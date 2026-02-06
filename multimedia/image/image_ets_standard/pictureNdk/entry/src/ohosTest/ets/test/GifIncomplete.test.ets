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

import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium';
import ndkTest from 'libPictureNdk.so';
import image from "@ohos.multimedia.image";
import hilog from '@ohos.hilog';

class Logger {
  testNum: string;

  constructor(testNum: string) {
      this.testNum = testNum;
  }

  log(msg: string) {
      hilog.info(0x0000, "gifIncomplete", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

const DECODE_FAILED = 7700301;
const BAD_SOURCE = 7700101;
const UNSUPPORTED_MIMETYPE = 7700102;
const IMAGE_TOO_LARGE = 7700103;
const UNSUPPORTED_OPTIONS = 7700203;
let isSupportHEICDecode: boolean;

function getFilePath(fileName: string): string {
  let filePath = AppStorage.get('pathDir') + "/" + fileName;
  return filePath;
}

const checkPictureAtIndex = (
  logger: Logger,
  index: number,
  imageSource: image.ImageSource,
  picture: image.Picture,
  delayTimeList: Array<number>,
  disposalTypeList: Array<number>
): boolean => {
  let delayTime: string = ndkTest.GifMetadataGetProperty(picture, image.GifPropertyKey.GIF_DELAY_TIME);
  let disposalType: string = ndkTest.GifMetadataGetProperty(picture, image.GifPropertyKey.GIF_DISPOSAL_TYPE);
  let srcImageInfo: ndkTest.InfoSize = ndkTest.GetImageInfo(imageSource, 0);
  let dstImageInfo: ndkTest.InfoSize = ndkTest.GifGetMainPixelmapInfo(picture);
  let ret = (delayTime == delayTimeList[index].toString()) &&
            (disposalType == disposalTypeList[index].toString()) &&
            (srcImageInfo.width == dstImageInfo.width) &&
            (srcImageInfo.height == dstImageInfo.height);
  logger.log(`index is: ${index}, compare result is: ${ret}`);
  if (!ret) {
    logger.log(`delayTimeList is: ${delayTimeList[index]}, disposalTypeList is: ${disposalTypeList[index]}.`);
    logger.log("metadata delayTime is: " + delayTime[image.GifPropertyKey.GIF_DELAY_TIME] + ", disposalType is: " +
      disposalType[image.GifPropertyKey.GIF_DISPOSAL_TYPE]);
    logger.log(`srcImageInfo is: ${JSON.stringify(srcImageInfo)}, dstImageInfo is: ${JSON.stringify(dstImageInfo)}`);
  }
  return ret;
}

const gifIncompleteFrameTest = async(logger: Logger, fileName: string): Promise<boolean> => {
  let filePath = getFilePath(fileName);
  logger.log("filePath is: " + filePath);
  try {
    let imageSource: image.ImageSource = ndkTest.CreateFromUri(filePath);
    let frameCount: number = ndkTest.GetAllFrameCount(imageSource);
    logger.log("get frameCount num is: " + frameCount);
    let imageSourceJS: image.ImageSource = image.createImageSource(filePath);
    let delayTimeList: Array<number> = await imageSourceJS.getDelayTimeList();
    let disposalTypeList: Array<number> = await imageSourceJS.getDisposalTypeList();
    let ret: boolean = true;
    for (let index = 0; index < frameCount; index++) {
      let picture: image.Picture = ndkTest.CreatePictureAtIndexByImageSource(imageSource, index);
      let temp = checkPictureAtIndex(logger, index, imageSource, picture, delayTimeList, disposalTypeList);
      ret = ret && temp;
      logger.log(`checkPictureAtIndex index is: ${index}, result is: ${ret}.`);
      ndkTest.PictureRelease(picture);
    }
    logger.log("ImageSourceRelease start");
    ndkTest.ImageSourceRelease(imageSource);
    return ret;
  } catch (error) {
    logger.log("gifInCompleteFrameTest failed error is: " + JSON.stringify(error));
    return false;
  }
}

const gifInCompleteFrameTestError = async(logger: Logger, fileName: string, errorCode: number): Promise<boolean> => {
  if (fileName.endsWith(".heic") && !isSupportHEICDecode) {
    logger.log("device is not support decode heic!");
    return true;
  }

  let filePath = getFilePath(fileName);
  try {
    let imageSource: image.ImageSource = ndkTest.CreateFromUri(filePath);
    let frameCount: number = ndkTest.GetAllFrameCount(imageSource);
    logger.log("get frameCount num is: " + frameCount);
    for (let index = 0; index < frameCount; index++) {
      let ret = ndkTest.CreatePictureAtIndexByImageSource(imageSource, index);
      if (typeof ret == 'number') {
        logger.log("index is: " + index + ", crete picture is failed, errcode is: " + ret);
        ndkTest.ImageSourceRelease(imageSource);
        return (ret == errorCode);
      } else {
        ndkTest.PictureRelease(ret);
        logger.log("index is: " + index + ", crete picture is succ!");
      }
    }
    logger.log("createPictureAtIndex is succ!");
    return false;
  } catch (error) {
    logger.log("gifInCompleteFrameTestError failed error is: " + JSON.stringify(error));
    return false;
  }
}

const gifInCompleteFrameMetadataTest = async (
  logger: Logger,
  picture: image.Picture,
  modifyKey: image.GifPropertyKey,
  modifyValue: string,
): Promise<boolean> => {
  try {
    ndkTest.GifMetadataSetProperty(picture, modifyKey, modifyValue);
    let data = ndkTest.GifMetadataGetProperty(picture, modifyKey);
    logger.log("modifyProperties is: " + JSON.stringify(modifyValue));
    logger.log("after data is: " + JSON.stringify(data));
    return (JSON.stringify(modifyValue) == JSON.stringify(data));
  } catch (error) {
    logger.log("test metadata failed error is: " + JSON.stringify(error));
    return false;
  }
}

export default function gifIncompleteTest() {
  describe('gifIncompleteTest', () => {

    beforeAll(async () => {
      console.info("beforeAll case");
      let filesDir = getFilePath("test.jpg");
      isSupportHEICDecode =
        image.createImageSource(filesDir).supportedFormats.includes("image/heic");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_0100
     * @tc.desc      : test gif incomplete frame
     *                 1.create imagesource
     *                 2.createPictureAtIndex
     *                 3.getDelayTimeList
     *                 4.getDisposalType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_0100", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_0100");
      let ret = await gifIncompleteFrameTest(logger, "moving_test.gif");
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_0200
     * @tc.desc      : test gif incomplete frame
     *                 1.create imagesource
     *                 2.createPictureAtIndex
     *                 3.set and get gif metadata
     *                 4.compare picture gif metadata properties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_0200", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_0200");
      let filePath = getFilePath("moving_test.gif");
      try {
        let imageSource: image.ImageSource = ndkTest.CreateFromUri(filePath);
        let picture: image.Picture = ndkTest.CreatePictureAtIndexByImageSource(imageSource, 0);
        let modifyGifDelayTime = "100";
        let modifyGifDisposalType = "2";
        let temp1 = await gifInCompleteFrameMetadataTest(logger, picture, image.GifPropertyKey.GIF_DELAY_TIME, modifyGifDelayTime);
        let temp2 = await gifInCompleteFrameMetadataTest(logger, picture, image.GifPropertyKey.GIF_DISPOSAL_TYPE, modifyGifDisposalType);
        let ret = (temp1 && temp2);
        ndkTest.ImageSourceRelease(imageSource);
        ndkTest.PictureRelease(picture);
        logger.log("test metadata ret is: " + ret);
        expect(ret).assertTrue();
        done();
      } catch (error) {
        logger.log("error is: " + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0100
     * @tc.desc      : test gif incomplete frame error
     *                 1.create imagesource
     *                 2.createPictureAtIndex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0100", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0100");
      let ret = await gifIncompleteFrameTest(logger, "incomplete_test.gif");
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0200
     * @tc.desc      : test gif incomplete frame error
     *                 1.create imagesource
     *                 2.createPictureAtIndex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0200", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0200");
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0300
     * @tc.desc      : test gif incomplete frame error
     *                 1.create imagesource
     *                 2.createPictureAtIndex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0300", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0300");
      let ret = await gifInCompleteFrameTestError(logger, "fake_large_size_test.gif", IMAGE_TOO_LARGE);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0400
     * @tc.desc      : test gif incomplete frame error
     *                 1.create imagesource
     *                 2.createPictureAtIndex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0400", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0400");
      try {
        let filePath = getFilePath("moving_test.gif");
        let imageSource: image.ImageSource = ndkTest.CreateFromUri(filePath);
        let ret = ndkTest.CreatePictureAtIndexByImageSource(imageSource, -1);
        if (typeof ret == 'number') {
          logger.log("create picture at index ret is: " + ret);
          ndkTest.ImageSourceRelease(imageSource);
          expect(ret == UNSUPPORTED_OPTIONS).assertTrue();
        } else {
          logger.log("crete picture is succ!");
        }
        done();
      } catch (error) {
        logger.log("createPictureAtIndex failed, error is: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0500
     * @tc.desc      : test gif incomplete frame error
     *                 1.createPictureAtIndex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0500", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0500");
      try {
        let filePath = getFilePath("moving_test.gif");
        let imageSource: image.ImageSource = ndkTest.CreateFromUri(filePath);
        let ret = ndkTest.CreatePictureAtIndexByImageSourceError(imageSource, true);
        if (typeof ret == 'number') {
          logger.log("create picture at index ret is: " + ret);
          expect(ret == BAD_SOURCE).assertTrue();
        } else {
          logger.log("crete picture is succ!");
        }
        done();
      } catch (error) {
        logger.log("createPictureAtIndex failed, error is: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0600
     * @tc.desc      : test gif incomplete frame error
     *                 1.createPictureAtIndex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0600", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0600");
      let filePath = getFilePath("moving_test.gif");
      try {
        let imageSource: image.ImageSource = ndkTest.CreateFromUri(filePath);
        let frameCount: number = ndkTest.GetAllFrameCount(imageSource);
        let ret = ndkTest.CreatePictureAtIndexByImageSource(imageSource, frameCount);
        if (typeof ret == 'number') {
          logger.log("create picture at index ret is: " + ret);
          ndkTest.ImageSourceRelease(imageSource);
          expect(ret == UNSUPPORTED_OPTIONS).assertTrue();
        } else {
          ndkTest.ImageSourceRelease(imageSource);
          logger.log("crete picture is succ!");
          expect().assertFail();
        }
        done();
      } catch (error) {
        logger.log("createPictureAtIndex failed, error is: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0700
     * @tc.desc      : test gif incomplete frame error
     *                 1.createPictureAtIndex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0700", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0700");
      try {
        let filePath = getFilePath("moving_test.gif");
        let imageSource: image.ImageSource = ndkTest.CreateFromUri(filePath);
        let ret = ndkTest.CreatePictureAtIndexByImageSourceError(imageSource, false);
        if (typeof ret == 'number') {
          logger.log("create picture at index ret is: " + ret);
          expect(ret == UNSUPPORTED_OPTIONS).assertTrue();
        } else {
          logger.log("crete picture is succ!");
        }
        done();
      } catch (error) {
        logger.log("createPictureAtIndex failed, error is: " + JSON.stringify(error));
        done();
      }
    });
  })
}