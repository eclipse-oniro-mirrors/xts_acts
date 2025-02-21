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
import featureAbility from "@ohos.ability.featureAbility";

export default function imageWebp() {
    describe("imageWebp", function () {
        const ERR_CODE = 62980149;
        let globalpixelmap;
        let globalImagesource;
        let globalPacker;
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

        afterAll(async function () {
            console.info("afterAll case");
        });

        async function createPixMapCbErr(done, testNum, arg) {
            await getFd("test_large.webp");
            let imageSourceApi = image.createImageSource(filePath);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSourceApi;
                imageSourceApi.createPixelMap(arg, (err, pixelmap) => {
                    if (pixelmap == undefined) {
                        expect(true).assertTrue();
                        console.info(`${testNum} success `);
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        }

        async function createPixMapCb(done, testNum, arg) {
            await getFd("test_large.webp");
            let imageSourceApi = image.createImageSource(filePath);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSourceApi;
                imageSourceApi.createPixelMap(arg, (err, pixelmap) => {
                    if (err) {
                        console.info(`${testNum} - fail ${err}`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        pixelmap
                            .getImageInfo()
                            .then((imageInfo) => {
                                expect(imageInfo.size.height == 2).assertTrue();
                                expect(imageInfo.size.width == 1).assertTrue();
                                console.info(`${testNum} - success `);
                                console.info(
                                    "imageInfo height :" + imageInfo.size.height + "width : " + imageInfo.size.width
                                );
                                done();
                            })
                            .catch((err) => {
                                console.info(`${testNum} getimageInfo err ` + JSON.stringify(err));
                            });
                    }
                });
            }
        }
        async function createPixMapPromiseErr(done, testNum, arg) {
            await getFd("test_large.webp");
            let imageSourceApi = image.createImageSource(filePath);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSourceApi;
                imageSourceApi
                    .createPixelMap(arg)
                    .then((pixelmap) => {
                        console.log(`${testNum} failed`);
                        expect().assertFail();
                        done();
                    })
                    .catch((error) => {
                        console.log(`${testNum} success `);
                        expect(true).assertTrue();
                        done();
                    });
            }
        }
        async function createPixMapPromise(done, testNum, arg) {
            await getFd("test_large.webp");
            let imageSourceApi = image.createImageSource(filePath);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSourceApi;
                imageSourceApi
                    .createPixelMap(arg)
                    .then((pixelmap) => {
                        globalpixelmap = pixelmap;
                        pixelmap
                            .getImageInfo()
                            .then((imageInfo) => {
                                expect(imageInfo.size.height == 2).assertTrue();
                                expect(imageInfo.size.width == 1).assertTrue();
                                console.info(`${testNum} - success `);
                                console.info(
                                    "imageInfo height :" + imageInfo.size.height + "width : " + imageInfo.size.width
                                );
                                done();
                            })
                            .catch((err) => {
                                console.info(`${testNum} getimageInfo err ` + JSON.stringify(err));
                            });
                    })
                    .catch((error) => {
                        console.log(`${testNum} fail `);
                        expect(flase).assertTrue();
                        done();
                    });
            }
        }
        async function packingPromise(done, testNum, arg) {
            console.info(`${testNum} enter`);
            var height = 4;
            var width = 6;
            var pixelSize = 4;
            var widthSize = width * pixelSize;
            var bufferSize = height * widthSize;
            const color = new ArrayBuffer(bufferSize);
            var colorArr = new Uint8Array(color);
            for (var h = 0; h < height / 2; h++) {
                for (var w = 0; w < width / 2; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 255; // r
                    colorArr[pos + 1] = 0;
                    colorArr[pos + 2] = 0;
                    colorArr[pos + 3] = 255;
                }
            }
            for (var h = 0; h < height / 2; h++) {
                for (var w = width / 2; w < width; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 0;
                    colorArr[pos + 1] = 255; // g
                    colorArr[pos + 2] = 0;
                    colorArr[pos + 3] = 255;
                }
            }
            for (var h = height / 2; h < height; h++) {
                for (var w = 0; w < width / 2; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 0;
                    colorArr[pos + 1] = 0;
                    colorArr[pos + 2] = 255; // b
                    colorArr[pos + 3] = 255;
                }
            }
            for (var h = height / 2; h < height; h++) {
                for (var w = width / 2; w < width; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 0;
                    colorArr[pos + 1] = 0;
                    colorArr[pos + 2] = 0;
                    colorArr[pos + 3] = 255;
                }
            }

            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } };
            image.createPixelMap(color, opts).then((pixelmap) => {
                if (pixelmap == undefined) {
                    console.info("${testNum} create pixelmap failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalpixelmap = pixelmap;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info(`${testNum} create image packer failed`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        imagePackerApi
                            .packing(pixelmap, arg)
                            .then((data) => {
                                console.info(`${testNum} success`);
                                expect(data != undefined).assertTrue();
                                var dataArr = new Uint8Array(data);
                                console.info(`${testNum} dataArr.length=` + dataArr.length);
                                for (var i = 0; i < dataArr.length; i++) {
                                    console.info(`dataArr[` + i + `]=` + dataArr[i]);
                                }
                                done();
                            })
                            .catch((error) => {
                                console.log(`${testNum} error: ` + error);
                                expect(false).assertFail();
                                done();
                            });
                    }
                }
            });
            console.info(`${testNum} leave`);
        }

        async function packingCb(done, testNum, arg) {
            console.info(`${testNum} enter`);
            var height = 4;
            var width = 6;
            var pixelSize = 4;
            var widthSize = width * pixelSize;
            var bufferSize = height * widthSize;
            const color = new ArrayBuffer(bufferSize);
            var colorArr = new Uint8Array(color);
            for (var h = 0; h < height / 2; h++) {
                for (var w = 0; w < width / 2; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 255; // r
                    colorArr[pos + 1] = 0;
                    colorArr[pos + 2] = 0;
                    colorArr[pos + 3] = 255;
                }
            }
            for (var h = 0; h < height / 2; h++) {
                for (var w = width / 2; w < width; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 0;
                    colorArr[pos + 1] = 255; // g
                    colorArr[pos + 2] = 0;
                    colorArr[pos + 3] = 255;
                }
            }
            for (var h = height / 2; h < height; h++) {
                for (var w = 0; w < width / 2; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 0;
                    colorArr[pos + 1] = 0;
                    colorArr[pos + 2] = 255; // b
                    colorArr[pos + 3] = 255;
                }
            }
            for (var h = height / 2; h < height; h++) {
                for (var w = width / 2; w < width; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 0;
                    colorArr[pos + 1] = 0;
                    colorArr[pos + 2] = 0;
                    colorArr[pos + 3] = 255;
                }
            }

            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } };
            image
                .createPixelMap(color, opts)
                .then((pixelmap) => {
                    if (pixelmap == undefined) {
                        console.info("${testNum} create pixelmap failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        const imagePackerApi = image.createImagePacker();
                        if (imagePackerApi == undefined) {
                            console.info(`${testNum} create image packer failed`);
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalPacker = imagePackerApi;
                            imagePackerApi.packing(pixelmap, arg, (err, data) => {
                                console.info(`${testNum} success`);
                                expect(data != undefined).assertTrue();
                                var dataArr = new Uint8Array(data);
                                console.info(`${testNum} dataArr.length=` + dataArr.length);
                                for (var i = 0; i < dataArr.length; i++) {
                                    console.info(`dataArr[` + i + `]=` + dataArr[i]);
                                }
                                done();
                            });
                        }
                    }
                })
                .catch((error) => {
                    console.log(`${testNum} error: ` + error);
                    expect(false).assertFail();
                    done();
                });
            console.info(`${testNum} leave`);
        }

        async function packingPromiseErr(done, testNum, arg) {
            console.info(`${testNum} enter`);
            var height = 4;
            var width = 6;
            var pixelSize = 4;
            var widthSize = width * pixelSize;
            var bufferSize = height * widthSize;
            const color = new ArrayBuffer(bufferSize);
            var colorArr = new Uint8Array(color);
            for (var h = 0; h < height / 2; h++) {
                for (var w = 0; w < width / 2; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 255; // r
                    colorArr[pos + 1] = 0;
                    colorArr[pos + 2] = 0;
                    colorArr[pos + 3] = 255;
                }
            }
            for (var h = 0; h < height / 2; h++) {
                for (var w = width / 2; w < width; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 0;
                    colorArr[pos + 1] = 255; // g
                    colorArr[pos + 2] = 0;
                    colorArr[pos + 3] = 255;
                }
            }
            for (var h = height / 2; h < height; h++) {
                for (var w = 0; w < width / 2; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 0;
                    colorArr[pos + 1] = 0;
                    colorArr[pos + 2] = 255; // b
                    colorArr[pos + 3] = 255;
                }
            }
            for (var h = height / 2; h < height; h++) {
                for (var w = width / 2; w < width; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 0;
                    colorArr[pos + 1] = 0;
                    colorArr[pos + 2] = 0;
                    colorArr[pos + 3] = 255;
                }
            }

            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } };
            image.createPixelMap(color, opts).then((pixelmap) => {
                if (pixelmap == undefined) {
                    console.info("${testNum} create pixelmap failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalpixelmap = pixelmap;
                    const imagePackerApi = image.createImagePacker();
                    if (imagePackerApi == undefined) {
                        console.info(`${testNum} create image packer failed`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalPacker = imagePackerApi;
                        imagePackerApi
                            .packing(pixelmap, arg)
                            .then((data) => {
                                expect(data == undefined).assertTrue();
                                done();
                            })
                            .catch((error) => {
                                console.log(`${testNum} error: ` + error);
                                expect(true).assertTrue();
                                done();
                            });
                    }
                }
            });
            console.info(`${testNum} leave`);
        }

        async function packingCbErr(done, testNum, arg) {
            console.info(`${testNum} enter`);
            var height = 4;
            var width = 6;
            var pixelSize = 4;
            var widthSize = width * pixelSize;
            var bufferSize = height * widthSize;
            const color = new ArrayBuffer(bufferSize);
            var colorArr = new Uint8Array(color);
            for (var h = 0; h < height / 2; h++) {
                for (var w = 0; w < width / 2; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 255; // r
                    colorArr[pos + 1] = 0;
                    colorArr[pos + 2] = 0;
                    colorArr[pos + 3] = 255;
                }
            }
            for (var h = 0; h < height / 2; h++) {
                for (var w = width / 2; w < width; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 0;
                    colorArr[pos + 1] = 255; // g
                    colorArr[pos + 2] = 0;
                    colorArr[pos + 3] = 255;
                }
            }
            for (var h = height / 2; h < height; h++) {
                for (var w = 0; w < width / 2; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 0;
                    colorArr[pos + 1] = 0;
                    colorArr[pos + 2] = 255; // b
                    colorArr[pos + 3] = 255;
                }
            }
            for (var h = height / 2; h < height; h++) {
                for (var w = width / 2; w < width; w++) {
                    var pos = widthSize * h + pixelSize * w;
                    colorArr[pos + 0] = 0;
                    colorArr[pos + 1] = 0;
                    colorArr[pos + 2] = 0;
                    colorArr[pos + 3] = 255;
                }
            }

            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } };
            image
                .createPixelMap(color, opts)
                .then((pixelmap) => {
                    if (pixelmap == undefined) {
                        console.info("${testNum} create pixelmap failed");
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        const imagePackerApi = image.createImagePacker();
                        if (imagePackerApi == undefined) {
                            console.info(`${testNum} create image packer failed`);
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalPacker = imagePackerApi;
                            imagePackerApi.packing(pixelmap, arg, (err, data) => {
                                console.info(`${testNum} success`);
                                expect(data == undefined).assertTrue();
                                done();
                            });
                        }
                    }
                })
                .catch((error) => {
                    console.log(`${testNum} error: ` + error);
                    expect(true).assertTrue();
                    done();
                });
            console.info(`${testNum} leave`);
        }

        async function testGetDelayTimePromise(done, testNum, file) {
            await getFd(file);
            let imageSourceApi = image.createImageSource(filePath);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} testGetDelayTimePromise create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                try {
                    console.info(`${testNum} testGetDelayTimePromise create image source success`);
                    globalImagesource = imageSourceApi;
                    imageSourceApi.getDelayTimeList().then((delayTimes) => {
                        console.info(`${testNum} testGetDelayTimePromise getDelayTime success`);
                        expect(true).assertTrue();
                        console.info(`${testNum} delayTimes show begin length: ${delayTimes.length} `);
                        for (var i = 0; i < delayTimes.length; i++) {
                            console.info(`${testNum} delayTimes[ ${i} ]= ${delayTimes[i]}`);
                        }
                        console.info(`${testNum} delayTimes show end`);
                    }).catch((err) => {
                        console.info(`${testNum} testGetDelayTimePromise getDelayTime failed err: code is ${err.code}, message is ${err.message}`);
                        expect(err.code == ERR_CODE).assertTrue();
                    })
                    done();
                } catch (error) {
                    console.log("testGetDelayTimePromise error: " + error);
                    expect(false).assertTrue();
                    done();
                }
            }
        }

        async function testGetDelayTimeCallBack(done, testNum, file) {
            await getFd(file);
            let imageSourceApi = image.createImageSource(filePath);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} testGetDelayTimeCallBack create imagesource failed`);
                expect(false).assertTrue();
                done();
            } else {
                console.info(`${testNum} testGetDelayTimeCallBack create imagesource success`);
                globalImagesource = imageSourceApi;
                imageSourceApi.getDelayTimeList((err, delayTimes) => {
                    if (err != undefined) {
                        console.info(`${testNum} testGetDelayTimeCallBack getDelayTime failed err: code is ${err.code}, message is ${err.message}`);
                        expect(err.code == ERR_CODE).assertTrue();
                        done();
                        return;
                    }
                    expect(delayTimes != undefined).assertTrue();
                    console.info(`${testNum} testGetDelayTimeCallBack getDelayTime success`);
                    console.info(`${testNum} delayTimes show begin(length:` + delayTimes.length + `)`);
                    for (var i = 0; i < delayTimes.length; i++) {
                        console.info(`${testNum} delayTimes[` + i + `]=` + delayTimes[i]);
                    }
                    console.info(`${testNum} delayTimes show end`);
                    done();
                });
            }
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0100
         * @tc.name      : createPixelMap - promise-webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0100", 0, async function (done) {
            try {
                await getFd("test_large.webp");
                let imageSourceApi = image.createImageSource(filePath);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0100 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };

                    imageSourceApi.createPixelMap(decodingOptions).then((pixelmap) => {
                        if (pixelmap != undefined) {
                            globalpixelmap = pixelmap;
                            expect(true).assertTrue();
                            console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0100 success ");
                            done();
                        } else {
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0100 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0100
         * @tc.name      : createPixelMap - callback-webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0100", 0, async function (done) {
            try {
                await getFd("test_large.webp");
                let imageSourceApi = image.createImageSource(filePath);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0100 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0,
                    };

                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (pixelmap != undefined) {
                            globalpixelmap = pixelmap;
                            expect(true).assertTrue();
                            console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0100 success ");
                            done();
                        } else {
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0100 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0200
         * @tc.name      : createPixelMap-promise-webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0200", 0, async function (done) {
            try {
                await getFd("test_large.webp");
                let imageSourceApi = image.createImageSource(filePath);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0200 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    imageSourceApi
                        .createPixelMap()
                        .then((pixelmap) => {
                            globalpixelmap = pixelmap;
                            expect(pixelmap != undefined).assertTrue();
                            console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0200 success ");
                            done();
                        })
                        .catch((error) => {
                            console.log("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0200 error: " + error);
                            expect().assertFail();
                            done();
                        });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0200 err " + error);
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0200
         * @tc.name      : createPixelMap-callback-webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0200", 0, async function (done) {
            try {
                await getFd("test_large.webp");
                let imageSourceApi = image.createImageSource(filePath);
                if (imageSourceApi == undefined) {
                    console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0200 create image source failed");
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSourceApi;
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        globalpixelmap = pixelmap;
                        expect(pixelmap != undefined).assertTrue();
                        console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0200 success ");
                        done();
                    });
                }
            } catch (error) {
                console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0200 err " + error);
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0300
         * @tc.name      : createPixelMap-callback -{sampleSize: -1} -webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0300", 0, async function (done) {
            let decodingOptions = {
                sampleSize: -1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0,
            };
            createPixMapCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0300", decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0400
         * @tc.name      : createPixelMap-callback -{index: -1} -webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0400", 0, async function (done) {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 0,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: -1,
            };
            createPixMapCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0400", decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0500
         * @tc.name      : createPixelMap-callback -{rotate: 500} -webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0500", 0, async function (done) {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 500,
                desiredPixelFormat: 3,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0,
            };
            createPixMapCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0500", decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0600
         * @tc.name      : createPixelMap-callback -{rotate: -10} -webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0600", 0, async function (done) {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: -10,
                desiredPixelFormat: 3,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0,
            };
            createPixMapCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0600", decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0700
         * @tc.name      : createPixelMap-callback editable: false -webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0700", 0, async function (done) {
            let decodingOptions = {
                sampleSize: 1,
                editable: false,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 33,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0,
            };
            createPixMapCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0700", decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0800
         * @tc.name      : createPixelMap-callback -{ size: { height: 1, width: 2 }, x: -1, y: -1 }-webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0800", 0, async function (done) {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                index: 0,
            };
            createPixMapCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0800", decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0900
         * @tc.name      : createPixelMap-callback -size: { height: 10000, width: 10000 } -webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0900", 0, async function (done) {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 3,
                desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                index: 0,
            };
            createPixMapCb(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0900", decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1000
         * @tc.name      : createPixelMap-callback - sampleSize: -1 -webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1000", 0, async function (done) {
            let decodingOptions = {
                sampleSize: -1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0,
            };
            createPixMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1000", decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1100
         * @tc.name      : createPixelMap-callback - index: -1 -webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1100", 0, async function (done) {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: -1,
            };
            createPixMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1100", decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1200
         * @tc.name      : createPixelMap-callback - desiredPixelFormat: 1 -webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1200", 0, async function (done) {
            let decodingOptions = {
                sampleSize: 2,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 500,
                desiredPixelFormat: 1,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0,
            };
            createPixMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1200", decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1300
         * @tc.name      : createPixelMap-callback - { size: { height: 1, width: 2 }, x: -1, y: -1 } -webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1300", 0, async function (done) {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 3,
                desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                index: 0,
            };
            createPixMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1300", decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1400
         * @tc.name      : createPixelMap-callback -  size: { height: 10000, width:10000 } -webp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.return pixelmap undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1400", 0, async function (done) {
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 2,
                desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                index: 0,
            };
            createPixMapPromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1400", decodingOptions);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_0100
         * @tc.name      : packing - callback-webp
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_0100", 0, async function (done) {
            let packOpts = { format: ["image/webp"], quality: 90 };
            packingCb(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_0100", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_0100
         * @tc.name      : packing - promise-webp
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_0100", 0, async function (done) {
            let packOpts = { format: ["image/webp"], quality: 100 };
            packingPromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_0100", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0100
         * @tc.name      : packing - promise-webp-wrong quality
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0100", 0, async function (done) {
            let packOpts = { format: ["image/webp"], quality: 123 };
            packingPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0100", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0200
         * @tc.name      : packing - promise-webp
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0200", 0, async function (done) {
            let packOpts = { format: ["image/gif"], quality: 90 };
            packingPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0200", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0300
         * @tc.name      : packing - promise-webp-no format
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0300", 0, async function (done) {
            let packOpts = { quality: 90 };
            packingPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0300", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0400
         * @tc.name      : packing - promise-webp-no format
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0400", 0, async function (done) {
            let packOpts = { format: ["image/jpeg"] };
            packingPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0400", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0100
         * @tc.name      : packing - callback-webp-wrong format
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0100", 0, async function (done) {
            let packOpts = { format: ["image/gif"], quality: 100 };
            packingCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0100", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0200
         * @tc.name      : packing - callback-webp-wrong quality
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0200", 0, async function (done) {
            let packOpts = { format: ["image/jpeg"], quality: 112 };
            packingCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0200", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0300
         * @tc.name      : packing - callback-webp-no quality
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0300", 0, async function (done) {
            let packOpts = { format: ["image/jpeg"] };
            packingCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0300", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0400
         * @tc.name      : packing - callback-webp-no format
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0400", 0, async function (done) {
            let packOpts = { quality: 90 };
            packingCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0400", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0500
         * @tc.name      : packing - callback-webp-quality -1
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0500", 0, async function (done) {
            let packOpts = { format: ["image/jpeg"], quality: -1 };
            packingCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0500", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0500
         * @tc.name      : packing - promise-webp-quality -1
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0500", 0, async function (done) {
            let packOpts = { format: ["image/jpeg"], quality: -1 };
            packingPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0500", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_0200
         * @tc.name      : packing - callback-webp-quality 0
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_0200", 0, async function (done) {
            let packOpts = { format: ["image/jpeg"], quality: 0 };
            packingCb(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_0200", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_0200
         * @tc.name      : packing - promise-webp-quality 0
         * @tc.desc      : 1.create ImageSource
         *                 2.call packing
         *                 3.return array
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_0200", 0, async function (done) {
            let packOpts = { format: ["image/jpeg"], quality: 0 };
            packingPromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_0200", packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0100
         * @tc.name      : test getDelayTime promise for one frame webp
         * @tc.desc      : 1.create one frame webp imagesource
         *                 2.getDelayTime
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0100", 0, async function (done) {
            testGetDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0100", "test_large.webp");
        });


        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0200
         * @tc.name      : test getDelayTime promise for webp
         * @tc.desc      : 1.create webp imagesource
         *                 2.getDelayTime
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0200", 0, async function (done) {
            testGetDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0200", "moving_test.webp");
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0300
         * @tc.name      : test getDelayTime promise for unsupported jpg
         * @tc.desc      : 1.create jpg imagesource
         *                 2.getDelayTime
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0300", 0, async function (done) {
            testGetDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0300", "test.jpg");
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0100
         * @tc.name      : test getDelayTime callback for one frame webp
         * @tc.desc      : 1.create one frame webp imagesource
         *                 2.getDelayTime with callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0100", 0, async function (done) {
            testGetDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0100", "test_large.webp");
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0200
         * @tc.name      : test getDelayTime callback for webp
         * @tc.desc      : 1.create webp imagesource
         *                 2.getDelayTime with callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0200", 0, async function (done) {
            testGetDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0200", "moving_test.webp");
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0300
         * @tc.name      : test getDelayTime callback for unsupported jpg
         * @tc.desc      : 1.create jpg imagesource
         *                 2.getDelayTime with callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0300", 0, async function (done) {
            testGetDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0300", "test.jpg");
        });
    });
}
