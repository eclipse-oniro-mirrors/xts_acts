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
        let filePath;
        async function getFd(fileName) {
            let context = await featureAbility.getContext();
            await context.getFilesDir().then((data) => {
                filePath = data + "/" + fileName;
                console.info("image case filePath is " + filePath);
            });
        }
        beforeAll(async function () {
            console.info("beforeAll case");
        });

        beforeEach(function () {
            console.info("beforeEach case");
        });

        afterEach(async function () {
            console.info("afterEach case");
        });

        afterAll(function () {
            console.info("afterAll case");
        });

        async function modifyPromise(done, testNum, type, key, value, checkProps) {
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

        async function modifyCb(done, testNum, type, key, value, checkProps) {
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
                imageSourceApi.modifyImageProperty(key, value, (error) => {
                    if (error) {
                        expect(false).assertTrue();
                        console.info(`${testNum} modify err: ` + error);
                    } else {
                        imageSourceApi.getImageProperty(key, (error, data) => {
                            if (error) {
                                expect(false).assertTrue();
                                console.info(`${testNum} get err: ` + error);
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

        async function modifyCb1(done, testNum, type, key, value, checkProps) {
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
                let property = { index: 0, defaultValue: "1" };
                imageSourceApi.modifyImageProperty(key, value, property, (error) => {
                    if (error) {
                        expect(false).assertTrue();
                        console.info(`${testNum} modify err: ` + error);
                    } else {
                        imageSourceApi.getImageProperty(key, (error, data) => {
                            if (error) {
                                expect(false).assertTrue();
                                console.info(`${testNum} get err: ` + error);
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

        async function modifyErrCb(done, testNum, type, key, value) {
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
                imageSourceApi.modifyImageProperty(key, value, (error) => {
                    expect(error.code != 0).assertTrue();
                    console.info(`${testNum} errormsg: ` + error);
                    done();
                });
            }
        }

        async function modifyErrCb1(done, testNum, type, key, value) {
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
                let property = { index: 0, defaultValue: "1" };
                imageSourceApi.modifyImageProperty(key, value, property, (error) => {
                    expect(error.code != 0).assertTrue();
                    console.info(`${testNum} errormsg: ` + error);
                    done();
                });
            }
        }

        async function modifyImageErrPromise(done, testNum, type, key, value) {
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

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0100
         * @tc.name      : modifyImageProperty(Orientation)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0100", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Top-right").assertTrue();
            }
            modifyPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0100",
                "buffer",
                "Orientation",
                "2",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0200
         * @tc.name      : modifyImageProperty(GPSLatitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0200", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("38") != -1).assertTrue();
            }
            modifyPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0200",
                "buffer",
                "GPSLatitude",
                "114,3",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0300
         * @tc.name      : modifyImageProperty(GPSLongitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0300", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("9") != -1).assertTrue();
            }
            modifyPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0300",
                "buffer",
                "GPSLongitude",
                "18,2",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0400
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0400", 0, async function (done) {
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            modifyPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0400",
                "buffer",
                "GPSLatitudeRef",
                "N",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0500
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0500", 0, async function (done) {
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            modifyPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0500",
                "buffer",
                "GPSLongitudeRef",
                "W",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0600
         * @tc.name      : modifyImageProperty(Orientation)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Top-right").assertTrue();
            }
            modifyPromise(done, "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0600", "fd", "Orientation", "2", checkProps);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0700
         * @tc.name      : modifyImageProperty(GPSLatitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0700", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("38") != -1).assertTrue();
            }
            modifyPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0700",
                "fd",
                "GPSLatitude",
                "114,3",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0800
         * @tc.name      : modifyImageProperty(GPSLongitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0800", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("9") != -1).assertTrue();
            }
            modifyPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0800",
                "fd",
                "GPSLongitude",
                "18,2",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0900
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            modifyPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_0900",
                "fd",
                "GPSLatitudeRef",
                "N",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_1000
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_1000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            modifyPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_1000",
                "fd",
                "GPSLongitudeRef",
                "W",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0100
         * @tc.name      : modifyImageProperty(Orientation)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0100", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Top-right").assertTrue();
            }
            modifyCb(done, "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0100", "buffer", "Orientation", "2", checkProps);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0200
         * @tc.name      : modifyImageProperty(GPSLatitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0200", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("38") != -1).assertTrue();
            }
            modifyCb(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0200",
                "buffer",
                "GPSLatitude",
                "114,3",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0300
         * @tc.name      : modifyImageProperty(GPSLongitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0300", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("9") != -1).assertTrue();
            }
            modifyCb(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0300",
                "buffer",
                "GPSLongitude",
                "18,2",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0400
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0400", 0, async function (done) {
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            modifyCb(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0400",
                "buffer",
                "GPSLatitudeRef",
                "N",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0500
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0500", 0, async function (done) {
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            modifyCb(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0500",
                "buffer",
                "GPSLongitudeRef",
                "W",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0600
         * @tc.name      : modifyImageProperty(Orientation)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Top-right").assertTrue();
            }
            modifyCb(done, "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0600", "fd", "Orientation", "2", checkProps);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0700
         * @tc.name      : modifyImageProperty(GPSLatitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0700", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("38") != -1).assertTrue();
            }
            modifyCb(done, "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0700", "fd", "GPSLatitude", "114,3", checkProps);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0800
         * @tc.name      : modifyImageProperty(GPSLongitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0800", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("9") != -1).assertTrue();
            }
            modifyCb(done, "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0800", "fd", "GPSLongitude", "18,2", checkProps);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0900
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            modifyCb(done, "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_0900", "fd", "GPSLatitudeRef", "N", checkProps);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_1000
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_1000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            modifyCb(done, "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_1000", "fd", "GPSLongitudeRef", "W", checkProps);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0100
         * @tc.name      : modifyImageProperty(Orientation,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0100", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Top-right").assertTrue();
            }
            modifyCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0100",
                "buffer",
                "Orientation",
                "2",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0200
         * @tc.name      : modifyImageProperty(GPSLatitude,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0200", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("38") != -1).assertTrue();
            }
            modifyCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0200",
                "buffer",
                "GPSLatitude",
                "114,3",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0300
         * @tc.name      : modifyImageProperty(GPSLongitude,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0300", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("9") != -1).assertTrue();
            }
            modifyCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0300",
                "buffer",
                "GPSLongitude",
                "18,2",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0400
         * @tc.name      : modifyImageProperty(GPSLatitudeRef,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0400", 0, async function (done) {
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            modifyCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0400",
                "buffer",
                "GPSLatitudeRef",
                "N",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0500
         * @tc.name      : modifyImageProperty(GPSLongitudeRef,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0500", 0, async function (done) {
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            modifyCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0500",
                "buffer",
                "GPSLongitudeRef",
                "W",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0600
         * @tc.name      : modifyImageProperty(Orientation,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0600", 0, async function (done) {
            function checkProps(result) {
                expect(result == "Top-right").assertTrue();
            }
            modifyCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0600",
                "fd",
                "Orientation",
                "2",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0700
         * @tc.name      : modifyImageProperty(GPSLatitude,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0700", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("38") != -1).assertTrue();
            }
            modifyCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0700",
                "fd",
                "GPSLatitude",
                "114,3",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0800
         * @tc.name      : modifyImageProperty(GPSLongitude,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0800", 0, async function (done) {
            function checkProps(result) {
                expect(result.search("9") != -1).assertTrue();
            }
            modifyCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0800",
                "fd",
                "GPSLongitude",
                "18,2",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0900
         * @tc.name      : modifyImageProperty(GPSLatitudeRef,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0900", 0, async function (done) {
            function checkProps(result) {
                expect(result == "N").assertTrue();
            }
            modifyCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0900",
                "fd",
                "GPSLatitudeRef",
                "N",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1000
         * @tc.name      : modifyImageProperty(GPSLongitudeRef,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value,options)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1000", 0, async function (done) {
            function checkProps(result) {
                expect(result == "W").assertTrue();
            }
            modifyCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1000",
                "fd",
                "GPSLongitudeRef",
                "W",
                checkProps
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0100
         * @tc.name      : modifyImageProperty(Orientation)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0100", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0100",
                "fd",
                "Orientation",
                "abcdef"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0200
         * @tc.name      : modifyImageProperty(GPSLatitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0200", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0200",
                "fd",
                "GPSLatitude",
                "abc,3"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0300
         * @tc.name      : modifyImageProperty(GPSLongitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0300", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0200",
                "fd",
                "GPSLongitude",
                "abc,2"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0400
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0400", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0400",
                "fd",
                "GPSLatitudeRef",
                "456"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0500
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0500", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0500",
                "fd",
                "GPSLongitudeRef",
                "1234"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0600
         * @tc.name      : modifyImageProperty(Orientation)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0600", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0600",
                "buffer",
                "Orientation",
                "abcdef"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0700
         * @tc.name      : modifyImageProperty(GPSLatitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0700", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0700",
                "buffer",
                "GPSLatitude",
                "abc,3"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0800
         * @tc.name      : modifyImageProperty(GPSLongitude)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0800", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0800",
                "buffer",
                "GPSLongitude",
                "abc,2"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0900
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0900", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0900",
                "buffer",
                "GPSLatitudeRef",
                "456"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_1000
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_1000", 0, async function (done) {
            modifyImageErrPromise(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_1000",
                "buffer",
                "GPSLongitudeRef",
                "1234"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0100
         * @tc.name      : modifyImageProperty(Orientation)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0100", 0, async function (done) {
            modifyErrCb(done, "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0100", "fd", "Orientation", "abcdef");
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0200
         * @tc.name      : modifyImageProperty(GPSLatitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0200", 0, async function (done) {
            modifyErrCb(done, "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0200", "fd", "GPSLatitude", "abc,3");
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0300
         * @tc.name      : modifyImageProperty(GPSLongitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0300", 0, async function (done) {
            modifyErrCb(done, "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0300", "fd", "GPSLongitude", "abc,2");
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0400
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0400", 0, async function (done) {
            modifyErrCb(done, "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0400", "fd", "GPSLongitudeRef", "1234");
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0500
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0500", 0, async function (done) {
            modifyErrCb(done, "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0500", "fd", "GPSLatitudeRef", "456");
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0600
         * @tc.name      : modifyImageProperty(Orientation)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0600", 0, async function (done) {
            modifyErrCb(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0600",
                "buffer",
                "Orientation",
                "abcdef"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0700
         * @tc.name      : modifyImageProperty(GPSLatitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0700", 0, async function (done) {
            modifyErrCb(done, "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0700", "buffer", "GPSLatitude", "abc,3");
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0800
         * @tc.name      : modifyImageProperty(GPSLongitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0800", 0, async function (done) {
            modifyErrCb(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0800",
                "buffer",
                "GPSLongitude",
                "abc,2"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0900
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0900", 0, async function (done) {
            modifyErrCb(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0900",
                "buffer",
                "GPSLongitudeRef",
                "1234"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_1000
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_1000", 0, async function (done) {
            modifyErrCb(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_1000",
                "buffer",
                "GPSLatitudeRef",
                "456"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0100
         * @tc.name      : modifyImageProperty(Orientation)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0100", 0, async function (done) {
            modifyErrCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0100",
                "fd",
                "Orientation",
                "abcdef"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0200
         * @tc.name      : modifyImageProperty(GPSLatitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0200", 0, async function (done) {
            modifyErrCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0200",
                "fd",
                "GPSLatitude",
                "abc,3"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0300
         * @tc.name      : modifyImageProperty(GPSLongitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0300", 0, async function (done) {
            modifyErrCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0300",
                "fd",
                "GPSLongitude",
                "abc,2"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0400
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0400", 0, async function (done) {
            modifyErrCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0400",
                "fd",
                "GPSLatitudeRef",
                "1234"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0500
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0500", 0, async function (done) {
            modifyErrCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0500",
                "fd",
                "GPSLongitudeRef",
                "567"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0600
         * @tc.name      : modifyImageProperty(Orientation)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0600", 0, async function (done) {
            modifyErrCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0600",
                "buffer",
                "Orientation",
                "abcef"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0700
         * @tc.name      : modifyImageProperty(GPSLatitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0700", 0, async function (done) {
            modifyErrCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0700",
                "buffer",
                "GPSLatitude",
                "abc,3"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0800
         * @tc.name      : modifyImageProperty(GPSLongitude)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0800", 0, async function (done) {
            modifyErrCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0800",
                "buffer",
                "GPSLongitude",
                "abc,2"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0900
         * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0900", 0, async function (done) {
            modifyErrCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0900",
                "buffer",
                "GPSLatitudeRef",
                "456"
            );
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_1000
         * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call modifyImageProperty(key,value)
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_1000", 0, async function (done) {
            modifyErrCb1(
                done,
                "SUB_GRAPHIC_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_1000",
                "buffer",
                "GPSLongitudeRef",
                "1234"
            );
        });
    });
}
