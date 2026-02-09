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
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { initialize } from './AbilityContextHelper.test';
import { BusinessError } from '@ohos.base';

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

interface LOOP {
  LOOP_FIVE: string,
  LOOP_ONE: string,
  LOOP_ZERO: string,
  LOOP_NO: string | null
}

export default function imageGetImageProperty() {
  describe('imageGetImageProperty', (): void => {
    let filesDir: string | undefined | null;
    let filePath: string;
    let GET_PROPERTIES_ERROR_CODE = 62980096;
    const ORIENTATION = image.PropertyKey.ORIENTATION
    const IMAGE_LENGTH = image.PropertyKey.IMAGE_LENGTH
    const IMAGE_WIDTH = image.PropertyKey.IMAGE_WIDTH
    const DATE_TIME_ORIGINAL = image.PropertyKey.DATE_TIME_ORIGINAL
    const EXPOSURE_TIME = image.PropertyKey.EXPOSURE_TIME
    const SCENE_TYPE = image.PropertyKey.SCENE_TYPE
    const ISO_SPEED_RATINGS = image.PropertyKey.ISO_SPEED_RATINGS
    const F_NUMBER = image.PropertyKey.F_NUMBER
    const DATE_TIME = image.PropertyKey.DATE_TIME
    const GPS_DATE_STAMP = image.PropertyKey.GPS_DATE_STAMP
    const IMAGE_DESCRIPTION = image.PropertyKey.IMAGE_DESCRIPTION
    const SCENE_FLOWERS_CONF = image.PropertyKey.SCENE_FLOWERS_CONF
    const SCENE_NIGHT_CONF = image.PropertyKey.SCENE_NIGHT_CONF
    const GIF_LOOP_COUNT = image.PropertyKey.GIF_LOOP_COUNT

    let LOOPCASE: LOOP = {
      LOOP_FIVE: "5",
      LOOP_ONE: "1",
      LOOP_ZERO: "0",
      LOOP_NO: null
    };

    let globalpixelmap: image.PixelMap | undefined = undefined;
    let globalimageSource: image.ImageSource | undefined = undefined;
    beforeAll(() => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
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

    const getBuffer = (fileName: string) => {
      filePath = filesDir + "/" + fileName;
      const file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead
    }

    const testGetImageProperties = async (
      done: () => void,
      testNum: string,
      fileName: string,
      args: Array<image.PropertyKey>,
      type: string
    ) => {
      let logger = new Logger(testNum);
      let imageSourceApi: image.ImageSource | undefined;
      if (type == "buf") {
        let buffer = getBuffer(fileName);
        imageSourceApi = image.createImageSource(buffer);
      } else {
        getFd(fileName);
        imageSourceApi = image.createImageSource(filePath);
      }
      if (imageSourceApi == undefined) {
        expect(false).assertTrue();
        logger.log('create image source failed');
        done();
      } else {
        globalimageSource = imageSourceApi;
        try {
          let data = await imageSourceApi.getImageProperties(args);
          for (let i = 0; i < args.length; i++) {
            logger.log("getImageProperties data: " + data[args[i] as string]);
          }
          expect(true).assertTrue();
          done();
        } catch (error: BusinessError) {
          logger.log("getImageProperties failed error: " + error);
          expect(error.code == GET_PROPERTIES_ERROR_CODE).assertTrue();
          done();
        }
      }
    }

    const testGetImagePropertyPromise = async (
      done: () => void,
      testNum: string,
      fileName: string,
      type: string,
      args: image.PropertyKey,
      propsValue: string
    ) => {
      let logger = new Logger(testNum);
      let imageSourceApi: image.ImageSource | undefined;
      if (type == "buf") {
        let buffer = getBuffer(fileName);
        imageSourceApi = image.createImageSource(buffer);
      } else {
        let fd: int = getFd(fileName);
        imageSourceApi = image.createImageSource(fd);
      }
      if (imageSourceApi == undefined) {
        expect(false).assertTrue();
        logger.log('create image source failed');
        done();
      } else {
        globalimageSource = imageSourceApi;
        try {
          let data = await imageSourceApi.getImageProperty(args);
          logger.log('getImageProperty args ' + args + ": " + data);
          logger.log('getImageProperty args ' + args + ": " + propsValue);
          expect(data == propsValue).assertTrue();
          done();
        } catch (error: BusinessError) {
          logger.log("getImageProperty failed error: " + error.code);
          expect(false).assertTrue();
          done();
        }
      }
    }

    const testGetGifLoopCount = async (
      done: () => void,
      testNum: string,
      loopCase: string | null,
      args: image.PropertyKey
    ) => {
      let imageSourceApi: image.ImageSource | undefined;
      let fd: int;
      if (loopCase == LOOPCASE.LOOP_FIVE) {
        fd = getFd("moving_test_loop5.gif");
      } else if (loopCase == LOOPCASE.LOOP_ONE) {
        fd = getFd("moving_test_loop1.gif");
      } else if (loopCase == LOOPCASE.LOOP_ZERO) {
        fd = getFd("moving_test_loop0.gif");
      } else {
        fd = getFd("text.jpg");
      }

      imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        console.info(`${testNum} create image source failed`);
        expect(false).assertTrue();
        done();
      } else {
        globalimageSource = imageSourceApi;
        try {
          let data: string = await imageSourceApi.getImageProperty(args);
          console.info(`${testNum} ${args} ` + data);
          expect(data == loopCase).assertTrue();
          done();
        } catch (error: BusinessError) {
          console.log(`${testNum} error: ` + error);
          console.log(`${testNum} error: ` + JSON.stringify(error));
          expect(error.code == 62980149).assertTrue();
          done();
        }
      }
    }

    const testGetGifLoopCountProperties = async (
      done: () => void,
      testNum: string,
      loopCase: string | null,
      arrayArgs: Array<image.PropertyKey>
    ) => {
      let imageSourceApi: image.ImageSource | undefined;
      let fd: int;
      if (loopCase == LOOPCASE.LOOP_FIVE) {
        fd = getFd("moving_test_loop5.gif");
      } else if (loopCase == LOOPCASE.LOOP_ONE) {
        fd = getFd("moving_test_loop1.gif");
      } else if (loopCase == LOOPCASE.LOOP_ZERO) {
        fd = getFd("moving_test_loop0.gif");
      } else {
        fd = getFd("text.jpg");
      }

      imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        console.info(`${testNum} create image source failed`);
        expect(false).assertTrue();
        done();
      } else {
        globalimageSource = imageSourceApi;
        try {
          let data = await imageSourceApi.getImageProperties(arrayArgs);
          for (let i = 0; i < arrayArgs.length; i++) {
            console.info(`${testNum} ${arrayArgs} ` + data[arrayArgs[i] as string]);
          }
          expect(data['GIFLoopCount'] == loopCase).assertTrue();
          done();
        } catch (error: BusinessError) {
          console.log(`${testNum} error: ` + error);
          console.log(`${testNum} error: ` + JSON.stringify(error));
          expect(error.code == 62980096).assertTrue();
          done();
        }
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0100
     * @tc.desc   getImageProperty(DateTimeOriginal)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key = DATE_TIME_ORIGINAL;
      await testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0100", "test_exif1.jpg",
        "picture", key, "2022:06:02 15:51:35");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0200
     * @tc.desc   getImageProperty(ExposureTime)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key = EXPOSURE_TIME;
      await testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0200", "test_exif1.jpg",
        "picture", key, "1/33 sec.");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0300
     * @tc.desc   getImageProperty(FNumber)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key = F_NUMBER;
      await testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0300", "test_exif1.jpg",
        "picture", key, "f/1.8");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0400
     * @tc.desc   getImageProperty(ISOSpeedRatings)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key = ISO_SPEED_RATINGS;
      await testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0400", "test_exif1.jpg",
        "picture", key, "400");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0500
     * @tc.desc   getImageProperty(SceneType)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key = SCENE_TYPE;
      await testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_STATIC_0500", "test_exif1.jpg",
        "picture", key, "Directly photographed");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0100
     * @tc.desc   getImageProperty(DateTimeOriginal)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key = DATE_TIME_ORIGINAL;
      await testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0100", "test_exif1.jpg",
        "buf", key, "2022:06:02 15:51:35");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0200
     * @tc.desc   getImageProperty(ExposureTime)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key = EXPOSURE_TIME;
      await testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0200", "test_exif1.jpg",
        "buf", key, "1/33 sec.");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0300
     * @tc.desc   getImageProperty(FNumber)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key = F_NUMBER;
      await testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0300", "test_exif1.jpg",
        "buf", key, "f/1.8");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0400
     * @tc.desc   getImageProperty(ISOSpeedRatings)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key = ISO_SPEED_RATINGS;
      await testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0400", "test_exif1.jpg",
        "buf", key, "400");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0500
     * @tc.desc   getImageProperty(SceneType)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key = SCENE_TYPE;
      await testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_STATIC_0500", "test_exif1.jpg",
        "buf", key, "Directly photographed");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0100
     * @tc.desc   test getImageProperties for jpg with multy key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key: Array<image.PropertyKey> = [
        IMAGE_LENGTH,
        IMAGE_WIDTH
      ];
      await testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0100", "test_exif.jpg", key,
        "picture");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0200
     * @tc.desc   test getImageProperties for png with multy key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key: Array<image.PropertyKey> = [
        ORIENTATION,
        DATE_TIME
      ];
      await testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0200", "test_exif.png", key,
        "picture");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0300
     * @tc.desc   test getImageProperties for jpg with single key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key: Array<image.PropertyKey> = [
        IMAGE_WIDTH
      ];
      await testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0300", "test_exif.jpg", key,
        "picture");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0400
     * @tc.desc   test getImageProperties for png with single key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key: Array<image.PropertyKey> = [
        ORIENTATION
      ];
      await testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0400", "test_exif.png", key,
        "picture");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0700
     * @tc.desc   test getImageProperties for jpg with partially null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key: Array<image.PropertyKey> = [
        GPS_DATE_STAMP,
        IMAGE_DESCRIPTION,
        SCENE_NIGHT_CONF
      ];
      await testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0700", "test_exif.jpg", key,
        "picture");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0800
     * @tc.desc   test getImageProperties for png with partially null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key: Array<image.PropertyKey> = [
        GPS_DATE_STAMP,
        IMAGE_DESCRIPTION,
        SCENE_NIGHT_CONF
      ];
      await testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0800", "test_exif.png", key,
        "buf");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0900
     * @tc.desc   test getImageProperties for private filed of jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key: Array<image.PropertyKey> = [
        SCENE_FLOWERS_CONF,
        SCENE_NIGHT_CONF
      ];
      await testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_0900", "test_exif.jpg", key,
        "buf");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_1000
     * @tc.desc   test getImageProperties for private filed of png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_1000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key: Array<image.PropertyKey> = [
        SCENE_FLOWERS_CONF,
        SCENE_NIGHT_CONF
      ];
      await testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_STATIC_1000", "test_exif.png", key,
        "buf");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_ERROR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_ERROR_STATIC_0300
     * @tc.desc   test getImageProperties for tiff with multy keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_ERROR_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key: Array<image.PropertyKey> = [
        IMAGE_LENGTH,
        IMAGE_WIDTH
      ];
      await testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_ERROR_STATIC_0300", "test.tiff", key,
        "buf");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0100
     * @tc.desc   test getImageProperty obtains the loop count 5 of gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key: image.PropertyKey = GIF_LOOP_COUNT;
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0100 start`);
      await testGetGifLoopCount(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0100", LOOPCASE.LOOP_FIVE, key);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0200
     * @tc.desc   test getImageProperty obtains the loop count 1 of gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key: image.PropertyKey = GIF_LOOP_COUNT;
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0200 start`);
      await testGetGifLoopCount(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0200", LOOPCASE.LOOP_ONE, key);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0300
     * @tc.desc   test getImageProperty obtains the loop count infinite of gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key: image.PropertyKey = GIF_LOOP_COUNT;
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0300 start`);
      await testGetGifLoopCount(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0300", LOOPCASE.LOOP_ZERO, key);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0400
     * @tc.desc   test getImageProperty obtains the loop count error of jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let key: image.PropertyKey = GIF_LOOP_COUNT;
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0400 start`);
      await testGetGifLoopCount(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_STATIC_0400", LOOPCASE.LOOP_NO, key);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0100
     * @tc.desc   test getImageProperties obtains the loop count 5 of gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let keys: Array<image.PropertyKey> = [GIF_LOOP_COUNT];
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0100 start`);
      await testGetGifLoopCountProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0100", LOOPCASE.LOOP_FIVE, keys);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0200
     * @tc.desc   test getImageProperties obtains the loop count 1 of gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let keys: Array<image.PropertyKey> = [IMAGE_WIDTH, GIF_LOOP_COUNT];
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0200 start`);
      await testGetGifLoopCountProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0200", LOOPCASE.LOOP_ONE, keys);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0300
     * @tc.desc   test getImageProperties obtains the loop count infinite of gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let keys: Array<image.PropertyKey> = [IMAGE_WIDTH, GIF_LOOP_COUNT];
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0300 start`);
      await testGetGifLoopCountProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0300", LOOPCASE.LOOP_ZERO, keys);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0400
     * @tc.desc   test getImageProperties obtains the loop count error of jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let keys: Array<image.PropertyKey> = [IMAGE_WIDTH, GIF_LOOP_COUNT];
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0400 start`);
      await testGetGifLoopCountProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_STATIC_0400", LOOPCASE.LOOP_NO, keys);
    });

  })
}

