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

export default function imageModifyProperty() {
  describe('imageModifyProperty', (): void => {
    let filesDir: string | undefined | null;
    let filePath: string = '';
    let ERROR_CODE1 = 62980135;
    let ERROR_CODE2 = 62980146;
    let ERROR_CODE3 = 62980096;
    const IMAGE_LENGTH = image.PropertyKey.IMAGE_LENGTH;
    const IMAGE_WIDTH = image.PropertyKey.IMAGE_WIDTH;
    const GPS_DATE_STAMP = image.PropertyKey.GPS_DATE_STAMP;
    const IMAGE_DESCRIPTION = image.PropertyKey.IMAGE_DESCRIPTION;
    const SCENE_BLUE_SKY_CONF = image.PropertyKey.SCENE_BLUE_SKY_CONF;
    const SCENE_GREEN_PLANT_CONF = image.PropertyKey.SCENE_GREEN_PLANT_CONF;
    const GIF_LOOP_COUNT = image.PropertyKey.GIF_LOOP_COUNT;
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

    const testModifyImageProperties = async (
      done: () => void,
      testNum: string,
      fileName: string,
      type: string,
      props: Record<string, string | null>,
      checkKey: Array<image.PropertyKey>
    ) => {
      let logger = new Logger(testNum);
      let imageSourceApi: image.ImageSource | undefined;
      if (type == "buffer") {
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
          await imageSourceApi.modifyImageProperties(props);
          try {
            let data = await imageSourceApi.getImageProperties(checkKey);
            for (let i = 0; i < checkKey.length; i++) {
              logger.log("getImageProperties data: " + data[checkKey[i] as string]);
              logger.log("getImageProperties props: " + props[checkKey[i] as string]);
            }
            checkKey.forEach((item: image.PropertyKey) => {
              expect(data[item as string] == props[item as string]).assertTrue();
            })
            done();
          } catch (error) {
            error = error as BusinessError;
            logger.log("getImageProperties failed error: " + error.code);
            expect(error.code == ERROR_CODE3).assertTrue();
            done();
          }
        } catch (error) {
            error = error as BusinessError;
          logger.log("modifyImageProperties failed error: " + error.code);
          expect(error.code == ERROR_CODE1 || error.code == ERROR_CODE2 || error.code == ERROR_CODE3).assertTrue();
          try {
            let data = await imageSourceApi.getImageProperties(checkKey);
            for (let i = 0; i < checkKey.length; i++) {
              logger.log("getImageProperties data: " + data[checkKey[i] as string]);
            }
            done();
          } catch (error) {
            error = error as BusinessError;
            logger.log("getImageProperties failed error: " + error.code);
            expect(error.code == ERROR_CODE3).assertTrue();
            done();
          }
        }
      }
    }
    
    const testModifyImagePropertyPromise = async (
      done: () => void,
      testNum: string,
      fileName: string,
      type: string,
      key: image.PropertyKey,
      value: string,
      checkProps: (result: string) => void
    ) => {
      let logger = new Logger(testNum);
      let imageSourceApi: image.ImageSource | undefined;
      if (type == "buffer") {
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
          await imageSourceApi.modifyImageProperty(key, value);
          try {
            let fd = getFd(fileName);
            let imageSourceApi2 = image.createImageSource(fd);
            if (imageSourceApi2 != undefined) {
              let data = await imageSourceApi2.getImageProperty(key);
              logger.log('getImageProperty key ' + key + ": " + data);
              checkProps(data);
              await imageSourceApi2.release();
            } else {
              expect(false).assertTrue();
              logger.log('create image source failed');
            }
            done();
          } catch (error) {
            logger.log("getImageProperty failed error: " + error.code);
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          logger.log("modifyImageProperty failed error: " + error.code);
          expect(false).assertTrue();
          done();
        }
      }
    }

    const testModifyImageBufferProperty = async (
      done: () => void,
      testNum: string,
      type: string,
      key: image.PropertyKey,
      value: string
    ) => {
      let imageSourceApi: image.ImageSource | undefined;
      try {
        if (type == "buffer") {
          let buffer = getBuffer("modifyBuffer.jpg");
          imageSourceApi = image.createImageSource(buffer);
        } else {
          console.info(`${testNum} buffer source failed`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.info(`${testNum} create image source failed`);
        expect(false).assertTrue();
        done();
      }

      if (imageSourceApi == undefined) {
        console.info(`${testNum} create image source failed`);
        expect(false).assertTrue();
        done();
      } else {
        globalimageSource = imageSourceApi;
        try {
          await imageSourceApi.modifyImageProperty(key, value);
          expect(false).assertTrue();
          done();
        } catch (error) {
            error = error as BusinessError;
          console.info(`${testNum} message: ` + error);
          expect(error.code == 62980146).assertTrue();
          expect(error.message == "The EXIF data failed to be written to the file.").assertTrue();
          done();
        }
      }
    }

    const testModifyLoopCountErr = async (
      testNum: string,
      type: string,
      isBatch: boolean,
      done: () => void
    ) => {
      let imageSourceApi: image.ImageSource | undefined;
      try {
        if (type == "gif") {
          getFd("moving_test_loop1.gif");
        } else {
          getFd("test_exif.jpg");
        }
      } catch (error) {
        console.info(`${testNum} create image source failed`);
        expect(false).assertTrue();
        done();
      }
      imageSourceApi = image.createImageSource(filePath);
      if (imageSourceApi == undefined) {
        console.info(`${testNum} create image source failed`);
        expect(false).assertTrue();
        done();
      } else {
        globalimageSource = imageSourceApi;
        if (isBatch) {
          let props: Record<string, string | null> = {};
          props[IMAGE_WIDTH as string] = "1024";
          props[GIF_LOOP_COUNT as string] = "3";
          try {
            await imageSourceApi.modifyImageProperties(props);
            console.log(`${testNum} modify GIF_LOOP_COUNT success.`);
            expect().assertFail();
            done()
          } catch (error) {
            error = error as BusinessError;
            console.log(`${testNum} error: ` + error);
            console.log(`${testNum} error.code: ` + error.code);
            expect(error.code == 62980146).assertTrue();
            done();
          }
        } else {
          try {
            await imageSourceApi.modifyImageProperty(GIF_LOOP_COUNT, '3');
            console.log(`${testNum} modify GIF_LOOP_COUNT success.`);
            expect().assertFail();
            done()
          } catch (error) {
            error = error as BusinessError;
            console.log(`${testNum} error: ` + error);
            console.log(`${testNum} error.code: ` + error.code);
            expect(error.code == 62980146).assertTrue();
            done();
          }
        }
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0100
     * @tc.desc   modifyImageProperty(Orientation)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0100",
        "buffer",
        image.PropertyKey.ORIENTATION,
        "2"
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0200
     * @tc.desc   modifyImageProperty(GPSLatitude)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0200",
        "buffer",
        image.PropertyKey.GPS_LATITUDE,
        "114,3"
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0300
     * @tc.desc   modifyImageProperty(GPSLongitude)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0300",
        "buffer",
        image.PropertyKey.GPS_LONGITUDE,
        "18,2"
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0400
     * @tc.desc   modifyImageProperty(GPSLatitudeRef)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0400",
        "buffer",
        image.PropertyKey.GPS_LATITUDE_REF,
        "N",
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0500
     * @tc.desc   modifyImageProperty(GPSLongitudeRef)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0500",
        "buffer",
        image.PropertyKey.GPS_LONGITUDE_REF,
        "W"
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0600
     * @tc.desc   modifyImageProperty(Orientation)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkProps = (result: string) => {
        expect(result == "Top-right").assertTrue();
      }
      await testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0600",
        "test_exif.jpg",
        "fd",
        image.PropertyKey.ORIENTATION,
        "2",
        checkProps
      );
    });
    
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0700
     * @tc.desc   modifyImageProperty(GPSLatitude)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkProps = (result: string) => {
        expect(result.search("38") != -1).assertTrue();
      }
      await testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0700",
        "test_exif.jpg",
        "fd",
        image.PropertyKey.GPS_LATITUDE,
        "114,3",
        checkProps
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0800
     * @tc.desc   modifyImageProperty(GPSLongitude)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkProps = (result: string) => {
        expect(result.search("9") != -1).assertTrue();
      }
      await testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0800",
        "test_exif.jpg",
        "fd",
        image.PropertyKey.GPS_LONGITUDE,
        "18,2",
        checkProps
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0900
     * @tc.desc   modifyImageProperty(GPSLatitudeRef)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkProps = (result: string) => {
        expect(result == "N").assertTrue();
      }
      await testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_0900",
        "test_exif.jpg",
        "fd",
        image.PropertyKey.GPS_LATITUDE_REF,
        "N",
        checkProps
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1000
     * @tc.desc   modifyImageProperty(GPSLongitudeRef)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkProps = (result: string) => {
        expect(result == "W").assertTrue();
      }
      await testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1000",
        "test_exif.jpg",
        "fd",
        image.PropertyKey.GPS_LONGITUDE_REF,
        "W",
        checkProps
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1100
     * @tc.desc   modifyImageProperty(BitsPerSample)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkProps = (result: string) => {
        expect(result == "4, 4, 4").assertTrue();
      }
      await testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1100",
        "test_exif.jpg",
        "fd",
        image.PropertyKey.BITS_PER_SAMPLE,
        "4, 4, 4",
        checkProps
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1200
     * @tc.desc   modifyImageProperty(ImageLength)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkProps = (result: string) => {
        expect(result == "800").assertTrue();
      }
      await testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1200",
        "test_exif.jpg",
        "fd",
        image.PropertyKey.IMAGE_LENGTH,
        "800",
        checkProps
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1300
     * @tc.desc   modifyImageProperty(ImageWidth)-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkProps = (result: string) => {
        expect(result == "500").assertTrue();
      }
      await testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_STATIC_1300",
        "test_exif.jpg",
        "fd",
        image.PropertyKey.IMAGE_WIDTH,
        "500",
        checkProps
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0100
     * @tc.desc   test modifyImageProperties for jpg with multy keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let props: Record<string, string | null> = {};
      props[IMAGE_WIDTH as string] = "1024";
      props[IMAGE_LENGTH as string] = "2048";

      let checkKey: Array<image.PropertyKey> = [
        IMAGE_WIDTH,
        IMAGE_LENGTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0100",
        "test_exif.jpg",
        "fd",
        props,
        checkKey
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0200
     * @tc.desc   test modifyImageProperties for jpg with single key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let props: Record<string, string | null> = {};
      props[IMAGE_LENGTH as string] = "2048";

      let checkKey: Array<image.PropertyKey> = [
        IMAGE_LENGTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0200",
        "test_exif.jpg",
        "fd",
        props,
        checkKey
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0300
     * @tc.desc   test modifyImageProperties for all the key with null value of jpg icon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let props: Record<string, string | null> = {}
      props[GPS_DATE_STAMP as string] = "2023:04:13";
      props[IMAGE_DESCRIPTION as string] = "A gray picture";

      let checkKey: Array<image.PropertyKey> = [
        GPS_DATE_STAMP,
        IMAGE_DESCRIPTION
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0300",
        "test_exif.jpg",
        "fd",
        props,
        checkKey
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0400
     * @tc.desc   test modifyImageProperties for partially the key with null value of jpg icon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let props: Record<string, string | null> = {}
      props[GPS_DATE_STAMP as string] = "2023:04:13";
      props[IMAGE_WIDTH as string] = "1024";

      let checkKey: Array<image.PropertyKey> = [
        GPS_DATE_STAMP,
        IMAGE_WIDTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0400",
        "test_exif.jpg",
        "fd",
        props,
        checkKey
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0500
     * @tc.desc   test modify image properties using the value obtained from getImageProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkKey: Array<image.PropertyKey> = [
        IMAGE_WIDTH,
        IMAGE_LENGTH
      ];
      let buffer = getBuffer("test_exif.jpg");
      let imageSource = image.createImageSource(buffer);
      if (imageSource == undefined) {
        console.info(`create image source failed`);
        expect().assertFail();
        return undefined;
      }
      let props = await imageSource.getImageProperties(checkKey);
      await imageSource.release();
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_STATIC_0500",
        "test_exif.jpg",
        "fd",
        props,
        checkKey
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0100
     * @tc.desc   test modifyImageProperties for jpg with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let props: Record<string, string | null> = {}
      props[IMAGE_WIDTH as string] = "-1";
      props[IMAGE_LENGTH as string] = "2344";

      let checkKey: Array<image.PropertyKey> = [
        IMAGE_WIDTH,
        IMAGE_LENGTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0100",
        "test_exif.jpg",
        "fd",
        props,
        checkKey
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0200
     * @tc.desc   test modifyImageProperties for jpg with out-of-bounds value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let props: Record<string, string | null> = {}
      props[IMAGE_WIDTH as string] = "100000000000000";
      props[IMAGE_LENGTH as string] = "2344";

      let checkKey: Array<image.PropertyKey> = [
        IMAGE_WIDTH,
        IMAGE_LENGTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0200",
        "test_exif.jpg",
        "buffer",
        props,
        checkKey
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0600
     * @tc.desc   test modifyImageProperties for jpg with partially null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let props: Record<string, string | null> = {}
      props[IMAGE_LENGTH as string] = "2048";
      props[IMAGE_WIDTH as string] = "";

      let checkKey: Array<image.PropertyKey> = [
        IMAGE_LENGTH,
        IMAGE_WIDTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0600",
        "test_exif.jpg",
        "buffer",
        props,
        checkKey
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0700
     * @tc.desc   test modifyImageProperties for jpg with incorrect type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let props: Record<string, string | null> = {}
      props[IMAGE_LENGTH as string] = "2048";
      props[IMAGE_WIDTH as string] = "abc";

      let checkKey: Array<image.PropertyKey> = [
        IMAGE_LENGTH,
        IMAGE_WIDTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0700",
        "test_exif.jpg",
        "buffer",
        props,
        checkKey
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0800
     * @tc.desc   test modifyImageProperties for private filed of jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let props: Record<string, string | null> = {}
      props[SCENE_BLUE_SKY_CONF as string] = "71";
      props[SCENE_GREEN_PLANT_CONF as string] = "98";

      let checkKey: Array<image.PropertyKey> = [
        SCENE_BLUE_SKY_CONF,
        SCENE_GREEN_PLANT_CONF
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0800",
        "test_exif.jpg",
        "buffer",
        props,
        checkKey
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0900
     * @tc.desc   test modifyImageProperties for private and public filed of jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let props: Record<string, string | null> = {}
      props[IMAGE_WIDTH as string] = "1024";
      props[IMAGE_LENGTH as string] = "2048";
      props[SCENE_BLUE_SKY_CONF as string] = "71";
      props[SCENE_GREEN_PLANT_CONF as string] = "98";

      let checkKey: Array<image.PropertyKey> = [
        IMAGE_WIDTH,
        IMAGE_LENGTH,
        SCENE_BLUE_SKY_CONF,
        SCENE_GREEN_PLANT_CONF
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_0900",
        "test_exif.jpg",
        "buffer",
        props,
        checkKey
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_1100
     * @tc.desc   test modifyImageProperties for tiff with multy keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_1100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let props: Record<string, string | null> = {}
      props[IMAGE_WIDTH as string] = "1024";
      props[IMAGE_LENGTH as string] = "2048";

      let checkKey: Array<image.PropertyKey> = [
        IMAGE_WIDTH,
        IMAGE_LENGTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_STATIC_1100",
        "test.tiff",
        "buffer",
        props,
        checkKey
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0100
     * @tc.desc   test modifyImageProperty GIFLoopCount for gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0100 start");
      await testModifyLoopCountErr("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0100", "gif", false, done);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0200
     * @tc.desc   test modifyImageProperties GIFLoopCount for gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0200 start");
      await testModifyLoopCountErr("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0200", "gif", true, done);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0300
     * @tc.desc   test modifyImageProperty GIFLoopCount for jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0300 start");
      await testModifyLoopCountErr("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0300", "jpg", false, done);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0400
     * @tc.desc   test modifyImageProperties GIFLoopCount for jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0400 start");
      await testModifyLoopCountErr("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_STATIC_0400", "jpg", true, done);
    });

  })
}
