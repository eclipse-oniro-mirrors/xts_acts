/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';
// import taskpool from '@ohos.taskpool';
import { initialize } from './AbilityContextHelper.test';

let sleep = async (delay: int): Promise<int> => {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, delay);
  });
};

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }

  printRecord(record: Record<string, string | null>, recordName: string) {
    Object.keys(record).forEach(key => {
      const value = record[key];
      if (value !== null) {
        this.log(`${recordName}(${key}) success:  + ${JSON.stringify(value)}`);
      } else {
        this.log(`${recordName}(${key}) is null!`);
      }
    });
  }
}

class MySequence implements rpc.Parcelable {
  picture_: image.Picture;

  constructor(conPicture: image.Picture) {
    this.picture_ = conPicture;
  }

  marshalling(messageSequence: rpc.MessageSequence): boolean {
    this.picture_.marshalling(messageSequence);
    return true;
  }

  unmarshalling(messageSequence: rpc.MessageSequence): boolean {
    let picture: image.Picture = image.createPictureFromParcel(messageSequence)
    this.picture_ = picture;
    return true;
  }
}

export default function imagePicture() {
  let filesDir: string|undefined;
  let cacheDir: string|undefined;
  let context: common.UIAbilityContext | undefined;
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

  describe('imagePicture', (): void => {
    beforeAll(() => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined;
      cacheDir = Hypium.get('cacheDir') as string | undefined;
      context = Hypium.get('context') as common.UIAbilityContext;
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "test.jpg")!.supportedFormats.includes("image/heic");
      isSupportHEICEncode =
        image.createImagePacker().supportedFormats.includes("image/heic");

      try {
        isSupportHdr = await fs.access('/system/lib64/ndk/libvideo_processing_capi_impl.so');
      } catch (err) {
        console.error("access failed with error message: " + err.message + ", error code: " + err.code);
        isSupportHdr = false;
      }
    })

    afterEach(async () => {
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

    const getImageSource = async (fileName: string, type?: string): Promise<image.ImageSource | undefined> => {
      let imageSourceApi: image.ImageSource | undefined;
      if (type === "buffer") {
        const buffer = getBuffer(fileName);
        imageSourceApi = image.createImageSource(buffer);
      } else if (type === "uri") {
        const filePath = filesDir + '/' + fileName
        imageSourceApi = image.createImageSource(filePath);
      } else if (type === "rawfile") {
        const resourceMgr: resourceManager.ResourceManager = context!.resourceManager;
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
      return imageSourceApi;
    }

    const createAuxPicByType = async (
      auxiliaryPictureType: image.AuxiliaryPictureType
    ): Promise<image.AuxiliaryPicture> => {
      let buffer = new ArrayBuffer(180 * 240 * 4);
      let size: image.Size = {height: 180, width: 240};
      let auxiliaryPicture: image.AuxiliaryPicture = image.createAuxiliaryPicture(buffer, size, auxiliaryPictureType);
      return auxiliaryPicture;
    }

    const createPictureImageSourcePic = async (fileName: string, type: string, auxType?: image.AuxiliaryPictureType): Promise<image.Picture | undefined> => {
      let imageSourceApi = await getImageSource(fileName, type);
      if (imageSourceApi == undefined) {
        hilog.info(0x0000, "imagePicture", 'createPictureImageSourcePic failed! imageSourceApi is undefined!');
        return undefined;
      }
      let picture: image.Picture | undefined;
      if (auxType) {
        let decodingOptForPicture: image.DecodingOptionsForPicture;
        decodingOptForPicture = {desiredAuxiliaryPictures: [auxType]};
        picture = await imageSourceApi.createPicture(decodingOptForPicture);
      } else {
        picture = await imageSourceApi.createPicture();
      }
      await imageSourceApi.release();
      return picture;
    }

    const createPicImageSourceWithAuxPics = async (
      fileName: string,
      type: string
    ): Promise<image.Picture | undefined> => {
      let picture = await createPictureImageSourcePic(fileName, type);
      if (picture == undefined) {
        hilog.info(0x0000, "imagePicture", 'createPicImageSourceWithAuxPics failed! picture is undefined!');
        return undefined;
      }
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

    const myGetPixelMap = async (
      fileName: string,
      type: string,
      pixelFormat: image.PixelMapFormat
    ): Promise<image.PixelMap | undefined> => {
      let imageSourceApi = await getImageSource(fileName, type);
      if (imageSourceApi == undefined) {
        hilog.info(0x0000, "imagePicture", 'myGetPixelMap failed! imageSourceApi is undefined!');
        return undefined;
      }
      let DecodingOptions: image.DecodingOptions = {
        desiredPixelFormat: pixelFormat
      };
      let pixelMap = await imageSourceApi.createPixelMap(DecodingOptions);
      await imageSourceApi.release();
      return pixelMap;
    }

    const createPictureOnlyMainPic = async (fileName: string, type: string, pixelFormat?: image.PixelMapFormat): Promise<image.Picture | undefined> => {
      let imageSourceApi = await getImageSource(fileName, type);
      if (imageSourceApi == undefined) {
        hilog.info(0x0000, "imagePicture", 'createPictureOnlyMainPic failed! imageSourceApi is undefined!');
        return undefined;
      }
      let pixelMap: image.PixelMap | undefined;
      if (pixelFormat != undefined) {
        let DecodingOptions: image.DecodingOptions = {
          desiredPixelFormat: pixelFormat
        };
        pixelMap = await imageSourceApi.createPixelMap(DecodingOptions);
      } else {
        pixelMap = await imageSourceApi.createPixelMap();
      }
      if (pixelMap == undefined) {
        hilog.info(0x0000, "imagePicture", 'createPictureOnlyMainPic failed! pixelMap is undefined!');
        return undefined;
      }
      let picture = image.createPicture(pixelMap!);
      await imageSourceApi.release();
      await pixelMap.release();
      return picture;
    }

    const createAuxPic = async (
      auxiliaryPictureType: image.AuxiliaryPictureType,
      fileName: string,
      size: image.Size
    ): Promise<image.AuxiliaryPicture> => {
      const buffer = getBuffer(fileName!!);
      let auxiliaryPicture: image.AuxiliaryPicture = image.createAuxiliaryPicture(buffer, size, auxiliaryPictureType);
      return auxiliaryPicture;
    }

    const testPictureGetMetadataError = async (
      done: () => void,
      logger: Logger,
      picture: image.Picture,
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
        error = error as BusinessError;
        picture.release();
        logger.log(`getProperties error ` + JSON.stringify(error) + error.code);
        expect(error.code == UNSUPPORTED_ERROR_CODE).assertTrue();
        done();
      }
    }

    const testPackPictureError = async (
      done: () => void,
      logger: Logger,
      packOpts: image.PackingOption,
      packType: string,
      picture: image.Picture,
      fdNum?: int,
    ) => {
      if (picture == undefined) {
        logger.log("create Picture failed.");
        expect(false).assertTrue();
        done();
      } else {
        const imagePackerApi: image.ImagePacker = image.createImagePacker();
        if (packType === "packing") {
          try {
            let data: ArrayBuffer = await imagePackerApi.packing(picture, packOpts);
            logger.log("packing success");
            picture.release();
            await imagePackerApi.release();
            expect(false).assertTrue();
            done();
          } catch (error) {
            error = error as BusinessError;
            logger.log(`packing picture to buffer failed: ${error}, error code: ${JSON.stringify(error.code)}`);
            picture.release();
            await imagePackerApi.release();
            expect(error.code == PARA_ERROR_CODE).assertTrue();
            done();
          }
        } else {
          try {
            await imagePackerApi.packToFile(picture, fdNum!!, packOpts);
            logger.log("packToFile success");
            picture.release();
            await imagePackerApi.release();
            expect(false).assertTrue();
            done();
          } catch (error) {
            error = error as BusinessError;
            logger.log(`packing picture to buffer failed: ${error}, error code: ${JSON.stringify(error.code)}`);
            picture.release();
            await imagePackerApi.release();
            expect(error.code == PARA_ERROR_CODE).assertTrue();
            done();
          }
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
      done: () => void,
      logger: Logger,
      fileName: string,
      type: string,
      typeList: Array<image.AuxiliaryPictureType>,
      undefinedTypeList: Array<image.AuxiliaryPictureType>
    ) => {
      let picture: image.Picture | undefined;
      let imageSource = await getImageSource(fileName, type);
      if (imageSource == undefined) {
        logger.log("testImageSourceCreatePicture failed. getImageSource failed. imageSource is undefined!");
        expect(false).assertTrue();
        done();
      } else {
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
          let ret = checkPicture(picture!, typeList, undefinedTypeList);
          picture.release();
          await imageSource.release();
          logger.log("ret = " + ret)
          expect(ret).assertTrue();
          done();
        }
      }
    }

    const testGetType = async (
      done: () => void,
      logger: Logger,
      fileName: string,
      type: string,
      typeList: Array<image.AuxiliaryPictureType>
    ) => {
      let picture: image.Picture | undefined;
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
        picture.release();
        expect(result).assertTrue();
        done();
      }
    }

    const testPictureApi = async (
      done: () => void,
      logger: Logger,
      fileName: string,
      type: string,
      apiName: String
    ): Promise<void> => {
      let imageInfo: image.ImageInfo|undefined;
      let picture: image.Picture | undefined;
      picture = await createPictureImageSourcePic(fileName, type);
      if (picture == undefined) {
        logger.log("testPictureApi failed. create Picture failed.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let imageSourceApi = await getImageSource(fileName, type);
      if (imageSourceApi == undefined) {
        logger.log("testPictureApi failed. getImageSource failed. imageSourceApi is undefined!");
        expect(false).assertTrue();
        done();
      } else {
        let pixelMap = await imageSourceApi.createPixelMap();
        await imageSourceApi.release();
        if (pixelMap == undefined) {
          logger.log("testPictureApi failed. create PixelMap failed.");
          picture.release();
          expect(false).assertTrue();
          done();
          return undefined;
        }

        let newPixelMap: image.PixelMap | undefined | null;
        if (apiName == "mainPixelMap") {
          newPixelMap = picture.getMainPixelmap();
        } else if (apiName == "hdrComposedPixelmap") {
          newPixelMap = await picture.getHdrComposedPixelmap();
        } else {
          newPixelMap = picture.getGainmapPixelmap();
        }
        if (newPixelMap == undefined || newPixelMap == null) {
          logger.log("newPixelMap is undefined. Because of apiName: " + apiName);
          picture.release();
          expect(false).assertTrue();
          done();
          return undefined;
        } else {
          imageInfo = newPixelMap.getImageInfoSync();
          await newPixelMap.release();
        }
        picture.release();

        logger.log("imageInfo: " + JSON.stringify(imageInfo));
        if (apiName == "mainPixelMap") {
          expect(JSON.stringify(imageInfo) == JSON.stringify(pixelMap.getImageInfoSync())).assertTrue();
          await pixelMap.release();
          done();
        } else if (apiName == "hdrComposedPixelmap") {
          expect(imageInfo?.pixelFormat == image.PixelMapFormat.RGBA_1010102).assertTrue();
          expect(imageInfo?.isHdr).assertTrue();
          await pixelMap.release();
          done();
        } else {
          expect(imageInfo?.pixelFormat == image.PixelMapFormat.RGBA_8888).assertTrue();
          await pixelMap.release();
          done();
        }
      }
    }

    const testPictureApiError = async (
      done: () => void,
      logger: Logger,
      fileName: string,
      type: string,
      apiName: String
    ) => {
      let picture: image.Picture | undefined;
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
            error = error as BusinessError;
            logger.log(JSON.stringify(error) + ", error code: " + error.code);
            expect(error.code == Unsupported_operation_CODE).assertTrue();
            done();
          } finally {
            picture.release();
          }
        } else {
          let gainMapPixelMap = picture.getGainmapPixelmap();
          logger.log("gainMapPixelMap: " + gainMapPixelMap);
          expect(gainMapPixelMap == undefined).assertTrue();
          picture.release();
          done();
        }
      }
    }



    const testMarshalling = async (
      done: () => void,
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
      } else if (type == "FRAGMENT_MAP" && metadataType != undefined) {
        let marshallingAuxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let unmarshallingAuxPicture = ret.picture_.getAuxiliaryPicture(FRAGMENT_MAP);
        let marshallingMetadata = await marshallingAuxPicture!.getMetadata(metadataType);
        let unmarshallingMetadata = await unmarshallingAuxPicture!.getMetadata(metadataType);
        let marshallingProperties = await marshallingMetadata!.getAllProperties();
        let unmarshallingProperties = await unmarshallingMetadata!.getAllProperties();
        logger.log(`marshalling properties: ` + JSON.stringify(marshallingProperties));
        logger.log(`unmarshalling properties: ` + JSON.stringify(unmarshallingProperties));
        expect(JSON.stringify(marshallingProperties) == JSON.stringify(unmarshallingProperties)).assertTrue();
        done();
      } else if (metadataType != undefined) {
        let marshallingMainPixelMap = picture.getMainPixelmap();
        let unmarshallingMainPixelMap = ret.picture_.getMainPixelmap();
        let marshallingImageInfo = marshallingMainPixelMap!.getImageInfoSync();
        let unmarshallingImageInfo = unmarshallingMainPixelMap!.getImageInfoSync()
        logger.log(`marshallingMain imageInfoSync: ` + JSON.stringify(marshallingImageInfo));
        logger.log(`unmarshallingMain imageInfoSync: ` + JSON.stringify(unmarshallingImageInfo));
        expect(JSON.stringify(marshallingImageInfo) == JSON.stringify(unmarshallingImageInfo)).assertTrue();

        let marshallingMetadata = await picture.getMetadata(metadataType);
        let unmarshallingMetadata = await ret.picture_.getMetadata(metadataType);
        let marshallingProperties = await marshallingMetadata!.getAllProperties();
        let unmarshallingProperties = await unmarshallingMetadata!.getAllProperties();
        logger.log(`marshalling properties: ` + JSON.stringify(marshallingProperties));
        logger.log(`unmarshalling properties: ` + JSON.stringify(unmarshallingProperties));
        expect(JSON.stringify(marshallingProperties) == JSON.stringify(unmarshallingProperties)).assertTrue();
        done();
      }
    }

    const testMetadataClone = async (
      done: () => void,
      logger: Logger,
      metadata: image.Metadata,
    ) => {
      //getAllProperties
      let properties = await metadata.getAllProperties();
      logger.printRecord(properties!, "properties, getAllProperties");
      let propertiesGotKey = Object.keys(properties!);
      //clone Metadata
      let clonedData = await metadata.clone();
      logger.log("clone metadata success");
      //getAllProperties
      let clonedProperties = await clonedData!.getAllProperties();
      logger.printRecord(clonedProperties!, "clonedProperties, getAllProperties");
      let propertiesClonedKey = Object.keys(clonedProperties!);
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
        if (properties![key] !== clonedProperties![key]) {
          logger.log(
            `cloned data has different value of: ${key}: ${properties![key]}
              ${clonedProperties![key]}`
          );
          expect(false).assertTrue();
          done();
        }
      }
      expect(true).assertTrue();
      done();
    }

    const testPictureMetadataProperty = async (
      done: () => void,
      logger: Logger,
      properties: Record<string, string|null>,
      picture: image.Picture,
      metadataType: image.MetadataType
    ) => {
      try {
        logger.log(`testPictureMetadataProperty start `);
        if (picture != null) {
          //getMetadata
          let metadata = await picture.getMetadata(metadataType);
          logger.log(`getMetadata success: ` + metadata);
          //setProperties
          await metadata!.setProperties(properties);
          logger.log(`setProperties success `);

          //setMetadata
          await picture.setMetadata(metadataType, metadata!);
          logger.log(`setMetadata success `);
          //getMetadata
          let dataAfterSet = await picture.getMetadata(metadataType);
          logger.log(`get new metadata success: ` + dataAfterSet);
          //getProperties
          let getProperties: Array<string> = [];
          for (const key of properties) {
            getProperties.push(key[0]);
          }
          let data = await dataAfterSet!.getProperties(getProperties);
          logger.log(`getProperties(data) success: ` + JSON.stringify(data));
          getProperties.forEach((key) => {
            logger.log(`getProperty of key: ` + key);
            expect(properties![key] == data![key]).assertTrue();
          });
          picture.release();
          await testMetadataClone(done, logger, metadata!);
          done();
        }
      } catch (error) {
        logger.log(`testPictureMetadataProperty failed: ${error}, error code: ${JSON.stringify(error.code)}`);
        expect(false).assertTrue();
        done();
      }
    }

    const testAuxPictureMetadataProperty = async (
      done: () => void,
      logger: Logger,
      properties: Record<string, string|null>,
      picture: image.AuxiliaryPicture | null,
      metadataType: image.MetadataType
    ) => {
      try {
        logger.log(`testAuxPictureMetadataProperty start `);
        if (picture != null) {
          //getMetadata
          let metadata = await picture.getMetadata(metadataType);
          logger.log(`getMetadata success: ` + metadata);
          //setProperties
          await metadata!.setProperties(properties);
          logger.log(`setProperties success `);

          //setMetadata
          await picture.setMetadata(metadataType, metadata!);
          logger.log(`setMetadata success `);
          //getMetadata
          let dataAfterSet = await picture.getMetadata(metadataType);
          logger.log(`get new metadata success: ` + dataAfterSet);
          //getProperties
          let getProperties: Array<string> = [];
          for (const key of properties) {
            getProperties.push(key[0]);
          }
          let data = await dataAfterSet!.getProperties(getProperties);
          logger.log(`getProperties(data) success: ` + JSON.stringify(data));
          getProperties.forEach((key) => {
            logger.log(`getProperty of key: ` + key);
            expect(properties![key] == data![key]).assertTrue();
          });
          picture.release();
          await testMetadataClone(done, logger, metadata!);
          done();
        }
      } catch (error) {
        logger.log(`testAuxPictureMetadataProperty failed: ${error}, error code: ${JSON.stringify(error.code)}`);
        expect(false).assertTrue();
        done();
      }
    }

    const testReadPixelsToBuffer = async (
      done: () => void,
      logger: Logger,
      picture: image.Picture,
      auxType: image.AuxiliaryPictureType
    ) => {
      let auxiliaryPicture = picture.getAuxiliaryPicture(auxType);

      //readPixelsToBuffer
      let beforeArrayBuffer = await auxiliaryPicture!.readPixelsToBuffer();
      logger.log(`read beforeArrayBuffer success: ` + beforeArrayBuffer!.byteLength);
      //writePixelsFromBuffer
      await auxiliaryPicture!.writePixelsFromBuffer(beforeArrayBuffer!);
      logger.log(`writePixelsFromBuffer success `);
      //readPixelsToBuffer
      let afterArrayBuffer = await auxiliaryPicture!.readPixelsToBuffer();
      auxiliaryPicture!.release();
      picture.release();
      logger.log(`readPixelsToBuffer success: ` + afterArrayBuffer!.byteLength);
      expect(beforeArrayBuffer!.byteLength == afterArrayBuffer!.byteLength).assertTrue();
      done();
    }

    const testAuxMetadata = async (
      done: () => void,
      logger: Logger,
      picture: image.Picture,
      auxType: image.AuxiliaryPictureType
    ) => {
      let auxiliaryPicture = picture.getAuxiliaryPicture(auxType);

      let beforeMetadata = await auxiliaryPicture!.getMetadata(FRAGMENT_METADATA);
      logger.log(`AuxiliaryPicture getMetadata success: ` + JSON.stringify(beforeMetadata));

      await auxiliaryPicture!.setMetadata(FRAGMENT_METADATA, beforeMetadata!);
      logger.log(`AuxiliaryPicture setMetadata success `);
      let afterMetadata = await auxiliaryPicture!.getMetadata(FRAGMENT_METADATA);
      logger.log(`AuxiliaryPicture getMetadata success: ` + JSON.stringify(afterMetadata));
      auxiliaryPicture!.release();
      picture.release();
      expect(afterMetadata != undefined).assertTrue();
      done();
    }

    const testAuxiliaryPictureInfo = async (
      done: () => void,
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

        expect(JSON.stringify(afterAuxInfo!.auxiliaryPictureType) == JSON.stringify(originAuxInfo.auxiliaryPictureType)).assertTrue();
        expect(JSON.stringify(afterAuxInfo!.size.width) == JSON.stringify(originAuxInfo.size.width)).assertTrue();
        expect(JSON.stringify(afterAuxInfo!.size.height) == JSON.stringify(originAuxInfo.size.height)).assertTrue();
        expect(JSON.stringify(afterAuxInfo!.pixelFormat) == JSON.stringify(originAuxInfo.pixelFormat)).assertTrue();
        expect(JSON.stringify(afterAuxInfo!.rowStride) == JSON.stringify(originAuxInfo.rowStride)).assertTrue();

        //release
        auxiliaryPicture!.release();
        picture.release();
        logger.log("release success");
      }
      done();
    }

    const getFdCacheDir = async (fileName: string): Promise<int> => {
      const uri: string = cacheDir + '/' + fileName;
      const file: fs.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      return file.fd as int;
    }

    const checkPackResult = async (
      logger: Logger,
      imageSource: image.ImageSource,
      flag: string,
      packOpts: image.PackingOption,
      originPicture: image.Picture,
      type?: image.AuxiliaryPictureType
    ): Promise<boolean> => {
      let decodeProperties: Record<string, string | null> | undefined;
      let originProperties: Record<string, string | null> | undefined;
      let picture = await imageSource.createPicture();
      if (picture == undefined) {
        logger.log("checkPackResult failed. createPicture failed. picture is undefined.");
        return false;
      }
      let metadata: image.Metadata | undefined = undefined;
      if(packOpts.needsPackProperties == true) {
        metadata = await picture.getMetadata(EXIF_METADATA);
        decodeProperties = await metadata!.getAllProperties();
        let originMetadata = await originPicture.getMetadata(EXIF_METADATA);
        originProperties = await originMetadata!.getAllProperties();
        logger.log(`originProperties: ${JSON.stringify(originProperties)}`);
      }
      let auxType: image.AuxiliaryPictureType | undefined;
      if (type != undefined) {
        auxType = picture.getAuxiliaryPicture(type)?.getType();
      }

      let imageInfo = imageSource.getImageInfoSync();
      if (imageInfo == undefined) {
        logger.log("checkPackResult failed. getImageInfoSync failed. imageInfo is undefined.");
        return false;
      }
      logger.log(`isHdr: ${imageInfo.isHdr}, mimeType: ${imageInfo.mimeType}, auxType: ${auxType}`);
      await imageSource.release();
      if (flag == "picture") {
        if (packOpts.desiredDynamicRange == image.PackingDynamicRange.AUTO && packOpts.needsPackProperties == true) {
          return imageInfo.mimeType == packOpts.format && imageInfo.isHdr == false && JSON.stringify(originProperties!) == JSON.stringify(decodeProperties!);
        } else {
          return imageInfo.mimeType == packOpts.format && imageInfo.isHdr == false && metadata == undefined;
        }
      } else {
        if (type == GAINMAP){
          if (packOpts.desiredDynamicRange == image.PackingDynamicRange.AUTO && packOpts.needsPackProperties == true) {
            return imageInfo.mimeType == packOpts.format && imageInfo.isHdr == true && JSON.stringify(originProperties!) == JSON.stringify(decodeProperties!);
          } else {
            return imageInfo.mimeType == packOpts.format && imageInfo.isHdr == false && metadata == undefined;
          }
        } else {
          if (packOpts.desiredDynamicRange == image.PackingDynamicRange.AUTO && packOpts.needsPackProperties == true) {
            return imageInfo.mimeType == packOpts.format && imageInfo.isHdr == false && auxType == type
              && JSON.stringify(originProperties!) == JSON.stringify(decodeProperties!);
          } else {
            return imageInfo.mimeType == packOpts.format && imageInfo.isHdr == false && auxType == undefined
              && metadata == undefined;
          }
        }
      }
    }

    const testPackPicture =  async (
      done: () => void,
      logger: Logger,
      packOpts: image.PackingOption,
      packType: string,
      picture: image.Picture,
      flag: string,
      fdNum?: int,
      type?: image.AuxiliaryPictureType
    ) => {
      if (picture == undefined) {
        logger.log("create Picture failed.");
        expect(false).assertTrue();
        done();
      } else {
        const imagePackerApi: image.ImagePacker = image.createImagePacker();
        if (packType === "packing") {
          try {
            let data: ArrayBuffer = await imagePackerApi.packing(picture, packOpts);
            let imageSource = image.createImageSource(data);
            if (imageSource == undefined) {
              logger.log("testPackPicture failed. createImageSource failed. imageSource is undefined.");
              picture.release();
              await imagePackerApi.release();
              expect(false).assertTrue();
              done();
            } else {
              let ret = await checkPackResult(logger, imageSource!, flag, packOpts, picture, type);
              picture.release();
              await imagePackerApi.release();
              expect(ret).assertTrue();
              done(); 
            }
          } catch (error) {
            logger.log(`packing picture to buffer failed: ${error}, error code: ${JSON.stringify(error.code)}`);
            expect(false).assertTrue();
            done();
          }
        } else {
          try {
            await imagePackerApi.packToFile(picture, fdNum!!, packOpts);
            let imageSource = image.createImageSource(fdNum!!);
            if (imageSource == undefined) {
              logger.log("testPackPicture failed. createImageSource failed. imageSource is undefined.");
              picture.release();
              await imagePackerApi.release();
              expect(false).assertTrue();
              done();
            } else {
              let ret = await checkPackResult(logger, imageSource, flag, packOpts, picture, type);
              picture.release();
              await imagePackerApi.release();
              fs.closeSync(fdNum!!);
              expect(ret).assertTrue();
              done();
            }
          } catch (error) {
            logger.log(`packToFile picture to buffer failed: ${error}, error code: ${JSON.stringify(error.code)}`);
            expect(false).assertTrue();
            done();
          }
        }
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_STATIC_0100
     * @tc.desc   test ImageSource createPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "JPEGISOSingle.jpg", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_JPEG_STATIC_0100
     * @tc.desc   test Image createPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_JPEG_STATIC_0100");
      let undefinedTypeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd");
      if (picture == undefined) {
        logger.log("createPictureImageSourcePic failed. picture is undefined.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      for (let i = 0; i < undefinedTypeList.length; i++) {
        let ret = picture.getAuxiliaryPicture(undefinedTypeList[i]) == undefined;
        logger.log("ret = " + ret)
        expect(ret).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("HEIFISOMultiChannelBaseColor0512V12.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          //readPixelsToBuffer && writePixelsFromBuffer
          await testReadPixelsToBuffer(done, logger, picture!, GAINMAP);
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0200
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          //readPixelsToBuffer && writePixelsFromBuffer
          await testReadPixelsToBuffer(done, logger, picture, DEPTH_MAP);
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0300
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          //readPixelsToBuffer && writePixelsFromBuffer
          await testReadPixelsToBuffer(done, logger, picture, UNREFOCUS_MAP);
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0400
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          //readPixelsToBuffer && writePixelsFromBuffer
          await testReadPixelsToBuffer(done, logger, picture, LINEAR_MAP);
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0500
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          //readPixelsToBuffer && writePixelsFromBuffer
          await testReadPixelsToBuffer(done, logger, picture, FRAGMENT_MAP);
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          //readPixelsToBuffer && writePixelsFromBuffer
          await testReadPixelsToBuffer(done, logger, picture, GAINMAP);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0200
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          //readPixelsToBuffer && writePixelsFromBuffer
          await testReadPixelsToBuffer(done, logger, picture, DEPTH_MAP);
          await sleep(500);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0300
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          //readPixelsToBuffer && writePixelsFromBuffer
          await testReadPixelsToBuffer(done, logger, picture, UNREFOCUS_MAP);
          await sleep(500);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0400
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          //readPixelsToBuffer && writePixelsFromBuffer
          await testReadPixelsToBuffer(done, logger, picture, LINEAR_MAP);
          await sleep(500);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0500
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          //readPixelsToBuffer && writePixelsFromBuffer
          await testReadPixelsToBuffer(done, logger, picture, FRAGMENT_MAP);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_JPEG_STATIC_0100
     * @tc.desc   test auxiliary picture get type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_JPEG_STATIC_0100");
      let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
      await testGetType(done, logger, "testExif.jpg", "fd", typeList);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_JPEG_STATIC_0100
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_JPEG_STATIC_0100");
      await testPictureApi(done, logger, "testExif.jpg", "buffer", "mainPixelMap");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_STATIC_0100
     * @tc.desc   test picture getHdrComposedPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        await testPictureApi(done, logger, "JPEGISOSingle.jpg", "buffer", "hdrComposedPixelmap");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_STATIC_0100
     * @tc.desc   test picture getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_STATIC_0100");
      await testPictureApi(done, logger, "JPEGISOSingle.jpg", "buffer", "gainMapPixelMap");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_STATIC_0100
     * @tc.desc   test picture marshalling createPictureFromParcel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_ERROR_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_ERROR_STATIC_0100");
        testPictureApiError(done, logger, "testExif.jpg", "buffer", "gainMapPixelMap");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_STATIC_0100
     * @tc.desc   test picture marshalling createPictureFromParcel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          await testMarshalling(done, logger, picture, "picture", EXIF_METADATA);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_STATIC_0200
     * @tc.desc   test picture marshalling createPictureFromParcel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          await testMarshalling(done, logger, picture, "GAINMAP");
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_STATIC_0300
     * @tc.desc   test picture marshalling createPictureFromParcel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          await testMarshalling(done, logger, picture, "FRAGMENT_MAP", FRAGMENT_METADATA);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_STATIC_0100
     * @tc.desc   test picture marshalling createPictureFromParcel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          await testMarshalling(done, logger, picture, "picture", EXIF_METADATA);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_STATIC_0200
     * @tc.desc   test picture marshalling createPictureFromParcel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("HEIFISOMultiChannelBaseColor0512V12.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          await testMarshalling(done, logger, picture, "GAINMAP");
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_STATIC_0300
     * @tc.desc   test picture marshalling createPictureFromParcel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          await testMarshalling(done, logger, picture, "FRAGMENT_MAP", FRAGMENT_METADATA);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARYPICTURE_FRAGMENT_MAP_METADATA_API_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARYPICTURE_FRAGMENT_MAP_METADATA_API_JPEG_STATIC_0100
     * @tc.desc   test picture metadata API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARYPICTURE_FRAGMENT_MAP_METADATA_API_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_AUXILIARYPICTURE_FRAGMENT_MAP_METADATA_API_JPEG_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          await testAuxMetadata(done, logger, picture, FRAGMENT_MAP);
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let size: image.Size ={ width: 1536, height: 2048 };
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: 10,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_STATIC_0100
     * @tc.desc   test picture metadata API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          await testPictureMetadataProperty(done, logger, exifRecords, picture, EXIF_METADATA);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_STATIC_0100
     * @tc.desc   test picture metadata API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          await testPictureMetadataProperty(done, logger, exifRecords, picture, EXIF_METADATA);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_STATIC_0100
     * @tc.desc   test auxiliary picture metadata API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support heif decode");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
          if (auxPicture == null) {
            logger.log("getAuxiliaryPicture failed. auxPicture is null.");
            expect(false).assertTrue();
            done();
          } else {
            let fragmentRecords: Record<string, string|null> = {
              "XInOriginal" : "0", "YInOriginal" : "0", "FragmentImageWidth": "512", "FragmentImageHeight": "512"
            };
            await testAuxPictureMetadataProperty(done, logger, fragmentRecords, auxPicture, FRAGMENT_METADATA);
          }
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_STATIC_0200
     * @tc.desc   test auxiliary picture metadata API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support heif decode");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
          if (auxPicture != undefined) {
            let metadata = await auxPicture.getMetadata(FRAGMENT_METADATA);
            logger.log(`get metadata success: ` + metadata);
            let fragmentkeys: string[] = [X_IN_ORIGINAL, Y_IN_ORIGINAL, WIDTH, HEIGHT];
            let properties = await metadata!.getProperties(fragmentkeys);
            logger.log(`getProperties success: ` + JSON.stringify(properties!));
            expect(properties != undefined).assertTrue();
            done();
          } else {
            logger.log("auxiliaryPicture is undefined");
            expect(false).assertEqual(true);
            done();
          }
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0100
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("testExif.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            needsPackProperties: true
          };
          await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0200
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("testExif.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            needsPackProperties: false
          };
          await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0300
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            needsPackProperties: true
          };
          await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0400
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            needsPackProperties: false
          };
          await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0500
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98
          };
          await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0100
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
	expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("testExif.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let writeFd = await getFdCacheDir("pack_picture_01.jpg");
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            needsPackProperties: true
          };
          await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0200
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
	expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("testExif.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let writeFd = await getFdCacheDir("pack_picture_02.jpg");
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            needsPackProperties: false
          };
          await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0300
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
	expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let writeFd = await getFdCacheDir("pack_picture_03.jpg");
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            needsPackProperties: true
          };
          await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd); 
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0400
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
	expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let writeFd = await getFdCacheDir("pack_picture_04.jpg");
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            needsPackProperties: false
          };
          await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0500
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
	expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let writeFd = await getFdCacheDir("pack_picture_05.jpg");
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98
          };
          await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0100
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let packOpts: image.PackingOption = {
            format: "image/heic",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            needsPackProperties: true
          };
          await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0200
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let packOpts: image.PackingOption = {
            format: "image/heic",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            needsPackProperties: false
          };
          await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0300
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let packOpts: image.PackingOption = {
            format: "image/heic",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            needsPackProperties: true
          };
          await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0400
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let packOpts: image.PackingOption = {
            format: "image/heic",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            needsPackProperties: false
          };
          await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0500
     * @tc.desc   test picture packing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let packOpts: image.PackingOption = {
            format: "image/heic",
            quality: 98
          };
          await testPackPicture(done, logger, packOpts, "packing", picture, "picture");
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0100
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let writeFd = await getFdCacheDir("pack_picture_01.heic");
          let packOpts: image.PackingOption = {
            format: "image/heic",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            needsPackProperties: true
          };
          await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0200
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let writeFd = await getFdCacheDir("pack_picture_02.heic");
          let packOpts: image.PackingOption = {
            format: "image/heic",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            needsPackProperties: false
          };
          await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0300
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let writeFd = await getFdCacheDir("pack_picture_03.heic");
          let packOpts: image.PackingOption = {
            format: "image/heic",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            needsPackProperties: true
          };
          await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0400
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let writeFd = await getFdCacheDir("pack_picture_04.heic");
          let packOpts: image.PackingOption = {
            format: "image/heic",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            needsPackProperties: false
          };
          await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0500
     * @tc.desc   test picture packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
          expect(!isSupportHEIFDecode).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
        } else {
          let writeFd = await getFdCacheDir("pack_picture_05.heic");
          let packOpts: image.PackingOption = {
            format: "image/heic",
            quality: 98
          };
          await testPackPicture(done, logger, packOpts, "packToFile", picture, "picture", writeFd);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_JPEG_STATIC_0100
     * @tc.desc   test picture release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_JPEG_STATIC_0100");
      let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
      if (picture != undefined) {
        try {
          picture.release();
        } catch(error) {
          logger.log("release picture failed, error is: " + JSON.stringify(error));
          expect(false).assertTrue();
        }
      } else {
        logger.log("create picture failed!");
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0100
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0100");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGBA_8888);
      if (picture == undefined) {
        logger.log("createPictureOnlyMainPic failed. picture is undefined.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGBA_8888);
      if (pixelMap == undefined) {
        logger.log("myGetPixelMap failed. pixelMap is undefined.");
        picture.release();
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
      expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
      picture.release();
      await pixelMap.release();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0200
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0200");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGB_565);
      if (picture == undefined) {
        logger.log("createPictureOnlyMainPic failed. picture is undefined.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGB_565);
      if (pixelMap == undefined) {
        logger.log("myGetPixelMap failed. pixelMap is undefined.");
        picture.release();
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
      expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
      picture.release();
      await pixelMap.release();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0300
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0300");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGBA_8888);
      if (picture == undefined) {
        logger.log("createPictureOnlyMainPic failed. picture is undefined.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGBA_8888);
      if (pixelMap == undefined) {
        logger.log("myGetPixelMap failed. pixelMap is undefined.");
        picture.release();
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
      expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
      picture.release();
      await pixelMap.release();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0400
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0400");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.BGRA_8888);
      if (picture == undefined) {
        logger.log("createPictureOnlyMainPic failed. picture is undefined.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.BGRA_8888);
      if (pixelMap == undefined) {
        logger.log("myGetPixelMap failed. pixelMap is undefined.");
        picture.release();
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
      expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
      picture.release();
      await pixelMap.release();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0600
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0600");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGBA_F16);
      if (picture == undefined) {
        logger.log("createPictureOnlyMainPic failed. picture is undefined.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGBA_F16);
      if (pixelMap == undefined) {
        logger.log("myGetPixelMap failed. pixelMap is undefined.");
        picture.release();
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
      expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
      picture.release();
      await pixelMap.release();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0700
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0700");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.RGBA_1010102);
      if (picture == undefined) {
        logger.log("createPictureOnlyMainPic failed. picture is undefined.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.RGBA_1010102);
      if (pixelMap == undefined) {
        logger.log("myGetPixelMap failed. pixelMap is undefined.");
        picture.release();
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
      expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
      picture.release();
      await pixelMap.release();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0800
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0800");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.YCBCR_P010);
      if (picture == undefined) {
        logger.log("createPictureOnlyMainPic failed. picture is undefined.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.YCBCR_P010);
      if (pixelMap == undefined) {
        logger.log("myGetPixelMap failed. pixelMap is undefined.");
        picture.release();
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
      expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
      picture.release();
      await pixelMap.release();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0900
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_0900");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.YCRCB_P010);
      if (picture == undefined) {
        logger.log("createPictureOnlyMainPic failed. picture is undefined.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.YCRCB_P010);
      if (pixelMap == undefined) {
        logger.log("myGetPixelMap failed. pixelMap is undefined.");
        picture.release();
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
      expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
      picture.release();
      await pixelMap.release();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_1000
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_1000");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.NV21);
      if (picture == undefined) {
        logger.log("createPictureOnlyMainPic failed. picture is undefined.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.NV21);
      if (pixelMap == undefined) {
        logger.log("myGetPixelMap failed. pixelMap is undefined.");
        picture.release();
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
      expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
      picture.release();
      await pixelMap.release();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_1100
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_STATIC_1100");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd", image.PixelMapFormat.NV12);
      if (picture == undefined) {
        logger.log("createPictureOnlyMainPic failed. picture is undefined.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let pixelMap = await myGetPixelMap("testExif.jpg", "fd", image.PixelMapFormat.NV12);
      if (pixelMap == undefined) {
        logger.log("myGetPixelMap failed. pixelMap is undefined.");
        picture.release();
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
      let pixelMapImageInfo = pixelMap.getImageInfoSync();
      logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
      logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
      expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
      picture.release();
      await pixelMap.release();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture!, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010  ,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        logger.log("auxinfo: " + JSON.stringify(auxInfo));
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_F16,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG_LIMIT)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG_LIMIT)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        logger.log("auxinfo: " + JSON.stringify(auxInfo));
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_F16,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_P3)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_P3)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT709)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT2020)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT2020)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_STATIC_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_JPEG_STATIC_0100
     * @tc.desc   test ImageSource createPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_JPEG_STATIC_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
        let undefinedTypeList = [] as Array<image.AuxiliaryPictureType>;
        testImageSourceCreatePicture(done, logger, "AllAuxiliaryPictures.jpg", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_CREATEAUXILIARYPICTURE_ERROR_JPEG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_CREATEAUXILIARYPICTURE_ERROR_JPEG_STATIC_0100
     * @tc.desc   test auxiliary picture get type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_CREATEAUXILIARYPICTURE_ERROR_JPEG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_CREATEAUXILIARYPICTURE_ERROR_JPEG_STATIC_0100");
      let size: image.Size = {height: -1, width: -1};
      try {
        let gainMapAuxiliaryPicture = await createAuxPic(GAINMAP, "GainMap.dat", size);
        logger.log("gainMapAuxiliaryPicture: " + gainMapAuxiliaryPicture);
        expect(false).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        logger.log("error: " + JSON.stringify(error));
        expect(error.code == PARA_ERROR_CODE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_STATIC_0200
     * @tc.desc   test auxiliary picture get type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_STATIC_0200");
      let gainMapAuxiliaryPicture = await createAuxPic(GAINMAP, "GainMap.dat", {height: 960, width: 720});
      try {
        let size: image.Size ={ width: 3072, height: -1 };
        let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType: GAINMAP,
          size: size,
          rowStride: 10,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
        }
        gainMapAuxiliaryPicture!.setAuxiliaryPictureInfo(auxiliaryPictureInfoOrigin);
      } catch (error) {
        error = error as BusinessError;
        logger.log("error: " + JSON.stringify(error));
        expect(error.code == PARA_ERROR_CODE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_STATIC_0300
     * @tc.desc   test auxiliary picture get type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_STATIC_0300");
      let gainMapAuxiliaryPicture = await createAuxPic(GAINMAP, "GainMap.dat", {height: 960, width: 720});
      try {
        let size: image.Size ={ width: -1, height: 1536 };
        let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType: GAINMAP,
          size: size,
          rowStride: 10,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
        }
        gainMapAuxiliaryPicture!.setAuxiliaryPictureInfo(auxiliaryPictureInfoOrigin);
      } catch (error) {
        error = error as BusinessError;
        logger.log("error: " + JSON.stringify(error));
        expect(error.code == PARA_ERROR_CODE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_STATIC_0100
     * @tc.desc   test picture getHdrComposedPixelmap error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_STATIC_0100");
      await testPictureApiError(done, logger, "testExif.jpg", "buffer", "hdrComposedPixelmap");
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_ERROR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_ERROR_STATIC_0300
     * @tc.desc   test picture metadata API error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_ERROR_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_ERROR_STATIC_0300");
      let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
      if (picture == undefined) {
        logger.log("createPictureImageSourcePic failed. picture is undefined.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      await testPictureGetMetadataError(done, logger, picture, FRAGMENT_METADATA);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_ERROR_STATIC_0100
     * @tc.desc   test picture packing error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_ERROR_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_ERROR_STATIC_0100");
      let picture = await createPictureOnlyMainPic("testExif.jpg", "fd");
      if (picture == undefined) {
        logger.log("createPictureOnlyMainPic failed. picture is undefined.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let packOpts: image.PackingOption = {format: "image/png", quality: 98};
      await testPackPictureError(done, logger, packOpts, "packing", picture);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_ERROR_STATIC_0100
     * @tc.desc   test picture packToFile error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_ERROR_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_ERROR_STATIC_0100");
      let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
      if (picture == undefined) {
        logger.log("createPictureImageSourcePic failed. picture is undefined.");
        expect(false).assertTrue();
        done();
        return undefined;
      }
      let writeFd = await getFdCacheDir("pack_txt_01.jpg");
      let packOpts: image.PackingOption = {format: "image/png", quality: 98};
      await testPackPictureError(done, logger, packOpts, "packToFile", picture, writeFd);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_PNG_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_PNG_ERROR_STATIC_0100
     * @tc.desc   test picture packToFile error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_PNG_ERROR_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_PNG_ERROR_STATIC_0100");
      try {
        let imageSourceApi = await getImageSource("test.png", "uri");
        if (imageSourceApi == undefined) {
          logger.log("getImageSource failed. imageSourceApi is undefined!");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let picture: image.Picture | undefined = await imageSourceApi.createPicture();
        if (picture != undefined) {
          expect(false).assertEqual(true);
          done();
        }
      } catch (error) {
        error = error as BusinessError;
        logger.log("createPicture by imageSource is error: " + JSON.stringify(error) + ", error code is: " + error.code);
        expect(error.code == UNSUPPORTED_DECODE_CODE).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_HEIF_STATIC_0100
     * @tc.desc   test auxiliary picture get type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
        await testGetType(done, logger, "0801_sdr2.heic", "fd", typeList);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_HEIF_STATIC_0100
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        await testPictureApi(done, logger, "0801_sdr2.heic", "buffer", "mainPixelMap");
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_HEIF_STATIC_0100
     * @tc.desc   test picture getHdrComposedPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        await testPictureApi(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "buffer", "hdrComposedPixelmap");
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_HEIF_STATIC_0100
     * @tc.desc   test picture getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        await testPictureApi(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "buffer", "gainMapPixelMap");
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DCI_P3)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(GAINMAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: GAINMAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010  ,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU)
          }
          let typeList = [GAINMAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_F16,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(DEPTH_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: DEPTH_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT)
          }
          let typeList = [DEPTH_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT709_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_EBU_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(UNREFOCUS_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: UNREFOCUS_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT)
          }
          let typeList = [UNREFOCUS_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG_LIMIT)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_HLG_LIMIT)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_F16,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.P3_PQ_LIMIT)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_P3)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_P3)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(LINEAR_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: LINEAR_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT709)
          }
          let typeList = [LINEAR_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_565,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT2020)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_BT2020)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.BGRA_8888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGB_888,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_SRGB)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.ALPHA_8,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV21,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.NV12,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.RGBA_1010102,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCBCR_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000
     * @tc.desc   test AuxiliaryPicture API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_STATIC_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let auxPicture = picture.getAuxiliaryPicture(FRAGMENT_MAP);
        let auxInfo = auxPicture!.getAuxiliaryPictureInfo();
        if (auxInfo) {
          let auxSize = auxInfo.size;
          let size: image.Size = {width: auxSize.width, height: auxSize.height};
          let auxiliaryPictureInfoOrigin: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: FRAGMENT_MAP,
            size: size,
            rowStride: auxInfo.rowStride,
            pixelFormat: image.PixelMapFormat.YCRCB_P010,
            colorSpace: colorSpaceManager.create(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ)
          }
          let typeList = [FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
          await testAuxiliaryPictureInfo(done, logger, picture, auxiliaryPictureInfoOrigin, typeList);
        } else {
          logger.log("get auxiliaryInfo is undefined");
          expect(false).assertTrue();
          done();
        }
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_HEIF_STATIC_0100
     * @tc.desc   test picture release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        picture.release();
        expect(picture.getMainPixelmap() == undefined).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0100
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_8888);
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_8888);
        if (pixelMap == undefined) {
          logger.log("myGetPixelMap failed. pixelMap is undefined.");
          picture.release();
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
        expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
        picture.release();
        await pixelMap.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0200
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGB_565);
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGB_565);
        if (pixelMap == undefined) {
          logger.log("myGetPixelMap failed. pixelMap is undefined.");
          picture.release();
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
        expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
        picture.release();
        await pixelMap.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0300
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_8888);
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_8888);
        if (pixelMap == undefined) {
          logger.log("myGetPixelMap failed. pixelMap is undefined.");
          picture.release();
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
        expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
        picture.release();
        await pixelMap.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0400
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.BGRA_8888);
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.BGRA_8888);
        if (pixelMap == undefined) {
          logger.log("myGetPixelMap failed. pixelMap is undefined.");
          picture.release();
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
        expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
        picture.release();
        await pixelMap.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0500
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_F16);
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_F16);
        if (pixelMap == undefined) {
          logger.log("myGetPixelMap failed. pixelMap is undefined.");
          picture.release();
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
        expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
        picture.release();
        await pixelMap.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0600
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_1010102);
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.RGBA_1010102);
        if (pixelMap == undefined) {
          logger.log("myGetPixelMap failed. pixelMap is undefined.");
          picture.release();
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
        expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
        picture.release();
        await pixelMap.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0700
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.YCBCR_P010);
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.YCBCR_P010);
        if (pixelMap == undefined) {
          logger.log("myGetPixelMap failed. pixelMap is undefined.");
          picture.release();
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
        expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
        picture.release();
        await pixelMap.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0800
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.YCRCB_P010);
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.YCRCB_P010);
        if (pixelMap == undefined) {
          logger.log("myGetPixelMap failed. pixelMap is undefined.");
          picture.release();
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
        expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
        picture.release();
        await pixelMap.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0900
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.NV21);
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.NV21);
        if (pixelMap == undefined) {
          logger.log("myGetPixelMap failed. pixelMap is undefined.");
          picture.release();
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
        expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
        picture.release();
        await pixelMap.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_1000
     * @tc.desc   test picture getMainPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_STATIC_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd", image.PixelMapFormat.NV12);
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let pixelMap = await myGetPixelMap("0801_sdr2.heic", "fd", image.PixelMapFormat.NV12);
        if (pixelMap == undefined) {
          logger.log("myGetPixelMap failed. pixelMap is undefined.");
          picture.release();
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let mainPixelMapImageInfo = picture.getMainPixelmap()!.getImageInfoSync();
        let pixelMapImageInfo = pixelMap.getImageInfoSync();
        logger.log("mainPixelMapImageInfo: " + JSON.stringify(mainPixelMapImageInfo!));
        logger.log("pixelMapImageInfo: " + JSON.stringify(pixelMapImageInfo!));
        expect(mainPixelMapImageInfo!.pixelFormat == pixelMapImageInfo!.pixelFormat).assertTrue();
        picture.release();
        await pixelMap.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_HEIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_HEIF_STATIC_0100
     * @tc.desc   test ImageSource createPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_HEIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_HEIF_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support hdr");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP] as Array<image.AuxiliaryPictureType>;
        let undefinedTypeList = [] as Array<image.AuxiliaryPictureType>;
        testImageSourceCreatePicture(done, logger, "all_auxtype.heic", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_ERROR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_ERROR_STATIC_0300
     * @tc.desc   test picture metadata API error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_ERROR_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_ERROR_STATIC_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        await testPictureGetMetadataError(done, logger, picture, FRAGMENT_METADATA);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_HEIF_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_HEIF_ERROR_STATIC_0100
     * @tc.desc   test picture packing error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_HEIF_ERROR_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_HEIF_ERROR_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureOnlyMainPic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let packOpts: image.PackingOption = {format: "image/png", quality: 98};
        await testPackPictureError(done, logger, packOpts, "packing", picture);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_HEIF_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_HEIF_ERROR_STATIC_0100
     * @tc.desc   test picture packToFile error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_HEIF_ERROR_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_HEIF_ERROR_STATIC_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        expect(!isSupportHEIFDecode).assertTrue();
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        if (picture == undefined) {
          logger.log("createPictureImageSourcePic failed. picture is undefined.");
          expect(false).assertTrue();
          done();
          return undefined;
        }
        let writeFd = await getFdCacheDir("pack_txt_01.heic");
        let packOpts: image.PackingOption = {format: "image/png", quality: 98};
        await testPackPictureError(done, logger, packOpts, "packToFile", picture, writeFd);
      }
    })

  })
}

