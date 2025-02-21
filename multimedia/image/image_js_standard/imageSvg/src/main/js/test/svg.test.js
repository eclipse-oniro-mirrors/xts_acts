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

export default function imageSvg() {
    describe("imageSvg", function () {
        const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
        let filePath;
        let fdNumber;
        async function getFd(fileName) {
            let context = await featureAbility.getContext();
            await context.getFilesDir().then((data) => {
                filePath = data + "/" + fileName;
                console.info("image case filePath is " + filePath);
            });
            await fileio
                .open(filePath, 0o2, 0o777)
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
            console.info("afterEach case");
        });

        afterAll(async function () {
            console.info("afterAll case");
        });

        async function packingPromise(done, testNum, pixelmap, packOpts) {
            try {
                const imagePackerApi = image.createImagePacker();
                if (imagePackerApi == undefined) {
                    console.info(`${testNum} packingPromise create image packer failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    let packOptsFormat = `format:` + packOpts.format;
                    let packOptsQuality = `quality:` + packOpts.quality;
                    console.info(
                        `${testNum} packingPromise packOpts={${packOptsFormat}, ${packOptsQuality} }`
                    );
                    let data = await imagePackerApi.packing(pixelmap, packOpts);
                    console.info(`${testNum} packing finished`);
                    if (data != undefined) {
                        console.info(`${testNum} packing success`);
                        var dataArr = new Uint8Array(data);
                        console.info(`${testNum} packing show begin(length: ${dataArr.length})`);
                        var line = 0;
                        for (var i = 0; i < dataArr.length; i++) {
                            var str = `dataArr[${i}]=`;
                            for (var j = 0; j < 20 && i < dataArr.length; j++, i++) {
                                str = str + "," + dataArr[i];
                            }
                            console.info(`${testNum} packing ` + str);
                            i--;
                            line++;
                        }
                        console.info(`${testNum} packing show end(line: ${line}  )`);
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info(`${testNum} packing failed`);
                        expect(false).assertTrue();
                        done();
                    }
                }
            } catch (error) {
                console.info(`${testNum} packingPromise error: ` + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function createPixelMapPromise(done, testNum, picName, decodeOpts, packFunc, packOpts) {
            let imageSourceApi;
            try {
                await getFd(picName);
                imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info(`${testNum} create imagesource failed`);
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info(`${testNum} create imagesource success`);
                    let pixelmap = await imageSourceApi.createPixelMap(decodeOpts);
                    if (pixelmap != undefined) {
                        console.info(`${testNum} create pixelmap success`);
                        let imageInfo = await pixelmap.getImageInfo();
                        expect(imageInfo.size.width).assertEqual(32);
                        expect(imageInfo.size.height).assertEqual(16);
                        packFunc(done, testNum, pixelmap, packOpts);
                    } else {
                        console.info(`${testNum} create pixelmap failed`);
                        expect(false).assertTrue();
                        done();
                    }
                }
            } catch (error) {
                console.info(`${testNum}  error: ` + error);
                expect(false).assertTrue();
                done();
            }
        }

        async function createPixelMapCallBack(done, testNum, picName, decodeOpts, packFunc, packOpts) {
            let imageSourceApi;
            await getFd(picName);
            imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create imagesource failed`);
                expect(false).assertTrue();
                done();
            } else {
                console.info(`${testNum} create imagesource success`);
                imageSourceApi.createPixelMap(decodeOpts, async (err, pixelmap) => {
                    if (err != undefined) {
                        console.info(`${testNum} createPixelMap create pixelmap failed err: ${err}`);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum} createPixelMap success`);
                    expect(pixelmap != undefined).assertTrue();
                    let imageInfo = await pixelmap.getImageInfo();
                    expect(imageInfo.size.width).assertEqual(4);
                    expect(imageInfo.size.height).assertEqual(2);
                    packFunc(done, testNum, pixelmap, packOpts);
                });
            }
        }

        async function createPixelMapCallBackErr(done, testNum, picName, decodeOpts) {
            let imageSourceApi;
            await getFd(picName);
            imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} createPixelMapPromise create imagesource failed`);
                expect(false).assertTrue();
                done();
            } else {
                console.info(`${testNum} createPixelMapPromise create imagesource success`);
                imageSourceApi.createPixelMap(decodeOpts, (err, pixelmap) => {
                    expect(err != undefined).assertTrue();
                    console.info(`${testNum} success: ` + err);
                    done();
                });
            }
        }

        async function createPixelMapPromiseErr(done, testNum, picName, decodeOpts) {
            let imageSourceApi;
            await getFd(picName);
            imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} createPixelMapPromise create imagesource failed`);
                expect(false).assertTrue();
                done();
            } else {
                console.info(`${testNum} createPixelMapPromise create imagesource success`);
                try {
                    await imageSourceApi.createPixelMap(decodeOpts);
                    expect(false).assertTrue();
                    done();
                } catch (error) {
                    expect(true).assertTrue();
                    console.info(`${testNum} error: ` + error);
                    done();
                }
            }
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_0100
         * @tc.name      : createPixelMap - promise
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.create PixelMap
         *                 4.packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_0100", 0, async function (done) {
            let decodeOpts = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 32, height: 16 },
                rotate: 0,
                desiredPixelFormat: RGBA_8888,
                index: 0,
            };
            let packOpts = { format: ["image/webp"], quality: 100 };
            createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_0100", "test_large.svg", decodeOpts,
                packingPromise, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_0100
         * @tc.name      : createPixelMap - callback
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.create PixelMap
         *                 4.packing
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_0100", 0, async function (done) {
            let decodeOpts = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 4, height: 2 },
                rotate: 0,
                desiredPixelFormat: RGBA_8888,
                index: 0,
            };
            let packOpts = { format: ["image/webp"], quality: 100 };
            createPixelMapCallBack(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_0100", "test_large.svg", decodeOpts,
                packingPromise, packOpts);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0100
         * @tc.name      : createPixelMap - callback-sampleSize: -1
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 3
         */
        it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0100", 0, async function (done) {
            let decodingOption = {
                sampleSize: -1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 0,
                desiredPixelFormat: RGBA_8888,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0,
            };
            await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0100", "test_large.svg",
                decodingOption);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0200
         * @tc.name      : createPixelMap - callback-index: -1
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 3
         */
        it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0200", 0, async function (done) {
            let decodingOption = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 0,
                desiredPixelFormat: RGBA_8888,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: -1,
            };
            await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0200", "test_large.svg",
                decodingOption);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0300
         * @tc.name      : createPixelMap - callback-rotate: 500
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 3
         */
        it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0300", 0, async function (done) {
            let decodingOption = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 500,
                desiredPixelFormat: RGBA_8888,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0,
            };
            await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0300", "test_large.svg",
                decodingOption);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0400
         * @tc.name      : createPixelMap - callback-desiredPixelFormat: 33
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 3
         */
        it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0400", 0, async function (done) {
            let decodingOption = {
                sampleSize: 1,
                editable: false,
                desiredSize: { width: 1, height: 2 },
                rotate: 0,
                desiredPixelFormat: 33,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0,
            };
            await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0400", "test_large.svg",
                decodingOption);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0500
         * @tc.name      : createPixelMap - callback-{x: 10000, y: 0 }
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 3
         */
        it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0500", 0, async function (done) {
            let decodingOption = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 0,
                desiredPixelFormat: RGBA_8888,
                desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 0 },
                index: 0,
            };
            await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0500", "test_large.svg",
                decodingOption);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0600
         * @tc.name      : createPixelMap - callback-{x: 0, y: 10000 }
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 3
         */
        it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0600", 0, async function (done) {
            let decodingOption = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 0,
                desiredPixelFormat: RGBA_8888,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 10000 },
                index: 0,
            };
            await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0600", "test_large.svg",
                decodingOption);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0100
         * @tc.name      : createPixelMap - promise-sampleSize: -1
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 3
         */
        it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0100", 0, async function (done) {
            let decodingOption = {
                sampleSize: -1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 0,
                desiredPixelFormat: RGBA_8888,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0,
            };
            await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0100", "test_large.svg",
                decodingOption);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0200
         * @tc.name      : createPixelMap - promise-index: -1
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 3
         */
        it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0200", 0, async function (done) {
            let decodingOption = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 0,
                desiredPixelFormat: RGBA_8888,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: -1,
            };
            await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0200", "test_large.svg",
                decodingOption);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0300
         * @tc.name      : createPixelMap - promise-rotate: 500
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 3
         */
        it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0300", 0, async function (done) {
            let decodingOption = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 500,
                desiredPixelFormat: RGBA_8888,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0,
            };
            await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0300", "test_large.svg",
                decodingOption);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0400
         * @tc.name      : createPixelMap - promise-desiredPixelFormat: 33
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 3
         */
        it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0400", 0, async function (done) {
            let decodingOption = {
                sampleSize: 1,
                editable: false,
                desiredSize: { width: 1, height: 2 },
                rotate: 0,
                desiredPixelFormat: 33,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0,
            };
            await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0400", "test_large.svg",
                decodingOption);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0500
         * @tc.name      : createPixelMap - promise-{x: 10000, y: 0}
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 3
         */
        it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0500", 0, async function (done) {
            let decodingOption = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 0,
                desiredPixelFormat: RGBA_8888,
                desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 0 },
                index: 0,
            };
            await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0500", "test_large.svg",
                decodingOption);
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0600
         * @tc.name      : createPixelMap - promise-{x: 0, y: 10000}
         * @tc.desc      : 1.create imagesource
         *                 2.set DecodeOptions
         *                 3.create PixelMap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 3
         */
        it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0600", 0, async function (done) {
            let decodingOption = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 0,
                desiredPixelFormat: RGBA_8888,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 10000 },
                index: 0,
            };
            await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0600", "test_large.svg",
                decodingOption);
        });
    });
}