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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import featureAbility from "@ohos.ability.featureAbility";
import fileio from "@ohos.fileio";

export default function imagePackToData() {
    describe("imagePackToData", function () {
        let globalpixelmap;
        let globalPacker;
        let globalImagesource;
        let filePath;
        let fdNumber;
        const ERROR_CODE = 401;
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
            if (globalpixelmap != undefined) {
                console.info("globalpixelmap release start");
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info("globalpixelmap release fail");
                }
            }
            if (globalImagesource != undefined) {
                console.info("globalpixelmap release start");
                try {
                    await globalImagesource.release();
                } catch (error) {
                    console.info("globalImagesource release fail");
                }
            }
            if (globalPacker != undefined) {
                console.info("globalPacker release start");
                try {
                    await globalPacker.release();
                } catch (error) {
                    console.info("globalPacker release fail");
                }
            }
            console.info("afterEach case");
        });

        afterAll(function () {
            console.info("afterAll case");
        });

        function packToDataPromise(done, testNum, pixFormat, arg) {
            let opts;
            const Color = new ArrayBuffer(96);
            if (pixFormat == 2) {
                opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } };
            } else {
                opts = { editable: true, pixelFormat: 5, size: { height: 4, width: 6 } };
            }
            image
                .createPixelMap(Color, opts)
                .then((pixelmap) => {
                    if (pixelmap == undefined) {
                        expect(false).assertTrue();
                        console.info(`${testNum} create pixelmap fail`);
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        const imagePackerApi = image.createImagePacker();
                        if (imagePackerApi == undefined) {
                            expect(false).assertTrue();
                            console.info(`${testNum} create imagepacker fail`);
                            done();
                        } else {
                            globalPacker = imagePackerApi;
                            imagePackerApi.packToData(pixelmap, arg).then((data) => {
                                var dataArr = new Uint8Array(data);
                                console.info(`${testNum} dataArr.length=` + dataArr.length);
                                for (var i = 0; i < dataArr.length; i++) {
                                    console.info(`dataArr[` + i + `]=` + dataArr[i]);
                                }
                                expect(data != undefined).assertTrue();
                                console.info(`${testNum} success`);
                                done();
                            }).catch((error) => {
                                console.log(`${testNum} error:` + error);
                                expect().assertFail();
                                done();
                            });
                        }
                    }
                })
                .catch((error) => {
                    console.log("createpixelmap error: " + error);
                    expect().assertFail();
                    done();
                });
        }

        function packingPromiseFail(done, testNum, pixFormat, arg) {
            const Color = new ArrayBuffer(96);
            if (pixFormat == 2) {
                var opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } };
            } else {
                var opts = { editable: true, pixelFormat: 5, size: { height: 4, width: 6 } };
            }
            image
                .createPixelMap(Color, opts)
                .then((pixelmap) => {
                    if (pixelmap == undefined) {
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        const imagePackerApi = image.createImagePacker();
                        if (imagePackerApi == undefined) {
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalPacker = imagePackerApi;
                            imagePackerApi.packToData(pixelmap, arg).then((data) => {
                                expect(false).assertTrue();
                                done();
                            }).catch((error) => {
                                console.log(`${testNum} error:` + error);
                                expect(error.code == ERROR_CODE).assertTrue();
                                done();
                            });
                        }
                    }
                })
                .catch((error) => {
                    console.log("createpixelmap error: " + error);
                    expect().assertFail();
                    done();
                });
        }

        async function packToDataimgSourcePromise(done, testNum, packOpts) {
            try {
                await getFd("test.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(`${testNum} create image source failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info(`${testNum} create imagepacker fail`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        imagePackerApi.packToData(imageSourceApi, packOpts).then((data) => {
                            console.log(`${testNum} success`);
                            expect(data != undefined).assertTrue();
                            done();
                        }).catch((error) => {
                            console.log(`${testNum} error:` + error);
                            expect(false).assertFail();
                            done();
                        });
                    }
                }
            } catch (error) {
                console.log(`${testNum} error:` + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function packToDataimgSourcePromiseFail(done, testNum, packOpts) {
            try {
                await getFd("test.png");
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(`${testNum} create image source failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info(`${testNum} create imagepacker fail`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        let packOpts = { quality: 50 };
                        imagePackerApi.packToData(imageSourceApi, packOpts).then((data) => {
                            console.info(`${testNum} failed`);
                            expect(data == undefined).assertTrue();
                            done();
                        }).catch((error) => {
                            console.log(`${testNum} error:` + error);
                            expect(error.code == ERROR_CODE).assertTrue();
                            done();
                        });
                    }
                }
            } catch (error) {
                console.log(`${testNum} error:` + error);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0100
         * @tc.name      : SUB_IMAGE_packToData_P_001
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0100", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99 };
            packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0100", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0200
         * @tc.name      : SUB_IMAGE_packToData_PixelMap_002 - Promise - RGB565 quality 123
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0200", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 123 };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0200", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0300
         * @tc.name      : SUB_IMAGE_packToData_PixelMap_003 - Promise - RGB565 quality null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0300", 0, async function (done) {
            let packOpts = { format: "image/jpeg" };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0300", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0400
         * @tc.name      : SUB_IMAGE_packToData_PixelMap_004 - Promise - RGB565 format null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0400", 0, async function (done) {
            let packOpts = { quality: 99 };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0400", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0500
         * @tc.name      : SUB_IMAGE_packToData_PixelMap_005 - Promise - RGB565 wrong format
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0500", 0, async function (done) {
            let packOpts = { format: "image/txt", quality: 99 };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0500", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0600
         * @tc.name      : SUB_IMAGE_packToData_PixelMap_006
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0600", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 50 };
            packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0600", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0700
         * @tc.name      : SUB_IMAGE_packToData_PixelMap_007 - Promise - RGB888 quality 123
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0700", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 123 };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0700", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0800
         * @tc.name      : SUB_IMAGE_packToData_PixelMap_008 - Promise - RGB888 quality null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0800", 0, async function (done) {
            let packOpts = { format: "image/jpeg" };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0800", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0900
         * @tc.name      : SUB_IMAGE_packToData_PixelMap_009 - Promise - RGB888 format null
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0900", 0, async function (done) {
            let packOpts = { quality: 99 };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0900", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_1000
         * @tc.name      : SUB_IMAGE_packToData_PixelMap_010 - Promise - RGB888 wrong format
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_1000", 0, async function (done) {
            let packOpts = { format: "image/txt", quality: 99 };
            packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_1000", 5, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0100
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0100", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 10485760 };
            packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0100", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0200
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0200
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0200", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 20480 };
            console.info(`SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0200 buffersize: 
                ${packOpts.bufferSize}`);
            packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0200", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0300
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0300-over maxbufferSize
         * @tc.desc      : 1.create PixelMap
         *                 2.create ImagePacker
         *                 3.call packToData
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0300", 0, async function (done) {
            let packOpts = { format: "image/jpeg", quality: 99, bufferSize: 20000000 };
            packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0300", 2, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0100
         * @tc.name      : packToData ImageSource - promise
         * @tc.desc      : 1.create ImageSource
         *                 2.call packToData
         *                 3.return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0100", 0, async function (done) {
            let packOpts = {
                format: "image/jpeg", 
                quality: 99
              };
              packToDataimgSourcePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0100", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0200
         * @tc.name      : packToData ImageSource - promise - quality 123
         * @tc.desc      : 1.create ImageSource
         *                 2.call packToData
         *                 3.call return array
         *                 4.call return 401
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */

        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0200", 0, async function (done) {
            let packOpts = {
                format: "image/jpeg", 
                quality: 123
            };
            packToDataimgSourcePromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0200", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0300
         * @tc.name      : packToData ImageSource - promise - no quality
         * @tc.desc      : 1.create ImageSource
         *                 2.call packToData
         *                 3.call return array
         *                 4.call return 401
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0300", 0, async function (done) {
            let packOpts = {
                format: "image/jpeg", 
            };
            packToDataimgSourcePromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0300", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0400
         * @tc.name      : packToData ImageSource - promise - no format
         * @tc.desc      : 1.create ImageSource
         *                 2.call packToData
         *                 3.call return array
         *                 4.call return 401
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0400", 0, async function (done) {
            let packOpts = {
                quality: 99
            };
            packToDataimgSourcePromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0400", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0500
         * @tc.name      : packToData ImageSource - promise
         * @tc.desc      : 1.create ImageSource
         *                 2.call packToData
         *                 3.return array
         *                 4.call return 401
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0500", 0, async function (done) {
            let packOpts = {
                format: "image/txt", 
                quality: 99
            };
            packToDataimgSourcePromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0500", packOpts);
        });
    });
}
