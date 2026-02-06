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
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { initialize } from './AbilityContextHelper.test';
import { BusinessError } from '@ohos.base';
import rpc from '@ohos.rpc';

const DECODE_FAILED = 7700301;
const UNSUPPORTED_MIMETYPE = 7700102;
const IMAGE_TOO_LARGE = 7700103;
const UNSUPPORTED_OPTIONS = 7700203;

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
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

export default function imageGif() {
  describe('imageGif', (): void => {
    let isSupportHEICDecode: boolean;
    let filesDir: string | undefined | null;
    let filePath: string;
    const EXPECTFRAMECOUNT = 3;
    const ERR_CODE = 62980149;
    const ERR_CODE1 = 62980096;
    const ERR_CODE2 = 62980118;
    const RGBA_8888 = image.PixelMapFormat.RGBA_8888;

    let globalpixelmap: image.PixelMap | undefined = undefined;
    let globalimageSource: image.ImageSource | undefined = undefined;
    beforeAll(() => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      isSupportHEICDecode =
        image.createImageSource(filesDir + '/' + "test.jpg")!.supportedFormats.includes("image/heic");
    })

    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap!.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
        }
      }
      if (globalimageSource != undefined) {
        console.info('globalimageSource release start');
        try {
          await globalimageSource!.release();
        } catch (error) {
          console.info('globalimageSource release fail');
        }
      }
      console.info('afterEach case');
    });


    const getFd = (fileName: string): int => {
      filePath = filesDir + "/" + fileName;
      console.info("image filePath:" + filePath);
      const file = fs.openSync(filePath);
      return file.fd as int;
    };

    const getDelayTimePromise = async (
      done: () => void,
      testNum: string,
      fileName: string
    ) => {
      let logger = new Logger(testNum);
      try {
        let fd: int = getFd(fileName);
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          logger.log('getDelayTimePromise create imageSource success');
          let delayTimes = await imageSourceApi.getDelayTimeList();
          if (delayTimes != undefined) {
            logger.log("getDelayTimePromise getDelayTime success");
            expect(true).assertTrue();
            logger.log("getDelayTimeList success: " + delayTimes.length);
            for (let i = 0; i < delayTimes.length; i++) {
              logger.log(`delayTimes[ ${i} ]= ${delayTimes[i]}`);
            }
            logger.log("delayTimes show end");
          } else {
            logger.log("getDelayTimePromise getDelayTime failed");
            expect(false).assertTrue();
          }
          done();
        }
      } catch (error) {
        logger.log("getDelayTimeList error: " + error);
        expect(false).assertTrue();
        done();
      }
    }

    const getDelayTimeCallBack = async (
      done: () => void,
      testNum: string,
      fileName: string
    ) => {
      let logger = new Logger(testNum);
      try {
        let fd: int = getFd(fileName);
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          logger.log('getDelayTimePromise create imageSource success');
          imageSourceApi.getDelayTimeList((error: BusinessError | null, delayTimes) => {
            if (error && error.code) {
              logger.log("getDelayTimeCallBack getDelayTime failed err: " + error);
              expect(false).assertTrue();
              done();
            }
            expect(delayTimes != undefined).assertTrue();
            logger.log('getDelayTimeCallBack getDelayTime success');
            logger.log("getDelayTimeList success: " + delayTimes!.length);
            for (let i = 0; i < delayTimes!.length; i++) {
              logger.log(`delayTimes[ ${i} ]= ${delayTimes![i]}`);
            }
            logger.log('delayTimes show end');
            done();
          });
        }
      } catch (error) {
        logger.log("getDelayTimeList error: " + error);
        expect(false).assertTrue();
        done();
      }
    }

    const testGetDisposalTypePromise = async (
      done: () => void,
      testNum: string,
      picName: string
    ) => {
      let fd: int = getFd(picName);
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        console.info(`${testNum} testGetDisposalTypePromise create imagesource failed`);
        expect(false).assertTrue();
        done();
      } else {
        globalimageSource = imageSourceApi;
        try {
          console.info(`${testNum} testGetDisposalTypePromise create imagesource success`);
          try {
            let disposalTypes: Array<int> = await imageSourceApi.getDisposalTypeList();
            console.info(`${testNum} testGetDisposalTypePromise getDisposalTypeList success`);
            expect(true).assertTrue();
            console.info(`${testNum} disposalTypes show begin length: ${disposalTypes.length} `);
            for (let i = 0; i < disposalTypes.length; i++) {
              console.info(`${testNum} disposalTypes[ ${i} ]= ${disposalTypes[i]}`);
            }
            console.info(`${testNum} disposalTypes show end`);
          } catch (err) {
            err = err as BusinessError;
            console.info(`${testNum} testGetDisposalTypePromise getDisposalTypeList failed err: code is ${err.code},message is ${err.message}`);
            expect(err.code == ERR_CODE).assertTrue();
          }
          done();
        } catch (error) {
          console.log(`${testNum} testGetDisposalTypePromise err: ${error}`);
          expect(false).assertTrue();
          done();
        };
      }
    }

    const getFrameCountPromise = async (
      done: () => void,
      testNum: string,
      picName: string
    ) => {
      try {
        let fd: int = getFd(picName);
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} getFrameCountPromise create imagesource failed`);
          expect(false).assertTrue();
          done();
        } else {
          globalimageSource = imageSourceApi;
          console.info(`${testNum} getFrameCountPromise create imagesource success`);
          let frameCount = await imageSourceApi.getFrameCount();
          if (frameCount != undefined) {
            console.info(`${testNum} getFrameCountPromise getFrameCount success`);
            expect(frameCount).assertEqual(EXPECTFRAMECOUNT);
            console.info(`${testNum} getFrameCountPromise frameCount= ${frameCount}`);
          } else {
            console.info(`${testNum} getFrameCountPromise getFrameCount failed`);
            expect(false).assertTrue();
          }
          done();
        }
      } catch (error) {
        console.info(`${testNum} getFrameCountPromise error: ` + error);
        expect(false).assertTrue();
        done();
      }
    }

    const getFrameCountCallBack = async (
      done: () => void,
      testNum:string,
      picName:string
    ) => {
      let fd: int = getFd(picName);
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        expect(false).assertTrue();
        console.info(`${testNum} getFrameCountCallBack create imagesource failed`);
        done();
      } else {
        globalimageSource = imageSourceApi;
        console.info(`${testNum} getFrameCountCallBack create imagesource success`);
        imageSourceApi.getFrameCount((err: BusinessError|null, frameCount) => {
          if (err && err.code) {
            console.info(`${testNum} getFrameCountCallBack getFrameCount failed err: ${err}`);
            expect(false).assertTrue();
            done();
          }
          expect(frameCount).assertEqual(EXPECTFRAMECOUNT);
          console.info(`${testNum} getFrameCountCallBack getFrameCount success`);
          console.info(`${testNum} getFrameCountCallBack frameCount= ${frameCount}`);
          done();
        });
      }
    }

    const createPixelMapListPromise = async (
      done: () => void,
      testNum: string,
      picName: string,
      decodeOpts: image.DecodingOptions
    ) => {
      let logger = new Logger(testNum);
      let fd: int = getFd(picName);
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        expect(false).assertTrue();
        logger.log('create image source failed');
        done();
      } else {
        globalimageSource = imageSourceApi;
        try {
          logger.log('createPixelMapListPromise create imagesource success');
          let pixelMapList: Array<image.PixelMap> = await imageSourceApi.createPixelMapList(decodeOpts);
          if (pixelMapList != undefined) {
            logger.log('pixelMapList show begin length: ' + pixelMapList.length);
            expect(pixelMapList != undefined).assertTrue();
            // packingPromise(done, testNum, pixelMapList[0]);
            done();
          } else {
            logger.log('createPixelMapListPromise createPixelMapList failed');
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          logger.log('createPixelMapListPromise error: ' + error);
          expect(false).assertTrue();
          done();
        }
      }
    }

    const createPixelMapListCallBack = async (
      done: () => void,
      testNum: string,
      picName: string,
      decodeOpts: image.DecodingOptions
    ) => {
      let logger = new Logger(testNum);
      let fd: int = getFd(picName);
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        expect(false).assertTrue();
        logger.log('create image source failed');
        done();
      } else {
        globalimageSource = imageSourceApi;
        logger.log('createPixelMapListCallBack create imagesource success');
        imageSourceApi.createPixelMapList(decodeOpts, (err, pixelMapList) => {
          if (err && err.code) {
            logger.log('createPixelMapListCallBack failed err: ' + err);
            expect(false).assertTrue();
            done();
          }
          expect(pixelMapList != undefined).assertTrue();
          logger.log('pixelMapList show begin length: ' + pixelMapList!.length);
          // packingPromise(done, testNum, pixelMapList[0]);
          done();
        });
      }
    }

    const createPixelMapListErrPromise = async (
      done: () => void,
      testNum: string,
      picName: string,
      decodeOpts: image.DecodingOptions,
      checkErrCode: (code: int) => void
    ) => {
      let logger = new Logger(testNum);
      let fd: int = getFd(picName);
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        expect(false).assertTrue();
        logger.log('create image source failed');
        done();
      } else {
        globalimageSource = imageSourceApi;
        try {
          await imageSourceApi.createPixelMapList(decodeOpts);
          logger.log('create pixel map list failed');
          expect(false).assertTrue();
          done();
        } catch (error) {
          error = error as BusinessError;
          logger.log('createPixelMapListErrPromise error.code: ' + error.code);
          logger.log('createPixelMapListErrPromise error: ' + error);
          checkErrCode(error.code as int);
          done();
        }
      }
    }

    const createPixelMapListErrCallBack = async (
      done: () => void,
      testNum: string,
      picName: string,
      decodeOpts: image.DecodingOptions,
      checkErrCode: (code: double|null) => void
    ) => {
      let logger = new Logger(testNum);
      let fd: int = getFd(picName);
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        expect(false).assertTrue();
        logger.log('create image source failed');
        done();
      } else {
        globalimageSource = imageSourceApi;
        logger.log('createPixelMapListErrCallBack create imagesource success');
        imageSourceApi.createPixelMapList(decodeOpts, (err, pixelMapList) => {
          if (err && err.code) {
            checkErrCode(err!.code);
            logger.log('createPixelMapListErrCallBack error.code: ' + err.code);
            logger.log('createPixelMapListErrCallBack error: ' + err);
            done();
          } else {
            logger.log('create pixel map list failed');
            expect(false).assertTrue();
            done();
          }
        });
      }
    }

    const getFilePath = async (fileName: string): Promise<string> => {
      let filePath = filesDir + "/" + fileName;
      return filePath;
    }

    const checkPictureAtIndex = async (
      logger: Logger,
      index: int,
      imageSource: image.ImageSource,
      picture: image.Picture,
      delayTimeList: Array<int>,
      disposalTypeList: Array<int>
    ): Promise<boolean> => {
      let metadata = await picture.getMetadata(image.MetadataType.GIF_METADATA);
      if (metadata == undefined) {
        logger.log("index is: " + index + ", getMetadata is undefined!");
        picture?.release();
        return false;
      }
      let delayTime: Record<string, string | null> = await metadata.getProperties([image.GifPropertyKey.GIF_DELAY_TIME]);
      let disposalType: Record<string, string | null> = await metadata.getProperties([image.GifPropertyKey.GIF_DISPOSAL_TYPE]);

      let mainPixelMap = picture.getMainPixelmap();
      if (mainPixelMap == undefined) {
        logger.log("index is: " + index + ", getMainPixelmap is undefined!");
        picture?.release();
        return false;
      }

      let srcImageInfo = await imageSource.getImageInfo();
      if (srcImageInfo == undefined) {
        logger.log("index is: " + index + ", srcImageInfo is undefined!");
        picture?.release();
        mainPixelMap?.release();
        return false;
      }

      let dstImageInfo: image.ImageInfo = await mainPixelMap.getImageInfo();
      let ret = (delayTime[image.GifPropertyKey.GIF_DELAY_TIME] == delayTimeList[index].toString()) &&
          (disposalType[image.GifPropertyKey.GIF_DISPOSAL_TYPE] == disposalTypeList[index].toString()) &&
          (srcImageInfo.size.width == dstImageInfo.size.width) &&
          (srcImageInfo.size.height == dstImageInfo.size.height);
      logger.log(`index is: ${index}, compare result is: ${ret}`);
      if (!ret) {
          logger.log(`delayTimeList is: ${delayTimeList[index]}, disposalTypeList is: ${disposalTypeList[index]}.`);
          logger.log("metadata delayTime is: " + delayTime[image.GifPropertyKey.GIF_DELAY_TIME] + ", disposalType is: " +
          disposalType[image.GifPropertyKey.GIF_DISPOSAL_TYPE]);
          logger.log(`srcImageInfo is: ${JSON.stringify(srcImageInfo)}, dstImageInfo is: ${JSON.stringify(dstImageInfo)}`);
      }
      picture?.release();
      mainPixelMap?.release();
      return ret;
    }

    const gifIncompleteFrameTest = async(logger: Logger, fileName: string): Promise<boolean> => {
      let filePath = await getFilePath(fileName);
      logger.log("filePath is: " + filePath);
      try {
        let imageSource = image.createImageSource(filePath);
        if (imageSource == undefined) {
          logger.log("create imageSource failed!");
          return false;
        }

        let frameCount: int = await imageSource.getFrameCount();
        let delayTimeList: Array<int> = await imageSource.getDelayTimeList();
        let disposalTypeList: Array<int> = await imageSource.getDisposalTypeList();
        logger.log("get frameCount num is: " + frameCount);
        let ret: boolean = true;
        for (let index = 0; index < frameCount; index++) {
          let picture: image.Picture | undefined = await imageSource.createPictureAtIndex(index);
          if (picture == undefined) {
            logger.log("index is: " + index + ", picture is undefined!");
            ret = false;
            continue;
          }
          let temp = await checkPictureAtIndex(logger, index, imageSource, picture, delayTimeList, disposalTypeList);
          ret = ret && temp;
        }
        imageSource?.release();
        return ret;
      } catch (error) {
        logger.log("gifInCompleteFrameTest failed error is: " + JSON.stringify(error));
        return false;
      }
    }

    const gifInCompleteFrameTestError = async (logger: Logger, fileName: string, errorCode: int): Promise<boolean> => {
      if (fileName.endsWith(".heic") && !isSupportHEICDecode) {
        logger.log("device is not support decode heic!");
        return true;
      }
    
      let filePath = await getFilePath(fileName);
      try {
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          logger.log("create imageSource failed!");
          return false;
        }

        let frameCount: int = await imageSourceApi.getFrameCount();
        logger.log("get frameCount num is: " + frameCount);
        for (let index = 0; index < frameCount; index++) {
          let picture: image.Picture|undefined = await imageSourceApi.createPictureAtIndex(index);
          if (picture == undefined) {
            logger.log("index is: " + index + ", picture is undefined!");
          }
          picture?.release();
        }
        logger.log("createPictureAtIndex is succ!");
        return false;
      } catch (error) {
        error = error as BusinessError;
        logger.log("gifInCompleteFrameTestError failed error is: " + JSON.stringify(error));
        return (error.code == errorCode);
      }
    }

    const gifInCompleteFrameTestMarshalling = async (logger: Logger, picture: image.Picture|undefined): Promise<boolean> => {
      if (picture == undefined) {
        logger.log("picture is undefined!");
        return false;
      }
      try {
        let parcelable: MySequence = new MySequence(picture);
        let data: rpc.MessageSequence = rpc.MessageSequence.create();
        data.writeParcelable(parcelable);
        let ret: MySequence = new MySequence(picture);
        data.readParcelable(ret);
        await Utils.msSleep(500);
    
        let marshallingMetadata = await picture.getMetadata(image.MetadataType.GIF_METADATA);
        let unmarshallingMetadata = await ret.picture_.getMetadata(image.MetadataType.GIF_METADATA);
        let marshallingProperties = await marshallingMetadata!.getAllProperties();
        let unmarshallingProperties = await unmarshallingMetadata!.getAllProperties();
        logger.log(`marshalling properties: ` + JSON.stringify(marshallingProperties));
        logger.log(`unmarshalling properties: ` + JSON.stringify(unmarshallingProperties));
        picture?.release();
        return (JSON.stringify(marshallingProperties) == JSON.stringify(unmarshallingProperties));
      } catch (error) {
        picture?.release();
        logger.log("test marshlling failed error is: " + JSON.stringify(error));
        return false;
      }
    }

    const gifInCompleteFrameMetadataTest = async (logger: Logger, picture: image.Picture|undefined, modifyProperties: Record<string, string | null>): Promise<boolean> => {
      if (picture == undefined) {
        logger.log("picture is undefined!");
        return false;
      }

      try {
        let metadata = await picture.getMetadata(image.MetadataType.GIF_METADATA);
        if (metadata == undefined) {
          logger.log("getMetadata is undefined!");
          picture?.release();
          return false;
        }

        await metadata.setProperties(modifyProperties);
        await picture.setMetadata(image.MetadataType.GIF_METADATA, metadata);
        let dataAfterSet = await picture.getMetadata(image.MetadataType.GIF_METADATA);
        let data = await dataAfterSet!.getAllProperties();
        logger.log("modifyProperties is: " + JSON.stringify(modifyProperties));
        logger.log("after data is: " + JSON.stringify(data));
        picture?.release();
        let ret = modifyProperties["GifDisposalType"] == data!["GifDisposalType"] &&
                  modifyProperties["GifDelayTime"] == data!["GifDelayTime"];
        logger.log("compare result is: " + ret);
        return ret;
      } catch (error) {
        picture?.release();
        logger.log("test metadata failed error is: " + JSON.stringify(error));
        return false;
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0100
     * @tc.desc   test getDelayTimeList(promise) one frame gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0100", "test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0200
     * @tc.desc   test getDelayTimeList(promise) gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0200", "moving_test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0100
     * @tc.desc   test getDelayTimeList(callback) one frame gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0100", "test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0200
     * @tc.desc   test getDelayTimeList(callback) gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0200", "moving_test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0100
     * @tc.desc   test getDisposalType promise for gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetDisposalTypePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0100", "moving_test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0200
     * @tc.desc   test getDisposalType promise for one frame gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetDisposalTypePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0200", "test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0300
     * @tc.desc   test getDisposalType promise jpg error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetDisposalTypePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0300", "test.jpg");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_STATIC_0100
     * @tc.desc   getFrameCount - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFrameCountPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_STATIC_0100", "moving_test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_STATIC_0100
     * @tc.desc   getFrameCount - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFrameCountCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_STATIC_0100", "moving_test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_PROMISE_STATIC_0100
     * @tc.desc   createPixelMapList - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let desired_size: image.Size ={ width: 198, height: 202 };
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: desired_size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      await createPixelMapListPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_PROMISE_STATIC_0100",
        "moving_test.gif", decodeOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0100
     * @tc.desc   createPixelMapList - promise-sampleSize: -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let desired_size: image.Size ={ width: 198, height: 202 };
      let decodeOpts: image.DecodingOptions = {
        sampleSize: -1,
        editable: true,
        desiredSize: desired_size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };

      let checkErrCode = (code: int)=> {
        expect(code == ERR_CODE2).assertTrue();
      }

      await createPixelMapListErrPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0100",
        "moving_test.gif", decodeOpts, checkErrCode);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0200
     * @tc.desc   createPixelMapList - promise-index: -8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let desired_size: image.Size ={ width: 198, height: 202 };
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: desired_size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: -8,
      };

      let checkErrCode = (code: int)=> {
        expect(code == ERR_CODE1).assertTrue();
      }

      await createPixelMapListErrPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0200",
        "moving_test.gif", decodeOpts, checkErrCode);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0300
     * @tc.desc   createPixelMapList - promise-rotate: 500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let desired_size: image.Size ={ width: 198, height: 202 };
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: desired_size,
        rotate: 500,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };

      let checkErrCode = (code: int)=> {
        expect(code == ERR_CODE1).assertTrue();
      }

      await createPixelMapListErrPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0300",
        "moving_test.gif", decodeOpts, checkErrCode);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_CALLBACK_STATIC_0100
     * @tc.desc   createPixelMapList - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let desired_size: image.Size ={ width: 198, height: 202 };
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: desired_size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      await createPixelMapListCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_CALLBACK_STATIC_0100",
        "moving_test.gif", decodeOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_STATIC_0100
     * @tc.desc   test gif incomplete frame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_STATIC_0100");
      let ret = await gifIncompleteFrameTest(logger, "moving_test.gif");
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_STATIC_0200
     * @tc.desc   test gif incomplete frame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_STATIC_0200", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_STATIC_0200");
      let filePath = await getFilePath("moving_test.gif");
      try {
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi != undefined) {
          let picture: image.Picture|undefined = await imageSourceApi.createPictureAtIndex(0);
          let ret = await gifInCompleteFrameTestMarshalling(logger, picture);
          expect(ret).assertTrue();
          done();
        } else {
          logger.log("create imageSource failed!");
          expect().assertFail();
          done();
        }
      } catch (error) {
        logger.log("error is: " + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_STATIC_0300
     * @tc.desc   test gif incomplete frame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_STATIC_0300", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_STATIC_0300");
      let filePath = await getFilePath("moving_test.gif");
      try {
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi != undefined) {
          let picture: image.Picture|undefined = await imageSourceApi.createPictureAtIndex(0);
          let modifyProperties: Record<string, string | null> = {"GifDisposalType":"2","GifDelayTime":"100"};
          let ret = await gifInCompleteFrameMetadataTest(logger, picture, modifyProperties);
          expect(ret).assertTrue();
          done();
        } else {
          logger.log("create imageSource failed!");
          expect().assertFail();
          done();
        }
      } catch (error) {
        logger.log("error is: " + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0100
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0100", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0100");
      let ret = await gifIncompleteFrameTest(logger, "incomplete_test.gif");
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0200
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0200", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0200");
      let fileList: Array<string> = ["test.jpg", "0801_sdr2.heic", "test.bmp", "test_dng.dng", "test.png"];
      let ret = true;
      for (let index = 0; index < fileList.length; index++) {
        let temp = await gifInCompleteFrameTestError(logger, fileList[index], UNSUPPORTED_MIMETYPE);
        logger.log(`index is: ${index}, retult is: ${temp}!`);
        ret = ret && temp;
      }
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0300
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0300", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0300");
      let ret = await gifInCompleteFrameTestError(logger, "fake_large_size_test.gif", IMAGE_TOO_LARGE);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0400
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0400", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_STATIC_0400");
      try {
        let filePath = await getFilePath("moving_test.gif");
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi != undefined) {
          let frameCount: int = await imageSourceApi.getFrameCount();
          let picture: image.Picture|undefined = await imageSourceApi.createPictureAtIndex(frameCount);
          logger.log("createPictureAtIndex is succ!");
          expect().assertFail();
          done();
        } else {
          logger.log("create imageSource failed!");
          expect().assertFail();
          done();
        }
      } catch (error) {
        error = error as BusinessError;
        logger.log("createPictureAtIndex failed, error is: " + JSON.stringify(error));
        expect(error.code == UNSUPPORTED_OPTIONS).assertTrue();
        done();
      }
    });
  })
}

