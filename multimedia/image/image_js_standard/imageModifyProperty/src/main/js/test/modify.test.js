/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { modifyBuf } from "./modifyBuffer";
import featureAbility from "@ohos.ability.featureAbility";

export default function imageModifyProperty() {
    describe("imageModifyProperty", function () {
        const { IMAGE_LENGTH, IMAGE_WIDTH, GPS_DATE_STAMP, IMAGE_DESCRIPTION,
            SCENE_BLUE_SKY_CONF, SCENE_GREEN_PLANT_CONF, GIF_LOOP_COUNT } = image.PropertyKey;
        let globalImagesource;
        let filePath;
        let fdNumber;
        let ERROR_CODE1 = "62980135";
        let ERROR_CODE2 = "62980146";
        let ERROR_CODE3 = "62980096";
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

        afterEach(async function () {
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

        afterAll(function () {
            console.info("afterAll case");
        });

        async function testModifyImageProperties(done, testNum, type, props, checkKey) {
            let imageSourceApi;
            if (type == "buffer") {
                const data = modifyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFd(type);
                imageSourceApi = image.createImageSource(filePath);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSourceApi;
                imageSourceApi.modifyImageProperties(props)
                    .then(() => {
                        imageSourceApi
                            .getImageProperties(checkKey)
                            .then((data) => {
                                console.info(`${testNum} newProps: ${JSON.stringify(props)} , data: ${JSON.stringify(data)}`);
                                checkKey.forEach((item) => {
                                    expect(data.item == props.item).assertTrue();
                                })
                                done();
                            })
                            .catch((err) => {
                                const errorCode = JSON.stringify(err);
                                console.log(`${testNum} get error: ` + err.toString());
                                expect(errorCode.includes(ERROR_CODE3)).assertTrue();
                                done();
                            });
                    })
                    .catch((err) => {
                        const errorCode = JSON.stringify(err);
                        console.log(`${testNum} modify error: ` + err.toString());
                        expect(errorCode.includes(ERROR_CODE1) || errorCode.includes(ERROR_CODE2) || errorCode.includes(ERROR_CODE3)).assertTrue();
                        imageSourceApi
                            .getImageProperties(checkKey)
                            .then((data) => {
                                console.info(`${testNum} props: ${JSON.stringify(props)} , data: ${JSON.stringify(data)}`);
                            })
                        done();
                    });
            }
        }

        async function testModifyImagePropertyPromise(done, testNum, type, key, value, checkProps) {
            let imageSourceApi;
            if (type == "buffer") {
                const data = modifyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFd("test_exif.jpg");
                imageSourceApi = image.createImageSource(filePath);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSourceApi;
                imageSourceApi
                    .modifyImageProperty(key, value)
                    .then(() => {
                        imageSourceApi
                            .getImageProperty(key)
                            .then((data) => {
                                console.info(`${testNum} ${key} ` + data);
                                checkProps(data);
                                done();
                            })
                            .catch((err) => {
                                console.info(`${testNum} getImageProperty failed, err:${err}`);
                                expect(false).assertTrue();
                                done();
                            });
                    })
                    .catch((err) => {
                        console.info(`${testNum} modifyImageProperty failed, err:${err}`);
                        expect(false).assertTrue();
                        done();
                    });
            }
        }

        async function testModifyImagePropertyCb(done, testNum, type, key, value, checkProps) {
            let imageSourceApi;
            if (type == "buffer") {
                const data = modifyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFd("test_exif.jpg");
                imageSourceApi = image.createImageSource(filePath);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSourceApi;
                imageSourceApi.modifyImageProperty(key, value, (error) => {
                    if (error) {
                        console.info(`${testNum} modify err: ` + error);
                        expect(false).assertTrue();
                        done();
                    } else {
                        imageSourceApi.getImageProperty(key, (error, data) => {
                            if (error) {
                                console.info(`${testNum} get err: ` + error);
                                expect(false).assertTrue();
                                done();
                            } else {
                                console.info(`${testNum} ${key}: ` + data);
                                checkProps(data);
                                done();
                            }
                        });
                    }
                });
            }
        }

        async function testModifyImagePropertyOptCb(done, testNum, type, key, value, checkProps) {
            let imageSourceApi;
            if (type == "buffer") {
                const data = modifyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFd("test_exif.jpg");
                imageSourceApi = image.createImageSource(filePath);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSourceApi;
                let property = { index: 0, defaultValue: "1" };
                imageSourceApi.modifyImageProperty(key, value, property, (error) => {
                    if (error) {
                        console.info(`${testNum} modify err: ` + error);
                        expect(false).assertTrue();
                        done();
                    } else {
                        imageSourceApi.getImageProperty(key, (error, data) => {
                            if (error) {
                                console.info(`${testNum} get err: ` + error);
                                expect(false).assertTrue();
                                done();
                            } else {
                                console.info(`${testNum} ${key}: ` + data);
                                checkProps(data);
                                done();
                            }
                        });
                    }
                });
            }
        }

        async function testModifyImagePropertyCbErr(done, testNum, type, key, value) {
            let imageSourceApi;
            if (type == "buffer") {
                const data = modifyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFd("test_exif.jpg");
                imageSourceApi = image.createImageSource(filePath);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSourceApi;
                imageSourceApi.modifyImageProperty(key, value, (error) => {
                    console.info(`${testNum} errormsg: ` + error);
                    expect(error.code == 62980135).assertTrue();
                    done();
                });
            }
        }

        async function testModifyImagePropertyOptCbErr(done, testNum, type, key, value) {
            let imageSourceApi;
            if (type == "buffer") {
                const data = modifyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFd("test_exif.jpg");
                imageSourceApi = image.createImageSource(filePath);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSourceApi;
                let property = { index: 0, defaultValue: "1" };
                imageSourceApi.modifyImageProperty(key, value, property, (error) => {
                    console.info(`${testNum} errormsg: ` + error);
                    expect(error.code == 62980135).assertTrue();
                    done();
                });
            }
        }

        async function testModifyImagePropertyPromiseError(done, testNum, type, key, value) {
            let imageSourceApi;
            try {
                if (type == "buffer") {
                    const data = modifyBuf.buffer;
                    imageSourceApi = image.createImageSource(data);
                } else {
                    await getFd("test_exif.jpg");
                    imageSourceApi = image.createImageSource(filePath);
                }
            } catch (error) {
                expect(false).assertTrue();
                done();
            }

            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSourceApi;
                imageSourceApi
                    .modifyImageProperty(key, value)
                    .then(() => {
                        expect(false).assertTrue();
                        done();
                    })
                    .catch((error) => {
                        expect(error.code != 0).assertTrue();
                        console.info(`${testNum} message: ` + error);
                        done();
                    });
            }
        }

        async function testModifyImageBufferProperty(done, testNum, type, key, value) {
            let imageSourceApi;
            try {
                if (type == "buffer") {
                    const data = modifyBuf.buffer;
                    imageSourceApi = image.createImageSource(data);
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
                globalImagesource = imageSourceApi;
                imageSourceApi
                    .modifyImageProperty(key, value)
                    .then(() => {
                        expect(false).assertTrue();
                        done();
                    })
                    .catch((error) => {
                        console.info(`${testNum} message: ` + error);
                        expect(error.code == 62980146).assertTrue();
                        expect(error.message == "The EXIF data failed to be written to the file.").assertTrue();
                        done();
                    });
            }
        }

        async function testModifyLoopCountErr(testNum, type, isBatch, done) {
            let imageSourceApi;
            try {
                if (type == "gif") {
                    await getFd("moving_test_loop1.gif");
                } else {
                    await getFd("test_exif.jpg");
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
                globalImagesource = imageSourceApi;
                if (isBatch) {
                    let props = {
                        ImageWidth: '1024',
                        GIFLoopCount: '3'
                    };
                    imageSourceApi
                        .modifyImageProperties(props)
                        .then(() => {
                            console.log(`${testNum} modify GIF_LOOP_COUNT success.`);
                            expect().assertFail();
                            done()
                        })
                        .catch((error) => {
                            let errorCode = JSON.stringify(error);
                            console.log(`${testNum} error: ` + error);
                            console.log(`${testNum} error: ` + errorCode);
                            expect(errorCode.includes("62980146")).assertTrue();
                            done();
                        });
                } else {
                    imageSourceApi
                        .modifyImageProperty(GIF_LOOP_COUNT, '3')
                        .then(() => {
                            console.log(`${testNum} modify GIF_LOOP_COUNT success.`);
                            expect().assertFail();
                            done()
                        })
                        .catch((error) => {
                            let errorCode = JSON.stringify(error);
                            console.log(`${testNum} error: ` + error);
                            console.log(`${testNum} error: ` + errorCode);
                            expect(errorCode.includes("62980146")).assertTrue();
                            done();
                        });
                }
            }
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0100
         * @tc.name      : modifyImageProperty(Orientation)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0100", 0, async function (done) {
            testModifyImageBufferProperty(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0100",
                "buffer",
                image.PropertyKey.ORIENTATION,
                "2"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0200
         * @tc.name      : modifyImageProperty(GPSLatitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0200", 0, async function (done) {
            testModifyImageBufferProperty(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0200",
                "buffer",
                image.PropertyKey.GPS_LATITUDE,
                "114,3"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0300
         * @tc.name      : modifyImageProperty(GPSLongitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0300", 0, async function (done) {
            testModifyImageBufferProperty(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0300",
                "buffer",
                image.PropertyKey.GPS_LONGITUDE,
                "18,2"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0400
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0400", 0, async function (done) {
            testModifyImageBufferProperty(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0400",
                "buffer",
                image.PropertyKey.GPS_LATITUDE_REF,
                "N",
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0500
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0500", 0, async function (done) {
            testModifyImageBufferProperty(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0500",
                "buffer",
                image.PropertyKey.GPS_LONGITUDE_REF,
                "W"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0600
         * @tc.name      : modifyImageProperty(Orientation)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Top-right").assertTrue();
            }
            testModifyImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0600", "fd", image.PropertyKey.ORIENTATION, "2", checkProps);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0700
         * @tc.name      : modifyImageProperty(GPSLatitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0700", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("38") != -1).assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0700",
                "fd",
                image.PropertyKey.GPS_LATITUDE,
                "114,3",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0800
         * @tc.name      : modifyImageProperty(GPSLongitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0800", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("9") != -1).assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0800",
                "fd",
                image.PropertyKey.GPS_LONGITUDE,
                "18,2",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0900
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0900",
                "fd",
                image.PropertyKey.GPS_LATITUDE_REF,
                "N",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1000
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1000",
                "fd",
                image.PropertyKey.GPS_LONGITUDE_REF,
                "W",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1100
         * @tc.name      : modifyImageProperty(BitsPerSample)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1100", 0, async function (done) {
            function checkProps(result) {
                expect(result == "4, 4, 4").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1100",
                "fd",
                image.PropertyKey.BITS_PER_SAMPLE,
                "4, 4, 4",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1200
         * @tc.name      : modifyImageProperty(ImageLength)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1200", 0, async function (done) {
            function checkProps(result) {
                expect(result == "800").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1200",
                "fd",
                image.PropertyKey.IMAGE_LENGTH,
                "800",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1300
                 * @tc.name      : modifyImageProperty(ImageWidth)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1300", 0, async function (done) {
            function checkProps(result) {
                expect(result == "500").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1300",
                "fd",
                image.PropertyKey.IMAGE_WIDTH,
                "500",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1400
                 * @tc.name      : modifyImageProperty(DateTimeOriginal)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1400", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2022:06:02 00:00:00").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1400",
                "fd",
                "DateTimeOriginal",
                "2022:06:02 00:00:00",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1500
                 * @tc.name      : modifyImageProperty(ExposureTime)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1500", 0, async function (done) {
            function checkProps(result) {
                expect(result == "1/3 sec.").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1500",
                "fd",
                "ExposureTime",
                "1/3",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1600
                 * @tc.name      : modifyImageProperty(SceneType)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Directly photographed").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1600",
                "fd",
                "SceneType",
                "1",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1700
                 * @tc.name      : modifyImageProperty(ISOSpeedRatings)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1700", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1700",
                "fd",
                "ISOSpeedRatings",
                "2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1800
                 * @tc.name      : modifyImageProperty(FNumber)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1800", 0, async function (done) {
            function checkProps(result) {
                expect(result == "f/0.5").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1800",
                "fd",
                "FNumber",
                "1/2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1900
                 * @tc.name      : modifyImageProperty(DateTime)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2022:06:02 00:00:00").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1900",
                "fd",
                "DateTime",
                "2022:06:02 00:00:00",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2000
                 * @tc.name      : modifyImageProperty(GPSTimeStamp)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "11:37:56.00").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2000",
                "fd",
                "GPSTimeStamp",
                "11/1 37/1 56/1",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2100
                 * @tc.name      : modifyImageProperty(GPSDateStamp)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2100", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2023:10:19").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2100",
                "fd",
                "GPSDateStamp",
                "2023:10:19",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2200
                 * @tc.name      : modifyImageProperty(ImageDescription)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2200", 0, async function (done) {
            function checkProps(result) {
                expect(result == "badPhoto").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2200",
                "fd",
                "ImageDescription",
                "badPhoto",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2300
                 * @tc.name      : modifyImageProperty(Make)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2300", 0, async function (done) {
            function checkProps(result) {
                expect(result == "XiaoMI").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2300",
                "fd",
                "Make",
                "XiaoMI",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2400
                 * @tc.name      : modifyImageProperty(Model)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2400", 0, async function (done) {
            function checkProps(result) {
                expect(result == "TNY-AL00").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2400",
                "fd",
                "Model",
                "TNY-AL00",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2600
                 * @tc.name      : modifyImageProperty(SensitivityType)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "ISO speed").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2600",
                "fd",
                "SensitivityType",
                "3",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2800
                 * @tc.name      : modifyImageProperty(RecommendedExposureIndex)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2800", 0, async function (done) {
            function checkProps(result) {
                expect(result == "200").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2800",
                "fd",
                "RecommendedExposureIndex",
                "200",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2900
                 * @tc.name      : modifyImageProperty(ISOSpeedRatings)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "3").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2900",
                "fd",
                "ISOSpeedRatings",
                "3",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3000
                 * @tc.name      : modifyImageProperty(ApertureValue)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "0.50 EV (f/1.2)").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3000",
                "fd",
                "ApertureValue",
                "1/2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3100
                 * @tc.name      : modifyImageProperty(ExposureBiasValue)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3100", 0, async function (done) {
            function checkProps(result) {
                expect(result == "0.50 EV").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3100",
                "fd",
                "ExposureBiasValue",
                "1/2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3200
                 * @tc.name      : modifyImageProperty(MeteringMode)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3200", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Spot").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3200",
                "fd",
                "MeteringMode",
                "3",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3300
                 * @tc.name      : modifyImageProperty(LightSource)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3300", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Fluorescent").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3300",
                "fd",
                "LightSource",
                "2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3400
                 * @tc.name      : modifyImageProperty(Flash)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3400", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Flash fired, auto mode").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3400",
                "fd",
                "Flash",
                "25",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3500
                 * @tc.name      : modifyImageProperty(FocalLength)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3500", 0, async function (done) {
            function checkProps(result) {
                expect(result == "0.5 mm").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3500",
                "fd",
                "FocalLength",
                "1/2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3600
                 * @tc.name      : modifyImageProperty(UserComment)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "1111").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3600",
                "fd",
                "UserComment",
                "1111",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3700
                 * @tc.name      : modifyImageProperty(PixelXDimension)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3700", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2000").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3700",
                "fd",
                "PixelXDimension",
                "2000",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3800
                 * @tc.name      : modifyImageProperty(PixelYDimension)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3800", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2000").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3800",
                "fd",
                "PixelYDimension",
                "2000",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3900
                 * @tc.name      : modifyImageProperty(WhiteBalance)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Auto white balance").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3900",
                "fd",
                "WhiteBalance",
                "0",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_4000
                 * @tc.name      : modifyImageProperty(FocalLengthIn35mmFilm)-promise
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_4000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "35").assertTrue();
            }
            testModifyImagePropertyPromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_4000",
                "fd",
                "FocalLengthIn35mmFilm",
                "35",
                checkProps
            );
        });


        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0100
         * @tc.name      : modifyImageProperty(Orientation)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0100", 0, async function (done) {
            testModifyImageBufferProperty(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0100", "buffer", "Orientation", "2");
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0200
         * @tc.name      : modifyImageProperty(GPSLatitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0200", 0, async function (done) {
            testModifyImageBufferProperty(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0200",
                "buffer",
                "GPSLatitude",
                "114,3"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0300
         * @tc.name      : modifyImageProperty(GPSLongitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0300", 0, async function (done) {
            testModifyImageBufferProperty(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0300",
                "buffer",
                "GPSLongitude",
                "18,2"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0400
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0400", 0, async function (done) {
            testModifyImageBufferProperty(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0400",
                "buffer",
                "GPSLatitudeRef",
                "N"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0500
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0500", 0, async function (done) {
            testModifyImageBufferProperty(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0500",
                "buffer",
                "GPSLongitudeRef",
                "W"
                );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0600
         * @tc.name      : modifyImageProperty(Orientation)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Top-right").assertTrue();
            }
            testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0600", "fd", "Orientation", "2", checkProps);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0700
         * @tc.name      : modifyImageProperty(GPSLatitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0700", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("38") != -1).assertTrue();
            }
            testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0700", "fd", "GPSLatitude", "114,3", checkProps);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0800
         * @tc.name      : modifyImageProperty(GPSLongitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0800", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("9") != -1).assertTrue();
            }
            testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0800", "fd", "GPSLongitude", "18,2", checkProps);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0900
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0900", "fd", "GPSLatitudeRef", "N", checkProps);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1000
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1000", "fd", "GPSLongitudeRef", "W", checkProps);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1100
         * @tc.name      : modifyImageProperty(BitsPerSample)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1100", 0, async function (done) {
            function checkProps(result) {
                expect(result == "4, 4, 4").assertTrue();
            }
            testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1100", "fd", "BitsPerSample", "4, 4, 4", checkProps);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1200
         * @tc.name      : modifyImageProperty(ImageLength)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1200", 0, async function (done) {
            function checkProps(result) {
                expect(result == "800").assertTrue();
            }
            testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1200", "fd", "ImageLength", "800", checkProps);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1300
         * @tc.name      : modifyImageProperty(ImageWidth)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1300", 0, async function (done) {
            function checkProps(result) {
                expect(result == "500").assertTrue();
            }
            testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1300", "fd", "ImageWidth", "500", checkProps);
        });


        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1400
                 * @tc.name      : modifyImageProperty(DateTimeOriginal)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1400", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2022:06:02 00:00:00").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1400",
                "fd",
                "DateTimeOriginal",
                "2022:06:02 00:00:00",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1500
                 * @tc.name      : modifyImageProperty(ExposureTime)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1500", 0, async function (done) {
            function checkProps(result) {
                expect(result == "1/3 sec.").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1500",
                "fd",
                "ExposureTime",
                "1/3",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1600
                 * @tc.name      : modifyImageProperty(SceneType)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Directly photographed").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1600",
                "fd",
                "SceneType",
                "1",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1700
                 * @tc.name      : modifyImageProperty(ISOSpeedRatings)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1700", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1700",
                "fd",
                "ISOSpeedRatings",
                "2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1800
                 * @tc.name      : modifyImageProperty(FNumber)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1800", 0, async function (done) {
            function checkProps(result) {
                expect(result == "f/0.5").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1800",
                "fd",
                "FNumber",
                "1/2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1900
                 * @tc.name      : modifyImageProperty(DateTime)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2022:06:02 00:00:00").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1900",
                "fd",
                "DateTime",
                "2022:06:02 00:00:00",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2000
                 * @tc.name      : modifyImageProperty(GPSTimeStamp)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "11:37:56.00").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2000",
                "fd",
                "GPSTimeStamp",
                "11:37:56",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2100
                 * @tc.name      : modifyImageProperty(GPSDateStamp)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2100", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2023:10:19").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2100",
                "fd",
                "GPSDateStamp",
                "2023:10:19",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2200
                 * @tc.name      : modifyImageProperty(ImageDescription)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2200", 0, async function (done) {
            function checkProps(result) {
                expect(result == "badPhoto").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2200",
                "fd",
                "ImageDescription",
                "badPhoto",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2300
                 * @tc.name      : modifyImageProperty(Make)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2300", 0, async function (done) {
            function checkProps(result) {
                expect(result == "XiaoMI").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2300",
                "fd",
                "Make",
                "XiaoMI",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2400
                 * @tc.name      : modifyImageProperty(Model)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2400", 0, async function (done) {
            function checkProps(result) {
                expect(result == "TNY-AL00").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2400",
                "fd",
                "Model",
                "TNY-AL00",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2600
                 * @tc.name      : modifyImageProperty(SensitivityType)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "ISO speed").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2600",
                "fd",
                "SensitivityType",
                "3",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2800
                 * @tc.name      : modifyImageProperty(RecommendedExposureIndex)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2800", 0, async function (done) {
            function checkProps(result) {
                expect(result == "200").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2800",
                "fd",
                "RecommendedExposureIndex",
                "200",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2900
                 * @tc.name      : modifyImageProperty(ISOSpeedRatings)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "3").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2900",
                "fd",
                "ISOSpeedRatings",
                "3",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3000
                 * @tc.name      : modifyImageProperty(ApertureValue)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "0.50 EV (f/1.2)").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3000",
                "fd",
                "ApertureValue",
                "1/2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3100
                 * @tc.name      : modifyImageProperty(ExposureBiasValue)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3100", 0, async function (done) {
            function checkProps(result) {
                expect(result == "0.50 EV").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3100",
                "fd",
                "ExposureBiasValue",
                "1/2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3200
                 * @tc.name      : modifyImageProperty(MeteringMode)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3200", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Spot").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3200",
                "fd",
                "MeteringMode",
                "3",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3300
                 * @tc.name      : modifyImageProperty(LightSource)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3300", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Fluorescent").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3300",
                "fd",
                "LightSource",
                "2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3400
                 * @tc.name      : modifyImageProperty(Flash)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3400", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Flash fired, auto mode").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3400",
                "fd",
                "Flash",
                "25",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3500
                 * @tc.name      : modifyImageProperty(FocalLength)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3500", 0, async function (done) {
            function checkProps(result) {
                expect(result == "0.5 mm").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3500",
                "fd",
                "FocalLength",
                "1/2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3600
                 * @tc.name      : modifyImageProperty(UserComment)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "1111").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3600",
                "fd",
                "UserComment",
                "1111",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3700
                 * @tc.name      : modifyImageProperty(PixelXDimension)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3700", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2000").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3700",
                "fd",
                "PixelXDimension",
                "2000",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3800
                 * @tc.name      : modifyImageProperty(PixelYDimension)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3800", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2000").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3800",
                "fd",
                "PixelYDimension",
                "2000",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3900
                 * @tc.name      : modifyImageProperty(WhiteBalance)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Auto white balance").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3900",
                "fd",
                "WhiteBalance",
                "0",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_4000
                 * @tc.name      : modifyImageProperty(FocalLengthIn35mmFilm)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_4000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "35").assertTrue();
            }
            testModifyImagePropertyCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_4000",
                "fd",
                "FocalLengthIn35mmFilm",
                "35",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0100
         * @tc.name      : modifyImageProperty(Orientation,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0100", 0, async function (done) {
            testModifyImageBufferProperty(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0100",
                "buffer",
                "Orientation",
                "2"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0200
         * @tc.name      : modifyImageProperty(GPSLatitude,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0200", 0, async function (done) {
            testModifyImageBufferProperty(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0200",
                "buffer",
                "GPSLatitude",
                "114,3"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0300
         * @tc.name      : modifyImageProperty(GPSLongitude,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0300", 0, async function (done) {
            testModifyImageBufferProperty(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0300",
                "buffer",
                "GPSLongitude",
                "18,2"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0400
         * @tc.name      : modifyImageProperty(GPSLatitudeRef,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0400", 0, async function (done) {
            testModifyImageBufferProperty(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0400",
                "buffer",
                "GPSLatitudeRef",
                "N"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0500
         * @tc.name      : modifyImageProperty(GPSLongitudeRef,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0500", 0, async function (done) {
            testModifyImageBufferProperty(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0500",
                "buffer",
                "GPSLongitudeRef",
                "W"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0600
         * @tc.name      : modifyImageProperty(Orientation,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Top-right").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0600",
                "fd",
                "Orientation",
                "2",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0700
         * @tc.name      : modifyImageProperty(GPSLatitude,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0700", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("38") != -1).assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0700",
                "fd",
                "GPSLatitude",
                "114,3",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0800
         * @tc.name      : modifyImageProperty(GPSLongitude,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0800", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("9") != -1).assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0800",
                "fd",
                "GPSLongitude",
                "18,2",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0900
         * @tc.name      : modifyImageProperty(GPSLatitudeRef,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0900",
                "fd",
                "GPSLatitudeRef",
                "N",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1000
         * @tc.name      : modifyImageProperty(GPSLongitudeRef,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1000",
                "fd",
                "GPSLongitudeRef",
                "W",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1100
         * @tc.name      : modifyImageProperty(BitsPerSample,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1100", 0, async function (done) {
            function checkProps(result) {
                expect(result == "4, 4, 4").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1100",
                "fd",
                "BitsPerSample",
                "4, 4, 4",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1200
         * @tc.name      : modifyImageProperty(ImageLength,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1200", 0, async function (done) {
            function checkProps(result) {
                expect(result == "800").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1200",
                "fd",
                "ImageLength",
                "800",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1300
         * @tc.name      : modifyImageProperty(ImageWidth,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1300", 0, async function (done) {
            function checkProps(result) {
                expect(result == "500").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1300",
                "fd",
                "ImageWidth",
                "500",
                checkProps
            );
        });


        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1400
                 * @tc.name      : modifyImageProperty(DateTimeOriginal,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1400", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2022:06:02 00:00:00").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1400",
                "fd",
                "DateTimeOriginal",
                "2022:06:02 00:00:00",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1500
                 * @tc.name      : modifyImageProperty(ExposureTime,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1500", 0, async function (done) {
            function checkProps(result) {
                expect(result == "1/3 sec.").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1500",
                "fd",
                "ExposureTime",
                "1/3",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1600
                 * @tc.name      : modifyImageProperty(SceneType,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Directly photographed").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1600",
                "fd",
                "SceneType",
                "1",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1700
                 * @tc.name      : modifyImageProperty(ISOSpeedRatings,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1700", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1700",
                "fd",
                "ISOSpeedRatings",
                "2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1800
                 * @tc.name      : modifyImageProperty(FNumber,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1800", 0, async function (done) {
            function checkProps(result) {
                expect(result == "f/0.5").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1800",
                "fd",
                "FNumber",
                "1/2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1900
                 * @tc.name      : modifyImageProperty(DateTime,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2022:06:02 00:00:00").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1900",
                "fd",
                "DateTime",
                "2022:06:02 00:00:00",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2000
                 * @tc.name      : modifyImageProperty(GPSTimeStamp,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "11:37:56.00").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2000",
                "fd",
                "GPSTimeStamp",
                "11:37:56",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2100
                 * @tc.name      : modifyImageProperty(GPSDateStamp,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2100", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2023:10:19").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2100",
                "fd",
                "GPSDateStamp",
                "2023:10:19",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2200
                 * @tc.name      : modifyImageProperty(ImageDescription,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2200", 0, async function (done) {
            function checkProps(result) {
                expect(result == "badPhoto").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2200",
                "fd",
                "ImageDescription",
                "badPhoto",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2300
                 * @tc.name      : modifyImageProperty(Make,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2300", 0, async function (done) {
            function checkProps(result) {
                expect(result == "XiaoMI").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2300",
                "fd",
                "Make",
                "XiaoMI",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2400
                 * @tc.name      : modifyImageProperty(Model,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2400", 0, async function (done) {
            function checkProps(result) {
                expect(result == "TNY-AL00").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2400",
                "fd",
                "Model",
                "TNY-AL00",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2600
                 * @tc.name      : modifyImageProperty(SensitivityType,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "ISO speed").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2600",
                "fd",
                "SensitivityType",
                "3",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2800
                 * @tc.name      : modifyImageProperty(RecommendedExposureIndex,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2800", 0, async function (done) {
            function checkProps(result) {
                expect(result == "200").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2800",
                "fd",
                "RecommendedExposureIndex",
                "200",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2900
                 * @tc.name      : modifyImageProperty(ISOSpeedRatings,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "3").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2900",
                "fd",
                "ISOSpeedRatings",
                "3",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3000
                 * @tc.name      : modifyImageProperty(ApertureValue,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "0.50 EV (f/1.2)").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3000",
                "fd",
                "ApertureValue",
                "1/2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3100
                 * @tc.name      : modifyImageProperty(ExposureBiasValue,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3100", 0, async function (done) {
            function checkProps(result) {
                expect(result == "0.50 EV").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3100",
                "fd",
                "ExposureBiasValue",
                "1/2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3200
                 * @tc.name      : modifyImageProperty(MeteringMode,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3200", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Spot").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3200",
                "fd",
                "MeteringMode",
                "3",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3300
                 * @tc.name      : modifyImageProperty(LightSource,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3300", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Fluorescent").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3300",
                "fd",
                "LightSource",
                "2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3400
                 * @tc.name      : modifyImageProperty(Flash,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3400", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Flash fired, auto mode").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3400",
                "fd",
                "Flash",
                "25",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3500
                 * @tc.name      : modifyImageProperty(FocalLength,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3500", 0, async function (done) {
            function checkProps(result) {
                expect(result == "0.5 mm").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3500",
                "fd",
                "FocalLength",
                "1/2",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3600
                 * @tc.name      : modifyImageProperty(UserComment,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "1111").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3600",
                "fd",
                "UserComment",
                "1111",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3700
                 * @tc.name      : modifyImageProperty(PixelXDimension,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3700", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2000").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3700",
                "fd",
                "PixelXDimension",
                "2000",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3800
                 * @tc.name      : modifyImageProperty(PixelYDimension,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3800", 0, async function (done) {
            function checkProps(result) {
                expect(result == "2000").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3800",
                "fd",
                "PixelYDimension",
                "2000",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3900
                 * @tc.name      : modifyImageProperty(WhiteBalance,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Auto white balance").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3900",
                "fd",
                "WhiteBalance",
                "0",
                checkProps
            );
        });

        /**
                 * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_4000
                 * @tc.name      : modifyImageProperty(FocalLengthIn35mmFilm,property)-callback
                 * @tc.desc      : 1.create imagesource
                 *                 2.call modifyImageProperty(key,value,options)
                 *                 3.return undefined
                 * @tc.size      : MEDIUM
                 * @tc.type      : Functional
                 * @tc.level     : Level 1
                 */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_4000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "35").assertTrue();
            }
            testModifyImagePropertyOptCb(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_4000",
                "fd",
                "FocalLengthIn35mmFilm",
                "35",
                checkProps
            );
        });




        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0100
         * @tc.name      : modifyImageProperty(Orientation)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0100", 0, async function (done) {
            testModifyImagePropertyPromiseError(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0100",
                "fd",
                "Orientation",
                "abcdef"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0200
         * @tc.name      : modifyImageProperty(GPSLatitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0200", 0, async function (done) {
            testModifyImagePropertyPromiseError(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0200",
                "fd",
                "GPSLatitude",
                "abc,3"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0300
         * @tc.name      : modifyImageProperty(GPSLongitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0300", 0, async function (done) {
            testModifyImagePropertyPromiseError(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0200",
                "fd",
                "GPSLongitude",
                "abc,2"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0400
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0400", 0, async function (done) {
            testModifyImagePropertyPromiseError(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0400",
                "fd",
                "GPSLatitudeRef",
                "456"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0500
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0500", 0, async function (done) {
            testModifyImagePropertyPromiseError(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0500",
                "fd",
                "GPSLongitudeRef",
                "1234"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0600
         * @tc.name      : modifyImageProperty(Orientation)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0600", 0, async function (done) {
            testModifyImagePropertyPromiseError(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0600",
                "buffer",
                "Orientation",
                "abcdef"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0700
         * @tc.name      : modifyImageProperty(GPSLatitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0700", 0, async function (done) {
            testModifyImagePropertyPromiseError(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0700",
                "buffer",
                "GPSLatitude",
                "abc,3"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0800
         * @tc.name      : modifyImageProperty(GPSLongitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0800", 0, async function (done) {
            testModifyImagePropertyPromiseError(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0800",
                "buffer",
                "GPSLongitude",
                "abc,2"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0900
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0900", 0, async function (done) {
            testModifyImagePropertyPromiseError(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0900",
                "buffer",
                "GPSLatitudeRef",
                "456"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_1000
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_1000", 0, async function (done) {
            testModifyImagePropertyPromiseError(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_1000",
                "buffer",
                "GPSLongitudeRef",
                "1234"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0100
         * @tc.name      : modifyImageProperty(Orientation)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0100", 0, async function (done) {
            testModifyImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0100", "fd", "Orientation", "abcdef");
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0200
         * @tc.name      : modifyImageProperty(GPSLatitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0200", 0, async function (done) {
            testModifyImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0200", "fd", "GPSLatitude", "abc,3");
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0300
         * @tc.name      : modifyImageProperty(GPSLongitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0300", 0, async function (done) {
            testModifyImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0300", "fd", "GPSLongitude", "abc,2");
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0400
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0400", 0, async function (done) {
            testModifyImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0400", "fd", "GPSLongitudeRef", "1234");
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0500
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0500", 0, async function (done) {
            testModifyImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0500", "fd", "GPSLatitudeRef", "456");
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0600
         * @tc.name      : modifyImageProperty(Orientation)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0600", 0, async function (done) {
            testModifyImagePropertyCbErr(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0600",
                "buffer",
                "Orientation",
                "abcdef"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0700
         * @tc.name      : modifyImageProperty(GPSLatitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0700", 0, async function (done) {
            testModifyImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0700", "buffer", "GPSLatitude", "abc,3");
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0800
         * @tc.name      : modifyImageProperty(GPSLongitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0800", 0, async function (done) {
            testModifyImagePropertyCbErr(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0800",
                "buffer",
                "GPSLongitude",
                "abc,2"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0900
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0900", 0, async function (done) {
            testModifyImagePropertyCbErr(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0900",
                "buffer",
                "GPSLongitudeRef",
                "1234"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_1000
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_1000", 0, async function (done) {
            testModifyImagePropertyCbErr(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_1000",
                "buffer",
                "GPSLatitudeRef",
                "456"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0100
         * @tc.name      : modifyImageProperty(Orientation)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0100", 0, async function (done) {
            testModifyImagePropertyOptCbErr(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0100",
                "fd",
                "Orientation",
                "abcdef"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0200
         * @tc.name      : modifyImageProperty(GPSLatitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0200", 0, async function (done) {
            testModifyImagePropertyOptCbErr(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0200",
                "fd",
                "GPSLatitude",
                "abc,3"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0300
         * @tc.name      : modifyImageProperty(GPSLongitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0300", 0, async function (done) {
            testModifyImagePropertyOptCbErr(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0300",
                "fd",
                "GPSLongitude",
                "abc,2"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0400
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0400", 0, async function (done) {
            testModifyImagePropertyOptCbErr(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0400",
                "fd",
                "GPSLatitudeRef",
                "1234"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0500
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0500", 0, async function (done) {
            testModifyImagePropertyOptCbErr(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0500",
                "fd",
                "GPSLongitudeRef",
                "567"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0600
         * @tc.name      : modifyImageProperty(Orientation)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0600", 0, async function (done) {
            testModifyImagePropertyOptCbErr(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0600",
                "buffer",
                "Orientation",
                "abcef"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0700
         * @tc.name      : modifyImageProperty(GPSLatitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0700", 0, async function (done) {
            testModifyImagePropertyOptCbErr(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0700",
                "buffer",
                "GPSLatitude",
                "abc,3"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0800
         * @tc.name      : modifyImageProperty(GPSLongitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0800", 0, async function (done) {
            testModifyImagePropertyOptCbErr(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0800",
                "buffer",
                "GPSLongitude",
                "abc,2"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0900
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0900", 0, async function (done) {
            testModifyImagePropertyOptCbErr(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0900",
                "buffer",
                "GPSLatitudeRef",
                "456"
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_1000
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_1000", 0, async function (done) {
            testModifyImagePropertyOptCbErr(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_1000",
                "buffer",
                "GPSLongitudeRef",
                "1234"
            );
        });
        
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0100
         * @tc.name      : test modifyImageProperties for jpg with multy keys
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0100", 0, async function (done) {
            let props = {
                ImageWidth: "1024",
                ImageLength: "2048"
            }
            let checkKey = [
                IMAGE_WIDTH,
                IMAGE_LENGTH
            ];
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0100",
                "test_exif.jpg",
                props,
                checkKey
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0200
         * @tc.name      : test modifyImageProperties for jpg with single key
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0200", 0, async function (done) {
            let props = {
                ImageLength: "2048"
            }
            let checkKey = [
                IMAGE_LENGTH
            ];
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0200",
                "test_exif.jpg",
                props,
                checkKey
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0300
         * @tc.name      : test modifyImageProperties for all the key with null value of jpg icon
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0300", 0, async function (done) {
            let props = {
                GPSDateStamp: "2023:04:13",
                ImageDescription: "A gray picture"
            }
            let checkKey = [
                GPS_DATE_STAMP,
                IMAGE_DESCRIPTION
            ];
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0300",
                "test_exif.jpg",
                props,
                checkKey
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0400
         * @tc.name      : test modifyImageProperties for partially the key with null value of jpg icon
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0400", 0, async function (done) {
            let props = {
                GPSDateStamp: "2023:04:13",
                ImageWidth: "1024",
            }
            let checkKey = [
                GPS_DATE_STAMP,
                IMAGE_WIDTH
            ];
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0400",
                "test_exif.jpg",
                props,
                checkKey
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0500
         * @tc.name      : test modify image properties using the value obtained from getImageProperties 
         * @tc.desc      : 1.create buffer imagesource1
         *                 2.call imagesource1.getImageProperties(checkKey)
         *                 3.create jpg imagesource2
         *                 4.call imagesource2.modifyImageProperties(props)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0500", 0, async function (done) {
            let checkKey = [
                IMAGE_WIDTH,
                IMAGE_LENGTH
            ];
            let imageSource = image.createImageSource(modifyBuf.buffer);
            let props = await imageSource.getImageProperties(checkKey);
            await imageSource.release();
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0500",
                "test_exif.jpg",
                props,
                checkKey
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0100
         * @tc.name      : test modifyImageProperties for jpg with invalid value
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0100", 0, async function (done) {
            let props = {
                ImageWidth: "-1",
                ImageLength: "2344"
            }
            let checkKey = [
                IMAGE_WIDTH,
                IMAGE_LENGTH
            ];
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0100",
                "test_exif.jpg",
                props,
                checkKey,
                undefined
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0200
         * @tc.name      : test modifyImageProperties for jpg with out-of-bounds value
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0200", 0, async function (done) {
            let props = {
                ImageWidth: "100000000000000",
                ImageLength: "2344"
            }
            let checkKey = [
                IMAGE_WIDTH,
                IMAGE_LENGTH
            ];
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0200",
                "test_exif.jpg",
                props,
                checkKey,
                undefined
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0300
         * @tc.name      : test modifyImageProperties for jpg with invalid keys
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0300", 0, async function (done) {
            let props = {
                "ErrorKey1": "1024",
                "ErrorKey2": "2048"
            }
            let checkKey = [
                "ErrorKey1",
                "ErrorKey2"
            ];
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0300",
                "test_exif.jpg",
                props,
                checkKey,
                undefined
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0400
         * @tc.name      : test modifyImageProperties for jpg with invalid key
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0400", 0, async function (done) {
            let props = {
                ImageLength: "2048",
                "ErrorKey": "1024",
            }
            let checkKey = [
                IMAGE_LENGTH,
                "ErrorKey"
            ];
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0400",
                "test_exif.jpg",
                props,
                checkKey,
                undefined
            );
        });

         /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0500
         * @tc.name      : test modifyImageProperties for jpg with all null value 
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
         it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0500", 0, async function (done) {
            let checkKeys = Object.values(image.PropertyKey).filter(item => 
                !item.startsWith("Hw") && item != "GIFLoopCount"
            );
            checkKeys.push("HwMnoteCaptureMode");

            let props = {};
            checkKeys.forEach((item) => {
                props[item] = ""
            })
            
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0500",
                "test_exif.jpg",
                props,
                checkKeys,
                undefined
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0600
         * @tc.name      : test modifyImageProperties for jpg with partially null value
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0600", 0, async function (done) {
            let props = {
                ImageLength: "2048",
                ImageWidth: "",
            }
            let checkKey = [
                IMAGE_LENGTH,
                IMAGE_WIDTH
            ];
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0600",
                "test_exif.jpg",
                props,
                checkKey,
                undefined
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0700
         * @tc.name      : test modifyImageProperties for jpg with incorrect type
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0700", 0, async function (done) {
            let props = {
                ImageLength: "2048",
                ImageWidth: "abc",
            }
            let checkKey = [
                IMAGE_LENGTH,
                IMAGE_WIDTH
            ];
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0700",
                "test_exif.jpg",
                props,
                checkKey,
                undefined
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0800
         * @tc.name      : test modifyImageProperties for private filed of jpg
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0800", 0, async function (done) {
            let props = {
                HwMnoteSceneBlueSkyConf: "71",
                HwMnoteSceneGreenPlantConf: "98"
            }
            let checkKey = [
                SCENE_BLUE_SKY_CONF,
                SCENE_GREEN_PLANT_CONF
            ];
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0800",
                "test_exif.jpg",
                props,
                checkKey,
                undefined
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0900
         * @tc.name      : test modifyImageProperties for private and public filed of jpg
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0900", 0, async function (done) {
            let props = {
                ImageWidth: "1024",
                ImageLength: "2048",
                HwMnoteSceneBlueSkyConf: "71",
                HwMnoteSceneGreenPlantConf: "98"
            }
            let checkKey = [
                IMAGE_WIDTH,
                IMAGE_LENGTH,
                SCENE_BLUE_SKY_CONF,
                SCENE_GREEN_PLANT_CONF
            ];
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0900",
                "test_exif.jpg",
                props,
                checkKey,
                undefined
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_1000
         * @tc.name      : test modifyImageProperties for unwritable filed of jpg
         * @tc.desc      : 1.create jpg imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_1000", 0, async function (done) {
            let props = {
                "JPEGInterchangeFormat": "1450",
                "JPEGInterchangeFormatLength": "1450",
                "MakerNote": "xxxxx",
            }
            let checkKey = [
                "JPEGInterchangeFormat",
                "JPEGInterchangeFormatLength",
                "MakerNote"
            ];
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_1000",
                "test_exif.jpg",
                props,
                checkKey,
                undefined
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_1100
         * @tc.name      : test modifyImageProperties for tiff with multy keys
         * @tc.desc      : 1.create tiff imagesource
         *                 2.call modifyImageProperty(keys)
         *                 3.return undefined
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_1100", 0, async function (done) {
            let props = {
                ImageWidth: "1024",
                ImageLength: "2048"
            }
            let checkKey = [
                IMAGE_WIDTH,
                IMAGE_LENGTH
            ];
            await testModifyImageProperties(
                done,
                "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_1100",
                "test.tiff",
                props,
                checkKey,
                undefined
            );
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0100
         * @tc.name      : test modifyImageProperty GIFLoopCount for gif
         * @tc.desc      : 1.getFd()
         *                 2.modifyImageProperty()
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0100", 0, async function (done) {
            console.info("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0100 start");
            testModifyLoopCountErr("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0100", "gif", false, done);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0200
         * @tc.name      : test modifyImageProperties GIFLoopCount for gif
         * @tc.desc      : 1.getFd()
         *                 2.modifyImageProperties()
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0200", 0, async function (done) {
            console.info("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0200 start");
            testModifyLoopCountErr("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0200", "gif", true, done);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0300
         * @tc.name      : test modifyImageProperty GIFLoopCount for jpg
         * @tc.desc      : 1.getFd()
         *                 2.modifyImageProperty()
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0300", 0, async function (done) {
            console.info("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0300 start");
            testModifyLoopCountErr("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0300", "jpg", false, done);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0400
         * @tc.name      : test modifyImageProperties GIFLoopCount for jpg
         * @tc.desc      : 1.getFd()
         *                 2.modifyImageProperties()
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0400", 0, async function (done) {
            console.info("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0400 start");
            testModifyLoopCountErr("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0400", "jpg", true, done);
        });
    });
}
