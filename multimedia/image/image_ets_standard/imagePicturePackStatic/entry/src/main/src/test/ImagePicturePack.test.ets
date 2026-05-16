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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import rpc from '@ohos.rpc';
import resourceManager from '@ohos.resourceManager';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';
import { initialize } from './AbilityContextHelper.test';

let sleep = async (count:int) : Promise<int> => {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

class Logger {
    testNum: string;

    constructor(testNum: string) {
    this.testNum = testNum;
    }

    log(msg: string) {
    hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
    }
}

export default function imagePicturePack() {
  let filesDir: string | undefined | null;
  let cacheDir: string | undefined | null;
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
    beforeAll(() => {
      await initialize();
      testContext = Hypium.get('context') as common.UIAbilityContext;
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      cacheDir = Hypium.get('cacheDir') as string | undefined | null;
      let tempImageSrc = image.createImageSource(filesDir + '/' + "test.jpg")
      if (tempImageSrc == undefined) {
        isSupportHEIFDecode = false
      } else {
        isSupportHEIFDecode = tempImageSrc.supportedFormats.includes("image/heic");
      }
      isSupportHEICEncode = 
        image.createImagePacker().supportedFormats.includes("image/heic");
      try {
        let hasHdr = await fs.access('/system/lib64/ndk/libvideo_processing_capi_impl.so');
        if (hasHdr) {
            console.info("file exists");
            isSupportHdr = true;
        } else {
            console.info("file not exists");
            isSupportHdr = false;
        }
      } catch(err: BusinessError) {
        console.error("access failed with error message: " + err.message + ", error code: " + err.code);
        isSupportHdr = false;
      };
    })

    afterEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach case');
    });

    const getBuffer = (fileName: string) => {
      const filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead;
    }

    const getImageSource = (fileName: string, type?: string) => {
      let imageSourceApi: image.ImageSource | undefined;
      if (type === "buffer") {
        const buffer = getBuffer(fileName);
        imageSourceApi = image.createImageSource(buffer);
      } else if (type === "uri") {
        const filePath = filesDir + '/' + fileName
        imageSourceApi = image.createImageSource(filePath);
      } else if (type === "rawfile") {
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName);
        imageSourceApi = image.createImageSource(rawFileDescriptor);
      } else if (type === "incremental") {
        const picBuffer = getBuffer(fileName);
        imageSourceApi = image.createIncrementalSource(picBuffer);
      } else {
        const filePath = filesDir + "/" + fileName;
        const file = fs.openSync(filePath);
        imageSourceApi = image.createImageSource(file.fd as int);
      }
      expect(imageSourceApi != undefined).assertTrue();
      let result: image.ImageSource = imageSourceApi as image.ImageSource;
      return result;
    }

    const createAuxPic = (
      auxiliaryPictureType: image.AuxiliaryPictureType,
      fileName: string,
      size: image.Size
    ) => {
      const buffer = getBuffer(fileName);
      let auxiliaryPicture: image.AuxiliaryPicture = image.createAuxiliaryPicture(buffer, size, auxiliaryPictureType);
      return auxiliaryPicture;
    }

    const createPictureImageSourcePic = (fileName: string, type: string, auxType?: image.AuxiliaryPictureType) => {
      let imageSourceApi: image.ImageSource = getImageSource(fileName, type);
      let picture: image.Picture | undefined;
      if (auxType) {
        let decodingOptForPicture: image.DecodingOptionsForPicture;
        decodingOptForPicture = {desiredAuxiliaryPictures: [auxType]};
        picture = await imageSourceApi.createPicture(decodingOptForPicture);
      } else {
        picture = await imageSourceApi.createPicture();
      }
      await imageSourceApi.release();
      expect(picture != undefined).assertTrue();
      let result: image.Picture = picture as image.Picture;
      return result;
    }

    const createPictureOnlyMainPic = (fileName: string, type: string, pixelFormat?: image.PixelMapFormat) => {
      let imageSourceApi: image.ImageSource = getImageSource(fileName, type);
      let pixelMap: image.PixelMap | undefined;
      if (pixelFormat != undefined) {
        let DecodingOptions: image.DecodingOptions = {
          desiredPixelFormat: pixelFormat
        };
        pixelMap = await imageSourceApi.createPixelMap(DecodingOptions);
      } else {
        pixelMap = await imageSourceApi.createPixelMap();
      }
      expect(pixelMap != undefined).assertTrue();
      let picture: image.Picture | undefined = image.createPicture(pixelMap as image.PixelMap);
      expect(picture != undefined).assertTrue();
      let result: image.Picture = picture as image.Picture;
      await imageSourceApi.release();
      if (pixelMap != undefined) {
        await pixelMap.release();
      }
      return result;
    }

    const createPictureWithGainMapAuxPic = (fileName: string, type: string) => {
      let picture: image.Picture = createPictureOnlyMainPic(fileName, type);
      let size: image.Size = {height: 960, width: 720};
      let gainMapAuxiliaryPicture = createAuxPic(GAINMAP, "GainMap.dat", size);
      picture.setAuxiliaryPicture(GAINMAP, gainMapAuxiliaryPicture);
      return picture;
    }

    const createPictureWithDepthMapAuxPic = (fileName: string, type: string) => {
      let picture: image.Picture = createPictureOnlyMainPic(fileName, type);
      let pictureAux = createPictureImageSourcePic("AllAuxiliaryPictures.jpg", "fd", DEPTH_MAP);
      let depthMapAuxiliaryPicture = pictureAux.getAuxiliaryPicture(DEPTH_MAP);
      expect(depthMapAuxiliaryPicture != null).assertTrue();
      picture.setAuxiliaryPicture(DEPTH_MAP, depthMapAuxiliaryPicture as image.AuxiliaryPicture);
      return picture;
    }

    const createPictureWithUnReFocusMapAuxPic = (fileName: string, type: string) => {
      let picture: image.Picture = createPictureOnlyMainPic(fileName, type);
      let pictureAux = createPictureImageSourcePic("AllAuxiliaryPictures.jpg", "fd", UNREFOCUS_MAP);
      let unrefocusMapAuxiliaryPicture = pictureAux.getAuxiliaryPicture(UNREFOCUS_MAP);
      expect(unrefocusMapAuxiliaryPicture != null).assertTrue();
      picture.setAuxiliaryPicture(UNREFOCUS_MAP, unrefocusMapAuxiliaryPicture as image.AuxiliaryPicture);
      return picture;
    }

    const createPictureWithLinearMapAuxPic = (fileName: string, type: string) => {
      let picture: image.Picture = createPictureOnlyMainPic(fileName, type);
      let pictureAux = createPictureImageSourcePic("AllAuxiliaryPictures.jpg", "fd", LINEAR_MAP);
      if (pictureAux == undefined) {
        return undefined;
      }
      let linearMapAuxiliaryPicture = pictureAux.getAuxiliaryPicture(LINEAR_MAP);
      expect(linearMapAuxiliaryPicture != null).assertTrue();
      picture.setAuxiliaryPicture(LINEAR_MAP, linearMapAuxiliaryPicture as image.AuxiliaryPicture);
      return picture;
    }

    const createPictureWithFragmentMapAuxPic = (fileName: string, type: string) => {
      let picture: image.Picture = createPictureOnlyMainPic(fileName, type);
      let pictureAux = createPictureImageSourcePic("JpegFragmentMap.jpg", "fd", FRAGMENT_MAP);
      let fragmentMapAuxiliaryPicture = pictureAux.getAuxiliaryPicture(FRAGMENT_MAP);
      expect(fragmentMapAuxiliaryPicture != null).assertTrue();
      picture.setAuxiliaryPicture(FRAGMENT_MAP, fragmentMapAuxiliaryPicture as image.AuxiliaryPicture);
      return picture;
    }

    const createPictureWithFragmentMapAuxPicHeif = (fileName: string, type: string) => {
      let picture: image.Picture = createPictureOnlyMainPic(fileName, type);
      let pictureAux = createPictureImageSourcePic("all_auxtype.heic", "fd", FRAGMENT_MAP);
      let fragmentMapAuxiliaryPicture = pictureAux.getAuxiliaryPicture(FRAGMENT_MAP);
      expect(fragmentMapAuxiliaryPicture != null).assertTrue();
      picture.setAuxiliaryPicture(FRAGMENT_MAP, fragmentMapAuxiliaryPicture as image.AuxiliaryPicture);
      return picture;
    }

    const getFdCacheDir = (fileName: string) => {
      const uri: string = cacheDir + '/' + fileName;
      const file: fs.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      return file.fd as int;
    }

    const checkPackResult = (
      logger: Logger,
      imageSource: image.ImageSource | undefined,
      flag: string,
      packOpts: image.PackingOption,
      properties: Record<string, string | null> | undefined,
      type: image.AuxiliaryPictureType
    ) => {
      if (imageSource == undefined) {
        return false;
      }
      let decodeProperties: Record<string, string | null> | undefined;
      let picture = await imageSource.createPicture();
      if (picture == undefined) {
        return false;
      }
      let imageInfo = await imageSource.getImageInfo();
      if (imageInfo == undefined) {
        return false;
      }

      if (flag == "picture") {
        let metadata = await picture.getMetadata(EXIF_METADATA);
        if (packOpts.desiredDynamicRange == image.PackingDynamicRange.AUTO && packOpts.needsPackProperties == true && metadata != undefined) {
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
        let ret: Boolean = false;
        if (type == GAINMAP && packOpts.desiredDynamicRange == image.PackingDynamicRange.AUTO){
          let imageInfo = imageSource.getImageInfoSync();
          let isHdr = false;
          if (imageInfo != undefined) {
            isHdr = imageInfo.isHdr;
          }
          let auxPicGet = picture.getAuxiliaryPicture(type);
          expect(auxPicGet != null).assertTrue();
          let auxPic = auxPicGet as image.AuxiliaryPicture;
          let auxType = auxPic.getType();
          logger.log(`packResult: type is  ${type}, isHdr ${isHdr}, ${auxPic != undefined}`);
          ret = (isHdr == true) && (auxPic != undefined) && (auxType == type);
        } else if (type == GAINMAP && (packOpts.desiredDynamicRange == image.PackingDynamicRange.SDR || packOpts.desiredDynamicRange == undefined)) {
          let auxPic = picture.getAuxiliaryPicture(type);
          logger.log(`packResult: ${type} ${auxPic == undefined}`);
          ret = (auxPic == undefined);
        } else {
          let auxPicGet = picture.getAuxiliaryPicture(type);
          expect(auxPicGet != null).assertTrue();
          let auxPic = auxPicGet as image.AuxiliaryPicture;
          let auxType = auxPic.getType();
          logger.log(`packResult: ${type} ${auxPic != undefined}`);
          ret = (auxPic != undefined) && (auxType == type);
          if (type == FRAGMENT_MAP && (packOpts.desiredDynamicRange == image.PackingDynamicRange.AUTO && packOpts.needsPackProperties == true)) {
            let decodeProperties: Record<string, string | null> | undefined;
            let metadata = await auxPic.getMetadata(FRAGMENT_METADATA);
            if (metadata != undefined) {
              decodeProperties = await metadata.getAllProperties();
            }
            ret = ret && (JSON.stringify(properties) == JSON.stringify(decodeProperties));
          }
        }
        await imageSource.release();
        picture.release();
        return ret;
      }
    }

    const testPackPicture = (
      done: () => void,
      logger: Logger,
      packOpts: image.PackingOption,
      packType: string,
      picture: image.Picture | undefined,
      flag: string,
      fdNum: int,
      type: image.AuxiliaryPictureType
    ) => {
      if (picture == undefined) {
        logger.log("create Picture failed.");
        expect(false).assertTrue();
        done();
      } else {
        let metadata: image.Metadata | undefined;
        let properties: Record<string, string | null> | undefined;

        if (type == FRAGMENT_MAP) {
        let auxPicGet = picture.getAuxiliaryPicture(type);
          expect(auxPicGet != null).assertTrue();
          let auxPic = auxPicGet as image.AuxiliaryPicture;
          metadata = await auxPic.getMetadata(FRAGMENT_METADATA);
          if (metadata != undefined) {
            logger.log(`getMetadata success: ` + metadata);
            properties = await metadata.getAllProperties();
          }
        } else {
          metadata = await picture.getMetadata(EXIF_METADATA);
          if (metadata != undefined) {
            properties = await metadata.getAllProperties();
          }
        }

        const imagePackerApi: image.ImagePacker = image.createImagePacker();
        if (packType === "packing") {
          try {
            let data: ArrayBuffer = await imagePackerApi.packing(picture, packOpts);
            let imageSource = image.createImageSource(data);
            let ret = checkPackResult(logger, imageSource, flag, packOpts, properties, type);
            expect(ret).assertTrue();
            picture.release();
            await sleep(5000);
            done();
          } catch(error: BusinessError) {
            logger.log(`packing picture to buffer failed: ${error}, error code: ${JSON.stringify(error.code)}`);
            expect(false).assertTrue();
            picture.release();
            await sleep(5000);
            done();
          }
        } else {
          try {
            await imagePackerApi.packToFile(picture, fdNum, packOpts);
            let imageSource = image.createImageSource(fdNum);
            let ret = checkPackResult(logger, imageSource, flag, packOpts, properties, type);
            await fs.close(fdNum);
            expect(ret).assertTrue();
            picture.release();
            await sleep(5000);
            done();
          } catch(error: BusinessError) {
            logger.log(`packToFile picture failed: ${error}, error code: ${JSON.stringify(error.code)}`);
            expect(false).assertTrue();
            picture.release();
            await sleep(5000);
            done();
          };
        }
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_STATIC_0100
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureWithGainMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, GAINMAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_STATIC_0200
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKING_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureImageSourcePic("JPEGISOSingle.jpg", "fd", GAINMAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, GAINMAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_STATIC_0100
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_gainmap_02.jpg");
        let picture = createPictureWithGainMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, GAINMAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_STATIC_0200
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_PACKTOFILE_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_gainmap_03.jpg");
        let picture = createPictureImageSourcePic("JPEGISOSingle.jpg", "fd", GAINMAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, GAINMAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0100
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureWithDepthMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0200
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureWithDepthMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0300
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0400
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0500
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0100
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_depthMap_01.jpg");
        let picture = createPictureWithDepthMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0200
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_depthMap_02.jpg");
        let picture = createPictureWithDepthMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0300
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_depthMap_03.jpg");
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0400
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_depthMap_05.jpg");
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0500
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_depthMap_03.jpg");
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0100
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureWithUnReFocusMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0200
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureWithUnReFocusMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0300
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0400
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0500
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0100
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_unRefocusMap_01.jpg");
        let picture = createPictureWithUnReFocusMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0200
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_unRefocusMap_02.jpg");
        let picture = createPictureWithUnReFocusMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0300
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_unRefocusMap_03.jpg");
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0400
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_unRefocusMap_04.jpg");
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0500
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_unRefocusMap_05.jpg");
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
        await sleep(2000);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0100
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureWithLinearMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0200
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureWithLinearMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0300
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0400
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0500
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0100
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_linearMap_01.jpg");
        let picture = createPictureWithLinearMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0200
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_linearMap_02.jpg");
        let picture = createPictureWithLinearMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0300
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_linearMap_03.jpg");
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0400
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_linearMap_05.jpg");
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0500
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_linearMap_03.jpg");
        let picture = createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0100
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureWithFragmentMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0200
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureWithFragmentMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0300
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureImageSourcePic("JpegFragmentMap.jpg", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0400
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureImageSourcePic("JpegFragmentMap.jpg", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0500
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = createPictureImageSourcePic("JpegFragmentMap.jpg", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0100
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_fragmentMap_01.jpg");
        let picture = createPictureWithFragmentMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0200
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_fragmentMap_02.jpg");
        let picture = createPictureWithFragmentMapAuxPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0300
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_fragmentMap_03.jpg");
        let picture = createPictureImageSourcePic("JpegFragmentMap.jpg", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0400
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_fragmentMap_04.jpg");
        let picture = createPictureImageSourcePic("JpegFragmentMap.jpg", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0500
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFd = getFdCacheDir("pack_fragmentMap_05.jpg");
        let picture = createPictureImageSourcePic("JpegFragmentMap.jpg", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 100,
          bufferSize: 10000 * 10000,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
        await sleep(500);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0100
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureWithDepthMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0200
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureWithDepthMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0300
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0400
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0500
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKING_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, DEPTH_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0100
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_depthMap_01.heic");
        let picture = createPictureWithDepthMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0200
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_depthMap_02.heic");
        let picture = createPictureWithDepthMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0300
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_depthMap_03.heic");
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0400
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_depthMap_04.heic");
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0500
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTHMAP_PACKTOFILE_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_depthMap_05.heic");
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", DEPTH_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, DEPTH_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_STATIC_0100
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_STATIC_0200
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_STATIC_0300
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKING_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, UNREFOCUS_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_STATIC_0100
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_unRefocusMap_01.heic");
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_STATIC_0200
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_unRefocusMap_02.heic");
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_STATIC_0300
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUSMAP_PACKTOFILE_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_unRefocusMap_03.heic");
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", UNREFOCUS_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, UNREFOCUS_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0100
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureWithLinearMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0200
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureWithLinearMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0300
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0400
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0500
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKING_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, LINEAR_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0100
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_linearMap_01.heic");
        let picture = createPictureWithLinearMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0200
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_linearMap_02.heic");
        let picture = createPictureWithLinearMapAuxPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0300
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_linearMap_03.heic");
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0400
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_linearMap_04.heic");
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0500
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEARMAP_PACKTOFILE_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_linearMap_05.heic");
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", LINEAR_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, LINEAR_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0100
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureWithFragmentMapAuxPicHeif("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0200
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureWithFragmentMapAuxPicHeif("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0300
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0400
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0500
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKING_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packing", picture, "picWithAuxPic", 0, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0100
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_fragmentMap_01.heic");
        let picture = createPictureWithFragmentMapAuxPicHeif("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0200
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_fragmentMap_02.heic");
        let picture = createPictureWithFragmentMapAuxPicHeif("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0300
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_fragmentMap_03.heic");
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0400
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_fragmentMap_04.heic");
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0500
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENTMAP_PACKTOFILE_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFd = getFdCacheDir("pack_fragmentMap_05.heic");
        let picture = createPictureImageSourcePic("all_auxtype.heic", "fd", FRAGMENT_MAP);
        let packOpts: image.PackingOption = {
          format: "image/heif",
          quality: 98
        };
        testPackPicture(done, logger, packOpts, "packToFile", picture, "picWithAuxPic", writeFd, FRAGMENT_MAP);
      }
    })
  })
}

