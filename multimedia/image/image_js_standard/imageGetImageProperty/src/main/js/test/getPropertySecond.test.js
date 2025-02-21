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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import featureAbility from "@ohos.ability.featureAbility";
export default function imageGetImagePropertySecond() {
    describe("imageGetImagePropertySecond", function () {
        const { DATE_TIME, GPS_TIME_STAMP, GPS_DATE_STAMP, IMAGE_DESCRIPTION, MAKE, MODEL, SENSITIVITY_TYPE,
            RECOMMENDED_EXPOSURE_INDEX, ISO_SPEED, APERTURE_VALUE, EXPOSURE_BIAS_VALUE, METERING_MODE, LIGHT_SOURCE,
            FLASH, FOCAL_LENGTH, USER_COMMENT, PIXEL_X_DIMENSION, PIXEL_Y_DIMENSION, WHITE_BALANCE,
            FOCAL_LENGTH_IN_35_MM_FILM, PHOTO_MODE, STANDARD_OUTPUT_SENSITIVITY, CAPTURE_MODE, PHYSICAL_APERTURE ,ROLL_ANGLE ,PITCH_ANGLE,
            SCENE_FOOD_CONF,SCENE_STAGE_CONF,SCENE_BLUE_SKY_CONF,SCENE_GREEN_PLANT_CONF,SCENE_BEACH_CONF,SCENE_SNOW_CONF,
            SCENE_SUNSET_CONF,SCENE_FLOWERS_CONF,SCENE_NIGHT_CONF,SCENE_TEXT_CONF,FACE_COUNT,FOCUS_MODE} = image.PropertyKey;
        const props = {
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
            HwMnoteCaptureMode:"0",
            HwMnotePhysicalAperture:"1",
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
        let filePath;
        let fdNumber;
        async function getFd(fileName) {
            let context = await featureAbility.getContext();
            await context.getFilesDir().then((data) => {
                filePath = data + "/" + fileName;
                console.info("image case filePath is " + filePath);
            });
            await fileio
                .open(filePath)
                .then(
                    (data) => {
                        fdNumber = data;
                        console.info("image case open fd success " + fdNumber);
                    },
                    (err) => {
                        console.info("image cese open fd fail" + err);
                    }
                )
                .catch((err) => {
                    console.info("image case open fd err " + err);
                });
        }
        beforeAll(async function () {
            console.info("beforeAll case");
        });

        beforeEach(function () {
            console.info("beforeEach case");
        });

        afterEach(function () {
            console.info("afterEach case");
        });

        afterAll(function () {
            console.info("afterAll case");
        });

        async function getImagePropertyPromise(filename,done, testNum, key) {
            await getFd(filename);
            let imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi
                    .getImageProperty(key)
                    .then((data) => {
                        console.info(`${testNum} ${key} ` + data);
                        expect(data == props[key]).assertTrue();
                        done();
                    })
                    .catch((error) => {
                        console.log(`${testNum} error: ` + error);
                        expect(false).assertTrue();
                        done();
                    });
            }
        }
        async function getImagePropertyCb(filename,done, testNum, key) {
            await getFd(filename);
            let imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
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
        async function getImagePropertyCb2(filename,done, testNum, key) {
            await getFd(filename);
            let imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                let property = { index: 0, defaultValue: "9999" };
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

        async function getImagePropertyErr(done, testNum, tag) {
            await getFd("test_hw.jpg");
            let imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
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

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0100
         * @tc.name      : getImageProperty(DATE_TIME)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(DATE_TIME)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0100", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0100", DATE_TIME);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0200
         * @tc.name      : getImageProperty(GPS_TIME_STAMP)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(GPS_TIME_STAMP)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0200", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0200", GPS_TIME_STAMP);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0300
         * @tc.name      : getImageProperty(GPS_DATE_STAMP)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(GPS_DATE_STAMP)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0300", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0300", GPS_DATE_STAMP);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0400
         * @tc.name      : getImageProperty(IMAGE_DESCRIPTION)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(IMAGE_DESCRIPTION)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0400", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0400", IMAGE_DESCRIPTION);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0500
         * @tc.name      : getImageProperty(MAKE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(MAKE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0500", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0500", MAKE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0600
         * @tc.name      : getImageProperty(MODEL)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(MODEL)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0600", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0600", MODEL);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0700
         * @tc.name      : getImageProperty(SENSITIVITY_TYPE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SENSITIVITY_TYPE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0700", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0700", SENSITIVITY_TYPE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0800
         * @tc.name      : getImageProperty(RECOMMENDED_EXPOSURE_INDEX)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(RECOMMENDED_EXPOSURE_INDEX)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0800", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0800",
                RECOMMENDED_EXPOSURE_INDEX);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0900
         * @tc.name      : getImageProperty(ISO_SPEED)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ISO_SPEED)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0900", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0900", ISO_SPEED);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1000
         * @tc.name      : getImageProperty(APERTURE_VALUE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(APERTURE_VALUE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1000", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1000", APERTURE_VALUE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1100
         * @tc.name      : getImageProperty(EXPOSURE_BIAS_VALUE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(EXPOSURE_BIAS_VALUE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1100", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1100", EXPOSURE_BIAS_VALUE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1200
         * @tc.name      : getImageProperty(METERING_MODE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(METERING_MODE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1200", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1200", METERING_MODE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1300
         * @tc.name      : getImageProperty(LIGHT_SOURCE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(LIGHT_SOURCE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1300", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1300", LIGHT_SOURCE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1400
         * @tc.name      : getImageProperty(FLASH)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FLASH)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1400", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1400", FLASH);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1500
         * @tc.name      : getImageProperty(FOCAL_LENGTH)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FOCAL_LENGTH)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1500", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1500", FOCAL_LENGTH);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1600
         * @tc.name      : getImageProperty(USER_COMMENT)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(USER_COMMENT)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1600", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1600", USER_COMMENT);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1700
         * @tc.name      : getImageProperty(PIXEL_X_DIMENSION)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PIXEL_X_DIMENSION)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1700", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1700", PIXEL_X_DIMENSION);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1800
         * @tc.name      : getImageProperty(PIXEL_Y_DIMENSION)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PIXEL_Y_DIMENSION)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1800", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1800", PIXEL_Y_DIMENSION);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1900
         * @tc.name      : getImageProperty(WHITE_BALANCE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(WHITE_BALANCE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1900", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_1900", WHITE_BALANCE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2000
         * @tc.name      : getImageProperty(FOCAL_LENGTH_IN_35_MM_FILM)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FOCAL_LENGTH_IN_35_MM_FILM)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2000", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2000",
                FOCAL_LENGTH_IN_35_MM_FILM);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2100
         * @tc.name      : getImageProperty(ROLL_ANGLE )
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ROLL_ANGLE )
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2100", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2100",
            ROLL_ANGLE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2200
         * @tc.name      : getImageProperty(PITCH_ANGLE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PITCH_ANGLE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2200", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2200",
            PITCH_ANGLE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2300
         * @tc.name      : getImageProperty(SCENE_FOOD_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_FOOD_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2300", 0, async function (done) {
            getImagePropertyPromise("food.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2300",
            SCENE_FOOD_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2400
         * @tc.name      : getImageProperty(SCENE_STAGE_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_STAGE_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2400", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2400",
            SCENE_STAGE_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2500
         * @tc.name      : getImageProperty(SCENE_BLUESKY_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_BLUESKY_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2500", 0, async function (done) {
            getImagePropertyPromise("bluesky.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2500",
            SCENE_BLUE_SKY_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2600
         * @tc.name      : getImageProperty(SCENE_GREENPLANT_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_GREENPLANT_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2600", 0, async function (done) {
            getImagePropertyPromise("greenplant.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2600",
            SCENE_GREEN_PLANT_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2700
         * @tc.name      : getImageProperty(SCENE_BEACH_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_BEACH_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2700", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2700",
            SCENE_BEACH_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2800
         * @tc.name      : getImageProperty(SCENE_SNOW_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_SNOW_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2800", 0, async function (done) {
            getImagePropertyPromise("snow.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2800",
            SCENE_SNOW_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2900
         * @tc.name      : getImageProperty(SCENE_SUNSET_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_SUNSET_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2900", 0, async function (done) {
            getImagePropertyPromise("sunset.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_2900",
            SCENE_SUNSET_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3000
         * @tc.name      : getImageProperty(SCENE_FLOWERS_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_FLOWERS_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3000", 0, async function (done) {
            getImagePropertyPromise("flower.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3000",
            SCENE_FLOWERS_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3100
         * @tc.name      : getImageProperty(SCENE_NIGHT_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_NIGHT_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3100", 0, async function (done) {
            getImagePropertyPromise("night.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3100",
            SCENE_NIGHT_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3200
         * @tc.name      : getImageProperty(SCENE_TEXT_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_TEXT_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3200", 0, async function (done) {
            getImagePropertyPromise("text.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3200",
            SCENE_TEXT_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3300
         * @tc.name      : getImageProperty(FACE_COUNT)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FACE_COUNT)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3300", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3300",
            FACE_COUNT);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3400
         * @tc.name      : getImageProperty(FOCUS_MODE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FOCUS_MODE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3400", 0, async function (done) {
            getImagePropertyPromise("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3400",
            FOCUS_MODE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3500
         * @tc.name      : getImageProperty(CAPTURE_MODE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(CAPTURE_MODE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3500", 0, async function (done) {
            getImagePropertyPromise("food.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3500",
            CAPTURE_MODE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3600
         * @tc.name      : getImageProperty(PHYSICAL_APERTURE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PHYSICAL_APERTURE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3600", 0, async function (done) {
            getImagePropertyPromise("food.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_3600",
            PHYSICAL_APERTURE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100
         * @tc.name      : getImageProperty(DATE_TIME)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(DATE_TIME)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100", DATE_TIME);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200
         * @tc.name      : getImageProperty(GPS_TIME_STAMP)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(GPS_TIME_STAMP)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200", GPS_TIME_STAMP);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300
         * @tc.name      : getImageProperty(GPS_DATE_STAMP)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(GPS_DATE_STAMP)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300", GPS_DATE_STAMP);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400
         * @tc.name      : getImageProperty(IMAGE_DESCRIPTION)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(IMAGE_DESCRIPTION)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400", IMAGE_DESCRIPTION);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500
         * @tc.name      : getImageProperty(MAKE)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(MAKE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500", MAKE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600
         * @tc.name      : getImageProperty(SENSITIVITY_TYPE)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(SENSITIVITY_TYPE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600", SENSITIVITY_TYPE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700
         * @tc.name      : getImageProperty(RECOMMENDED_EXPOSURE_INDEX)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(RECOMMENDED_EXPOSURE_INDEX)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700", RECOMMENDED_EXPOSURE_INDEX);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800
         * @tc.name      : getImageProperty(MODEL)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(MODEL)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800", MODEL);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900
         * @tc.name      : getImageProperty(ISO_SPEED)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(ISO_SPEED)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900", ISO_SPEED);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000
         * @tc.name      : getImageProperty(APERTURE_VALUE)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(APERTURE_VALUE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000", APERTURE_VALUE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1100
         * @tc.name      : getImageProperty(EXPOSURE_BIAS_VALUE)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(EXPOSURE_BIAS_VALUE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1100", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1100", EXPOSURE_BIAS_VALUE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1200
         * @tc.name      : getImageProperty(METERING_MODE)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(METERING_MODE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1200", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1200", METERING_MODE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1300
         * @tc.name      : getImageProperty(LIGHT_SOURCE)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(LIGHT_SOURCE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1300", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1300", LIGHT_SOURCE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1400
         * @tc.name      : getImageProperty(FLASH)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(FLASH)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1400", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1400", FLASH);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1500
         * @tc.name      : getImageProperty(FOCAL_LENGTH)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(FOCAL_LENGTH)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1500", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1500", FOCAL_LENGTH);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1600
         * @tc.name      : getImageProperty(USER_COMMENT)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(USER_COMMENT)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1600", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1600", USER_COMMENT);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1700
         * @tc.name      : getImageProperty(PIXEL_X_DIMENSION)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(PIXEL_X_DIMENSION)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1700", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1700", PIXEL_X_DIMENSION);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1800
         * @tc.name      : getImageProperty(PIXEL_Y_DIMENSION)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(PIXEL_Y_DIMENSION)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1800", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1800", PIXEL_Y_DIMENSION);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1900
         * @tc.name      : getImageProperty(WHITE_BALANCE)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(WHITE_BALANCE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1900", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1900", WHITE_BALANCE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2000
         * @tc.name      : getImageProperty(FOCAL_LENGTH_IN_35_MM_FILM)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(FOCAL_LENGTH_IN_35_MM_FILM)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2000", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2000", FOCAL_LENGTH_IN_35_MM_FILM);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2100
         * @tc.name      : getImageProperty(ROLL_ANGLE )
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ROLL_ANGLE )
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2100", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2100",
            ROLL_ANGLE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2200
         * @tc.name      : getImageProperty(PITCH_ANGLE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PITCH_ANGLE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2200", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2200",
            PITCH_ANGLE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2300
         * @tc.name      : getImageProperty(SCENE_FOOD_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_FOOD_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2300", 0, async function (done) {
            getImagePropertyCb("food.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2300",
            SCENE_FOOD_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2400
         * @tc.name      : getImageProperty(SCENE_STAGE_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_STAGE_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2400", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2400",
            SCENE_STAGE_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2500
         * @tc.name      : getImageProperty(SCENE_BLUESKY_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_BLUESKY_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2500", 0, async function (done) {
            getImagePropertyCb("bluesky.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2500",
            SCENE_BLUE_SKY_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2600
         * @tc.name      : getImageProperty(SCENE_GREENPLANT_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_GREENPLANT_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2600", 0, async function (done) {
            getImagePropertyCb("greenplant.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2600",
            SCENE_GREEN_PLANT_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2700
         * @tc.name      : getImageProperty(SCENE_BEACH_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_BEACH_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2700", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2700",
            SCENE_BEACH_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2800
         * @tc.name      : getImageProperty(SCENE_SNOW_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_SNOW_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2800", 0, async function (done) {
            getImagePropertyCb("snow.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2800",
            SCENE_SNOW_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2900
         * @tc.name      : getImageProperty(SCENE_SUNSET_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_SUNSET_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2900", 0, async function (done) {
            getImagePropertyCb("sunset.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_2900",
            SCENE_SUNSET_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3000
         * @tc.name      : getImageProperty(SCENE_FLOWERS_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_FLOWERS_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3000", 0, async function (done) {
            getImagePropertyCb("flower.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3000",
            SCENE_FLOWERS_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3100
         * @tc.name      : getImageProperty(SCENE_NIGHT_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_NIGHT_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3100", 0, async function (done) {
            getImagePropertyCb("night.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3100",
            SCENE_NIGHT_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3200
         * @tc.name      : getImageProperty(SCENE_TEXT_CONF)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SCENE_TEXT_CONF)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3200", 0, async function (done) {
            getImagePropertyCb("text.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3200",
            SCENE_TEXT_CONF);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3300
         * @tc.name      : getImageProperty(FACE_COUNT)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FACE_COUNT)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3300", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3300",
            FACE_COUNT);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3400
         * @tc.name      : getImageProperty(FOCUS_MODE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FOCUS_MODE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3400", 0, async function (done) {
            getImagePropertyCb("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3400",
            FOCUS_MODE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3500
         * @tc.name      : getImageProperty(CAPTURE_MODE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(CAPTURE_MODE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3500", 0, async function (done) {
            getImagePropertyCb("food.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3500",
            CAPTURE_MODE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3600
         * @tc.name      : getImageProperty(PHYSICAL_APERTURE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PHYSICAL_APERTURE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3600", 0, async function (done) {
            getImagePropertyCb("food.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_3600",
            PHYSICAL_APERTURE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0100
         * @tc.name      : getImageProperty(DATE_TIME,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(DATE_TIME,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0100", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0100", DATE_TIME);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0200
         * @tc.name      : getImageProperty(GPS_TIME_STAMP,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(GPS_TIME_STAMP,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0200", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0200", GPS_TIME_STAMP);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0300
         * @tc.name      : getImageProperty(GPS_DATE_STAMP,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(GPS_DATE_STAMP,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0300", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0300", GPS_DATE_STAMP);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0400
         * @tc.name      : getImageProperty(IMAGE_DESCRIPTION,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(IMAGE_DESCRIPTION,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0400", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0400", IMAGE_DESCRIPTION);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0500
         * @tc.name      : getImageProperty(MAKE,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(MAKE,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0500", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0500", MAKE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0600
         * @tc.name      : getImageProperty(MODEL,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(MODEL,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0600", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0600", MODEL);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0700
         * @tc.name      : getImageProperty(SENSITIVITY_TYPE,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SENSITIVITY_TYPE,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0700", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0700", SENSITIVITY_TYPE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0800
         * @tc.name      : getImageProperty(RECOMMENDED_EXPOSURE_INDEX,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(RECOMMENDED_EXPOSURE_INDEX,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0800", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0800", RECOMMENDED_EXPOSURE_INDEX);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0900
         * @tc.name      : getImageProperty(ISO_SPEED,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ISO_SPEED,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0900", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0900", ISO_SPEED);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1000
         * @tc.name      : getImageProperty(APERTURE_VALUE,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(APERTURE_VALUE,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1000", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1000", APERTURE_VALUE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1100
         * @tc.name      : getImageProperty(EXPOSURE_BIAS_VALUE,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(EXPOSURE_BIAS_VALUE,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1100", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1100", EXPOSURE_BIAS_VALUE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1200
         * @tc.name      : getImageProperty(METERING_MODE,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(METERING_MODE,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1200", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1200", METERING_MODE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1300
         * @tc.name      : getImageProperty(LIGHT_SOURCE,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(LIGHT_SOURCE,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1300", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1300", LIGHT_SOURCE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1400
         * @tc.name      : getImageProperty(FLASH,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FLASH,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1400", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1400", FLASH);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1500
         * @tc.name      : getImageProperty(FOCAL_LENGTH,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FOCAL_LENGTH,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1500", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1500", FOCAL_LENGTH);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1600
         * @tc.name      : getImageProperty(USER_COMMENT,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(USER_COMMENT,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1600", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1600", USER_COMMENT);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1700
         * @tc.name      : getImageProperty(PIXEL_X_DIMENSION,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PIXEL_X_DIMENSION,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1700", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1700", PIXEL_X_DIMENSION);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1800
         * @tc.name      : getImageProperty(PIXEL_Y_DIMENSION,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PIXEL_Y_DIMENSION,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1800", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1800", PIXEL_Y_DIMENSION);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1900
         * @tc.name      : getImageProperty(WHITE_BALANCE,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(WHITE_BALANCE,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1900", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1900", WHITE_BALANCE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2000
         * @tc.name      : getImageProperty(FOCAL_LENGTH_IN_35_MM_FILM,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FOCAL_LENGTH_IN_35_MM_FILM,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2000", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2000", FOCAL_LENGTH_IN_35_MM_FILM);
        });

                /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2100
         * @tc.name      : getImageProperty(ROLL_ANGLE ,property)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ROLL_ANGLE )
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2100", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2100",
            ROLL_ANGLE);
        });

        /**
            * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2200
            * @tc.name      : getImageProperty(PITCH_ANGLE,property)
            * @tc.desc      : 1.create imagesource
            *                 2.set property
            *                 3.call getImageProperty(PITCH_ANGLE)
            * @tc.size      : MEDIUM
            * @tc.type      : Functional
            * @tc.level     : Level 0
            */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2200", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2200",
            PITCH_ANGLE);
        });

        /**
            * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2300
            * @tc.name      : getImageProperty(SCENE_FOOD_CONF,property)
            * @tc.desc      : 1.create imagesource
            *                 2.set property
            *                 3.call getImageProperty(SCENE_FOOD_CONF)
            * @tc.size      : MEDIUM
            * @tc.type      : Functional
            * @tc.level     : Level 0
            */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2300", 0, async function (done) {
            getImagePropertyCb2("food.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2300",
            SCENE_FOOD_CONF);
        });

        /**
            * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2400
            * @tc.name      : getImageProperty(SCENE_STAGE_CONF,property)
            * @tc.desc      : 1.create imagesource
            *                 2.set property
            *                 3.call getImageProperty(SCENE_STAGE_CONF)
            * @tc.size      : MEDIUM
            * @tc.type      : Functional
            * @tc.level     : Level 0
            */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2400", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2400",
            SCENE_STAGE_CONF);
        });

        /**
            * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2500
            * @tc.name      : getImageProperty(SCENE_BLUESKY_CONF,property)
            * @tc.desc      : 1.create imagesource
            *                 2.set property
            *                 3.call getImageProperty(SCENE_BLUESKY_CONF)
            * @tc.size      : MEDIUM
            * @tc.type      : Functional
            * @tc.level     : Level 0
            */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2500", 0, async function (done) {
            getImagePropertyCb2("bluesky.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2500",
            SCENE_BLUE_SKY_CONF);
        });

        /**
            * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2600
            * @tc.name      : getImageProperty(SCENE_GREENPLANT_CONF,property)
            * @tc.desc      : 1.create imagesource
            *                 2.set property
            *                 3.call getImageProperty(SCENE_GREENPLANT_CONF)
            * @tc.size      : MEDIUM
            * @tc.type      : Functional
            * @tc.level     : Level 0
            */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2600", 0, async function (done) {
            getImagePropertyCb2("greenplant.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2600",
            SCENE_GREEN_PLANT_CONF);
        });

        /**
            * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2700
            * @tc.name      : getImageProperty(SCENE_BEACH_CONF,property)
            * @tc.desc      : 1.create imagesource
            *                 2.set property
            *                 3.call getImageProperty(SCENE_BEACH_CONF)
            * @tc.size      : MEDIUM
            * @tc.type      : Functional
            * @tc.level     : Level 0
            */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2700", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2700",
            SCENE_BEACH_CONF);
        });

        /**
            * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2800
            * @tc.name      : getImageProperty(SCENE_SNOW_CONF,property)
            * @tc.desc      : 1.create imagesource
            *                 2.set property
            *                 3.call getImageProperty(SCENE_SNOW_CONF)
            * @tc.size      : MEDIUM
            * @tc.type      : Functional
            * @tc.level     : Level 0
            */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2800", 0, async function (done) {
            getImagePropertyCb2("snow.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2800",
            SCENE_SNOW_CONF);
        });

        /**
            * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2900
            * @tc.name      : getImageProperty(SCENE_SUNSET_CONF,property)
            * @tc.desc      : 1.create imagesource
            *                 2.set property
            *                 3.call getImageProperty(SCENE_SUNSET_CONF)
            * @tc.size      : MEDIUM
            * @tc.type      : Functional
            * @tc.level     : Level 0
            */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2900", 0, async function (done) {
            getImagePropertyCb2("sunset.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2900",
            SCENE_SUNSET_CONF);
        });

        /**
            * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3000
            * @tc.name      : getImageProperty(SCENE_FLOWERS_CONF,property)
            * @tc.desc      : 1.create imagesource
            *                 2.set property
            *                 3.call getImageProperty(SCENE_FLOWERS_CONF)
            * @tc.size      : MEDIUM
            * @tc.type      : Functional
            * @tc.level     : Level 0
            */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3000", 0, async function (done) {
            getImagePropertyCb2("flower.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3000",
            SCENE_FLOWERS_CONF);
        });

        /**
            * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3100
            * @tc.name      : getImageProperty(SCENE_NIGHT_CONF,property)
            * @tc.desc      : 1.create imagesource
            *                 2.set property
            *                 3.call getImageProperty(SCENE_NIGHT_CONF)
            * @tc.size      : MEDIUM
            * @tc.type      : Functional
            * @tc.level     : Level 0
            */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3100", 0, async function (done) {
            getImagePropertyCb2("night.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3100",
            SCENE_NIGHT_CONF);
        });

        /**
            * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3200
            * @tc.name      : getImageProperty(SCENE_TEXT_CONF,property)
            * @tc.desc      : 1.create imagesource
            *                 2.set property
            *                 3.call getImageProperty(SCENE_TEXT_CONF)
            * @tc.size      : MEDIUM
            * @tc.type      : Functional
            * @tc.level     : Level 0
            */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3200", 0, async function (done) {
            getImagePropertyCb2("text.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3200",
            SCENE_TEXT_CONF);
        });

        /**
            * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3300
            * @tc.name      : getImageProperty(FACE_COUNT,property)
            * @tc.desc      : 1.create imagesource
            *                 2.set property
            *                 3.call getImageProperty(FACE_COUNT)
            * @tc.size      : MEDIUM
            * @tc.type      : Functional
            * @tc.level     : Level 0
            */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3300", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3300",
            FACE_COUNT);
        });

        /**
            * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3400
            * @tc.name      : getImageProperty(FOCUS_MODE,property)
            * @tc.desc      : 1.create imagesource
            *                 2.set property
            *                 3.call getImageProperty(FOCUS_MODE)
            * @tc.size      : MEDIUM
            * @tc.type      : Functional
            * @tc.level     : Level 0
            */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3400", 0, async function (done) {
            getImagePropertyCb2("test_hw.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3400",
            FOCUS_MODE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3500
         * @tc.name      : getImageProperty(CAPTURE_MODE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(CAPTURE_MODE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3500", 0, async function (done) {
            getImagePropertyCb2("food.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3500",
            CAPTURE_MODE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3600
         * @tc.name      : getImageProperty(PHYSICAL_APERTURE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PHYSICAL_APERTURE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3600", 0, async function (done) {
            getImagePropertyCb2("food.jpg",done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK2_3600",
            PHYSICAL_APERTURE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_0100
         * @tc.name      : getImageProperty(PHOTO_MODE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PHOTO_MODE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_0100", 0, async function (done) {
            getImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_0100", PHOTO_MODE);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_0200
         * @tc.name      : getImageProperty(STANDARD_OUTPUT_SENSITIVITY)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(STANDARD_OUTPUT_SENSITIVITY)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_0200", 0, async function (done) {
            getImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_ERR_0200", STANDARD_OUTPUT_SENSITIVITY);
        });
    });
}
