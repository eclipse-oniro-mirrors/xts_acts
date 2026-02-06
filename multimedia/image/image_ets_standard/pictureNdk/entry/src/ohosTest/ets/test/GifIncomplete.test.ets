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
    await imageSourceJS?.release();
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

const checkHeifsPictureAtIndex = (
  logger: Logger,
  index: number,
  imageSource: image.ImageSource,
  picture: image.Picture,
  delayTimeList: Array<number>
): boolean => {
  let srcImageInfo: ndkTest.InfoSize = ndkTest.GetImageInfo(imageSource, 0);
  let dstImageInfo: ndkTest.InfoSize = ndkTest.GifGetMainPixelmapInfo(picture);
  let ret = ("40" == delayTimeList[index].toString()) &&
            (srcImageInfo.width == dstImageInfo.width) &&
            (srcImageInfo.height == dstImageInfo.height);
  logger.log(`index is: ${index}, compare result is: ${ret}`);
  if (!ret) {
    logger.log(`delayTimeList is: ${delayTimeList[index]}.`);
    logger.log(`srcImageInfo is: ${JSON.stringify(srcImageInfo)}, dstImageInfo is: ${JSON.stringify(dstImageInfo)}`);
  }
  return ret;
}

const heifsIncompleteFrameTest = async(logger: Logger, fileName: string): Promise<boolean> => {
  let filePath = getFilePath(fileName);
  logger.log("filePath is: " + filePath);
  try {
    let imageSource: image.ImageSource = ndkTest.CreateFromUri(filePath);
    let frameCount: number = ndkTest.GetAllFrameCount(imageSource);
    logger.log("get frameCount num is: " + frameCount);
    let imageSourceJS: image.ImageSource = image.createImageSource(filePath);
    let delayTimeList: Array<number> = await imageSourceJS.getDelayTimeList();
    let ret: boolean = true;
    for (let index = 0; index < frameCount; index++) {
      let picture: image.Picture = ndkTest.CreatePictureAtIndexByImageSource(imageSource, index);
      let temp = checkHeifsPictureAtIndex(logger, index, imageSource, picture, delayTimeList);
      ret = ret && temp;
      logger.log(`checkHeifsPictureAtIndex index is: ${index}, result is: ${ret}.`);
      ndkTest.PictureRelease(picture);
    }
    logger.log("ImageSourceRelease start");
    ndkTest.ImageSourceRelease(imageSource);
    await imageSourceJS?.release();
    return ret;
  } catch (error) {
    logger.log("heifsIncompleteFrameTest failed error is: " + JSON.stringify(error));
    return false;
  }
}

const heifsIncompleteFrameTestError = async(logger: Logger, fileName: string, index: number, errorCode: number): Promise<boolean> => {
  let filePath = getFilePath(fileName);
  logger.log("filePath is: " + filePath);
  let ret: boolean = false;
  try {
    let imageSource: image.ImageSource = ndkTest.CreateFromUri(filePath);
    
    let temp = ndkTest.CreatePictureAtIndexByImageSource(imageSource, index);
    if (typeof temp == 'number') {
      logger.log("create picture at index ret is: " + temp);
      ret = temp == errorCode
    } else {
      logger.log("crete picture is succ!");
      ndkTest.PictureRelease(temp);
    }
    logger.log("ImageSourceRelease start");
    ndkTest.ImageSourceRelease(imageSource);
    return ret;
  } catch (error) {
    logger.log("heifsIncompleteFrameTest failed error is: " + JSON.stringify(error));
    return ret;
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_0100
     * @tc.desc   test gif incomplete frame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_0100", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_0100");
      let ret = await gifIncompleteFrameTest(logger, "moving_test.gif");
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_0200
     * @tc.desc   test gif incomplete frame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0100
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0100", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0100");
      let ret = await gifIncompleteFrameTest(logger, "incomplete_test.gif");
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0200
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0300
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0300", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0300");
      let ret = await gifInCompleteFrameTestError(logger, "fake_large_size_test.gif", IMAGE_TOO_LARGE);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0400
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0500
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0600
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_NATIVE_ERROR_0700
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.number      SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_WITH_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_WITH_METADATA_0100
     * @tc.desc        Test HEIFS multi-frame image decode with metadata verification
     *                 Verify delay time and image info for each frame
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_WITH_METADATA_0100", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_WITH_METADATA_0100");
      let fileName = "heif.heic";
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support heif");
        done();
      } else {
        let ret = await heifsIncompleteFrameTest(logger, fileName);
        expect(ret).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_HEIFS_IMAGESOURCE_GETMIMETYPE_0200
     * @tc.name        SUB_MULTIMEDIA_HEIFS_IMAGESOURCE_GETMIMETYPE_0200
     * @tc.desc        Test HEIFS image source get MIME type
     *                 Verify MIME type is "image/heif-sequence"
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_HEIFS_IMAGESOURCE_GETMIMETYPE_0200", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_HEIFS_IMAGESOURCE_GETMIMETYPE_0200");
      let fileName = "heif.heic";
      let filePath = getFilePath(fileName);
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support heif");
        done();
      } else {
        try {
          let imageSource: image.ImageSource = ndkTest.CreateFromUri(filePath);
          let mimeType: string = ndkTest.HeifsMetadataGetMimetype(imageSource);
          let ret = mimeType == "image/heif-sequence";
          ndkTest.ImageSourceRelease(imageSource);
          logger.log("mimeType is: " + mimeType + ", test result: " + ret);
          expect(ret).assertTrue();
          done();
        } catch (error) {
          logger.log("error is: " + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_HEIFS_CREATEPIXELMAP_IMAGEINFO_0300
     * @tc.name        SUB_MULTIMEDIA_HEIFS_CREATEPIXELMAP_IMAGEINFO_0300
     * @tc.desc        Test HEIFS create pixelmap and compare image dimensions
     *                 Verify width and height match between source and pixelmap
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_HEIFS_CREATEPIXELMAP_IMAGEINFO_0300", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_HEIFS_CREATEPIXELMAP_IMAGEINFO_0300");
      let fileName = "heif.heic";
      let filePath = getFilePath(fileName);
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support heif");
        done();
      } else {
        try {
          let imageSource: image.ImageSource = ndkTest.CreateFromUri(filePath);
          let srcImageInfo: ndkTest.InfoSize = ndkTest.GetImageInfo(imageSource, 0);
          let dstImageInfo: ndkTest.InfoSize = ndkTest.testCreatePixelMapGetImageInfo(imageSource);
          let ret = (srcImageInfo.width == dstImageInfo.width) &&
            (srcImageInfo.height == dstImageInfo.height);
          ndkTest.ImageSourceRelease(imageSource);
          logger.log("srcImageInfo: " + JSON.stringify(srcImageInfo) + ", dstImageInfo: " + 
            JSON.stringify(dstImageInfo) + ", test result: " + ret);
          expect(ret).assertTrue();
          done();
        } catch (error) {
          logger.log("error is: " + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_INTERMEDIATE_FRAME_0100
     * @tc.name        SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_INTERMEDIATE_FRAME_0100
     * @tc.desc        Test HEIFS decode at specific index with metadata verification
     *                 Verify delay time and image info at index 10
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_INTERMEDIATE_FRAME_0100", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_INTERMEDIATE_FRAME_0100");
      let fileName = "heif.heic";
      let filePath = getFilePath(fileName);
      logger.log("filePath is: " + filePath);
      let ret: boolean = false;
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support heif");
        done();
      } else {
        try {
          let imageSource: image.ImageSource = ndkTest.CreateFromUri(filePath);
          let imageSourceJS: image.ImageSource = image.createImageSource(filePath);
          let delayTimeList: Array<number> = await imageSourceJS.getDelayTimeList();
          let picture: image.Picture = ndkTest.CreatePictureAtIndexByImageSource(imageSource, 10);
          ret = checkHeifsPictureAtIndex(logger, 10, imageSource, picture, delayTimeList);
          logger.log(`checkHeifsPictureAtIndex index is: 10, result is: ${ret}.`);
          ndkTest.PictureRelease(picture);
          logger.log("ImageSourceRelease start");
          ndkTest.ImageSourceRelease(imageSource);
          await imageSourceJS?.release();
        } catch (error) {
          logger.log("heifsIncompleteFrameTest failed error is: " + JSON.stringify(error));
        }
        expect(ret).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_FRAME_SKIPPING_0100
     * @tc.name        SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_FRAME_SKIPPING_0100
     * @tc.desc        Test HEIFS decode at even indices with metadata verification
     *                 Verify delay time and image info for even index frames (0, 2, 4...)
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_FRAME_SKIPPING_0100", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_FRAME_SKIPPING_0100");
      let fileName = "heif.heic";
      let filePath = getFilePath(fileName);
      let ret: boolean = true;
      let imageSource: image.ImageSource;
      let picture: image.Picture | undefined;
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support heif");
        done();
      } else {
        imageSource = ndkTest.CreateFromUri(filePath);
        let frameCount: number = ndkTest.GetAllFrameCount(imageSource);
        logger.log("frameCount is: " + frameCount);
        
       let imageSourceJS: image.ImageSource = image.createImageSource(filePath);
       let delayTimeList: Array<number> = await imageSourceJS.getDelayTimeList();
        try {
          for (let index = 0; index < frameCount; index += 2) {
            picture = ndkTest.CreatePictureAtIndexByImageSource(imageSource, index);
            let temp = checkHeifsPictureAtIndex(logger, index, imageSource, picture, delayTimeList);
            ret = ret && temp;
            logger.log(`checkHeifsPictureAtIndex index is: ${index}, result is: ${ret}.`);
          }
        } catch (error) {
          logger.log("create picture at failed, ret is: " + ret);
          ret = false;
        }
        if (picture != undefined) {
          logger.log("PictureRelease start");
          ndkTest.PictureRelease(picture);
        }
        logger.log("ImageSourceRelease start");
        ndkTest.ImageSourceRelease(imageSource);
        await imageSourceJS?.release();
        logger.log("test result: " + ret);
        expect(ret).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_WITH_METADATA_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_WITH_METADATA_ERROR_0100
     * @tc.desc        Test HEIFS create picture with negative index error
     *                 Verify UNSUPPORTED_OPTIONS error for invalid index -1
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_WITH_METADATA_ERROR_0100", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_WITH_METADATA_ERROR_0100");
      let fileName = "heif.heic";
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support heif");
        done();
      } else {
        let ret = await heifsIncompleteFrameTestError(logger, fileName, -1, UNSUPPORTED_OPTIONS);
        expect(ret).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_WITH_METADATA_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_WITH_METADATA_ERROR_0200
     * @tc.desc        Test HEIFS create picture with out-of-bounds index error
     *                 Verify UNSUPPORTED_OPTIONS error when index equals frameCount
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_WITH_METADATA_ERROR_0200", Level.LEVEL0, async (done:Function)=>{
      let logger = new Logger("SUB_MULTIMEDIA_HEIFS_CREATEPICTURE_INDEX_WITH_METADATA_ERROR_0200");
      let fileName = "heif.heic";
      let filePath = getFilePath(fileName);
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support heif");
        done();
      } else {
        let imageSource: image.ImageSource = ndkTest.CreateFromUri(filePath);
        let frameCount: number = ndkTest.GetAllFrameCount(imageSource);
        logger.log("get frameCount num is: " + frameCount);
        let ret = await heifsIncompleteFrameTestError(logger, fileName, frameCount, UNSUPPORTED_OPTIONS);
        ndkTest.ImageSourceRelease(imageSource);
        expect(ret).assertTrue();
        done();
      }
    });


  })
}