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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import { base64Image, scale2x1, translate3x1, rotate90, flipH, testBmp, testGif, crop3x3, scale1x4, 
setAlpha8, translate1x3 }from './testImg2.test'
import { testPng ,testJpg} from "./testImg.test";
import { BusinessError } from '@ohos.base';

interface Size {
    height: number;
    width: number;
}


interface RegionType {
    size: Size;
    x: number;
    y: number;
}

interface DecodingOptions {
    sampleSize: number;
}

export default function addImage() {
    describe("addImage", () => {
        const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
        let incSouce: image.ImageSource;
        beforeAll(async () => {
            console.info("beforeAll case");
        });
        beforeEach(() => {
            console.info("beforeEach case");
        });
        afterEach(async () => {
            console.info("afterEach case");
            if (incSouce != undefined) {
                try {
                    await incSouce.release();
                } catch (error) {
                    console.info("incSouce release faile :" + error);
                }
            }
        });
        afterAll(async () => {
            console.info("afterAll case");
        });

        let createPixMapPromise = (done: Function, testNum: string, opts: image.InitializationOptions) => {
            const Color = new ArrayBuffer(96);
            image
                .createPixelMap(Color, opts)
                .then((pixelmap) => {
                    expect(pixelmap != undefined).assertTrue();
                    console.info(`${testNum} success`);
                    done();
                })
                .catch((error : BusinessError) => {
                    console.log(`${testNum} error: ` + error);
                    expect(false).assertTrue();
                    done();
                });
        }

        let createPixMapCb = (done: Function, testNum: string, opts: image.InitializationOptions) => {
            const Color = new ArrayBuffer(96);
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                expect(pixelmap != undefined).assertTrue();
                console.info(`${testNum} success`);
                done();
            });
        }

        let createPixMapSync = (done: Function, testNum: string, opts: image.InitializationOptions) => {
            const Color = new ArrayBuffer(96);
            let pixelmap = image.createPixelMapSync(Color, opts);
            expect(pixelmap != undefined).assertTrue();
            console.info(`${testNum} success`);
            done();
        }

        let createIncrementalSourcePromise = async(done: Function, testNum: string, type: string, opts?: image.SourceOptions | undefined) => {
            let testimagebuffer: ESObject = testPng;
            console.info(`${testNum} 0001 ` + testimagebuffer.length);
            let bufferSize = 5000;
            let offset = 0;
            if (type == "sourceOpts") {
                console.info(`${testNum} have sourceopts`);
                incSouce = image.CreateIncrementalSource(new ArrayBuffer(1), opts);
            } else {
                console.info(`${testNum} no sourceopts`);
                incSouce = image.CreateIncrementalSource(new ArrayBuffer(1));
            }
            let ret: ESObject;
            let isFinished = false;
            while (offset < testimagebuffer.length) {
                let oneStep: ESObject = testimagebuffer.slice(offset, offset + bufferSize);
                console.info(`${testNum} 0002 ` + oneStep.length);
                if (oneStep.length < bufferSize) {
                    isFinished = true;
                }
                ret = await incSouce.updateData(oneStep, isFinished, 0, oneStep.length);
                if (!ret) {
                    console.info(`${testNum} updateData failed`);
                    expect(ret).assertTrue();
                    break;
                }
                offset = offset + oneStep.length;
                console.info(`${testNum} 0003 ` + offset);
            }
            if (ret) {
                console.info(`${testNum} updateData success `);
                let decodingOptions: DecodingOptions = {
                    sampleSize: 1,
                };
                incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(`${testNum} createPixelMap err: ` + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum} 0004` + pixelmap);
                    expect(pixelmap != undefined).assertTrue();
                    done();
                });
            } else {
                expect(false).assertTrue();
                done();
            }
        }

       let createIncrementalSourceCb = async (done: Function, testNum: string, type: string, opts: image.SourceOptions | undefined) => {
            let testimagebuffer: ESObject = testPng;
            console.info(`${testNum} 0001 ` + testimagebuffer.length);
            let bufferSize = 5000;
            let offset = 0;
            if (type == "sourceOpts") {
                incSouce = image.CreateIncrementalSource(new ArrayBuffer(1), opts);
            } else {
                incSouce = image.CreateIncrementalSource(new ArrayBuffer(1));
            }
            let ret: ESObject;
            let isFinished = false;
            while (offset < testimagebuffer.length) {
                let oneStep: ESObject = testimagebuffer.slice(offset, offset + bufferSize);
                console.info(`${testNum} 0002 ` + oneStep.length);
                if (oneStep.length < bufferSize) {
                    isFinished = true;
                }
                ret = await new Promise<void>((res) => {
                    incSouce.updateData(oneStep, isFinished, 0, oneStep.length, (err, ret) => {
                        res(ret);
                    });
                });
                if (!ret) {
                    console.info(`${testNum} updateData failed`);
                    expect(ret).assertTrue();
                    break;
                }
                offset = offset + oneStep.length;
                console.info(`${testNum} 0003 ` + offset);
            }
            if (ret) {
                console.info(`${testNum} updateData success `);
                let decodingOptions: DecodingOptions = {
                    sampleSize: 1,
                };
                incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info(`${testNum} createPixelMap err: ` + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum} 0004` + pixelmap);
                    expect(pixelmap != undefined).assertTrue();
                    done();
                });
            } else {
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0100
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 1, alphaType: 0)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0100", 0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: 3,
                size: {
                    height: 4, width: 6
                },
                scaleMode: 1,
                alphaType: 0
            };
            createPixMapPromise(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0100", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0200
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 1, alphaType: 1)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0200", 0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: 3,
                size: {
                    height: 4, width: 6
                },
                scaleMode: 1,
                alphaType: 1
            };
            createPixMapPromise(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0200", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0300
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 0, alphaType: 2)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0300", 0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: 3,
                size: {
                    height: 4, width: 6
                },
                scaleMode: 0,
                alphaType: 2
            };
            createPixMapPromise(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0300", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0400
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 0, alphaType: 3)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0400", 0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: 3,
                size: {
                    height: 4, width: 6
                },
                scaleMode: 0,
                alphaType: 3
            };
            createPixMapPromise(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0400", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0100
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 1, alphaType: 0)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0100", 0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: 3,
                size: {
                    height: 4, width: 6
                },
                scaleMode: 1,
                alphaType: 0
            };
            createPixMapSync(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0100", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0200
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 1, alphaType: 1)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0200", 0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: 3,
                size: {
                    height: 4, width: 6
                },
                scaleMode: 1,
                alphaType: 1
            };
            createPixMapSync(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0200", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0300
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 0, alphaType: 2)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0300", 0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: 3,
                size: {
                    height: 4, width: 6
                },
                scaleMode: 0,
                alphaType: 2
            };
            createPixMapSync(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0300", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0400
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 0, alphaType: 3)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0400", 0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: 3,
                size: {
                    height: 4, width: 6
                },
                scaleMode: 0,
                alphaType: 3
            };
            createPixMapSync(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0400", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SCALE_PIXELMAP_SYNC_0100
         * @tc.name      : Pixelmap Scale-sync
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SCALE_PIXELMAP_SYNC_0100', 0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 2, size: {
                    height: 6, width: 8
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_SCALE_PIXELMAP_SYNC_0100 createPixelMap failed');
                expect(false).assertTrue();
                done();
            }
            let numberX = 1.0;
            let numberY = 4.0;
            let res = false;
            pixelmap.scaleSync(numberX, numberY);
            res = true;
            if (!res) {
                console.info('SUB_MULTIMEDIA_IMAGE_SCALE_PIXELMAP_SYNC_0100 scale2x1 failed');
                expect(false).assertTrue();
                done();
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_SCALE_PIXELMAP_SYNC_0100 success ');
                expect(true).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_SCALE_PIXELMAP_SYNC_0200
         * @tc.name      : Pixelmap Scale-sync
         * @tc.desc      : 1.create pixelmap
         *               : 2.call scale
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_SCALE_PIXELMAP_SYNC_0200', 0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 2, size: {
                    height: 6, width: 8
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_SCALE_PIXELMAP_SYNC_0200 createPixelMap failed');
                expect(false).assertTrue();
                done();
            }
            let numberX = 2.0;
            let numberY = 1.0;
            let res = false;
            pixelmap.scaleSync(numberX, numberY);
            res = true;
            if (!res) {
                console.info('SUB_MULTIMEDIA_IMAGE_SCALE_PIXELMAP_SYNC_0200 scale2x1 failed');
                expect(false).assertTrue();
                done();
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_SCALE_PIXELMAP_SYNC_0200 success ');
                expect(true).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_SYNC_ALPHA_0100
         * @tc.name      : opacity-sync-alpha
         * @tc.desc      : 1.create pixelmap
         *               : 2.opacity-sync
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_SYNC_ALPHA_0100', 0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 2, size: {
                    height: 6, width: 8
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_SYNC_ALPHA_0100 createPixelMap failed');
                expect(false).assertTrue();
                done();
            }
            let res = false;
            pixelmap.opacitySync(0.8);
            res = true;
            if (!res) {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_SYNC_ALPHA_0100 failed');
                expect(false).assertTrue();
                done();
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_OPACITY_SYNC_ALPHA_0100 success ');
                expect(true).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0100
         * @tc.name      : createAlphaPixelmap-sync
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.create AlphaPixelmapsync
         *               : 4.call getImageInfo
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0100', 0, async (done: Function) => {
            let imageData: ESObject = testPng.buffer;
            let imageSource = image.createImageSource(imageData);
            if (imageSource != undefined) {
                let pixelMap = imageSource.createPixelMapSync();
                if (pixelMap != undefined) {
                    let alphaPixelMap = pixelMap.createAlphaPixelmapSync();
                    if (alphaPixelMap != undefined) {
                        let imageInfo = alphaPixelMap.getImageInfoSync();
                        expect(imageInfo.pixelFormat == 6).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0100 success ');
                        done();
                    } else {
                        console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0100 failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0100 failed ');
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0100 failed ');
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0200
         * @tc.name      : createAlphaPixelmap-sync
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.create AlphaPixelmapsync
         *               : 4.call getImageInfo
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0200', 0, async (done: Function) => {
            let imageData: ESObject = testJpg.buffer;
            let imageSource = image.createImageSource(imageData);
            if (imageSource != undefined) {
                let pixelMap = imageSource.createPixelMapSync();
                if (pixelMap != undefined) {
                    let alphaPixelMap = pixelMap.createAlphaPixelmapSync();
                    if (alphaPixelMap != undefined) {
                        let imageInfo = alphaPixelMap.getImageInfoSync();
                        expect(imageInfo.pixelFormat == 6).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0200 success ');
                        done();
                    } else {
                        console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0200 failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0200 failed ');
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0200 failed ');
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0300
         * @tc.name      : createAlphaPixelmap-sync
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.create AlphaPixelmapsync
         *               : 4.call getImageInfo
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0300', 0, async (done: Function) => {
            let imageData: ESObject = testBmp.buffer;
            let imageSource = image.createImageSource(imageData);
            if (imageSource != undefined) {
                let pixelMap = imageSource.createPixelMapSync();
                if (pixelMap != undefined) {
                    let alphaPixelMap = pixelMap.createAlphaPixelmapSync();
                    if (alphaPixelMap != undefined) {
                        let imageInfo = alphaPixelMap.getImageInfoSync();
                        expect(imageInfo.pixelFormat == 6).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0300 success ');
                        done();
                    } else {
                        console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0300 failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0300 failed ');
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0300 failed ');
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0400
         * @tc.name      : createAlphaPixelmap-sync
         * @tc.desc      : 1.create imagesource
         *               : 2.create pixelmap
         *               : 3.create AlphaPixelmapsync
         *               : 4.call getImageInfo
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0400', 0, async (done: Function) => {
            let imageData: ESObject = testGif.buffer;
            let imageSource = image.createImageSource(imageData);
            if (imageSource != undefined) {
                let pixelMap = imageSource.createPixelMapSync();
                if (pixelMap != undefined) {
                    let alphaPixelMap = pixelMap.createAlphaPixelmapSync();
                    if (alphaPixelMap != undefined) {
                        let imageInfo = alphaPixelMap.getImageInfoSync();
                        expect(imageInfo.pixelFormat == 6).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0400 success ');
                        done();
                    } else {
                        console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0400 failed ');
                        expect(false).assertTrue();
                        done();
                    }
                } else {
                    console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0400 failed ');
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CREATEALPHAPIXELMAP_SYNC_0400 failed ');
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_TRANSLATE_PIXELMAP_SYNC_0100
         * @tc.name      : Pixelmap Translate -sync
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translatesync
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_TRANSLATE_PIXELMAP_SYNC_0100', 0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 2, size: {
                    height: 6, width: 8
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_TRANSLATE_PIXELMAP_SYNC_0100 createPixelMap failed');
                expect(false).assertTrue();
                done();
            }
            let numberX = 3.0;
            let numberY = 1.0;
            let res = false;
            pixelmap.translateSync(numberX, numberY);
            res = true;
            if (!res) {
                console.info('SUB_MULTIMEDIA_IMAGE_TRANSLATE_PIXELMAP_SYNC_0100 failed');
                expect(false).assertTrue();
                done();
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_TRANSLATE_PIXELMAP_SYNC_0100 success ');
                expect(true).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_TRANSLATE_PIXELMAP_SYNC_0200
         * @tc.name      : Pixelmap Translate -sync
         * @tc.desc      : 1.create pixelmap
         *               : 2.call translatesync
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_TRANSLATE_PIXELMAP_SYNC_0200', 0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 2, size: {
                    height: 6, width: 8
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_TRANSLATE_PIXELMAP_SYNC_0200 createPixelMap failed');
                expect(false).assertTrue();
                done();
            }
            let numberX = 1.0;
            let numberY = 3.0;
            let res = false;
            pixelmap.translateSync(numberX, numberY);
            res = true;
            if (!res) {
                console.info('SUB_MULTIMEDIA_IMAGE_TRANSLATE_PIXELMAP_SYNC_0200 failed');
                expect(false).assertTrue();
                done();
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_TRANSLATE_PIXELMAP_SYNC_0200 success ');
                expect(true).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_SYNC_0100
         * @tc.name      : Pixelmap Rotate-sync
         * @tc.desc      : 1.create pixelmap
         *               : 2.call rotate
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_SYNC_0100', 0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 2, size: {
                    height: 6, width: 8
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_SYNC_0100 createPixelMap failed');
                expect(false).assertTrue();
                done();
            }
            let res = false;
            pixelmap.rotateSync(90.0);
            res = true;
            if (!res) {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_SYNC_0100 failed');
                expect(false).assertTrue();
                done();
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_ROTATE_SYNC_0100 success ');
                expect(true).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_SYNC_0100
         * @tc.name      : Pixelmap Flip-sync
         * @tc.desc      : 1.create pixelmap
         *               : 2.call flip
         *               : 3.get pixelbytesnumber
         *               : 4.read pixels to buffer
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_SYNC_0100', 0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 2, size: {
                    height: 6, width: 8
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_SYNC_0100 createPixelMap failed');
                expect(false).assertTrue();
                done();
            }
            let res = false;
            pixelmap.flipSync(false, true);
            res = true;
            if (!res) {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_SYNC_0100 failed');
                expect(false).assertTrue();
                done();
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_PIXELMAP_FLIP_SYNC_0100 success ');
                expect(true).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_SYNC_0100
         * @tc.name      : crop-promise
         * @tc.desc      : 1.create PixelMap
         *               : 2.crop
         *               : 3.getImageInfo
         *               : 4.getPixelBytesNumber
         *               : 5.readPixelsToBuffer
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_SYNC_0100', 0, async (done: Function) => {
            let region: RegionType = {
                size: {
                    height: 3, width: 3
                }, x: 1, y: 1
            };
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 2, size: {
                    height: 6, width: 8
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_SYNC_0100 createPixelMap failed');
                expect(false).assertTrue();
                done();
            }
            let res = false;
            pixelmap.cropSync(region);
            res = true;
            if (!res) {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_SYNC_0100 failed');
                expect(false).assertTrue();
                done();
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPFRAMEWORK_CROP_SYNC_0100 success ');
                expect(true).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0100
         * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 0, alphaType: 0)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0100", 0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: 3,
                size: {
                    height: 4, width: 6
                },
                scaleMode: 0,
                alphaType: 0
            };
            createPixMapCb(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0100", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0200
         * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 0, alphaType: 1)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0200", 0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: 3,
                size: {
                    height: 4, width: 6
                },
                scaleMode: 0,
                alphaType: 1
            };
            createPixMapCb(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0200", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0300
         * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 1, alphaType: 2)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0300", 0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: 3,
                size: {
                    height: 4, width: 6
                },
                scaleMode: 1,
                alphaType: 2
            };
            createPixMapCb(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0300", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0400
         * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer,scaleMode: 1, alphaType: 3)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0400", 0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: 3,
                size: {
                    height: 4, width: 6
                },
                scaleMode: 1,
                alphaType: 3
            };
            createPixMapCb(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0400", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_0100
         * @tc.name      : createIncrementalSource-updateData-png-promise
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_0100", 0, async (done: Function) => {
            let opts: image.SourceOptions = {
                sourceDensity: 240, sourcePixelFormat: RGBA_8888, sourceSize: {
                    height: 4, width: 6
                }
            };
            createIncrementalSourcePromise(done,
                "SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_0100", "noSourceOpts",undefined);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_0200
         * @tc.name      : createIncrementalSource-updateData-png-promise
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_0200", 0, async (done: Function) => {
            let opts: image.SourceOptions = {
                sourceDensity: 240, sourcePixelFormat: RGBA_8888, sourceSize: {
                    height: 4, width: 6
                }
            };
            createIncrementalSourcePromise(done,
                "SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_PROMISE_0200", "sourceOpts", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_0100
         * @tc.name      : createIncrementalSource-updateData-png-callback
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_0100", 0, async (done: Function) => {
            let opts: image.SourceOptions = {
                sourceDensity: 240, sourcePixelFormat: RGBA_8888, sourceSize: {
                    height: 4, width: 6
                }
            };
            createIncrementalSourceCb(done, "SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_0100",
                "noSourceOpts", undefined);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_0200
         * @tc.name      : createIncrementalSource-updateData-png-callback
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_0200", 0, async (done: Function) => {
            let opts: image.SourceOptions = {
                sourceDensity: 240, sourcePixelFormat: RGBA_8888, sourceSize: {
                    height: 4, width: 6
                }
            };
            createIncrementalSourceCb(done, "SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_PNG_CALLBACK_0200",
                "sourceOpts", opts);
        });
    });
}
