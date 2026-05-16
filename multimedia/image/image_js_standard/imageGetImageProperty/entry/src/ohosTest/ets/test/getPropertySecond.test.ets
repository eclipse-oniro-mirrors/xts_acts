/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import image from "@ohos.multimedia.image";
import fileio from "@ohos.fileio";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import featureAbility from "@ohos.ability.featureAbility";
import { BusinessError } from '@ohos.base';


const DATE_TIME = image.PropertyKey.DATE_TIME;
const GPS_TIME_STAMP = image.PropertyKey.GPS_TIME_STAMP;
const GPS_DATE_STAMP = image.PropertyKey.GPS_DATE_STAMP;
const IMAGE_DESCRIPTION = image.PropertyKey.IMAGE_DESCRIPTION;
const MAKE = image.PropertyKey.MAKE;
const MODEL = image.PropertyKey.MODEL;
const SENSITIVITY_TYPE = image.PropertyKey.SENSITIVITY_TYPE;
const RECOMMENDED_EXPOSURE_INDEX = image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX;
const ISO_SPEED = image.PropertyKey.ISO_SPEED;
const APERTURE_VALUE = image.PropertyKey.APERTURE_VALUE;
const EXPOSURE_BIAS_VALUE = image.PropertyKey.EXPOSURE_BIAS_VALUE;
const METERING_MODE = image.PropertyKey.METERING_MODE;
const LIGHT_SOURCE = image.PropertyKey.LIGHT_SOURCE;
const FLASH = image.PropertyKey.FLASH;
const FOCAL_LENGTH = image.PropertyKey.FOCAL_LENGTH;
const USER_COMMENT = image.PropertyKey.USER_COMMENT;
const PIXEL_X_DIMENSION = image.PropertyKey.PIXEL_X_DIMENSION;
const PIXEL_Y_DIMENSION = image.PropertyKey.PIXEL_Y_DIMENSION;
const WHITE_BALANCE = image.PropertyKey.WHITE_BALANCE
const FOCAL_LENGTH_IN_35_MM_FILM = image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM;
const PHOTO_MODE = image.PropertyKey.PHOTO_MODE;
const STANDARD_OUTPUT_SENSITIVITY = image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY;
const CAPTURE_MODE = image.PropertyKey.CAPTURE_MODE;
const PHYSICAL_APERTURE = image.PropertyKey.PHYSICAL_APERTURE;
const ROLL_ANGLE = image.PropertyKey.ROLL_ANGLE;
const PITCH_ANGLE = image.PropertyKey.PITCH_ANGLE;
const SCENE_FOOD_CONF = image.PropertyKey.SCENE_FOOD_CONF;
const SCENE_STAGE_CONF = image.PropertyKey.SCENE_STAGE_CONF;
const SCENE_BLUE_SKY_CONF = image.PropertyKey.SCENE_BLUE_SKY_CONF;
const SCENE_GREEN_PLANT_CONF = image.PropertyKey.SCENE_GREEN_PLANT_CONF;
const SCENE_BEACH_CONF = image.PropertyKey.SCENE_BEACH_CONF;
const SCENE_SNOW_CONF = image.PropertyKey.SCENE_SNOW_CONF;
const SCENE_SUNSET_CONF = image.PropertyKey.SCENE_SUNSET_CONF;
const SCENE_FLOWERS_CONF = image.PropertyKey.SCENE_FLOWERS_CONF;
const SCENE_NIGHT_CONF = image.PropertyKey.SCENE_NIGHT_CONF;
const SCENE_TEXT_CONF = image.PropertyKey.SCENE_TEXT_CONF;
const FACE_COUNT = image.PropertyKey.FACE_COUNT;
const FOCUS_MODE = image.PropertyKey.FOCUS_MODE;


const props: ESObject = {
  DateTime: "2019:11:15 20:48:30",
  GPSTimeStamp: "13:31:27.00",
  GPSDateStamp: "2023:04:13",
  ImageDescription: "A gray picture",
  Make: "HW",
  Model: "STK-LX1",
  SensitivityType: "Standard output sensitivity (SOS)",
  RecommendedExposureIndex: "200",
  ISOSpeedRatings: "200",
  ApertureValue: "1.69 EV (f/1.8)",
  ExposureBiasValue: "0.00 EV",
  MeteringMode: "Pattern",
  LightSource: "Daylight",
  Flash: "Flash fired, auto mode",
  FocalLength: "4.0 mm",
  UserComment: "gray",
  PixelXDimension: "3456",
  PixelYDimension: "4608",
  WhiteBalance: "Auto white balance",
  FocalLengthIn35mmFilm: "26",
  HwMnoteCaptureMode: "0",
  HwMnotePhysicalAperture: "1",
  HwMnoteRollAngle: "default_exif_value",
  HwMnotePitchAngle: "default_exif_value",
  HwMnoteSceneFoodConf: "71",
  HwMnoteSceneStageConf: "default_exif_value",
  HwMnoteSceneBlueSkyConf: "71",
  HwMnoteSceneGreenPlantConf: "98",
  HwMnoteSceneBeachConf: "default_exif_value",
  HwMnoteSceneSnowConf: "default_exif_value",
  HwMnoteSceneSunsetConf: "78",
  HwMnoteSceneFlowersConf: "100",
  HwMnoteSceneNightConf: "99",
  HwMnoteSceneTextConf: "100",
  HwMnoteFaceCount: "default_exif_value",
  HwMnoteFocusMode: "default_exif_value",
}
let filePath: ESObject;
let fdNumber: number;
let globalImagesource: image.ImageSource;

async function getFd(fileName: string) {
  let context: ESObject = await AppStorage.get('thisContext');
  filePath = context.filesDir + "/" + fileName;
  console.info("image case filePath is " + filePath);
  await fileio
    .open(filePath)
    .then(
      (data) => {
        fdNumber = data;
        console.info("image case open fd success " + fdNumber);
      },
      (err: BusinessError) => {
        console.info("image cese open fd fail" + err);
      }
    )
    .catch((err: BusinessError) => {
      console.info("image case open fd err " + err);
    });
}

async function getImagePropertyPromise(filename: string, done: Function, testNum: string, key: string) {
  await getFd(filename);
  let imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    imageSourceApi
      .getImageProperty(key)
      .then((data) => {
        console.info(`${testNum} ${key} ` + data);
        expect(data == props[key]).assertTrue();
        done();
      })
      .catch((error: BusinessError) => {
        console.log(`${testNum} error: ` + error);
        expect(false).assertTrue();
        done();
      });
  }
}

async function getImagePropertyCb(filename: string, done: Function, testNum: string, key: string) {
  await getFd(filename);
  let imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    imageSourceApi.getImageProperty(key, (err, data) => {
      if (err) {
        expect(false).assertTrue();
        console.info(`${testNum} ${key} err: ` + err);
        done();
      } else {
        console.info(`${testNum} ${key} ` + data);
        expect(data == props[key]).assertTrue();
        done();
      }
    });
  }
}

async function getImagePropertyCb2(filename: string, done: Function, testNum: string, key: ESObject) {
  await getFd(filename);
  let imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    let property: ESObject = {
      index: 0, defaultValue: "9999"
    };
    imageSourceApi.getImageProperty(key, property, (err, data) => {
      if (err) {
        expect(false).assertTrue();
        console.info(`${testNum} ${key} err: ` + err);
        done();
      } else {
        console.info(`${testNum} ${key} ` + data);
        expect(data != "9999" && data == props[key]).assertTrue();
        done();
      }
    });
  }
}

async function getImagePropertyErr(done: Function, testNum: string, tag: string) {
  await getFd("test_hw.jpg");
  let imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    try {
      await imageSourceApi.getImageProperty(tag);
      expect(false).assertTrue();
      done();
    } catch (error) {
      expect(error.code != 0).assertTrue();
      console.log(`${testNum} error msg: ` + error);
      done();
    }
  }
}

export default function imageGetImagePropertySecond() {
  describe("imageGetImagePropertySecond", () => {

    beforeAll(async () => {
      console.info("beforeAll case");
    });

    beforeEach(() => {
      console.info("beforeEach case");
    });

    afterEach(async () => {
      if (globalImagesource != undefined) {
        console.info("globalImagesource release start");
        try {
          await globalImagesource.release();
        } catch (error) {
          console.info("globalImagesource release fail");
        }
      }
      console.info("afterEach case");
    });

    afterAll(() => {
      console.info("afterAll case");
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0100", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0100", DATE_TIME);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0200", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0200",
        GPS_TIME_STAMP);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0300", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0300",
        GPS_DATE_STAMP);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0400", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0400",
        IMAGE_DESCRIPTION);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0500", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0500", MAKE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0600", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0600", MODEL);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0700
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0700", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0700",
        SENSITIVITY_TYPE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0800", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0800",
        RECOMMENDED_EXPOSURE_INDEX);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0900
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0900", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0900", ISO_SPEED);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1000
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1000", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1000",
        APERTURE_VALUE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1100", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1100",
        EXPOSURE_BIAS_VALUE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1200", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1200", METERING_MODE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1300", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1300", LIGHT_SOURCE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1400", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1400", FLASH);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1500", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1500", FOCAL_LENGTH);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1600", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1600", USER_COMMENT);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1700
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1700
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1700", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1700",
        PIXEL_X_DIMENSION);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1800
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1800", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1800",
        PIXEL_Y_DIMENSION);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1900
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1900
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1900", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1900", WHITE_BALANCE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2000
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2000
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2000", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2000",
        FOCAL_LENGTH_IN_35_MM_FILM);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2100", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2100",
        ROLL_ANGLE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2200", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2200",
        PITCH_ANGLE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2300", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("food.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2300",
        SCENE_FOOD_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2400", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2400",
        SCENE_STAGE_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2500", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("bluesky.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2500",
        SCENE_BLUE_SKY_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2600", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("greenplant.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2600",
        SCENE_GREEN_PLANT_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2700
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2700
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2700", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2700",
        SCENE_BEACH_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2800
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2800", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("snow.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2800",
        SCENE_SNOW_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2900
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2900
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2900", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("sunset.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2900",
        SCENE_SUNSET_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3000
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3000
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3000", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("flower.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3000",
        SCENE_FLOWERS_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3100", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("night.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3100",
        SCENE_NIGHT_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3200", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("text.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3200",
        SCENE_TEXT_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3300", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3300",
        FACE_COUNT);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3400", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3400",
        FOCUS_MODE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3500", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("food.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3500",
        CAPTURE_MODE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3600", Level.LEVEL0, async (done: Function) => {
      getImagePropertyPromise("food.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3600",
        PHYSICAL_APERTURE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100", DATE_TIME);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200", GPS_TIME_STAMP);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300", GPS_DATE_STAMP);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400", IMAGE_DESCRIPTION);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500", MAKE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600", SENSITIVITY_TYPE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700",
        RECOMMENDED_EXPOSURE_INDEX);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800", MODEL);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900", ISO_SPEED);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000", APERTURE_VALUE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1100", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1100",
        EXPOSURE_BIAS_VALUE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1200", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1200", METERING_MODE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1300", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1300", LIGHT_SOURCE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1400", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1400", FLASH);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1500", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1500", FOCAL_LENGTH);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1600", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1600", USER_COMMENT);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1700
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1700
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1700", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1700", PIXEL_X_DIMENSION);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1800
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1800", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1800", PIXEL_Y_DIMENSION);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1900
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1900
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1900", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1900", WHITE_BALANCE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2000
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2000
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2000", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2000",
        FOCAL_LENGTH_IN_35_MM_FILM);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2100", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2100",
        ROLL_ANGLE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2200", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2200",
        PITCH_ANGLE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2300", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("food.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2300",
        SCENE_FOOD_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2400", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2400",
        SCENE_STAGE_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2500", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("bluesky.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2500",
        SCENE_BLUE_SKY_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2600", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("greenplant.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2600",
        SCENE_GREEN_PLANT_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2700
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2700
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2700", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2700",
        SCENE_BEACH_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2800
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2800", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("snow.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2800",
        SCENE_SNOW_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2900
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2900
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2900", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("sunset.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2900",
        SCENE_SUNSET_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3000
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3000
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3000", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("flower.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3000",
        SCENE_FLOWERS_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3100", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("night.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3100",
        SCENE_NIGHT_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3200", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("text.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3200",
        SCENE_TEXT_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3300", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3300",
        FACE_COUNT);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3400", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3400",
        FOCUS_MODE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3500", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("food.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3500",
        CAPTURE_MODE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3600", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb("food.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3600",
        PHYSICAL_APERTURE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0100", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0100", DATE_TIME);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0200", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0200", GPS_TIME_STAMP);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0300", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0300", GPS_DATE_STAMP);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0400", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0400",
        IMAGE_DESCRIPTION);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0500", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0500", MAKE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0600", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0600", MODEL);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0700
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0700", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0700",
        SENSITIVITY_TYPE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0800", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0800",
        RECOMMENDED_EXPOSURE_INDEX);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0900
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0900", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0900", ISO_SPEED);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1000
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1000", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1000", APERTURE_VALUE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1100", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1100",
        EXPOSURE_BIAS_VALUE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1200", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1200", METERING_MODE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1300", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1300", LIGHT_SOURCE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1400", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1400", FLASH);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1500", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1500", FOCAL_LENGTH);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1600", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1600", USER_COMMENT);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1700
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1700
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1700", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1700",
        PIXEL_X_DIMENSION);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1800
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1800", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1800",
        PIXEL_Y_DIMENSION);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1900
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1900
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1900", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1900", WHITE_BALANCE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2000
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2000
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2000", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2000",
        FOCAL_LENGTH_IN_35_MM_FILM);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2100", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2100",
        ROLL_ANGLE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2200", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2200",
        PITCH_ANGLE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2300", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("food.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2300",
        SCENE_FOOD_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2400", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2400",
        SCENE_STAGE_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2500", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("bluesky.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2500",
        SCENE_BLUE_SKY_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2600", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("greenplant.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2600",
        SCENE_GREEN_PLANT_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2700
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2700
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2700", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2700",
        SCENE_BEACH_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2800
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2800
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2800", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("snow.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2800",
        SCENE_SNOW_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2900
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2900
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2900", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("sunset.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2900",
        SCENE_SUNSET_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3000
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3000
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3000", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("flower.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3000",
        SCENE_FLOWERS_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3100", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("night.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3100",
        SCENE_NIGHT_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3200", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("text.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3200",
        SCENE_TEXT_CONF);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3300", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3300",
        FACE_COUNT);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3400", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("test_hw.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3400",
        FOCUS_MODE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3500
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3500", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("food.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3500",
        CAPTURE_MODE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3600
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3600", Level.LEVEL0, async (done: Function) => {
      getImagePropertyCb2("food.jpg", done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3600",
        PHYSICAL_APERTURE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_0100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_0100", Level.LEVEL0, async (done: Function) => {
      getImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_0100", PHOTO_MODE);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_0200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_0200", Level.LEVEL0, async (done: Function) => {
      getImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_0200", STANDARD_OUTPUT_SENSITIVITY);
    });
  });
}
