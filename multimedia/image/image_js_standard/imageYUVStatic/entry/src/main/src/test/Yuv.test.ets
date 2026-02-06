/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog';

class Logger {
    testNum: string;

    constructor(testNum: string) {
        this.testNum = testNum;
    }

    log(msg: string) {
        hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
    }
}

export default function imageYuv() {
    describe("imageYuv", () => {
        let globalpixelmap: image.PixelMap | undefined = undefined;
        let globalImagesource: image.ImageSource | undefined = undefined;
        let globalPacker: image.ImagePacker | undefined = undefined;
        const NV12 = image.PixelMapFormat.NV21;
        const NV21 = image.PixelMapFormat.NV21;
        const WRONG_FORMAT = image.PixelMapFormat.RGBA_1010102;

        beforeAll(async () => {
            console.info("beforeAll case");
        });

        beforeEach(() => {
            console.info("beforeEach case");
        });

        afterEach(async () => {
            if (globalpixelmap != undefined) {
                console.info("globalpixelmap release start");
                try {
                    await globalpixelmap!.release();
                } catch (error) {
                    console.info("globalpixelmap release fail");
                }
            }
            if (globalImagesource != undefined) {
                console.info("globalpixelmap release start");
                try {
                    await globalImagesource!.release();
                } catch (error) {
                    console.info("globalImagesource release fail");
                }
            }
            if (globalPacker != undefined) {
                console.info("globalPacker release start");
                try {
                    await globalPacker!.release();
                } catch (error) {
                    console.info("globalPacker release fail");
                }
            }
            console.info("afterEach case");
        });

        afterAll(() => {
            console.info("afterAll case");
        });

        const createBuffer = (height: int, width: int): ArrayBuffer => {
            let ySize = height * width;
            let uvSize = ySize / 2;
            let ySum = ySize;
            let uvSum = uvSize / 2;
            let bufferSize = ySize + uvSize;
            let yBase = 0;
            let uvBase = yBase + ySize;
            let yuv = new ArrayBuffer(bufferSize);
            let yuvArr = new Uint8Array(yuv);
            for (let p = 0; p < ySum; p++) {
                let pos = yBase + p;
                yuvArr[pos] = 1 + p;
            }
            for (let p = 0; p < uvSum; p++) {
                let pos = uvBase + p * 2;
                yuvArr[pos + 0] = 41 + p;
                yuvArr[pos + 1] = 71 + p;
            }
            return yuv;
        }

        let yuvToJpegByPixelMapPromise = async (done: () => void, testNum: string, sourceOptions: image.SourceOptions, yuvData: ArrayBuffer) => {
            let logger = new Logger(testNum);
            try {
                let imageSource = image.createImageSource(yuvData, sourceOptions);
                if (imageSource == undefined) {
                    console.info(`${testNum} create ImageSource failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSource;
                    try {
                        let pixelmap = await imageSource.createPixelMap();
                        if (pixelmap == undefined) {
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            pixelmap.getImageInfo((err, imageInfo) => {
                                if (err && err.code) {
                                    expect(false).assertTrue();
                                    done();
                                }
                                expect(imageInfo != undefined).assertTrue();
                                expect(imageInfo!.size.height == 4).assertTrue();
                                expect(imageInfo!.size.width == 6).assertTrue();
                                expect(imageInfo!.density == 120).assertTrue();
                                done();
                            });
                        }
                    } catch (error) {
                        console.info(`${testNum} create Pixelmap failed`);
                        console.log(`${testNum} error:` + error);
                        expect(false).assertTrue();
                        done();
                    }
                }
            } catch (err) {
                logger.log(`${testNum} error:` + err);
                expect(false).assertTrue();
                done();
            }
        }
        let yuvToJpegByPixelMapPromise_Fail = async (done: () => void, testNum: string, sourceOptions: image.SourceOptions, yuvData: ArrayBuffer) => {
            let logger = new Logger(testNum);
            try {
                let imageSource = image.createImageSource(yuvData, sourceOptions);
                if (imageSource == undefined) {
                    console.info(`${testNum} create ImageSource failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSource;
                    try {
                        let pixelmap = await imageSource.createPixelMap();
                        expect(false).assertTrue();
                        done();
                    } catch (error) {
                        console.info(`${testNum} error:` + error);
                        expect(true).assertTrue();
                        done();
                    }
                }
            } catch (error) {
                logger.log(`${testNum} error:` + error);
                expect(false).assertTrue();
                done();
            }
        }

        let yuvToJpegByPixelMapCallback = async (done: () => void, testNum: string, sourceOptions: image.SourceOptions, yuvData: ArrayBuffer) => {
            console.info(`${testNum} test`);
            let logger = new Logger(testNum);
            try {
                let imageSource = image.createImageSource(yuvData, sourceOptions);
                if (imageSource == undefined) {
                    console.info(`${testNum} create ImageSource failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSource;
                    imageSource.createPixelMap((err, pixelmap) => {
                        if (err && err.code) {
                            console.info(`${testNum} err2: ` + err);
                            expect(false).assertTrue();
                            done();
                        }
                        globalpixelmap = pixelmap!;
                        pixelmap!.getImageInfo((err, imageInfo) => {
                            if (err && err.code) {
                                console.info(`${testNum} getImageInfo fail`);
                                expect(false).assertTrue();
                                done();
                            }
                            expect(imageInfo != undefined).assertTrue();
                            expect(imageInfo!.size.height == 4).assertTrue();
                            expect(imageInfo!.size.width == 6).assertTrue();
                            expect(imageInfo!.density == 120).assertTrue();
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

        let yuvToJpegByPixelMapCallback_Fail = async (done: () => void, testNum: string, sourceOptions: image.SourceOptions, yuvData: ArrayBuffer) => {
            let logger = new Logger(testNum);
            try {
                let imageSource = image.createImageSource(yuvData, sourceOptions);
                if (imageSource == undefined) {
                    console.info(`${testNum} create ImageSource failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    globalImagesource = imageSource;
                    imageSource.createPixelMap((err, pixelmap) => {
                        if (err!.code || pixelmap == undefined) {
                            console.info(`${testNum} err: ` + err);
                            expect(true).assertTrue();
                            done();
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

        let yuvToJpegByImageSourcePromise = async (done: () => void, testNum: string, sourceOptions: image.SourceOptions, arg: image.PackingOption, yuvData: ArrayBuffer) => {
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
                    try {
                        let data = await imagePackerApi.packToData(imageSource, arg);
                        console.info(`${testNum} packed`);
                        let dataArr = new Uint8Array(data);
                        console.info(`${testNum} dataArr.length=` + dataArr.length);
                        for (let i = 0; i < dataArr.length; i++) {
                            let str = `dataArr[` + i + `]=`;
                            for (let j = 0; j < 20 && i < dataArr.length; j++, i++) {
                                str = str + "," + dataArr[i];
                            }
                            console.info(`${testNum} ` + str);
                            i--;
                        }
                        expect(data != undefined).assertTrue();
                        done();
                    } catch (error) {
                        console.log(`${testNum} error: ` + error);
                        expect(false).assertTrue();
                        done();
                    }
                }
            }
        }

        let yuvToJpegByImageSourcePromise_Fail = async (done: () => void, testNum: string, sourceOptions: image.SourceOptions, arg: image.PackingOption, yuvData: ArrayBuffer) => {
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
                    try {
                        let data = await imagePackerApi.packToData(imageSource, arg);
                        expect(data == undefined).assertTrue();
                        done();
                    } catch (error) {
                        console.log(`${testNum} error: ` + error);
                        expect(true).assertTrue();
                        done();
                    }
                }
            }
        }


        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0100
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = createBuffer(4, 6);
            let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0100", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0200
         * @tc.desc   1.create ImageSource
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = createBuffer(4, 6);
            let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0200", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0300
         * @tc.desc   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0300 - Promise - wrong buffer
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = new ArrayBuffer(5);
            let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0300", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0400
         * @tc.desc   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0400 - Promise - wrong width
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = createBuffer(4, 6);
            let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 5 } };
            yuvToJpegByPixelMapPromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0400",
                sourceOptions,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0500
         * @tc.desc   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0500 - Promise - wrong buffer
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = new ArrayBuffer(5);
            let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0500", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0600
         * @tc.desc   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0600 - Promise - wrong width
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = createBuffer(4, 6);
            let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 5 } };
            yuvToJpegByPixelMapPromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0600",
                sourceOptions,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0700
         * @tc.desc   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0700 - Promise - wrong format
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = createBuffer(4, 6);
            let sourceOptions: image.SourceOptions = {
                sourceDensity: 120,
                sourcePixelFormat: WRONG_FORMAT,
                sourceSize: { height: 4, width: 6 },
            };
            yuvToJpegByPixelMapPromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0700",
                sourceOptions,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0800
         * @tc.desc   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0800 - Promise - format null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = createBuffer(4, 6);
            let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapPromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_PROMISE_STATIC_0800",
                sourceOptions,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0400
         * @tc.desc   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0400 - Promise - wrong width
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = createBuffer(4, 6);
            let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 5 } };
            let packOpts: image.PackingOption = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourcePromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0400",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0600
         * @tc.desc   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0600 - Promise - wrong width
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = createBuffer(4, 6);
            let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 5 } };
            let packOpts: image.PackingOption = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourcePromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0600",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0700
         * @tc.desc   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0700 - Promise - wrong format
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = createBuffer(4, 6);
            let sourceOptions: image.SourceOptions = {
                sourceDensity: 120,
                sourcePixelFormat: WRONG_FORMAT,
                sourceSize: { height: 4, width: 6 },
            };
            let packOpts: image.PackingOption = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourcePromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0700",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0800
         * @tc.desc   SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0800 - Promise - format null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = createBuffer(4, 6);
            let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourceSize: { height: 4, width: 6 } };
            let packOpts: image.PackingOption = { format: "image/jpeg", quality: 99 };
            yuvToJpegByImageSourcePromise_Fail(
                done,
                "SUB_MULTIMEDIA_IMAGE_YUV_IMAGESOURCE_PROMISE_STATIC_0800",
                sourceOptions,
                packOpts,
                yuvData
            );
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0100
         * @tc.desc   SUB_IMAGE_yuv_pixelmap_CB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = createBuffer(4, 6);
            let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapCallback(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0100", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0200
         * @tc.desc   SUB_IMAGE_yuv_pixelmap_CB_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = createBuffer(4, 6);
            let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapCallback(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0200", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0300
         * @tc.desc   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0300 - Promise - wrong buffer
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = new ArrayBuffer(5);
            let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourcePixelFormat: NV21, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapCallback(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0300", sourceOptions, yuvData);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0500
         * @tc.desc   SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0500 - Promise - wrong buffer
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
            let yuvData = new ArrayBuffer(5);
            let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourcePixelFormat: NV12, sourceSize: { height: 4, width: 6 } };
            yuvToJpegByPixelMapCallback(done, "SUB_MULTIMEDIA_IMAGE_YUV_PIXELMAP_CB_STATIC_0500", sourceOptions, yuvData);
        });
    });
}

