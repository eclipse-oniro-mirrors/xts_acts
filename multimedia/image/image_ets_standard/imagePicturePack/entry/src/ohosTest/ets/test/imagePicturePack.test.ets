/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { describe, beforeAll, afterEach, it, expect } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import rpc from '@ohos.rpc';
import resourceManager from '@ohos.resourceManager';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function imagePicturePack() {
  let filesDir: string|undefined;
  let cacheDir: string|undefined;
  let testContext: common.UIAbilityContext;
  let isSupportHEIFDecode: boolean;
  let isSupportHEICEncode: boolean;
  let isSupportHdr: Boolean;
  const GAINMAP = image.AuxiliaryPictureType.GAINMAP;
  const DEPTH_MAP = image.AuxiliaryPictureType.DEPTH_MAP;
  const UNREFOCUS_MAP = image.AuxiliaryPictureType.UNREFOCUS_MAP;
  const LINEAR_MAP = image.AuxiliaryPictureType.LINEAR_MAP;
  const FRAGMENT_MAP = image.AuxiliaryPictureType.FRAGMENT_MAP;
  const EXIF_METADATA = image.MetadataType.EXIF_METADATA;
  const FRAGMENT_METADATA = image.MetadataType.FRAGMENT_METADATA;

  describe('imagePicturePack', () => {
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir');
      cacheDir = AppStorage.get('cacheDir');
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "test.jpg").supportedFormats.includes("image/heic");
      isSupportHEICEncode = 
        image.createImagePacker().supportedFormats.includes("image/heic");
      isSupportHdr =
        !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
        display.getDefaultDisplaySync().hdrFormats.length != 0;
    })

    afterEach(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach case');
    });

    class Logger {
      testNum: string;
  
      constructor(testNum: string) {
        this.testNum = testNum;
      }
  
      log(msg: string) {
        hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
      }
    }

    const getBuffer = async (fileName: string) => {
      const filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead;
    }

    const getImageSource = async (fileName: string, type?: string) => {
      let imageSourceApi: image.ImageSource;
      if (type === "buffer") {
        const buffer = await getBuffer(fileName);
        imageSourceApi = await image.createImageSource(buffer);
      } else if (type === "uri") {
        const filePath = filesDir + '/' + fileName
        imageSourceApi = await image.createImageSource(filePath);
      } else if (type === "rawfile") {
        const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName);
        imageSourceApi = await image.createImageSource(rawFileDescriptor);
      } else if (type === "incremental") {
        const picBuffer = await getBuffer(fileName);
        imageSourceApi = await image.CreateIncrementalSource(picBuffer);
      } else {
        const filePath = filesDir + "/" + fileName;
        const file = await fs.open(filePath);
        imageSourceApi = await image.createImageSource(file.fd);
      }
      return imageSourceApi;
    }

    const createAuxPic = async (
      auxiliaryPictureType: image.AuxiliaryPictureType,
      fileName?: string,
      size?: image.Size
    ) => {
      const buffer = await getBuffer(fileName!!);
      let auxiliaryPicture: image.AuxiliaryPicture = image.createAuxiliaryPicture(buffer, size, auxiliaryPictureType);
      return auxiliaryPicture;
    }

    const createPictureImageSourcePic = async (fileName: string, type: string, auxType?: image.AuxiliaryPictureType) => {
      let imageSourceApi: image.ImageSource = await getImageSource(fileName, type);
      let picture: image.Picture;
      if (auxType) {
        let decodingOptForPicture: image.DecodingOptionsForPicture;
        decodingOptForPicture = {desiredAuxiliaryPictures: [auxType]};
        picture = await imageSourceApi.createPicture(decodingOptForPicture);
      } else {
        picture = await imageSourceApi.createPicture();
      }
      return picture;
    }

    const createPictureOnlyMainPic = async (fileName: string, type: string, pixelFormat?: image.PixelMapFormat) => {
      let imageSourceApi: image.ImageSource = await getImageSource(fileName, type);
      let pixelMap: image.PixelMap;
      if (pixelFormat != undefined) {
        let DecodingOptions: image.DecodingOptions = {
          desiredPixelFormat: pixelFormat
        };
        pixelMap = await imageSourceApi.createPixelMap(DecodingOptions);
      } else {
        pixelMap = await imageSourceApi.createPixelMap();
      }
      let picture: image.Picture = image.createPicture(pixelMap);
      return picture;
    }

    const createPictureWithGainMapAuxPic = async (fileName: string, type: string) => {
      let picture: image.Picture = await createPictureOnlyMainPic(fileName, type);
      let size: image.Size = {height: 960, width: 720};
      let gainMapAuxiliaryPicture = await createAuxPic(GAINMAP, "GainMap.dat", size);
      picture.setAuxiliaryPicture(GAINMAP, gainMapAuxiliaryPicture);
      return picture;
    }

    const createPictureWithDepthMapAuxPic = async (fileName: string, type: string) => {
      let picture: image.Picture = await createPictureOnlyMainPic(fileName, type);
      let pictureAux = await createPictureImageSourcePic("AllAuxiliaryPictures.jpg", "fd", DEPTH_MAP);
      let depthMapAuxiliaryPicture = await pictureAux.getAuxiliaryPicture(DEPTH_MAP);
      picture.setAuxiliaryPicture(DEPTH_MAP, depthMapAuxiliaryPicture);
      return picture;
    }

    const createPictureWithUnReFocusMapAuxPic = async (fileName: string, type: string) => {
      let picture: image.Picture = await createPictureOnlyMainPic(fileName, type);
      let pictureAux = await createPictureImageSourcePic("AllAuxiliaryPictures.jpg", "fd", UNREFOCUS_MAP);
      let unrefocusMapAuxiliaryPicture = await pictureAux.getAuxiliaryPicture(UNREFOCUS_MAP);
      picture.setAuxiliaryPicture(UNREFOCUS_MAP, unrefocusMapAuxiliaryPicture);
      return picture;
    }

    const createPictureWithLinearMapAuxPic = async (fileName: string, type: string) => {
      let picture: image.Picture = await createPictureOnlyMainPic(fileName, type);
      let pictureAux = await createPictureImageSourcePic("AllAuxiliaryPictures.jpg", "fd", LINEAR_MAP);
      let linearMapAuxiliaryPicture = await pictureAux.getAuxiliaryPicture(LINEAR_MAP);
      picture.setAuxiliaryPicture(LINEAR_MAP, linearMapAuxiliaryPicture);
      return picture;
    }

    const createPictureWithFragmentMapAuxPic = async (fileName: string, type: string) => {
      let picture: image.Picture = await createPictureOnlyMainPic(fileName, type);
      let pictureAux = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd", FRAGMENT_MAP);
      let fragmentMapAuxiliaryPicture = await pictureAux.getAuxiliaryPicture(FRAGMENT_MAP);
      picture.setAuxiliaryPicture(FRAGMENT_MAP, fragmentMapAuxiliaryPicture);
      return picture;
    }

    const createPictureWithFragmentMapAuxPicHeif = async (fileName: string, type: string) => {
      let picture: image.Picture = await createPictureOnlyMainPic(fileName, type);
      let pictureAux = await createPictureImageSourcePic("all_auxtype.heic", "fd", FRAGMENT_MAP);
      let fragmentMapAuxiliaryPicture = await pictureAux.getAuxiliaryPicture(FRAGMENT_MAP);
      picture.setAuxiliaryPicture(FRAGMENT_MAP, fragmentMapAuxiliaryPicture);
      return picture;
    }

    class MySequence implements rpc.Parcelable {
      picture_: image.Picture;

      constructor(conPicture: image.Picture) {
        this.picture_ = conPicture;
      }

      marshalling(messageSequence: rpc.MessageSequence) {
        this.picture_.marshalling(messageSequence);
        return true;
      }

      unmarshalling(messageSequence: rpc.MessageSequence): boolean {
        let picture: image.Picture = image.createPictureFromParcel(messageSequence)
        this.picture_ = picture;
        return true;
      }
    }

    const getFdCacheDir = async (fileName: string) => {
      const uri: string = cacheDir + '/' + fileName;
      const file: fs.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      return file.fd;
    }

    const checkPackResult = async (
      logger: Logger,
      imageSource: image.ImageSource,
      flag: string,
      packOpts: image.PackingOption,
      properties: Record<string, string | null> | undefined,
      type?: image.AuxiliaryPictureType
    ) => {
      let decodeProperties: Record<string, string | null> | undefined;
      let picture = await imageSource.createPicture();
      let metadata = await picture.getMetadata(EXIF_METADATA);
      let imageInfo = await imageSource.getImageInfo();
      
      if (flag == "picture") {
        if (packOpts.desiredDynamicRange == image.PackingDynamicRange.AUTO && packOpts.needsPackProperties == true) {
          decodeProperties = await metadata.getAllProperties();
          picture.release();
          await imageSource.release();
          return imageInfo.mimeType == packOpts.format && imageInfo.isHdr == false && JSON.stringify(properties) == JSON.stringify(decodeProperties);
        } else {
          await imageSource.release();
          picture.release();
          return imageInfo.mimeType == packOpts.format && imageInfo.isHdr == false && metadata == undefined;
        }
      } else {
        let ret: Boolean = true;
        if (type == GAINMAP && packOpts.desiredDynamicRange == image.PackingDynamicRange.AUTO){
          let isHdr = imageSource.getImageInfoSync().isHdr;
          let auxPic = await picture.getAuxiliaryPicture(type);
          let auxType = auxPic?.getType();
          logger.log(`packResult: type is  ${type}, isHdr ${isHdr}, ${auxPic != undefined}`);
          ret = (isHdr == true) && (auxPic != undefined) && (auxType == type);
        } else if (type == GAINMAP && (packOpts.desiredDynamicRange == image.PackingDynamicRange.SDR || packOpts.desiredDynamicRange == undefined)) {
          let auxPic = await picture.getAuxiliaryPicture(type);
          logger.log(`packResult: ${type} ${auxPic == undefined}`);
          ret = (auxPic == undefined);
        } else {
          let auxPic = await picture.getAuxiliaryPicture(type);
          let auxType = auxPic?.getType();
          logger.log(`packResult: ${type} ${auxPic != undefined}`);
          ret = (auxPic != undefined) && (auxType == type);
          if (type == FRAGMENT_MAP && (packOpts.desiredDynamicRange == image.PackingDynamicRange.AUTO && packOpts.needsPackProperties == true)) {
            let metadata = await auxPic?.getMetadata(FRAGMENT_METADATA);
            decodeProperties = await metadata?.getAllProperties();
            ret = ret && (JSON.stringify(properties) == JSON.stringify(decodeProperties));
          }
        }
        await imageSource.release();
        await picture.release();
        return ret;
      }
    }

    const testPackPicture =  async (
      done: Function,
      logger: Logger,
      packOpts: image.PackingOption,
      packType: string,
      picture: image.Picture,
      flag: string,
      fdNum?: number,
      type?: image.AuxiliaryPictureType
    ) => {
      if (picture == undefined) {
        logger.log("create Picture failed.");
        expect(false).assertTrue();
        done();
      } else {
        let metadata: image.Metadata | undefined;
        let properties: Record<string, string | null> | undefined;

        if (type == FRAGMENT_MAP) {
          let auxPic = await picture.getAuxiliaryPicture(type);
          metadata = await auxPic?.getMetadata(FRAGMENT_METADATA);
          logger.log(`getMetadata success: ` + metadata);
          properties = await metadata?.getAllProperties();
        } else {
          metadata = await picture.getMetadata(EXIF_METADATA);
          if (metadata != undefined) {
            properties = await metadata.getAllProperties();
          }
        }

        const imagePackerApi: image.ImagePacker = image.createImagePacker();
        if (packType === "packing") {
          await imagePackerApi.packing(picture, packOpts).then(async (data: ArrayBuffer) => {
            let imageSource = image.createImageSource(data);
            let ret = await checkPackResult(logger, imageSource, flag, packOpts, properties, type);
            expect(ret).assertTrue();
            picture.release();
            await sleep(5000);
            done();
          }).catch(async (error: BusinessError) => {
            logger.log(`packing picture to buffer failed: ${error}, error code: ${JSON.stringify(error.code)}`);
            expect(false).assertTrue();
            picture.release();
            await sleep(5000);
            done();
          })
        } else {
          await imagePackerApi.packToFile(picture, fdNum!!, packOpts).then(async () => {
            let imageSource = image.createImageSource(fdNum!!);
            let ret = await checkPackResult(logger, imageSource, flag, packOpts, properties, type);
            await fs.close(fdNum!!);
            expect(ret).assertTrue();
            picture.release();
            await sleep(5000);
            done();
          }).catch(async (error: BusinessError) => {
            logger.log(`packToFile picture failed: ${error}, error code: ${JSON.stringify(error.code)}`);
            expect(false).assertTrue();
            picture.release();
            await sleep(5000);
            done();
          });
        }
      }
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_0100
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithGainMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, GAINMAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_0200
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd", GAINMAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, GAINMAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_0300
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd", GAINMAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, GAINMAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_0400
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd", GAINMAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, GAINMAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_0100
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_gainmap_02.jpg");
        let picture = await createPictureWithGainMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, GAINMAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_0200
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_gainmap_03.jpg");
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd", GAINMAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, GAINMAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_0300
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_gainmap_05.jpg");
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd", GAINMAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, GAINMAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_0400
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_gainmap_03.jpg");
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd", GAINMAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, GAINMAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0100
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithDepthMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0200
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithDepthMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0300
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0400
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0500
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0100
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_depthMap_01.jpg");
        let picture = await createPictureWithDepthMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0200
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_depthMap_02.jpg");
        let picture = await createPictureWithDepthMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0300
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_depthMap_03.jpg");
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0400
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_depthMap_05.jpg");
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0500
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_depthMap_03.jpg");
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0100
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithUnReFocusMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0200
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithUnReFocusMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0300
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0400
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0500
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0100
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_unRefocusMap_01.jpg");
        let picture = await createPictureWithUnReFocusMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0200
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_unRefocusMap_02.jpg");
        let picture = await createPictureWithUnReFocusMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0300
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_unRefocusMap_03.jpg");
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0400
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_unRefocusMap_05.jpg");
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0500
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_unRefocusMap_03.jpg");
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0100
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithLinearMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0200
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithLinearMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0300
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0400
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0500
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0100
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_linearMap_01.jpg");
        let picture = await createPictureWithLinearMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0200
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_linearMap_02.jpg");
        let picture = await createPictureWithLinearMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0300
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_linearMap_03.jpg");
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0400
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_linearMap_05.jpg");
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0500
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_linearMap_03.jpg");
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0100
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithFragmentMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0200
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithFragmentMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0300
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0400
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0500
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0100
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_fragmentMap_01.jpg");
        let picture = await createPictureWithFragmentMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0200
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_fragmentMap_02.jpg");
        let picture = await createPictureWithFragmentMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0300
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_fragmentMap_03.jpg");
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0400
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_fragmentMap_05.jpg");
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0500
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_fragmentMap_03.jpg");
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_HEIF_0100
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_HEIF_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithGainMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, GAINMAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_HEIF_0200
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_HEIF_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("HEIFISOMultiChannelBaseColor0512V12.heic", "fd", GAINMAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, GAINMAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_HEIF_0300
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_HEIF_0300");
      if (!isSupportHEICEncode) {
        logger.log("device is not support heif encode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures.jpg", "fd", GAINMAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, GAINMAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_HEIF_0400
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_HEIF_0400");
      if (!isSupportHEICEncode) {
        logger.log("device is not support heif encode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures.jpg", "fd", GAINMAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, GAINMAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_HEIF_0100
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_HEIF_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_gainmap_01.heic");
        let picture = await createPictureWithGainMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, GAINMAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_HEIF_0200
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_HEIF_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_gainmap_02.heic");
        let picture = await createPictureImageSourcePic("HEIFISOMultiChannelBaseColor0512V12.heic", "fd", GAINMAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, GAINMAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_HEIF_0300
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_HEIF_0300");
      if (!isSupportHEICEncode) {
        logger.log("device is not support heif encode");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_gainmap_03.heic");
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures.jpg", "fd", GAINMAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, GAINMAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_HEIF_0400
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_HEIF_0400");
      if (!isSupportHEICEncode) {
        logger.log("device is not support heif encode");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_gainmap_04.heic");
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures.jpg", "fd", GAINMAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, GAINMAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0100
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithDepthMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0200
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithDepthMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0300
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0400
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0500
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0100
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_depthMap_01.heic");
        let picture = await createPictureWithDepthMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0200
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_depthMap_02.heic");
        let picture = await createPictureWithDepthMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0300
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_depthMap_03.heic");
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0400
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_depthMap_04.heic");
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0500
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_depthMap_05.heic");
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_0100
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_0200
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_0300
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_0100
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_unRefocusMap_01.heic");
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_0200
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_unRefocusMap_02.heic");
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_0300
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_unRefocusMap_03.heic");
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0100
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithLinearMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0200
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithLinearMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0300
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0400
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0500
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0100
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_linearMap_01.heic");
        let picture = await createPictureWithLinearMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0200
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_linearMap_02.heic");
        let picture = await createPictureWithLinearMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0300
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_linearMap_03.heic");
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0400
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_linearMap_04.heic");
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0500
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_linearMap_05.heic");
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0100
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithFragmentMapAuxPicHeif("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0200
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureWithFragmentMapAuxPicHeif("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0300
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0400
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0500
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0100
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_fragmentMap_01.heic");
        let picture = await createPictureWithFragmentMapAuxPicHeif("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0200
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_fragmentMap_02.heic");
        let picture = await createPictureWithFragmentMapAuxPicHeif("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0300
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_fragmentMap_03.heic");
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0400
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_fragmentMap_04.heic");
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0500
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_fragmentMap_05.heic");
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
      }
    })
  })
}