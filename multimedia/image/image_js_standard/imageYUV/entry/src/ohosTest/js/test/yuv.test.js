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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "@ohos/hypium";

export default function imageYuv() {
    describe("imageYuv", function () {
        let globalpixelmap;
        let globalImagesource;
        let globalPacker;
        const { NV21, NV12 } = image.PixelMapFormat;
        const WRONG_FORMAT = 10;

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

        function createBuffer(height, width) {
            var ySize = height * width;
            var uvSize = ySize / 2;
            var ySum = ySize;
            var uvSum = uvSize / 2;
            var bufferSize = ySize + uvSize;
            var yBase = 0;
            var uvBase = yBase + ySize;
            var yuv = new ArrayBuffer(bufferSize);
            var yuvArr = new Uint8Array(yuv);
            for (var p = 0; p < ySum; p++) {
                var pos = yBase + p;
                yuvArr[pos] = 1 + p;
            }
            for (var p = 0; p < uvSum; p++) {
                var pos = uvBase + p * 2;
                yuvArr[pos + 0] = 41 + p;
                yuvArr[pos + 1] = 71 + p;
            }
            return yuv;
        }

        async function yuvToJpegByPixelMapPromise(done, testNum, sourceOptions, yuvData) {
            try {
                let imageSource = image.createImageSource(yuvData, sourceOptions);
                if (imageSource == undefined) {
                    console.info(`${testNum} create ImageSource failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSource;
                    imageSource
                        .createPixelMap()
                        .then((pixelmap) => {
                            if (pixelmap == undefined) {
                                expect(false).assertTrue();
                                done();
                            } else {
                                globalpixelmap = pixelmap;
                                pixelmap.getImageInfo((err, imageInfo) => {
                                    if (err != undefined) {
                                        expect(false).assertTrue();
                                        done();
                                        return;
                                    }
                                    expect(imageInfo != undefined).assertTrue();
                                    expect(imageInfo.size.height == 4).assertTrue();
                                    expect(imageInfo.size.width == 6).assertTrue();
                                    expect(imageInfo.density == 120).assertTrue();
                                    done();
                                });
                            }
                        })
                        .catch((error) => {
                            console.info(`${testNum} create Pixelmap failed`);
                            console.log(`${testNum} error:` + error);
                            expect(false).assertTrue();
                            done();
                        });
                }
            } catch (error) {
                logger.log(`${testNum} error:` + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function yuvToJpegByPixelMapPromise_Fail(done, testNum, sourceOptions, yuvData) {
            try {
                let imageSource = image.createImageSource(yuvData, sourceOptions);
                if (imageSource == undefined) {
                    console.info(`${testNum} create ImageSource failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSource;
                    imageSource
                        .createPixelMap()
                        .then((pixelmap) => {
                            expect(false).assertTrue();
                            done();
                        })
                        .catch((error) => {
                            console.info(`${testNum} error:` + error);
                            done();
                        });
                }
            } catch (error) {
                logger.log(`${testNum} error:` + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function yuvToJpegByPixelMapCallback(done, testNum, sourceOptions, yuvData) {
            console.info(`${testNum} test`);
            try {
                let imageSource = image.createImageSource(yuvData, sourceOptions);
                if (imageSource == undefined) {
                    console.info(`${testNum} create ImageSource failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSource;
                    imageSource.createPixelMap((err, pixelmap) => {
                        if (err != undefined || pixelmap == undefined) {
                            console.info(`${testNum} err2: ` + err);
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        globalpixelmap = pixelmap;
                        pixelmap.getImageInfo((err, imageInfo) => {
                            if (err != undefined) {
                                console.info(`${testNum} getImageInfo fail`);
                                expect(false).assertTrue();
                                done();
                                return;
                            }
                            expect(imageInfo != undefined).assertTrue();
                            expect(imageInfo.size.height == 4).assertTrue();
                            expect(imageInfo.size.width == 6).assertTrue();
                            expect(imageInfo.density == 120).assertTrue();
                            done();
                        });
                    });
                }
            } catch (error) {
                logger.log(`${testNum} error:` + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function yuvToJpegByPixelMapCallback_Fail(done, testNum, sourceOptions, yuvData) {
            try {
                let imageSource = image.createImageSource(yuvData, sourceOptions);
                if (imageSource == undefined) {
                    console.info(`${testNum} create ImageSource failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSource;
                    imageSource.createPixelMap((err, pixelmap) => {
                        if (err != undefined || pixelmap == undefined) {
                            console.info(`${testNum} err: ` + err);
                            done();
                            return;
                        }
                        expect(false).assertTrue();
                        done();
                    });
                }
            } catch (error) {
                logger.log(`${testNum} error:` + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function yuvToJpegByImageSourcePromise(done, testNum, sourceOptions, arg, yuvData) {
            let imageSource = image.createImageSource(yuvData, sourceOptions);
            if (imageSource == undefined) {
                console.info(`${testNum} create ImageSource failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSource;
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info(`${testNum} create ImagePacker failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalPacker = imagePackerApi;
                    imagePackerApi
                        .packing(imageSource, arg)
                        .then((data) => {
                            console.info(`${testNum} packed`);
                            var dataArr = new Uint8Array(data);
                            console.info(`${testNum} dataArr.length=` + dataArr.length);
                            for (var i = 0; i < dataArr.length; i++) {
                                var str = `dataArr[` + i + `]=`;
                                for (var j = 0; j < 20 && i < dataArr.length; j++, i++) {
                                    str = str + "," + dataArr[i];
                                }
                                console.info(`${testNum} ` + str);
                                i--;
                            }
                            expect(data != undefined).assertTrue();
                            done();
                        })
                        .catch((error) => {
                            console.log(`${testNum} error: ` + error);
                            expect(false).assertTrue();
                            done();
                        });
                }
            }
        }

        async function yuvToJpegByImageSourcePromise_Fail(done, testNum, sourceOptions, arg, yuvData) {
            let imageSource = image.createImageSource(yuvData, sourceOptions);
            if (imageSource == undefined) {
                console.info(`${testNum} create ImageSource failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSource;
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info(`${testNum} create ImagePacker failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalPacker = imagePackerApi;
                    imagePackerApi
                        .packing(imageSource, arg)
                        .then((data) => {
                            expect(data == undefined).assertTrue();
                            done();
                        })
                        .catch((error) => {
                            console.log(`${testNum} error: ` + error);
                            done();
                        });
                }
            }
        }

        async function yuvToJpegByImageSourceCallback(done, testNum, sourceOptions, arg, yuvData) {
            let imageSource = image.createImageSource(yuvData, sourceOptions);
            if (imageSource == undefined) {
                console.info(`${testNum} create ImageSource failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSource;
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info(`${testNum} create ImagePacker failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalPacker = imagePackerApi;
                    imagePackerApi.packing(imageSource, arg, (err, data) => {
                        if (err != undefined) {
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        var dataArr = new Uint8Array(data);
                        console.info(`${testNum} dataArr.length=` + dataArr.length);
                        for (var i = 0; i < dataArr.length; i++) {
                            var str = `dataArr[` + i + `]=`;
                            for (var j = 0; j < 20 && i < dataArr.length; j++, i++) {
                                str = str + "," + dataArr[i];
                            }
                            console.info(`${testNum} ` + str);
                            i--;
                        }
                        expect(data != undefined).assertTrue();
                        done();
                    });
                }
            }
        }

        async function yuvToJpegByImageSourceCallback_Fail(done, testNum, sourceOptions, arg, yuvData) {
            let imageSource = image.createImageSource(yuvData, sourceOptions);
            if (imageSource == undefined) {
                console.info(`${testNum} create ImageSource failed`);
                expect(false).assertTrue();
                done();
            } else {
                globalImagesource = imageSource;
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info(`${testNum} create ImagePacker failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalPacker = imagePackerApi;
                    imagePackerApi.packing(imageSource, arg, (err, data) => {
                        expect(err != undefined || data == undefined).assertTrue();
                        done();
                    });
                }
            }
        }

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0100
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0100", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0100", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0200
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0200", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0200", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0300
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0300", Level.LEVEL0, async function (done) {
            let yuvData = new ArrayBuffer(5);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0300", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0400
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0400", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 5 } };
            yuvToJpegByPixelMapPromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0400",
                sourceOptions,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0500
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0500", Level.LEVEL0, async function (done) {
            let yuvData = new ArrayBuffer(5);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0500", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0600
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0600", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 5 } };
            yuvToJpegByPixelMapPromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0600",
                sourceOptions,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0700
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0700", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = {
                sourceDensity: 120,
                sourcePixelFormat: WRONG_FORMAT,
                sourceSize: { height: 4, width: 6 },
            };
            yuvToJpegByPixelMapPromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0700",
                sourceOptions,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0800
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0800
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0800", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapPromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_0800",
                sourceOptions,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0100
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0100", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 6 } };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourcePromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0100",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0200
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0200", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 6 } };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourcePromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0200",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0300
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0300", Level.LEVEL0, async function (done) {
            let yuvData = new ArrayBuffer(5);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 6 } };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourcePromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0300",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0400
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0400", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 5 } };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourcePromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0400",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0500
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0500", Level.LEVEL0, async function (done) {
            let yuvData = new ArrayBuffer(5);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 6 } };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourcePromise(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0500",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0600
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0600", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 5 } };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourcePromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0600",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0700
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0700", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = {
                sourceDensity: 120,
                sourcePixelFormat: WRONG_FORMAT,
                sourceSize: { height: 4, width: 6 },
            };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourcePromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0700",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0800
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0800
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0800", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourceSize: { height: 4, width: 6 } };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourcePromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_0800",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0100
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0100", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapCallback(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0100", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0200
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0200", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapCallback(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0200", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0300
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0300", Level.LEVEL0, async function (done) {
            let yuvData = new ArrayBuffer(5);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapCallback(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0300", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0400
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0400", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 5 } };
            yuvToJpegByPixelMapCallback_Fail(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0400", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0500
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0500", Level.LEVEL0, async function (done) {
            let yuvData = new ArrayBuffer(5);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapCallback(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0500", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0600
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0600", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 5 } };
            yuvToJpegByPixelMapCallback_Fail(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0600", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0700
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0700", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = {
                sourceDensity: 120,
                sourcePixelFormat: WRONG_FORMAT,
                sourceSize: { height: 4, width: 6 },
            };
            yuvToJpegByPixelMapCallback_Fail(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0700", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0800
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0800
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0800", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapCallback_Fail(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_0800", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0100
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0100", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 6 } };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourceCallback(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0100",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0200
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0200", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 6 } };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourceCallback(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0200",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0300
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0300", Level.LEVEL0, async function (done) {
            let yuvData = new ArrayBuffer(5);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 6 } };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourceCallback(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0300",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0400
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0400", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 5 } };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourceCallback_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0400",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0500
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0500", Level.LEVEL0, async function (done) {
            let yuvData = new ArrayBuffer(5);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 6 } };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourceCallback(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0500",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0600
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0600", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 5 } };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourceCallback_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0600",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0700
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0700", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = {
                sourceDensity: 120,
                sourcePixelFormat: WRONG_FORMAT,
                sourceSize: { height: 4, width: 6 },
            };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourceCallback_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0700",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0800
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0800
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0800", Level.LEVEL0, async function (done) {
            let yuvData = createBuffer(4, 6);
            let sourceOptions = { sourceDensity: 120, sourceSize: { height: 4, width: 6 } };
            let packOpts = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourceCallback_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_CB_0800",
                sourceOptions,
                packOpts,
                yuvData
            );
        });
    });
}
