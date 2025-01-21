/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import { getPropertyBuf } from "./getPropertyBuf";
import featureAbility from "@ohos.ability.featureAbility";
export default function imageGetImageProperty() {
    describe("imageGetImageProperty", function () {
        const { DATE_TIME_ORIGINAL, EXPOSURE_TIME, SCENE_TYPE, ISO_SPEED_RATINGS, F_NUMBER } = image.PropertyKey;
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

        let props = {
            DateTimeOriginal: "2022:06:02 15:51:35",
            ExposureTime: "1/33 sec.",
            SceneType: "Directly photographed",
            ISOSpeedRatings: "400",
            FNumber: "f/1.8",
        };
        async function getPromise(done, testNum, type, args) {
            let imageSourceApi;
            if (type == "buf") {
                const data = getPropertyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFd("test_exif1.jpg");
                imageSourceApi = image.createImageSource(fdNumber);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi
                    .getImageProperty(args)
                    .then((data) => {
                        console.info(`${testNum} ${args} ` + data);
                        expect(data == props[args]).assertTrue();
                        done();
                    })
                    .catch((error) => {
                        console.log(`${testNum} error: ` + error);
                        expect(false).assertTrue();
                        done();
                    });
            }
        }

        async function getCb(done, testNum, type, args) {
            let imageSourceApi;
            if (type == "buf") {
                const data = getPropertyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFd("test_exif1.jpg");
                imageSourceApi = image.createImageSource(fdNumber);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageProperty(args, (err, data) => {
                    if (err) {
                        expect(false).assertTrue();
                        console.info(`${testNum} ${args} err: ` + err);
                    } else {
                        console.info(`${testNum} ${args} ` + data);
                        expect(data == props[args]).assertTrue();
                        done();
                    }
                });
            }
        }

        async function getCb2(done, testNum, type, args) {
            let imageSourceApi;
            if (type == "buf") {
                const data = getPropertyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFd("test_exif1.jpg");
                imageSourceApi = image.createImageSource(fdNumber);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                let property = { index: 0, defaultValue: "9999" };
                imageSourceApi.getImageProperty(args, property, (err, data) => {
                    if (err) {
                        expect(false).assertTrue();
                        onsole.info(`${testNum} ${args} err: ` + err);
                    } else {
                        console.info(`${testNum} ${args} ` + data);
                        expect(data != "9999" && data == props[args]).assertTrue();
                        done();
                    }
                });
            }
        }

        async function getPromiseErr(done, testNum, type, args, isTypeErr) {
            let imageSourceApi;
            if (type == "buf") {
                const data = getPropertyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFd("test_exif1.jpg");
                imageSourceApi = image.createImageSource(fdNumber);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                if (isTypeErr) {
                    try {
                        await imageSourceApi.getImageProperty(args);
                        expect(false).assertTrue();
                    } catch (error) {
                        expect(error.code == 1).assertTrue();
                        console.log(`${testNum} error msg: ` + error);
                        done();
                    }
                } else {
                    try {
                        await imageSourceApi.getImageProperty(args);
                        expect(false).assertTrue();
                    } catch (error) {
                        expect(error.code != 0).assertTrue();
                        console.log(`${testNum} error msg: ` + error);
                        done();
                    }
                }
            }
        }

        async function getCbErr(done, testNum, type, args, isTypeErr) {
            let imageSourceApi;
            if (type == "buf") {
                const data = getPropertyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFd("test_exif1.jpg");
                imageSourceApi = image.createImageSource(fdNumber);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                if (isTypeErr) {
                    try {
                        imageSourceApi.getImageProperty(args, (error, data) => {
                            expect(false).assertTrue();
                            done();
                        });
                    } catch (error) {
                        console.log(`${testNum} error1 msg: ` + error);
                        expect(error.code == 1).assertTrue();
                        done();
                    }
                } else {
                    imageSourceApi.getImageProperty(args, (error, data) => {
                        expect(error.code != 0).assertTrue();
                        console.log(`${testNum} error3 msg: ` + error);
                        done();
                    });
                }
            }
        }

        async function getCb2Err(done, testNum, type, args, isTypeErr) {
            let imageSourceApi;
            if (type == "buf") {
                const data = getPropertyBuf.buffer;
                imageSourceApi = image.createImageSource(data);
            } else {
                await getFd("test_exif1.jpg");
                imageSourceApi = image.createImageSource(fdNumber);
            }
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                let property = { index: 0, defaultValue: "9999" };
                if (isTypeErr) {
                    try {
                        imageSourceApi.getImageProperty(args, property, (error, data) => {
                            expect(false).assertTrue();
                        });
                    } catch (error) {
                        expect(error.code == 1).assertTrue();
                        console.log(`${testNum} error msg: ` + error);
                        done();
                    }
                } else {
                    imageSourceApi.getImageProperty(args, property, (error, data) => {
                        expect(error.code != 0).assertTrue();
                        console.log(`${testNum} error msg: ` + error);
                        done();
                    });
                }
            }
        }

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0100
         * @tc.name      : getImageProperty(DateTimeOriginal)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(DateTimeOriginal)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0100", 0, async function (done) {
            let key = DATE_TIME_ORIGINAL;
            getPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0100", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0200
         * @tc.name      : getImageProperty(ExposureTime)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ExposureTime)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0200", 0, async function (done) {
            let key = EXPOSURE_TIME;
            getPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0200", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0300
         * @tc.name      : getImageProperty(FNumber)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FNumber)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0300", 0, async function (done) {
            let key = F_NUMBER;
            getPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0300", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0400
         * @tc.name      : getImageProperty(ISOSpeedRatings)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ISOSpeedRatings)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0400", 0, async function (done) {
            let key = ISO_SPEED_RATINGS;
            getPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0400", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0500
         * @tc.name      : getImageProperty(SceneType)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SceneType)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0500", 0, async function (done) {
            let key = SCENE_TYPE;
            getPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0500", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100
         * @tc.name      : getImageProperty(DateTimeOriginal)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(DateTimeOriginal)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100", 0, async function (done) {
            let key = DATE_TIME_ORIGINAL;
            getCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200
         * @tc.name      : getImageProperty(ExposureTime)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(ExposureTime)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200", 0, async function (done) {
            let key = EXPOSURE_TIME;
            getCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300
         * @tc.name      : getImageProperty(FNumber)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(FNumber)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300", 0, async function (done) {
            let key = F_NUMBER;
            getCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400
         * @tc.name      : getImageProperty(ISOSpeedRatings)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(ISOSpeedRatings)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400", 0, async function (done) {
            let key = ISO_SPEED_RATINGS;
            getCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500
         * @tc.name      : getImageProperty(SceneType)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(SceneType)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500", 0, async function (done) {
            let key = SCENE_TYPE;
            getCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600
         * @tc.name      : getImageProperty(DateTimeOriginal,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(DateTimeOriginal,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600", 0, async function (done) {
            let key = DATE_TIME_ORIGINAL;
            getCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700
         * @tc.name      : getImageProperty(ExposureTime,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ExposureTime,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700", 0, async function (done) {
            let key = EXPOSURE_TIME;
            getCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800
         * @tc.name      : getImageProperty(FNumber,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FNumber,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800", 0, async function (done) {
            let key = F_NUMBER;
            getCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900
         * @tc.name      : getImageProperty(ISOSpeedRatings,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ISOSpeedRatings,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900", 0, async function (done) {
            let key = ISO_SPEED_RATINGS;
            getCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000
         * @tc.name      : getImageProperty(SceneType,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SceneType,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000", 0, async function (done) {
            let key = SCENE_TYPE;
            getCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000", "picture", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0100
         * @tc.name      : getImageProperty(DateTimeOriginal)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(DateTimeOriginal)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0100", 0, async function (done) {
            let key = DATE_TIME_ORIGINAL;
            getPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0100", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0200
         * @tc.name      : getImageProperty(ExposureTime)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ExposureTime)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0200", 0, async function (done) {
            let key = EXPOSURE_TIME;
            getPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0200", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0300
         * @tc.name      : getImageProperty(FNumber)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FNumber)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0300", 0, async function (done) {
            let key = F_NUMBER;
            getPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0300", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0400
         * @tc.name      : getImageProperty(ISOSpeedRatings)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ISOSpeedRatings)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0400", 0, async function (done) {
            let key = ISO_SPEED_RATINGS;
            getPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0400", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0500
         * @tc.name      : getImageProperty(SceneType)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SceneType)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0500", 0, async function (done) {
            let key = SCENE_TYPE;
            getPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0500", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0100
         * @tc.name      : getImageProperty(DateTimeOriginal)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(DateTimeOriginal)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0100", 0, async function (done) {
            let key = DATE_TIME_ORIGINAL;
            getCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0100", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0200
         * @tc.name      : getImageProperty(ExposureTime)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(ExposureTime)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0200", 0, async function (done) {
            let key = EXPOSURE_TIME;
            getCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0200", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0300
         * @tc.name      : getImageProperty(FNumber)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(FNumber)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0300", 0, async function (done) {
            let key = F_NUMBER;
            getCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0300", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0400
         * @tc.name      : getImageProperty(ISOSpeedRatings)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(ISOSpeedRatings)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0400", 0, async function (done) {
            let key = ISO_SPEED_RATINGS;
            getCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0400", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0500
         * @tc.name      : getImageProperty(SceneType)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(SceneType)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0500", 0, async function (done) {
            let key = SCENE_TYPE;
            getCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0500", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0600
         * @tc.name      : getImageProperty(DateTimeOriginal,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(DateTimeOriginal,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0600", 0, async function (done) {
            let key = DATE_TIME_ORIGINAL;
            getCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0600", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0700
         * @tc.name      : getImageProperty(ExposureTime,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ExposureTime,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0700", 0, async function (done) {
            let key = EXPOSURE_TIME;
            getCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0700", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0800
         * @tc.name      : getImageProperty(FNumber,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FNumber,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0800", 0, async function (done) {
            let key = F_NUMBER;
            getCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0800", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0900
         * @tc.name      : getImageProperty(ISOSpeedRatings,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ISOSpeedRatings,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0900", 0, async function (done) {
            let key = ISO_SPEED_RATINGS;
            getCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0900", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_1000
         * @tc.name      : getImageProperty(SceneType,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SceneType,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_1000", 0, async function (done) {
            let key = SCENE_TYPE;
            getCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_1000", "buf", key);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0100
         * @tc.name      : getImageProperty-Promise-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0100", 0, async function (done) {
            let key = "Date";
            getPromiseErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0100", "picture", key, false);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0200
         * @tc.name      : getImageProperty-Promise-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0200", 0, async function (done) {
            let key = null;
            getPromiseErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0200", "picture", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0300
         * @tc.name      : getImageProperty-Promise-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0300", 0, async function (done) {
            let key = 12;
            getPromiseErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0300", "picture", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0400
         * @tc.name      : getImageProperty-Promise-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0400", 0, async function (done) {
            let key = { w: 12 };
            getPromiseErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0400", "picture", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0100
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0100", 0, async function (done) {
            let key = "Date";
            await getCbErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0100", "picture", key, false);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0200
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0200", 0, async function (done) {
            let key = null;
            await getCbErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0200", "picture", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0300
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0300", 0, async function (done) {
            let key = 12;
            await getCbErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0300", "picture", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0400
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0400", 0, async function (done) {
            let key = { w: 12 };
            await getCbErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0400", "picture", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0500
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0500", 0, async function (done) {
            let key = "Date";
            getCb2Err(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0500", "picture", key, false);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0600
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0600", 0, async function (done) {
            let key = null;
            getCb2Err(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0600", "picture", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0700
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0700", 0, async function (done) {
            let key = 12;
            getCb2Err(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0700", "picture", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0800
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0800", 0, async function (done) {
            let key = { a: 12 };
            getCb2Err(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0800", "picture", key, true);
        });
        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0100
         * @tc.name      : getImageProperty-promise-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0100", 0, async function (done) {
            let key = "Date";
            getPromiseErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0100", "buf", key, false);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0200
         * @tc.name      : getImageProperty-promise-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0200", 0, async function (done) {
            let key = null;
            getPromiseErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0200", "buf", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0300
         * @tc.name      : getImageProperty-promise-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0300", 0, async function (done) {
            let key = 12;
            getPromiseErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0300", "buf", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0400
         * @tc.name      : getImageProperty-promise-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0400", 0, async function (done) {
            let key = { w: 12 };
            getPromiseErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0400", "buf", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0100
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0100", 0, async function (done) {
            let key = "Date";
            await getCbErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0100", "buf", key, false);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0200
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0200", 0, async function (done) {
            let key = null;
            await getCbErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0200", "buf", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0300
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0300", 0, async function (done) {
            let key = 12;
            await getCbErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0300", "buf", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0400
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0400", 0, async function (done) {
            let key = { w: 12 };
            await getCbErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0400", "buf", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0500
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0500", 0, async function (done) {
            let key = "Date";
            getCb2Err(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0500", "buf", key, false);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0600
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0600", 0, async function (done) {
            let key = null;
            getCb2Err(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0600", "buf", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0700
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0700", 0, async function (done) {
            let key = 12;
            getCb2Err(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0700", "buf", key, true);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0800
         * @tc.name      : getImageProperty-callback-wrong key
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0800", 0, async function (done) {
            let key = { a: 12 };
            getCb2Err(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0800", "buf", key, true);
        });
    });
}
