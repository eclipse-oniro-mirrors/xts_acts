/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function imagePicture() {
  let filesDir: string|undefined;
  let cacheDir: string|undefined;
  let testContext: common.UIAbilityContext;
  const Unsupported_operation_CODE = 7600201;
  const UNSUPPORTED_ERROR_CODE = 7600202;
  const UNSUPPORTED_DECODE_CODE = 7700301;
  const PARA_ERROR_CODE = 401;
  const GAINMAP = image.AuxiliaryPictureType.GAINMAP;
  const DEPTH_MAP = image.AuxiliaryPictureType.DEPTH_MAP;
  const UNREFOCUS_MAP = image.AuxiliaryPictureType.UNREFOCUS_MAP;
  const LINEAR_MAP = image.AuxiliaryPictureType.LINEAR_MAP;
  const FRAGMENT_MAP = image.AuxiliaryPictureType.FRAGMENT_MAP;
  const EXIF_METADATA = image.MetadataType.EXIF_METADATA;
  const FRAGMENT_METADATA = image.MetadataType.FRAGMENT_METADATA;
  const X_IN_ORIGINAL = "XInOriginal";
  const Y_IN_ORIGINAL = "YInOriginal";
  const WIDTH = "FragmentImageWidth";
  const HEIGHT = "FragmentImageHeight";
  let exifRecords: Record<string, string|null> = {"ImageWidth": "512", "ImageLength": "512"};
  let isSupportHEIFDecode: boolean;
  let isSupportHEICEncode: boolean;
  let isSupportHdr: Boolean;

  describe('imagePicture', () => {
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir')
      cacheDir = AppStorage.get('cacheDir')
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "test.jpg").supportedFormats.includes("image/heic");
      isSupportHEICEncode = 
        image.createImagePacker().supportedFormats.includes("image/heic");
      isSupportHdr = await fs.access('/system/lib64/ndk/libvideo_processing_capi_impl.so').then((res: boolean) => {
        if (res) {
          console.info("file exists");
          return true;
        } else {
          console.info("file not exists");
          return false;
        }
      }).catch((err: BusinessError) => {
        console.error("access failed with error message: " + err.message + ", error code: " + err.code);
        return false;
      });
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
        imageSourceApi = image.createImageSource(buffer);
      } else if (type === "uri") {
        const filePath = filesDir + '/' + fileName
        imageSourceApi = image.createImageSource(filePath);
      } else if (type === "rawfile") {
        const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName);
        imageSourceApi = image.createImageSource(rawFileDescriptor);
      } else if (type === "incremental") {
        const picBuffer = await getBuffer(fileName);
        imageSourceApi = image.CreateIncrementalSource(picBuffer);
      } else {
        const filePath = filesDir + "/" + fileName;
        const file = fs.openSync(filePath);
        imageSourceApi = image.createImageSource(file.fd);
      }
      return imageSourceApi;
    }

    const createAuxPicByType = async (auxiliaryPictureType: image.AuxiliaryPictureType) => {
      let buffer = new ArrayBuffer(180 * 240 * 4);
      let size: image.Size = {height: 180, width: 240};
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

    const createPicImageSourceWithAuxPics = async (fileName: string, type: string) => {
      let picture: image.Picture = await createPictureImageSourcePic(fileName, type);
      let gainMapAuxiliaryPicture = await createAuxPicByType(GAINMAP);
      picture.setAuxiliaryPicture(GAINMAP, gainMapAuxiliaryPicture);

      let depthMapAuxiliaryPicture = await createAuxPicByType(DEPTH_MAP);
      picture.setAuxiliaryPicture(DEPTH_MAP, depthMapAuxiliaryPicture);

      let unReFocusMapAuxiliaryPicture = await createAuxPicByType(UNREFOCUS_MAP);
      picture.setAuxiliaryPicture(UNREFOCUS_MAP, unReFocusMapAuxiliaryPicture);

      let linearMapAuxiliaryPicture = await createAuxPicByType(LINEAR_MAP);
      picture.setAuxiliaryPicture(LINEAR_MAP, linearMapAuxiliaryPicture);

      let fragmentMapAuxiliaryPicture = await createAuxPicByType(FRAGMENT_MAP);
      picture.setAuxiliaryPicture(FRAGMENT_MAP, fragmentMapAuxiliaryPicture);

      return picture;
    }

    const myGetPixelMap = async (fileName: string, type: string, pixelFormat: image.PixelMapFormat) => {
      let imageSourceApi: image.ImageSource = await getImageSource(fileName, type);
      let DecodingOptions: image.DecodingOptions = {
        desiredPixelFormat: pixelFormat
      };
      let pixelMap = await imageSourceApi.createPixelMap(DecodingOptions);
      return pixelMap;
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

    const createAuxPic = async (
      auxiliaryPictureType: image.AuxiliaryPictureType,
      fileName?: string,
      size?: image.Size
    ) => {
      const buffer = await getBuffer(fileName!!);
      let auxiliaryPicture: image.AuxiliaryPicture = image.createAuxiliaryPicture(buffer, size, auxiliaryPictureType);
      return auxiliaryPicture;
    }

    const testGetMetadataError = async (
      done: Function,
      logger: Logger,
      picture: image.AuxiliaryPicture|null | image.Picture,
      metadataType: image.MetadataType,
    ) => {
      try {
        let metadata = await picture!.getMetadata(metadataType);
        if (metadata != undefined) {
          logger.log("picture metadata not is undefined");
          expect(false).assertEqual(true);
          done();
        }
      } catch (error) {
        logger.log(`getProperties error ` + JSON.stringify(error) + error.code);
        expect(error.code == UNSUPPORTED_ERROR_CODE).assertTrue();
        done();
      }
    }

    const testPackPictureError =  async (
      done: Function,
      logger: Logger,
      packOpts: image.PackingOption,
      packType: string,
      picture: image.Picture,
      fdNum?: number,
    ) => {
      if (picture == undefined) {
        logger.log("create Picture failed.");
        expect(false).assertTrue();
        done();
      } else {
        const imagePackerApi: image.ImagePacker = image.createImagePacker();
        if (packType === "packing") {
          imagePackerApi.packing(picture, packOpts).then(async (data: ArrayBuffer) => {
            logger.log("packing success");
            picture.release();
            expect(false).assertTrue();
            done();
          }).catch((error: BusinessError) => {
            logger.log(`packing picture to buffer failed: ${error}, error code: ${JSON.stringify(error.code)}`);
            expect(error.code == PARA_ERROR_CODE).assertTrue();
            done();
          })
        } else {
          imagePackerApi.packToFile(picture, fdNum!!, packOpts).then(async () => {
            logger.log("packToFile success");
            picture.release();
            expect(false).assertTrue();
            done();
          }).catch((error: BusinessError) => {
            logger.log(`packing picture to buffer failed: ${error}, error code: ${JSON.stringify(error.code)}`);
            expect(error.code == PARA_ERROR_CODE).assertTrue();
            done();
          });
        }
      }
    }

    const checkPicture = (
      picture: image.Picture,
      containTypeList: Array<image.AuxiliaryPictureType>,
      excludeTypeList: Array<image.AuxiliaryPictureType>
    ): boolean => {
      let result = true;
      for (let i = 0; i < containTypeList.length; i++) {
        result = result && (picture?.getAuxiliaryPicture(containTypeList[i])?.getType() == containTypeList[i]);
      }

      for (let i = 0; i < excludeTypeList.length; i++) {
        result = result && (picture?.getAuxiliaryPicture(excludeTypeList[i]) == undefined);
      }
      return result;
    }

    const testImageSourceCreatePicture = async (
      done: Function,
      logger: Logger,
      fileName: string,
      type: string,
      typeList: Array<image.AuxiliaryPictureType>,
      undefinedTypeList: Array<image.AuxiliaryPictureType>
    ) => {
      let picture: image.Picture;
      let imageSource = await getImageSource(fileName, type);
      let decodingOptForPicture: image.DecodingOptionsForPicture;
      if (type == "buffer") {
        picture = await imageSource.createPicture();
      } else if (type == "uri") {
        decodingOptForPicture = {desiredAuxiliaryPictures: [GAINMAP]};
        picture = await imageSource.createPicture(decodingOptForPicture);
      } else {
        decodingOptForPicture = {desiredAuxiliaryPictures: [GAINMAP, DEPTH_MAP,
          UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP]};
        picture = await imageSource.createPicture(decodingOptForPicture);
      }

      if (picture == undefined) {
        logger.log("create Pictrue failed.");
        expect(false).assertTrue();
        done();
      } else {
        let ret = checkPicture(picture, typeList, undefinedTypeList);
        logger.log("ret = " + ret)
        expect(ret).assertTrue();
        done();
      }
    }

    const testGetType = async (
      done: Function,
      logger: Logger,
      fileName: string,
      type: string,
      typeList: Array<image.AuxiliaryPictureType>
    ) => {
      let picture: image.Picture;
      let result = true;
      picture = await createPicImageSourceWithAuxPics(fileName, type);

      if (picture == undefined) {
        logger.log("create Pictrue failed.");
        expect(false).assertTrue();
        done();
      } else {
        for (let i = 0; i < typeList.length; i++) {
          result = result && (picture?.getAuxiliaryPicture(typeList[i])?.getType() == typeList[i]);
          logger.log("AuxiliaryPictureType: " + picture?.getAuxiliaryPicture(typeList[i])?.getType());
        }
        expect(result).assertTrue();
        done();
      }     
    }  

    const testPictureApi = async (
      done: Function,
      logger: Logger,
      fileName: string,
      type: string,
      apiName: String
    ) => {
      let imageInfo: image.ImageInfo|undefined;
      let picture: image.Picture;
      picture = await createPictureImageSourcePic(fileName, type);
      let imageSourceApi: image.ImageSource = await getImageSource(fileName, type);
      let pixelMap = await imageSourceApi.createPixelMap();

      if (picture == undefined) {
        logger.log("create Pictrue failed.");
        expect(false).assertTrue();
        done();
      } else {
        if (apiName == "mainPixelMap") {
          let mainPixelMap = picture.getMainPixelmap();
          imageInfo = mainPixelMap.getImageInfoSync();
        } else if (apiName == "hdrComposedPixelmap") {
          let hdrPixelMap = await picture.getHdrComposedPixelmap();
          imageInfo = hdrPixelMap.getImageInfoSync();
        } else {
          let gainMapPixelMap = picture.getGainmapPixelmap();
          imageInfo = gainMapPixelMap?.getImageInfoSync();
        }

        logger.log("imageInfo: " + JSON.stringify(imageInfo));
        if (apiName == "mainPixelMap") {
          expect(JSON.stringify(imageInfo) == JSON.stringify(pixelMap.getImageInfoSync())).assertTrue();
          done();
        } else if (apiName == "hdrComposedPixelmap") {
          expect(imageInfo?.pixelFormat == image.PixelMapFormat.RGBA_1010102).assertTrue();
          expect(imageInfo?.isHdr).assertTrue();
          done();
        } else {
          expect(imageInfo?.pixelFormat == image.PixelMapFormat.RGBA_8888).assertTrue();
          done();
        }
      }
    }

    const testPictureApiError = async (
      done: Function,
      logger: Logger,
      fileName: string,
      type: string,
      apiName: String
    ) => {
      let picture: image.Picture;
      picture = await createPictureImageSourcePic(fileName, type);

      if (picture == undefined) {
        logger.log("create Pictrue failed.");
        expect(false).assertTrue();
        done();
      } else {
        if (apiName == "hdrComposedPixelmap") {
          try {
            await picture.getHdrComposedPixelmap();
            expect(false).assertTrue();
            done();
          } catch (error) {
            logger.log(JSON.stringify(error) + ", error code: " + error.code);
            expect(error.code == Unsupported_operation_CODE).assertTrue();
            done();
          }
        } else {
          let gainMapPixelMap = picture.getGainmapPixelmap();
          logger.log("gainMapPixelMap: " + gainMapPixelMap);
          expect(gainMapPixelMap == undefined).assertTrue();
          done();
        }
      }
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

    const testMarshalling = async (
      done: Function,
      logger: Logger,
      picture: image.Picture,
      type: String,
      metadataType?: image.MetadataType,
    ) => {
      logger.log("start");
      // marshalling
      let parcelable: MySequence = new MySequence(picture);
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      data.writeParcelable(parcelable);
      // createPictureFromParcel
      let ret: MySequence = new MySequence(picture);
      data.readParcelable(ret);
      await sleep(500);

      if (type == "GAINMAP") {
        let marshallingGainMapPixelMap = picture.getGainmapPixelmap();
        let unmarshallingGainMapPixelMap = ret.picture_.getGainmapPixelmap();
        let marshallingImageInfo = marshallingGainMapPixelMap!.getImageInfoSync();
        let unmarshallingImageInfo = unmarshallingGainMapPixelMap!.getImageInfoSync()
        logger.log(`marshalling imageInfoSync: ` + JSON.stringify(marshallingImageInfo));
        logger.log(`unmarshalling imageInfoSync: ` + JSON.stringify(unmarshallingImageInfo));
        expect(JSON.stringify(marshallingImageInfo) == JSON.stringify(unmarshallingImageInfo)).assertTrue();
        done();
      } else if (type == "FRAGMENT_MAP") {
        let marshallingAuxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let unmarshallingAuxPicture = ret.picture_.getAuxiliaryPicture(FRAGMENT_MAP);
        let marshallingMetadata: image.Metadata = await marshallingAuxPicture!.getMetadata(metadataType);
        let unmarshallingMetadata: image.Metadata = await unmarshallingAuxPicture!.getMetadata(metadataType);
        let marshallingProperties = await marshallingMetadata.getAllProperties();
        let unmarshallingProperties = await unmarshallingMetadata.getAllProperties();
        logger.log(`marshalling properties: ` + JSON.stringify(marshallingProperties));
        logger.log(`unmarshalling properties: ` + JSON.stringify(unmarshallingProperties));
        expect(JSON.stringify(marshallingProperties) == JSON.stringify(unmarshallingProperties)).assertTrue();
        done();
      } else {
        let marshallingMainPixelMap: image.PixelMap = picture.getMainPixelmap();
        let unmarshallingMainPixelMap: image.PixelMap = ret.picture_.getMainPixelmap();
        let marshallingImageInfo = marshallingMainPixelMap.getImageInfoSync();
        let unmarshallingImageInfo = unmarshallingMainPixelMap.getImageInfoSync()
        logger.log(`marshallingMain imageInfoSync: ` + JSON.stringify(marshallingImageInfo));
        logger.log(`unmarshallingMain imageInfoSync: ` + JSON.stringify(unmarshallingImageInfo));
        expect(JSON.stringify(marshallingImageInfo) == JSON.stringify(unmarshallingImageInfo)).assertTrue();

        let marshallingMetadata = await picture.getMetadata(metadataType);
        let unmarshallingMetadata = await ret.picture_.getMetadata(metadataType);
        let marshallingProperties = await marshallingMetadata.getAllProperties();
        let unmarshallingProperties = await unmarshallingMetadata.getAllProperties();
        logger.log(`marshalling properties: ` + JSON.stringify(marshallingProperties));
        logger.log(`unmarshalling properties: ` + JSON.stringify(unmarshallingProperties));
        expect(JSON.stringify(marshallingProperties) == JSON.stringify(unmarshallingProperties)).assertTrue();
        done();
      }
    }

    const testMetadataClone = async (
      done: Function,
      logger: Logger,
      metadata: image.Metadata,
    ) => {
      //getAllProperties
      let properties = await metadata.getAllProperties();
      logger.log("getAllProperties(allData) success: " + JSON.stringify(properties));
      let propertiesGotKey = Object.keys(properties);
      //clone Metadata
      let clonedData = await metadata.clone();
      logger.log("clone metadata success");
      //getAllProperties
      let clonedProperties = await clonedData.getAllProperties();
      logger.log("getAllProperties(allData) success: " + JSON.stringify(clonedProperties));
      let propertiesClonedKey = Object.keys(clonedProperties);
      if (propertiesGotKey.length !== propertiesClonedKey.length) {
        expect(false).assertTrue();
        done();
      }
      for (const key of propertiesGotKey) {
        if (!propertiesClonedKey.includes(key)) {
          logger.log("cloned data do not have this property: " + key);
          expect(false).assertTrue();
          done();
        }
        if (propertiesGotKey[key] !== propertiesClonedKey[key]) {
          logger.log(
            `cloned data has different value of: ${key}: ${propertiesGotKey[key]}
              ${propertiesClonedKey[key]}`
          );
          expect(false).assertTrue();
          done();
        }
      }
      expect(true).assertTrue();
      done();
    }

    const testMetadataProperty = async (
      done: Function,
      logger: Logger,
      properties: Record<string, string|null>,
      picture: image.AuxiliaryPicture|null | image.Picture,
      metadataType: image.MetadataType
    ) => {
      try {
        logger.log(`testMetadataProperty start `);
        if (picture != null) {
          //getMetadata
          let metadata = await picture.getMetadata(metadataType);
          logger.log(`getMetadata success: ` + metadata);
          //setProperties
          await metadata.setProperties(properties);
          logger.log(`setProperties success `);

          //setMetadata
          await picture.setMetadata(metadataType, metadata);
          logger.log(`setMetadata success `);
          //getMetadata
          let dataAfterSet = await picture.getMetadata(metadataType);
          logger.log(`get new metadata success: ` + dataAfterSet);
          //getProperties
          let getProperties = Object.keys(properties);
          let data = await dataAfterSet.getProperties(getProperties);
          logger.log(`getProperties(data) success: ` + JSON.stringify(data));
          getProperties.forEach(async (key) => {
            logger.log(`getProperty of key: ` + key);
            expect(properties[key] == data[key]).assertTrue();
          });
          await testMetadataClone(done, logger, metadata);
          done();
        }
      } catch (error) {
        logger.log(error);
        expect(false).assertTrue();
        done();
      }
    }

    const testReadPixelsToBuffer = async (
      done: Function,
      logger: Logger,
      picture: image.Picture,
      auxType: image.AuxiliaryPictureType
    ) => {
      let auxiliaryPicture = picture.getAuxiliaryPicture(auxType);

      //readPixelsToBuffer
      let beforeArrayBuffer = await auxiliaryPicture!.readPixelsToBuffer();
      logger.log(`read beforeArrayBuffer success: ` + beforeArrayBuffer.byteLength);
      //writePixelsFromBuffer
      await auxiliaryPicture!.writePixelsFromBuffer(beforeArrayBuffer);
      logger.log(`writePixelsFromBuffer success `);
      //readPixelsToBuffer
      let afterArrayBuffer = await auxiliaryPicture!.readPixelsToBuffer();
      logger.log(`readPixelsToBuffer success: ` + afterArrayBuffer.byteLength);
      expect(beforeArrayBuffer.byteLength == afterArrayBuffer.byteLength).assertTrue();
      done();
    }

    const testAuxMetadata = async (
      done: Function,
      logger: Logger,
      picture: image.Picture,
      auxType: image.AuxiliaryPictureType
    ) => {
      let auxiliaryPicture = picture.getAuxiliaryPicture(auxType);

      let beforeMetadata = await auxiliaryPicture!.getMetadata(FRAGMENT_METADATA);
      logger.log(`AuxiliaryPicture getMetadata success: ` + JSON.stringify(beforeMetadata));

      await auxiliaryPicture!.setMetadata(FRAGMENT_METADATA, beforeMetadata);
      logger.log(`AuxiliaryPicture setMetadata success `);
      let afterMetadata = await auxiliaryPicture!.getMetadata(FRAGMENT_METADATA);
      logger.log(`AuxiliaryPicture getMetadata success: ` + JSON.stringify(afterMetadata));

      expect(afterMetadata != undefined).assertTrue();
      done();
    }

    const testAuxiliaryPictureInfo = async (
      done: Function,
      logger: Logger,
      picture: image.Picture,
      originAuxInfo: image.AuxiliaryPictureInfo,
      typeList: Array<image.AuxiliaryPictureType>
    ) => {
      for (let i = 0; i < typeList.length; i++) {
        let auxiliaryPicture = picture.getAuxiliaryPicture(typeList[i]);
   
        //getAuxiliaryPictureInfo
        let beforeAuxInfo = auxiliaryPicture!.getAuxiliaryPictureInfo();
        logger.log(`get AuxiliaryPictureInfo success: ` + JSON.stringify(beforeAuxInfo));

        //setAuxiliaryPictureInfo
        auxiliaryPicture!.setAuxiliaryPictureInfo(originAuxInfo);
        logger.log(`setAuxiliaryPictureInfo success setInfo: ` + JSON.stringify(originAuxInfo));
        //getAuxiliaryPictureInfo
        let afterAuxInfo = auxiliaryPicture!.getAuxiliaryPictureInfo();
        logger.log(`get AuxiliaryPictureInfo success: ` + JSON.stringify(afterAuxInfo));

        expect(JSON.stringify(afterAuxInfo.auxiliaryPictureType) == JSON.stringify(originAuxInfo.auxiliaryPictureType)).assertTrue();
        expect(JSON.stringify(afterAuxInfo.size.width) == JSON.stringify(originAuxInfo.size.width)).assertTrue();
        expect(JSON.stringify(afterAuxInfo.size.height) == JSON.stringify(originAuxInfo.size.height)).assertTrue();
        expect(JSON.stringify(afterAuxInfo.pixelFormat) == JSON.stringify(originAuxInfo.pixelFormat)).assertTrue();
        expect(JSON.stringify(afterAuxInfo.rowStride) == JSON.stringify(originAuxInfo.rowStride)).assertTrue();

        //release
        auxiliaryPicture!.release();
        picture.release();
        logger.log("release success");
        expect(auxiliaryPicture!.getType() == undefined).assertTrue();
      }
      done();
    }

    const getFdCacheDir = async (fileName: string) => {
      const uri: string = cacheDir + '/' + fileName;
      const file: fs.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      return file.fd;
    }

    const checkPackResult = async (
      logger: Logger,
      source: number | ArrayBuffer,
      flag: string,
      packOpts: image.PackingOption,
      properties: Record<string, string | null>,
      type?: image.AuxiliaryPictureType
    ) => {
      let imageSource: image.ImageSource;
      let decodeProperties: Record<string, string | null>;
      if (typeof source == 'number') {
        imageSource = image.createImageSource(source)
      } else {
        imageSource = image.createImageSource(source)
      }
      let picture = await imageSource.createPicture();
      let metadata = await picture.getMetadata(EXIF_METADATA);
      let auxType: image.AuxiliaryPictureType | undefined;
      if (type != undefined) {
        auxType = picture.getAuxiliaryPicture(type)?.getType();
      }
      
      let imageInfo = imageSource.getImageInfoSync();
      logger.log(`properties: ${JSON.stringify(properties)}, isHdr: ${imageInfo.isHdr}, mimeType: ${imageInfo.mimeType}, auxType: ${auxType}`);
      await imageSource.release();
      if (flag == "picture") {
        if (packOpts.desiredDynamicRange == image.PackingDynamicRange.AUTO && packOpts.needsPackProperties == true) {
          decodeProperties = await metadata.getAllProperties();
          return imageInfo.mimeType == packOpts.format && imageInfo.isHdr == false && JSON.stringify(properties) == JSON.stringify(decodeProperties);
        } else {
          return imageInfo.mimeType == packOpts.format && imageInfo.isHdr == false && metadata == undefined;
        }
      } else {
        if (type == GAINMAP){
          if (packOpts.desiredDynamicRange == image.PackingDynamicRange.AUTO && packOpts.needsPackProperties == true) {
            decodeProperties = await metadata.getAllProperties();
            return imageInfo.mimeType == packOpts.format && imageInfo.isHdr == true && JSON.stringify(properties) == JSON.stringify(decodeProperties);
          } else {
            return imageInfo.mimeType == packOpts.format && imageInfo.isHdr == false && metadata == undefined;
          }
        } else {
          if (packOpts.desiredDynamicRange == image.PackingDynamicRange.AUTO && packOpts.needsPackProperties == true) {
            decodeProperties = await metadata.getAllProperties();
            return imageInfo.mimeType == packOpts.format && imageInfo.isHdr == false && auxType == type
              && JSON.stringify(properties) == JSON.stringify(decodeProperties);
          } else {
            return imageInfo.mimeType == packOpts.format && imageInfo.isHdr == false && auxType == undefined
              && metadata == undefined;
          }
        }
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
        let metadata = await picture.getMetadata(EXIF_METADATA);
        let properties = await metadata.getAllProperties();
        const imagePackerApi: image.ImagePacker = image.createImagePacker();
        if (packType === "packing") {
          imagePackerApi.packing(picture, packOpts).then(async (data: ArrayBuffer) => {
            let ret = await checkPackResult(logger, data, flag, packOpts, properties, type);
            expect(ret).assertTrue();
            done();
          }).catch((error: BusinessError) => {
            logger.log(`packing picture to buffer failed: ${error}, error code: ${JSON.stringify(error.code)}`);
            expect(false).assertTrue();
            done();
          })
        } else {
          imagePackerApi.packToFile(picture, fdNum!!, packOpts).then(async () => {
            let ret = await checkPackResult(logger, fdNum!!, flag, packOpts, properties, type);
            fs.closeSync(fdNum!!);
            expect(ret).assertTrue();
            done();
          }).catch((error: BusinessError) => {
            logger.log(`packToFile picture to buffer failed: ${error}, error code: ${JSON.stringify(error.code)}`);
            expect(false).assertTrue();
            done();
          });
        }
      }
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0100
     * @tc.name      : test ImageSource createPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have gain map type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "JPEGISOSingle.jpg", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0200
     * @tc.name      : test ImageSource createPicture decodingOptForPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have gain map type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "JPEGISOSingle.jpg", "uri", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0300
     * @tc.name      : test ImageSource createPicture decodingOptForPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have gain map type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "JPEGISOSingle.jpg", "fd", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0400
     * @tc.name      : test ImageSource createPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test haven't auxiliaryPicture
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let undefinedTypeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        let picture = await createPictureImageSourcePic("testExif.jpg", "buffer");
        for (let i = 0; i < undefinedTypeList.length; i++) {
          let ret = picture?.getAuxiliaryPicture(undefinedTypeList[i]) == undefined;
          logger.log("ret = " + ret)
          expect(ret).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_JPEG_0100
     * @tc.name      : test Image createPicture
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.test haven't auxiliaryPicture
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_JPEG_0100");
      let undefinedTypeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd");
      for (let i = 0; i < undefinedTypeList.length; i++) {
        let ret = picture?.getAuxiliaryPicture(undefinedTypeList[i]) == undefined;
        logger.log("ret = " + ret)
        expect(ret).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_JPEG_0100
     * @tc.name      : test auxiliary picture get type
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary images and store them in the picture
     *                 3.test auxiliary picture type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_JPEG_0100");
      let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
      testGetType(done, logger, "testExif.jpg", "fd", typeList);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_JPEG_0100
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_JPEG_0100");
      testPictureApi(done, logger, "testExif.jpg", "buffer", "mainPixelMap");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_0100
     * @tc.name      : test picture getHdrComposedPixelmap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get HdrComposed pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        testPictureApi(done, logger, "JPEGISOSingle.jpg", "buffer", "hdrComposedPixelmap");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_0100
     * @tc.name      : test picture getGainmapPixelmap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get gainmap pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_0100");
      testPictureApi(done, logger, "JPEGISOSingle.jpg", "buffer", "gainMapPixelMap");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_ERROR_0100
     * @tc.name      : test picture getGainmapPixelmap error
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get gainmap pixelMap info failed
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_ERROR_0100', 0, async (done: Function) => {
        let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_ERROR_0100");
        testPictureApiError(done, logger, "testExif.jpg", "buffer", "gainMapPixelMap");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0100
     * @tc.name      : test picture marshalling createPictureFromParcel
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test marshalling and create Picture From Parcel
     *                 3.compare deserialize before and after main pixel map info and metadata 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        testMarshalling(done, logger, picture, "picture", EXIF_METADATA);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0200
     * @tc.name      : test picture marshalling createPictureFromParcel
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test marshalling and create Picture From Parcel
     *                 3.compare deserialize before and after gainmap pixel map info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        testMarshalling(done, logger, picture, "GAINMAP");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, GAINMAP);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_AUXILIARYPICTURE_FRAGMENT_MAP_METADATA_API_JPEG_0100
     * @tc.name      : test picture metadata API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.set exif message of metadata
     *                 3.get exif message of metadata
     *                 4.check exif message info
     *                 5.get all message of metadata
     *                 6.clone metadata
     *                 7.check that all information after cloning is consistent
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARYPICTURE_FRAGMENT_MAP_METADATA_API_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_AUXILIARYPICTURE_FRAGMENT_MAP_METADATA_API_JPEG_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        await testAuxMetadata(done, logger, picture, FRAGMENT_MAP);
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType: GAINMAP,
          size: {width: 1536, height: 2048},
          rowStride: 10,
          pixelFormat: image.PixelMapFormat.RGB_565,
          colorSpace: await colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
        }
        let typeList = [GAINMAP];
        testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_0100
     * @tc.name      : test picture metadata API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.set exif message of metadata
     *                 3.get exif message of metadata
     *                 4.check exif message info
     *                 5.get all message of metadata
     *                 6.clone metadata
     *                 7.check that all information after cloning is consistent
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        await testMetadataProperty(done, logger, exifRecords, picture, EXIF_METADATA);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_0100
     * @tc.name      : test picture metadata API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.set exif message of metadata
     *                 3.get exif message of metadata
     *                 4.check exif message info
     *                 5.get all message of metadata
     *                 6.clone metadata
     *                 7.check that all information after cloning is consistent
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        await testMetadataProperty(done, logger, exifRecords, picture, EXIF_METADATA);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_0100
     * @tc.name      : test auxiliary picture metadata API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.get auxiliary picture
     *                 3.set fragment message of metadata
     *                 4.get fragment message of metadata
     *                 5.check fragment message info
     *                 6.get all message of metadata
     *                 7.clone metadata
     *                 8.check that all information after cloning is consistent
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let fragmentRecords: Record<string, string|null> = {
          "XInOriginal" : "0", "YInOriginal" : "0", "FragmentImageWidth": "512", "FragmentImageHeight": "512"
        };
        await testMetadataProperty(done, logger, fragmentRecords, auxPicture, FRAGMENT_METADATA);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_0200
     * @tc.name      : test auxiliary picture metadata API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.get auxiliary picture
     *                 3.set fragment message of metadata
     *                 4.get fragment message of metadata
     *                 5.check fragment message info
     *                 6.get all message of metadata
     *                 7.clone metadata
     *                 8.check that all information after cloning is consistent
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        if (auxPicture != undefined) {
          let metadata = await auxPicture.getMetadata(FRAGMENT_METADATA);
          logger.log(`get metadata success: ` + metadata);
          let fragmentkeys: string[] = [X_IN_ORIGINAL, Y_IN_ORIGINAL, WIDTH, HEIGHT];
          let properties = await metadata.getProperties(fragmentkeys);
          logger.log(`getProperties success: ` + JSON.stringify(properties));
          expect(properties != undefined).assertTrue();
          done();
        } else {
          logger.log("auxiliaryPicture is undefined");
          expect(false).assertEqual(true);
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0100
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0200
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0300
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0400
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0500
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0100
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_picture_01.jpg");
        let picture = await createPictureOnlyMainPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0200
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_picture_02.jpg");
        let picture = await createPictureOnlyMainPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0300
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_picture_03.jpg");
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0400
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_picture_04.jpg");
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0500
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_picture_05.jpg");
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0100
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0200
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0300
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0400
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0500
     * @tc.name      : test picture packing
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0100
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0100");
      let writeFd = await getFdCacheDir("pack_picture_01.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0200
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0200");
      let writeFd = await getFdCacheDir("pack_picture_02.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0300
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0300");
      let writeFd = await getFdCacheDir("pack_picture_03.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0400
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0400");
      let writeFd = await getFdCacheDir("pack_picture_04.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0500
     * @tc.name      : test picture packToFile
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create ImagePacker
     *                 3.set packingOption
     *                 4.test picture packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0500");
      let writeFd = await getFdCacheDir("pack_picture_04.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98
        };
        await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_JPEG_0100
     * @tc.name      : test picture release 
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test release picture 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_JPEG_0100', 0, async (done: Function) => {
      let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
      picture.release();
      expect(picture.getMainPixelmap() == undefined).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0100
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0100");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGBA_8888);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGBA_8888);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0200
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0200");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGB_565);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGB_565);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0300
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0300");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGBA_8888);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGBA_8888);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0400
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0400");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.BGRA_8888);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.BGRA_8888);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0600
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0600");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGBA_F16);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGBA_F16);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0700
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0700");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGBA_1010102);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGBA_1010102);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0800
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0800");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.YCBCR_P010);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.YCBCR_P010);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0900
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0900");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.YCRCB_P010);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.YCRCB_P010);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1000
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1000");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.NV21);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.NV21);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1100
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1100");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.NV12);
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.NV12);
      let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
      expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010  ,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        logger.log("auxinfo: " + JSON.stringify(auxInfo));
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_F16,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        logger.log("auxinfo: " + JSON.stringify(auxInfo));
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_F16,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_P3)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_P3)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT709)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT2020)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT2020)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0300
     * @tc.name      : test picture marshalling createPictureFromParcel
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test marshalling and create Picture From Parcel
     *                 3.compare deserialize before and after metadata
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        testMarshalling(done, logger, picture, "FRAGMENT_MAP", FRAGMENT_METADATA);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, DEPTH_MAP);
        await sleep(500);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, UNREFOCUS_MAP);
        await sleep(500);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, LINEAR_MAP);
        await sleep(500);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, FRAGMENT_MAP);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_JPEG_0100
     * @tc.name      : test ImageSource createPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have all auxiliary picture type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        let undefinedTypeList = [];
        testImageSourceCreatePicture(done, logger, "AllAuxiliaryPictures.jpg", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_JPEG_0100
     * @tc.name      : test ImageSource createPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have auxiliary picture type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP];
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "CUVAHdrMulti.jpg", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_CREATEAUXILIARYPICTURE_ERROR_JPEG_0100
     * @tc.name      : test auxiliary picture get type
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary images and store them in the picture
     *                 3.test auxiliary picture type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_CREATEAUXILIARYPICTURE_ERROR_JPEG_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_CREATEAUXILIARYPICTURE_ERROR_JPEG_0100");
      let size: image.Size = {height: -1, width: -1};
      try {
        let gainMapAuxiliaryPicture = await createAuxPic(GAINMAP, "GainMap.dat", size);
        logger.log("gainMapAuxiliaryPicture: " + gainMapAuxiliaryPicture);
        expect(false).assertTrue();
        done();
      } catch (error) {
        logger.log("error: " + JSON.stringify(error));
        expect(error.code == PARA_ERROR_CODE).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0200
     * @tc.name      : test auxiliary picture get type
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test set auxiliaryPicture info
     *                 3.throwing error code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0200");
      let gainMapAuxiliaryPicture = await createAuxPic(GAINMAP, "GainMap.dat", {height: 960, width: 720});
      try {
        let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType: GAINMAP,
          size: {height: -1, width: 3072},
          rowStride: 10,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
        }
        gainMapAuxiliaryPicture!.setAuxiliaryPictureInfo(auxiliaryPictureInfoOrigin);
      } catch (error) {
        logger.log("error: " + JSON.stringify(error));
        expect(error.code == PARA_ERROR_CODE).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0300
     * @tc.name      : test auxiliary picture get type
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test set auxiliaryPicture info
     *                 3.throwing error code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0300");
      let gainMapAuxiliaryPicture = await createAuxPic(GAINMAP, "GainMap.dat", {height: 960, width: 720});
      try {
        let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType: GAINMAP,
          size: {height: 1536, width: -1},
          rowStride: 10,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
        }
        gainMapAuxiliaryPicture!.setAuxiliaryPictureInfo(auxiliaryPictureInfoOrigin);
      } catch (error) {
        logger.log("error: " + JSON.stringify(error));
        expect(error.code == PARA_ERROR_CODE).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_0100
     * @tc.name      : test picture getHdrComposedPixelmap error
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get HdrComposed pixelMap failed
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_0100");
      testPictureApiError(done, logger, "testExif.jpg", "buffer", "hdrComposedPixelmap");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_ERROR_0300
     * @tc.name      : test picture metadata API error
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get metadata error
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_ERROR_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_ERROR_0300");
      let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
      await testGetMetadataError(done, logger, picture, FRAGMENT_METADATA);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_ERROR_0100
     * @tc.name      : test picture packing error
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing failed
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_ERROR_0100', 0, async (done: Function) => {
        let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_ERROR_0100");
        let picture = await createPictureOnlyMainPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {format: "image/png", quality: 98};
        await testPackPictureError(done, logger, packOpts, "packing", picture);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_ERROR_0100
     * @tc.name      : test picture packToFile error
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile failed
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_ERROR_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_ERROR_0100");
      let writeFd = await getFdCacheDir("pack_txt_01.jpg");
      let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
      let packOpts: image.PackingOption = {format: "image/png", quality: 98};
      await testPackPictureError(done, logger, packOpts, "packToFile", picture, writeFd);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_PNG_ERROR_0100
     * @tc.name      : test picture packToFile error
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create picture use image format is png
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_PNG_ERROR_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_PNG_ERROR_0100");
      try {
        let imageSourceApi: image.ImageSource = await getImageSource("test.png", "uri");
        let picture: image.Picture = await imageSourceApi.createPicture();
        if (picture != undefined) {
          expect(false).assertEqual(true);
          done();
        }
      } catch (error) {
        logger.log("createPicture by imageSource is error: " + JSON.stringify(error) + ", error code is: " + error.code);
        expect(error.code == UNSUPPORTED_DECODE_CODE).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0100
     * @tc.name      : test ImageSource createPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have gain map type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "buffer",
            typeList, undefinedTypeList);
      }
    })
  
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0200
     * @tc.name      : test ImageSource createPicture decodingOptForPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have gain map type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "uri",
            typeList, undefinedTypeList);
      }
    })
  
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0300
     * @tc.name      : test ImageSource createPicture decodingOptForPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have gain map type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "fd",
            typeList, undefinedTypeList);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0400
     * @tc.name      : test ImageSource createPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test haven't auxiliaryPicture
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let undefinedTypeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "buffer");
        for (let i = 0; i < undefinedTypeList.length; i++) {
          let ret = picture?.getAuxiliaryPicture(undefinedTypeList[i]) == undefined;
          logger.log("ret = " + ret)
          expect(ret).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_HEIF_0100
     * @tc.name      : test Image createPicture
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.test haven't auxiliaryPicture
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let undefinedTypeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        for (let i = 0; i < undefinedTypeList.length; i++) {
          let ret = picture?.getAuxiliaryPicture(undefinedTypeList[i]) == undefined;
          logger.log("ret = " + ret)
          expect(ret).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_HEIF_0100
     * @tc.name      : test auxiliary picture get type
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary images and store them in the picture
     *                 3.test auxiliary picture type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testGetType(done, logger, "0801_sdr2.heic", "fd", typeList);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_HEIF_0100
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        testPictureApi(done, logger, "0801_sdr2.heic", "buffer", "mainPixelMap");
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_HEIF_0100
     * @tc.name      : test picture getHdrComposedPixelmap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get HdrComposed pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        testPictureApi(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "buffer", "hdrComposedPixelmap");
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_HEIF_0100
     * @tc.name      : test picture getGainmapPixelmap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get gainmap pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        testPictureApi(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "buffer", "gainMapPixelMap");
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0100
     * @tc.name      : test picture marshalling createPictureFromParcel
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test marshalling and create Picture From Parcel
     *                 3.compare deserialize before and after main pixel map info and metadata 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        testMarshalling(done, logger, picture, "picture", EXIF_METADATA);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0200
     * @tc.name      : test picture marshalling createPictureFromParcel
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test marshalling and create Picture From Parcel
     *                 3.compare deserialize before and after gainmap pixel map info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("HEIFISOMultiChannelBaseColor0512V12.heic", "fd");
        testMarshalling(done, logger, picture, "GAINMAP");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0300
     * @tc.name      : test picture marshalling createPictureFromParcel
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test marshalling and create Picture From Parcel
     *                 3.compare deserialize before and after metadata
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        testMarshalling(done, logger, picture, "FRAGMENT_MAP", FRAGMENT_METADATA);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: await colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010  ,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU)
          }
          let typeList = [GAINMAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_F16,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT)
          }
          let typeList = [DEPTH_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_F16,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_P3)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_P3)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT709)
          }
          let typeList = [LINEAR_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT2020)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT2020)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: {width: auxSize.width, height: auxSize.height},
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP];
          testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0100
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("HEIFISOMultiChannelBaseColor0512V12.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, GAINMAP);
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0200
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, DEPTH_MAP);
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0300
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, UNREFOCUS_MAP);
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0400
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, LINEAR_MAP);
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0500
     * @tc.name      : test AuxiliaryPicture API
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get auxiliaryPicture type
     *                 3.test set auxiliaryPicture info
     *                 4.test get auxiliaryPicture info
     *                 5.test auxiliaryPicture read pixels to buffer
     *                 6.test auxiliaryPicture write pixels from buffer
     *                 7.test auxiliaryPicture release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, FRAGMENT_MAP);
      };
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_HEIF_0100
     * @tc.name      : test picture release 
     * @tc.desc      : 1.create main pixelMap
     *                 2.create picture object by main pixelMap
     *                 3.test release picture 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        picture.release();
        expect(picture.getMainPixelmap() == undefined).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0100
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_8888);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_8888);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0200
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0200', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGB_565);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGB_565);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0300
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_8888);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_8888);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0400
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0400', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.BGRA_8888);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.BGRA_8888);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0500
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0500', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_F16);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_F16);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0600
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0600', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_1010102);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_1010102);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0700
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0700', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.YCBCR_P010);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.YCBCR_P010);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0800
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0800', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.YCRCB_P010);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.YCRCB_P010);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0900
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0900', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.NV21);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.NV21);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_1000
     * @tc.name      : test picture getMainPixelMap
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get main pixelMap info
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_1000', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.NV12);
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.NV12);
        let mainPixelMapImageInfo = picture.getMainPixelmap().getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo));
        expect(mainPixelMapImageInfo.pixelFormat == pixelMapImageInfo.pixelFormat).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_HEIF_0100
     * @tc.name      : test ImageSource createPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have all auxiliary picture type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        let undefinedTypeList = [];
        testImageSourceCreatePicture(done, logger, "all_auxtype.heic", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_HEIF_0100
     * @tc.name      : test ImageSource createPicture
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test auxiliaryPicture have all auxiliary picture type
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_HEIF_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support hdr");
        expect(true).assertTrue();
        done();
      } else {
        let typeList = [];
        let undefinedTypeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "HDRVividSingleLayer.heic", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_ERROR_0300
     * @tc.name      : test picture metadata API error
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.test get metadata error
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_ERROR_0300', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_ERROR_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        await testGetMetadataError(done, logger, picture, FRAGMENT_METADATA);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_HEIF_ERROR_0100
     * @tc.name      : test picture packing error
     * @tc.desc      : 1.create picture object by main pixelMap
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packing failed
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_HEIF_ERROR_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_HEIF_ERROR_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {format: "image/png", quality: 98};
        await testPackPictureError(done, logger, packOpts, "packing", picture);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_HEIF_ERROR_0100
     * @tc.name      : test picture packToFile error
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.create auxiliary picture and insert them into the picture
     *                 3.create ImagePacker
     *                 4.set packingOption
     *                 5.test picture packToFile failed
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_HEIF_ERROR_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_HEIF_ERROR_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_txt_01.heic");
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {format: "image/png", quality: 98};
        await testPackPictureError(done, logger, packOpts, "packToFile", picture, writeFd);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_OPTION_NULL_HEIF_ERROR_0100
     * @tc.name      : test picture packToFile error
     * @tc.desc      : 1.create picture object by decode image source
     *                 2.set desiredAuxiliaryPictures is null
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_OPTION_NULL_HEIF_ERROR_0100', 0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_OPTION_NULL_HEIF_ERROR_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(true).assertTrue();
        done();
      } else {
        try {
          let imageSource: image.ImageSource = await getImageSource("all_auxtype.heic", "fd");
          let picture = await imageSource.createPicture(null);
        } catch (error) {
          logger.log("create picture error" + JSON.stringify(error));
          expect(error.code == PARA_ERROR_CODE).assertTrue();
          done();
        }
      }
    })
  })
}