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
import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import rpc from '@ohos.rpc';
import resourceManager from '@ohos.resourceManager';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';
import taskpool from '@ohos.taskpool';

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

async function taskpoolTest(pixelMap : image.PixelMap) {
  console.info("start taskpoolTest");
  try {
    let task = new taskpool.Task(pixelTest, pixelMap);
    taskpool.execute(task);
  } catch (error) {
    console.error('taskpool execute error is ' + error)
  }
}

@Concurrent
async function pixelTest(pixelMap: image.PixelMap) {
  console.info("Start first time");
  // 模拟异步操作
  setTimeout(() => {
    console.log('Start asynchronous blocking');
  }, 1000);
  return pixelMap;
}

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

    class MySequence1 implements rpc.Parcelable {
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
        expect(picture !== undefined).assertTrue();
        this.picture_ = picture;
        return true;
      }
    }

    const testCreatePictureFromParcel = async (
      done: Function,
      logger: Logger,
      picture: image.Picture
    ) => {
      // marshalling
      let parcelable: MySequence1 = new MySequence1(picture);
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      data.writeParcelable(parcelable);
      // createPictureFromParcel
      let ret: MySequence1 = new MySequence1(picture);
      data.readParcelable(ret);
      await sleep(500);
      done();
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "JPEGISOSingle.jpg", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "JPEGISOSingle.jpg", "uri", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "JPEGISOSingle.jpg", "fd", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_JPEG_0100
     * @tc.desc   1.create picture object by main pixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_JPEG_0100', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_JPEG_0100");
      let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
      testGetType(done, logger, "testExif.jpg", "fd", typeList);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_JPEG_0100");
      testPictureApi(done, logger, "testExif.jpg", "buffer", "mainPixelMap");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_0100");
      try {
        if(!fs.accessSync("/sys_prod/etc/VideoProcessingEngine/Image_SR_Model_576x576_20240402.omc")) {
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      }
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        testPictureApi(done, logger, "JPEGISOSingle.jpg", "buffer", "hdrComposedPixelmap");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_0100");
      testPictureApi(done, logger, "JPEGISOSingle.jpg", "buffer", "gainMapPixelMap");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_ERROR_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_ERROR_0100', Level.LEVEL0, async (done: Function) => {
        let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_JPEG_ERROR_0100");
        testPictureApiError(done, logger, "testExif.jpg", "buffer", "gainMapPixelMap");
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_PICTURE_FROM_PARCEL_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_PICTURE_FROM_PARCEL_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_PICTURE_FROM_PARCEL_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_CREATE_PICTURE_FROM_PARCEL_0100");
      let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
      testCreatePictureFromParcel(done, logger, picture);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        testMarshalling(done, logger, picture, "picture", EXIF_METADATA);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        testMarshalling(done, logger, picture, "GAINMAP");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let picture = await createPictureImageSourcePic("JPEGISOSingle.jpg", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, GAINMAP);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_AUXILIARYPICTURE_FRAGMENT_MAP_METADATA_API_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_AUXILIARYPICTURE_FRAGMENT_MAP_METADATA_API_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_AUXILIARYPICTURE_FRAGMENT_MAP_METADATA_API_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_AUXILIARYPICTURE_FRAGMENT_MAP_METADATA_API_JPEG_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        await testAuxMetadata(done, logger, picture, FRAGMENT_MAP);
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
        await testMetadataProperty(done, logger, exifRecords, picture, EXIF_METADATA);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        await testMetadataProperty(done, logger, exifRecords, picture, EXIF_METADATA);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_METADATA_API_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0100
     * @tc.desc   1.create picture object by main pixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0200
     * @tc.desc   1.create picture object by main pixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0100
     * @tc.desc   1.create picture object by main pixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0200
     * @tc.desc   1.create picture object by main pixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0100
     * @tc.desc   1.create picture object by main pixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0200
     * @tc.desc   1.create picture object by main pixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0200");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0300");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0400");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_HEIF_0500");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0100
     * @tc.desc   1.create picture object by main pixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0100");
      let writeFd = await getFdCacheDir("pack_picture_01.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0200
     * @tc.desc   1.create picture object by main pixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0200");
      let writeFd = await getFdCacheDir("pack_picture_02.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0300");
      let writeFd = await getFdCacheDir("pack_picture_03.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0400");
      let writeFd = await getFdCacheDir("pack_picture_04.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_HEIF_0500");
      let writeFd = await getFdCacheDir("pack_picture_04.heic");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          logger.log("device is not support heif decode");
        } else {
          logger.log("device is not support heif encode");
        }
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
      picture.release();
      expect(picture.getMainPixelmap() == undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0100', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0200', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0300', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0400', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0600
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0600', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0700
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0700', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0800
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0800', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0900
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_0900', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1000
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1000', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_JPEG_1100', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_1000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_JPEG_1100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0600");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0700");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0800");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_0900");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_JPEG_1000");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        testMarshalling(done, logger, picture, "FRAGMENT_MAP", FRAGMENT_METADATA);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0200");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, DEPTH_MAP);
        await sleep(500);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, UNREFOCUS_MAP);
        await sleep(500);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0400");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let picture = await createPictureImageSourcePic("AllAuxiliaryPictures_exclude_fragment.jpg", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, LINEAR_MAP);
        await sleep(500);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_JPEG_0500");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let picture = await createPictureImageSourcePic("JpegFragmentMap.jpg", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, FRAGMENT_MAP);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        let undefinedTypeList = [];
        testImageSourceCreatePicture(done, logger, "AllAuxiliaryPictures.jpg", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_JPEG_0100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let typeList = [GAINMAP];
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "CUVAHdrMulti.jpg", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_CREATEAUXILIARYPICTURE_ERROR_JPEG_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_CREATEAUXILIARYPICTURE_ERROR_JPEG_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_CREATEAUXILIARYPICTURE_ERROR_JPEG_0100', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0200', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_SET_AUXILIARY_PICTURE_INFO_ERROR_0300', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_JPEG_ERROR_0100");
      testPictureApiError(done, logger, "testExif.jpg", "buffer", "hdrComposedPixelmap");
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_ERROR_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_ERROR_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_JPEG_ERROR_0300");
      let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
      await testGetMetadataError(done, logger, picture, FRAGMENT_METADATA);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_ERROR_0100
     * @tc.desc   1.create picture object by main pixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_ERROR_0100', Level.LEVEL0, async (done: Function) => {
        let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_ERROR_0100");
        let picture = await createPictureOnlyMainPic("testExif.jpg", "fd");
        let packOpts: image.PackingOption = {format: "image/png", quality: 98};
        await testPackPictureError(done, logger, packOpts, "packing", picture);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_ERROR_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_ERROR_0100");
      let writeFd = await getFdCacheDir("pack_txt_01.jpg");
      let picture = await createPictureImageSourcePic("testExif.jpg", "fd");
      let packOpts: image.PackingOption = {format: "image/png", quality: 98};
      await testPackPictureError(done, logger, packOpts, "packToFile", picture, writeFd);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_PNG_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_PNG_ERROR_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_PNG_ERROR_0100', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "buffer",
            typeList, undefinedTypeList);
      }
    })
  
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "uri",
            typeList, undefinedTypeList);
      }
    })
  
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let typeList = [GAINMAP]; 
        let undefinedTypeList = [DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "fd",
            typeList, undefinedTypeList);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_HEIF_0100
     * @tc.desc   1.create picture object by main pixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_TYPE_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testGetType(done, logger, "0801_sdr2.heic", "fd", typeList);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_MAIN_PIXELMAP_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        testPictureApi(done, logger, "0801_sdr2.heic", "buffer", "mainPixelMap");
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_PIXELMAP_HEIF_0100");
      try {
        if(!fs.accessSync("/sys_prod/etc/VideoProcessingEngine/Image_SR_Model_576x576_20240402.omc")) {
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      }
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        testPictureApi(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "buffer", "hdrComposedPixelmap");
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_GAIN_PIXELMAP_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        testPictureApi(done, logger, "HEIFISOMultiChannelBaseColor0512V12.heic", "buffer", "gainMapPixelMap");
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        testMarshalling(done, logger, picture, "picture", EXIF_METADATA);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let picture = await createPictureImageSourcePic("HEIFISOMultiChannelBaseColor0512V12.heic", "fd");
        testMarshalling(done, logger, picture, "GAINMAP");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_MARSHALLING_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        testMarshalling(done, logger, picture, "FRAGMENT_MAP", FRAGMENT_METADATA);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_1000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_GAINMAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DEPTH_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_UNREFOCUS_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_LINEAR_MAP_AUXILIARY_PICTURE_INFO_HEIF_1100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_FRAGMENT_MAP_AUXILIARY_PICTURE_INFO_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let picture = await createPictureImageSourcePic("HEIFISOMultiChannelBaseColor0512V12.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, GAINMAP);
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, DEPTH_MAP);
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, UNREFOCUS_MAP);
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, LINEAR_MAP);
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_AUXILIARY_PICTURE_READ_AND_WRITE_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let picture = await createPictureImageSourcePic("all_auxtype.heic", "fd");
        //readPixelsToBuffer && writePixelsFromBuffer
        await testReadPixelsToBuffer(done, logger, picture, FRAGMENT_MAP);
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_HEIF_0100
     * @tc.desc   1.create main pixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_RELEASE_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        picture.release();
        expect(picture.getMainPixelmap() == undefined).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0200
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0400
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0500
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0600
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0700
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0700");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0800
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0800");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0900
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_0900");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_1000
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_1000', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PIXELMAP_FORMAT_HEIF_1000");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_OPTION_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support hdr");
        done();
      } else {
        let typeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        let undefinedTypeList = [];
        testImageSourceCreatePicture(done, logger, "all_auxtype.heic", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_HEIF_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_HEIF_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_HEIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_DECODE_10BIT_HEIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support hdr");
        done();
      } else {
        let typeList = [];
        let undefinedTypeList = [GAINMAP, DEPTH_MAP, UNREFOCUS_MAP, LINEAR_MAP, FRAGMENT_MAP];
        testImageSourceCreatePicture(done, logger, "HDRVividSingleLayer.heic", "buffer", typeList, undefinedTypeList);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_ERROR_0300
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_ERROR_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_METADATA_API_HEIF_ERROR_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        await testGetMetadataError(done, logger, picture, FRAGMENT_METADATA);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_HEIF_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_HEIF_ERROR_0100
     * @tc.desc   1.create picture object by main pixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_HEIF_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKING_PNG_HEIF_ERROR_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let picture = await createPictureOnlyMainPic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {format: "image/png", quality: 98};
        await testPackPictureError(done, logger, packOpts, "packing", picture);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_HEIF_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_HEIF_ERROR_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_HEIF_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_PACKTOFILE_PNG_HEIF_ERROR_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
        done();
      } else {
        let writeFd = await getFdCacheDir("pack_txt_01.heic");
        let picture = await createPictureImageSourcePic("0801_sdr2.heic", "fd");
        let packOpts: image.PackingOption = {format: "image/png", quality: 98};
        await testPackPictureError(done, logger, packOpts, "packToFile", picture, writeFd);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_OPTION_NULL_HEIF_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_OPTION_NULL_HEIF_ERROR_0100
     * @tc.desc   1.create picture object by decode image source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_OPTION_NULL_HEIF_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_DECODE_OPTION_NULL_HEIF_ERROR_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device is not support heif decode");
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

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CROP_SYNC_0100
     * @tc.number testImageCropSync0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CROP_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_CROP_SYNC_0100";
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          pixelMap.cropSync(region);
          console.info(tag + ' Succeeded in cropping Sync pixelmap. Expect fail.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to cropSync pixelmap.  error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_FLIP_SYNC_0100
     * @tc.number testImageFlipSync0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_FLIP_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_FLIP_SYNC_0100";
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let horizontal : boolean = true;
      let vertical : boolean = false;
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          pixelMap.flipSync(horizontal, vertical);
          console.info(tag + ' Succeeded in flipping pixelmap.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to flip pixelmap.  error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_ROTATE_SYNC_0100
     * @tc.number testImageRotateSync0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_ROTATE_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_ROTATE_SYNC_0100";
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let angle : number = 90.0;
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          pixelMap.rotateSync(angle);
          console.info(tag + ' Succeeded in rotating pixelmap.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to rotate pixelmap.  error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_TRANSLATE_SYNC_0100
     * @tc.number testImageTranslateSync0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_TRANSLATE_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_TRANSLATE_SYNC_0100";
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let translateX : number = 50.0;
      let translateY : number = 10.0;
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          pixelMap.translateSync(translateX, translateY);
          console.info(tag + ' Succeeded in translating pixelmap.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to translate pixelmap.  error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_SCALE_PIXEL_MAP_SYNC_0100
     * @tc.number testImageCreateScaledPixelMapSync0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_SCALE_PIXEL_MAP_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_SCALE_PIXEL_MAP_SYNC_0100";
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.LOW);
          console.info(tag + ' Succeeded in scaling Sync pixelmap.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to scale Sync pixelmap.  error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_READ_PIXEL_TO_BUFFER_SYNC_0100
     * @tc.number testImageReadPixelsToBufferSync0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_READ_PIXEL_TO_BUFFER_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_READ_PIXEL_TO_BUFFER_SYNC_0100";
      const color = new ArrayBuffer(96);
      const readBuffer: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          pixelMap.readPixelsToBufferSync(readBuffer);
          console.info(tag + ' Succeeded in reading to buffer Sync pixelmap.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to read to buffer Sync pixelmap.  error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_READ_PIXELS_SYNC_0100
     * @tc.number testImageReadPixelsSync0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_READ_PIXELS_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_READ_PIXELS_SYNC_0100";
      const color = new ArrayBuffer(96);
      const area : image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
      };
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          pixelMap.readPixelsSync(area);
          console.info(tag + ' Succeeded in reading pixels Sync pixelmap.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to read pixels Sync pixelmap.  error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WRITE_PIXELS_SYNC_0100
     * @tc.number testImageWritePixelsSync0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_WRITE_PIXELS_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_WRITE_PIXELS_SYNC_0100";
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
      };
      let bufferArr: Uint8Array = new Uint8Array(area.pixels);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          pixelMap.writePixelsSync(area);
          console.info(tag + ' Succeeded in writing pixels Sync pixelmap.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to write pixels Sync pixelmap.  error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WRITE_BUFFER_TO_PIXELS_SYNC_0100
     * @tc.number testImageWriteBufferToPixelsSync0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_WRITE_BUFFER_TO_PIXELS_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_WRITE_BUFFER_TO_PIXELS_SYNC_0100";
      const color : ArrayBuffer = new ArrayBuffer(96);
      let bufferArr : Uint8Array = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          pixelMap.writeBufferToPixelsSync(color);
          console.info(tag + ' Succeeded in Writting to buffer Sync pixelmap.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to write to buffer Sync pixelmap. Error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GET_IMAGE_INFO_SYNC_0100
     * @tc.number testImageGetImageInfoSync0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_IMAGE_INFO_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_GET_IMAGE_INFO_SYNC_0100";
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          console.info(tag + ' Succeeded in getting info Sync.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to get info Sync. Error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_OPACITY_SYNC_0100
     * @tc.number testImageOpacitySync0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_OPACITY_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_OPACITY_SYNC_0100";
      let rate : number = 0.5;
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          pixelMap.opacitySync(rate);
          console.info(tag + ' Succeeded in getting info Sync.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to get info Sync. Error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_ALPHA_PIXEL_MAP_SYNC_0100
     * @tc.number testImageCreateAlphaPixelmapSync0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_ALPHA_PIXEL_MAP_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_ALPHA_PIXEL_MAP_SYNC_0100";
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          let pixelmap : image.PixelMap = pixelMap.createAlphaPixelmapSync();
          console.info(tag + ' Succeeded in creating Alpha Pixelmap Sync.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to create Alpha Pixelmap Sync. Error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SCALE_SYNC_0100
     * @tc.number testImageScaleSync0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_SCALE_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SCALE_SYNC_0100";
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          pixelMap.scaleSync(scaleX, scaleY);
          console.info(tag + ' Succeeded in scaling Sync.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to scale Sync. Error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SCALE_SYNC_0200
     * @tc.number testImageScaleSync0200
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_SCALE_SYNC_0200', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SCALE_SYNC_0200";
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          pixelMap.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.LOW);
          console.info(tag + ' Succeeded in scaling Sync.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to scale Sync. Error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CLONE_SYNC_0100
     * @tc.number testImageCloneSync0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CLONE_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CLONE_SYNC_0100";
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        try {
          pixelMap.cloneSync();
          console.info(tag + ' Succeeded in cloning Sync.');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(tag + ` Failed to clone Sync. Error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        }
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SCALE_0100
     * @tc.number testImageScale0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_SCALE_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SCALE_0100";
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.LOW).then(() => {
          console.info(tag + ' Succeeded in scaling.');
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.error(tag + ` Failed to scale. Error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        })
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_SCALE_PIXEL_MAP_0100
     * @tc.number testImageCreateScaledPixelMap0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_SCALE_PIXEL_MAP_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_SCALE_PIXEL_MAP_0100";
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        let scaledPixelMap = pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.LOW).then(() => {
          console.info(tag + ' Succeeded in scaling pixelmap.');
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.error(tag + ` Failed to scale pixelmap.  error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        })
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CLONE_0100
     * @tc.number testImageClone0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CLONE_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CLONE_SYNC_0100";
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        pixelMap.clone().then((clonePixelMap: image.PixelMap) => {
          console.info(tag + ' Succeeded in cloning.');
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.error(tag + ` Failed to clone. Error code is ` + error.code);
          expect(Number(error.code) == 501).assertTrue();
          done();
        })
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_SET_METADATA_0100
     * @tc.number testImageSetMetadata0100
     * @tc.desc   501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SET_METADATA_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_SET_METADATA_0100";
      let staticMetadata: image.HdrStaticMetadata = {
        displayPrimariesX: [1.1, 1.1, 1.1],
        displayPrimariesY: [1.2, 1.2, 1.2],
        whitePointX: 1.1,
        whitePointY: 1.2,
        maxLuminance: 2.1,
        minLuminance: 1.0,
        maxContentLightLevel: 2.1,
        maxFrameAverageLightLevel: 2.1,
      }
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      if (pixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        taskpoolTest(pixelMap);
        pixelMap.setMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA, staticMetadata).then(() => {
          console.info(tag + ' Succeeded in Setting Metadata.');
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.error(tag + ` Failed to set metadata. Error code is ` + error);
          expect(Number(error) == 501).assertTrue();
          done();
        })
      } else {
        console.info(tag + " Failed to create pixel map");
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREMULTIPLIED_PIXEL_MAP_0100
     * @tc.number testImageCreatePremultipliedPixelMap0100
     * @tc.desc   62980248
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_PREMULTIPLIED_PIXEL_MAP_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_PREMULTIPLIED_PIXEL_MAP_0100";
      const color: ArrayBuffer = new ArrayBuffer(16);
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
        bufferArr[i] = 255;
        bufferArr[i+1] = 255;
        bufferArr[i+2] = 122;
        bufferArr[i+3] = 122;
      }
      let optsForUnpre: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.UNPREMUL}
      let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
      let optsForPre: image.InitializationOptions = { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.PREMUL}
      let dstPixelMap = image.createPixelMapSync(optsForPre);
      image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap, (error: BusinessError) => {
        if(error) {
          console.error(tag + ` Failed to Create Premultiplied PixelMap. code is ${error}`);
          expect(Number(error) == 62980248).assertTrue();
          done();
        } else {
          console.info(tag + ' Succeeded in Creating Premultiplied PixelMap.');
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREMULTIPLIED_PIXEL_MAP_0200
     * @tc.number testImageCreatePremultipliedPixelMap0200
     * @tc.desc   62980248
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_PREMULTIPLIED_PIXEL_MAP_0200', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_PREMULTIPLIED_PIXEL_MAP_0200";
      const color: ArrayBuffer = new ArrayBuffer(16);
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
        bufferArr[i] = 255;
        bufferArr[i+1] = 255;
        bufferArr[i+2] = 122;
        bufferArr[i+3] = 122;
      }
      let optsForUnpre: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.UNPREMUL}
      let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
      let optsForPre: image.InitializationOptions = { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.PREMUL}
      let dstPixelMap = image.createPixelMapSync(optsForPre);
      image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap).then(() => {
        console.info(tag + ' Succeeded in Creating Premultiplied PixelMap.');
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` Failed to Create Premultiplied PixelMap. code is ${error}`);
        expect(Number(error) == 62980248).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_UNPREMULTIPLIED_PIXEL_MAP_0100
     * @tc.number testImageCreateUnpremultipliedPixelMap0100
     * @tc.desc   62980248
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_UNPREMULTIPLIED_PIXEL_MAP_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_UNPREMULTIPLIED_PIXEL_MAP_0100";
      const color: ArrayBuffer = new ArrayBuffer(16);
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
        bufferArr[i] = 255;
        bufferArr[i+1] = 255;
        bufferArr[i+2] = 122;
        bufferArr[i+3] = 122;
      }
      let optsForPre: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.PREMUL}
      let srcPixelmap = image.createPixelMapSync(color, optsForPre);
      let optsForUnpre: image.InitializationOptions = { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.UNPREMUL}
      let dstPixelMap = image.createPixelMapSync(optsForUnpre);
      image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap, (error: BusinessError) => {
        console.error(tag + ` Failed to Create unpremultiplied PixelMap. code is ${error}`);
        expect(Number(error) == 62980248).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_UNPREMULTIPLIED_PIXEL_MAP_0200
     * @tc.number testImageCreateUnpremultipliedPixelMap0200
     * @tc.desc   62980248
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_UNPREMULTIPLIED_PIXEL_MAP_0200', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_CREATE_UNPREMULTIPLIED_PIXEL_MAP_0200";
      const color: ArrayBuffer = new ArrayBuffer(16);
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
        bufferArr[i] = 255;
        bufferArr[i+1] = 255;
        bufferArr[i+2] = 122;
        bufferArr[i+3] = 122;
      }
      let optsForUnpre: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.UNPREMUL}
      let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
      let optsForPre: image.InitializationOptions = { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.PREMUL}
      let dstPixelMap = image.createPixelMapSync(optsForPre);
      image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap).then(() => {
        console.info(tag + ' Succeeded in Creating unpremultiplied PixelMap.');
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` Failed to Create unpremultiplied PixelMap. code is ${error}`);
        expect(Number(error) == 62980248).assertTrue();
        done();
      })
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_FRAGMENT_MAP_PROPERTY_KEY_0100
     * @tc.number testImageFragmentMapPropertyKey0100
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_FRAGMENT_MAP_PROPERTY_KEY_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_FRAGMENT_MAP_PROPERTY_KEY_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_FRAGMENT_MAP_PROPERTY_KEY_0100"
      let property_X: image.FragmentMapPropertyKey = image.FragmentMapPropertyKey.X_IN_ORIGINAL;
      expect(property_X == 'XInOriginal').assertTrue();
      console.info(tag + 'X_IN_ORIGINAL is equal to XInOriginal. ')
      let property_Y: image.FragmentMapPropertyKey = image.FragmentMapPropertyKey.Y_IN_ORIGINAL;
      expect(property_Y == 'YInOriginal').assertTrue();
      console.info(tag + ' X_IN_ORIGINAL is equal to YInOriginal. ')
      let property_width: image.FragmentMapPropertyKey = image.FragmentMapPropertyKey.WIDTH;
      expect(property_width == 'FragmentImageWidth').assertTrue();
      console.info(tag + ' X_IN_ORIGINAL is equal to FragmentImageWidth. ')
      let property_height: image.FragmentMapPropertyKey = image.FragmentMapPropertyKey.HEIGHT;
      expect(property_height == 'FragmentImageHeight').assertTrue();
      console.info(tag + ' X_IN_ORIGINAL is equal to FragmentImageHeight. ')
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0100
     * @tc.number testImagePixelMapSetColorSpace0100
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PIXEL_MAP_SET_COLOR_SPACE_0100"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      const readBuffer: ArrayBuffer = new ArrayBuffer(96);
      let fileName = 'test.png'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      if (pixelMap != undefined) {
        console.info(tag + ' Succeeded in creating pixelMap.');
        done();
      } else {
        console.info(tag + ' Succeeded in creating pixelMap.');
        expect().assertFail();
        done();
      }
      try {
        pixelMap.setColorSpace(null!); 
        console.info(tag + ' Succeeded in Setting ColorSpace. Expect fail.');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(tag + ` Failed to set ColorSpace. error is ` + error + 'error code is ' + error.code);
        expect(error.code == 62980115).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0100
     * @tc.number testImageApplyColorSpace0100
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0100"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      let fileName = 'test.png'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      if (pixelMap != undefined) {
        console.info(tag + ' Succeeded in creating pixelMap.');
        done();
      } else {
        console.info(tag + ' Succeeded in creating pixelMap.');
        expect().assertFail();
        done();
      }
      pixelMap.applyColorSpace(null!).then(() => {
        console.info(tag + ' Succeeded in applying color space for pixelmap object.');
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` Failed to apply color space for pixelmap object. error is ${error}`); 
        expect(error).assertEqual(62980115);
        done();
        })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0200
     * @tc.number testImageApplyColorSpace0100
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0200', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0200"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      let fileName = 'dog.astc'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      pixelMap.applyColorSpace(targetColorSpace).then(() => {
        console.info(tag + ' Succeeded in applying color space for pixelmap object.');
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` Failed to apply color space for pixelmap object. error is ${error}`); 
        if (Number(error) == 62980108) {
          expect(Number(error) == 62980108).assertTrue();
          console.info('Failed to apply color space. Error is 62980108. Check your device.')
          done();
        } else {
          console.info('Error is not 62980108. Error is ' + error)
          expect().assertFail();
          done();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0300
     * @tc.number testImageApplyColorSpace0100
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0300', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_APPLY_COLOR_SPACE_0300"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      let fileName = 'dog.astc'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      pixelMap.applyColorSpace(targetColorSpace, (error: BusinessError) => {
        if (error == undefined || error == null) {
          console.info(tag + ' Succeeded in applying color space for pixelmap object.');
          done();
        } else {
          if (Number(error) == 62980108){
            expect(Number(error) == 62980108).assertTrue();
            console.info('Failed to apply color space. Error is 62980108. Check your device.')
            done();
          } else {
            console.info('Error is not 62980108. Error is ' + error)
            expect().assertFail();
            done();
          }
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_LIST_0100
     * @tc.number testImageCreatePixelMapList0100
     * @tc.desc   1.createPixelMapList(options?: DecodingOptions): Promise<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_LIST_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_LIST_0100"
      let fileName = 'test_code116.jpg'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        index: 0,
      };
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info('Succeeded in creating pixelMapList object.');
        done();
      }).catch((error: BusinessError) => {
        console.error(`Failed to create pixelMapList object. Error is ${error}`);
        expect(Number(error) == 62980116).assertTrue();
        done();
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_LIST_0200
     * @tc.number testImageCreatePixelMapList0100
     * @tc.desc   1.createPixelMapList(options: DecodingOptions, callback: AsyncCallback<Array<PixelMap>>)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_LIST_0200', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_PIXEL_MAP_LIST_0200"
      let fileName = 'test_code116.jpg'
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        index: 0,
      };
      let imageSourceApi = await getImageSource(fileName, "uri")
      try {
        imageSourceApi.createPixelMapList(decodeOpts, (error: BusinessError, pixelMapList: Array<image.PixelMap>) => {
          console.error(tag + ` Failed to create pixelMapList object. Callback code is ${error.code}`);
          done();
        })
      } catch (error) {
        console.error(tag + ` Failed to create pixelMapList object. Callback code is ${error.code}`);
        expect(Number(error.code) == 62980116).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0100
     * @tc.number testImageSourceGetColorSpace0100
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0100"
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap = image.createPixelMapSync(color, opts);
      try {
        let csm = await pixelMap.getColorSpace();
        console.info(tag + ' Succeeded in getting ColorSpace. csm is ' + csm);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(tag + ` Failed to get ColorSpace. error is ` + error + 'error code is ' + error.code);
        expect(error.code == 62980103).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GET_DELAY_TIME_LIST_0100
     * @tc.number testImageGetDelayTimeList0100
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_GET_DELAY_TIME_LIST_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_DELAY_TIME_LIST_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_GET_DELAY_TIME_LIST_0100"
      let fileName = 'FragmentMap.dat'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.getDelayTimeList().then((delayTimes: Array<number>) => {
        console.info(tag + 'Succeeded in getting delay time list.');
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.info(tag + ` Failed to get delay time list. code is ${error.code}`);
        expect(error.code == 62980137).assertTrue();
        done();
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GET_DELAY_TIME_LIST_0200
     * @tc.number testImageGetDelayTimeList0200
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_GET_DELAY_TIME_LIST_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_DELAY_TIME_LIST_0200', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_GET_DELAY_TIME_LIST_0200"
      let fileName = 'FragmentMap.dat'
      let imageSourceApi = await getImageSource(fileName, "uri")
      await imageSourceApi.getDelayTimeList((error: BusinessError, delayTimes: Array<number>) => {
        if (error) {
          console.error(tag + ` Failed to get delayTimes object.code is ${error.code}`);
          expect(error.code == 62980137).assertTrue();
          done();
        } else {
          console.info(tag + ' Succeeded in getting delayTimes object.');
          expect().assertFail();
          done();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PROPERTY_0100
     * @tc.number testImageGetImageProperty0100
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PROPERTY_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PROPERTY_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PROPERTY_0100"
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' }
      let fileName = 'FragmentMap.dat'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.getImageProperty(image.PropertyKey.BITS_PER_SAMPLE, options).then((data: string) => {
        console.info(tag + ' Succeeded in getting the value of the specified attribute key of the image.');
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ' Failed to get the value of the specified attribute key of the image.');
        expect(error.code == 62980137).assertTrue();
        done();
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PROPERTY_KEY_NULL_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PROPERTY_KEY_NULL_0100
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PROPERTY_KEY_NULL_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PROPERTY_KEY_NULL_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PROPERTY_KEY_NULL_0100"
      let options: image.ImagePropertyOptions = { index: 0, defaultValue: '9999' }
      let fileName = 'FragmentMap.dat'
      let imageSourceApi = await getImageSource(fileName, "uri")
      try {
        imageSourceApi.getImageProperty(null, options).then((data: string) => {
          console.info(tag + ' Succeeded in getting the value of the specified attribute key of the image.');
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.error(tag + ' Failed to get the value of the specified attribute key of the image.');
          expect().assertFail();
          done();
        })
      } catch (e) {
        expect(e.message).assertContain("async context unwrap failed");
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PROPERTIES_0100
     * @tc.number testImageGetImageProperties0100
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PROPERTIES_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PROPERTIES_0100', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PROPERTIES_0100"
      let fileName = 'FragmentMap.dat'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let key = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      imageSourceApi.getImageProperties(key).then((data) => {
        console.info(tag + ' Succeeded in getting the value of the specified attribute key of the image.');
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ' Failed to get the value of the specified attribute key of the image.');
        expect(error.code == 62980137).assertTrue();
        done();
      })
      done();
    })
    
  })
}