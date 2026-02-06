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

import image from '@ohos.multimedia.image'
import rpc from '@ohos.rpc'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import { testPng, testJpg } from './testImg.test'
import { tcBuf020, tcBuf020_1, tcBuf021, tcBuf021_1, tcBuf022 } from './testImg.test'
import { BusinessError } from '@ohos.base'
import common from '@ohos.app.ability.common'
import fs from '@ohos.file.fs'

let pixelMap: image.PixelMap;
let pixel_map: image.PixelMap;
let testContext: common.UIAbilityContext;

export default function imageJsTest() {
    describe('imageJsTest', () => {
        let filePath: string;
        let fdNumber: number;
        let globalpixelmap: image.PixelMap;
        let globalimageSource: image.ImageSource;
        let globalpacker: image.ImagePacker;

        class MySequence1 {
            pixel_map: image.PixelMap;

            constructor(pixelmap: image.PixelMap) {
                this.pixel_map = pixelmap;
            }

            marshalling(messageSequence: rpc.MessageSequence) {
                this.pixel_map.marshalling(messageSequence);
                return true;
            }

            async unmarshalling(messageSequence: rpc.MessageSequence) {
                this.pixel_map.unmarshalling(messageSequence).then(async (pixelMap: image.PixelMap) => {
                    this.pixel_map = pixelMap;
                });
                return true;
            }
        }

        class MySequence2 {
            pixel_map: image.PixelMap;

            constructor(pixelmap: image.PixelMap) {
                this.pixel_map = pixelmap;
            }

            marshalling(messageSequence: rpc.MessageSequence) {
                this.pixel_map.marshalling(messageSequence);
                return true;
            }

            async unmarshalling(messageSequence: rpc.MessageSequence) {
                this.pixel_map.unmarshalling(messageSequence).then(async (pixelMap: image.PixelMap) => {
                    this.pixel_map = pixelMap;
                });
                return true;
            }
        }

        class MySequence3 {
            pixel_map: image.PixelMap;

            constructor(pixelmap: image.PixelMap) {
                this.pixel_map = pixelmap;
            }

            marshalling(messageSequence: rpc.MessageSequence) {
                this.pixel_map.marshalling(messageSequence);
                return true;
            }

            async unmarshalling(messageSequence: rpc.MessageSequence) {
                this.pixel_map = image.createPixelMapFromParcel(messageSequence);
                return true;
            }
        }

        let getFd = async (fileName: number | string) => {
            let pathDir = testContext.filesDir;
            filePath = pathDir + '/' + fileName;
            try {
                let file = fs.openSync(filePath);
                fdNumber = file.fd;
                console.info('image case fdNumber is ' + fdNumber);
            } catch (err) {
                console.info("image case open fd errss " + JSON.stringify(err));
            }
        }

        let sleep = (ms?: number | undefined): Promise<void> => {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        let createPixeMapSync = (done: Function, testNum: string, opts: image.InitializationOptions) => {
            let pixelmap = image.createPixelMapSync(opts);
            expect(pixelmap != undefined).assertTrue();
            console.info(`${testNum} success`);
            done();
        }

        let testImageSourceImageInfoMimetype = async(done: Function, testNum: string, pictureFormat: string, expectedMimetype: string, flag: string) => {
            try {
                await getFd(pictureFormat);
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    expect(false).assertTrue();
                    console.info(testNum + ' create image source failed');
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    if (flag == 'Promise') {
                        imageSourceApi.getImageInfo().then(imageInfo => {
                            expect(imageInfo.mimeType == expectedMimetype).assertTrue();
                            console.info(testNum + ' success imageinfo.encodedformat: ' + imageInfo.mimeType);
                            done();
                        }).catch((error:BusinessError) => {
                            expect().assertFail();
                            console.log(testNum + ' getimageinfo error: ' + error);
                            done();
                        });
                    } else if (flag == 'PromiseNumber') {
                        imageSourceApi.getImageInfo(0).then(imageInfo => {
                            expect(imageInfo.mimeType == expectedMimetype).assertTrue();
                            console.info(testNum + ' success imageinfo.encodedformat: ' + imageInfo.mimeType);
                            done();
                        }).catch((error: BusinessError) => {
                            expect().assertFail();
                            console.log(testNum + ' getimageinfo error: ' + error);
                            done();
                        });
                    } else if (flag == 'Callback') {
                        imageSourceApi.getImageInfo((err, imageInfo) => {
                            if (err) {
                                expect(false).assertTrue();
                                console.info(testNum + ' error' + err);
                                done();
                            }
                            if (imageInfo != undefined && imageInfo != null) {
                                expect(imageInfo.mimeType == expectedMimetype).assertTrue();
                                console.info(testNum + 'success imageInfo.mimeType:' + imageInfo.mimeType);
                                done();
                            } else {
                                expect(false).assertTrue();
                                console.info(testNum + ' failed');
                                done();
                            }
                        });
                    } else if (flag == 'CallbackNumber') {
                        imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                            if (err) {
                                expect(false).assertTrue();
                                console.info(testNum + ' error' + err);
                                done();
                            }
                            if (imageInfo != undefined && imageInfo != null) {
                                expect(imageInfo.mimeType == expectedMimetype).assertTrue();
                                console.info(testNum + 'success imageInfo.mimeType:' + imageInfo.mimeType);
                                done();
                            } else {
                                expect(false).assertTrue();
                                console.info(testNum + ' failed');
                                done();
                            }
                        });
                    }
                }
            } catch (error) {
                expect(false).assertTrue();
                console.info(testNum + ' error: ' + error);
                done();
            }
        }

        let testPixelMapImageInfoMimetype = async(done: Function, testNum: string, pictureFormat: string, expectedMimetype: string, flag: string) => {
            try {
                await getFd(pictureFormat);
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    expect(false).assertTrue();
                    console.info(testNum + ' create image source failed');
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        if (pixelmap == undefined) {
                            globalpixelmap = pixelmap;
                            expect(false).assertTrue();
                            console.info(testNum + ' create pixelmap fail');
                            done();
                        }
                        if (flag == 'Promise') {
                            pixelmap.getImageInfo().then(imageInfo => {
                                if (imageInfo == undefined) {
                                    expect(false).assertTrue();
                                    console.info(testNum + ' imageInfo is empty');
                                } else {
                                    expect(imageInfo.mimeType == expectedMimetype).assertTrue();
                                    console.info(testNum + ' pixelmap imageinfo.encodedformat:' + imageInfo.mimeType);
                                }
                                done();
                            });
                        } else if (flag == 'PromiseNumber') {
                            pixelmap.getImageInfo().then(imageInfo => {
                                if (imageInfo == undefined) {
                                    expect(false).assertTrue();
                                    console.info(testNum + ' imageInfo is empty');
                                } else {
                                    expect(imageInfo.mimeType == expectedMimetype).assertTrue();
                                    console.info(testNum + ' pixelmap imageinfo.encodedformat:' + imageInfo.mimeType);
                                }
                                done();
                            });
                        } else if (flag == 'Callback') {
                            pixelmap.getImageInfo((err, imageInfo) => {
                                if (imageInfo == undefined) {
                                    expect(false).assertTrue();
                                    console.info(testNum + ' imageInfo is empty');
                                } else {
                                    expect(imageInfo.mimeType == expectedMimetype).assertTrue();
                                    console.info(testNum + ' pixelmap imageinfo.encodedformat:' + imageInfo.mimeType);
                                }
                                done();
                            });
                        }
                    });
                }
            } catch (error) {
                expect(false).assertTrue();
                console.info(testNum + ' error: ' + error);
                done();
            }
        }

        beforeAll(async () => {
            testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
            console.info('beforeAll case');
        });
        beforeEach(() => {
            console.info('beforeEach case');
        });
        afterEach(async () => {
            if (globalpixelmap != undefined) {
                console.info('globalpixelmap release start');
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info('globalpixelmap release fail');
                }
            }
            if (globalimageSource != undefined) {
                console.info('globalimageSource release start');
                try {
                    await globalimageSource.release();
                } catch (error) {
                    console.info('globalimageSource release fail');
                }
            }
            if (globalpacker != undefined) {
                console.info('globalpacker release start');
                try {
                    await globalpacker.release();
                } catch (error) {
                    console.info('globalpacker release fail');
                }
            }
            console.info('afterEach case');
        });
        afterAll(async () => {
            console.info('afterAll case');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0500
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGBA_8888, size: { height: 4, width: 6 }, bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0500 success');
                    done();
                })
                .catch((error: BusinessError) => {
                    console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0500 error: ' + error);
                    expect().assertFail();
                    done();
                });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0500
         * @tc.name      : create pixelmap-callback (editable: false, pixelFormat: RGBA_8888, size: { height: 4, width: 6 },bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0500', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let opts: image.InitializationOptions= {
                editable: false, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0500 err' + err);
                    done();
                    return;
                }
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0500 success');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0600
         * @tc.name      : createpixelmap-promise (editable: true, pixelFormat: RGB_565, size: { height: 6, width: 8 },bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 2, size: {
                    height: 6, width: 8
                }
            };
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0600 success');
                    done();
                })
                .catch((error: BusinessError) => {
                    console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0600 error: ' + error);
                    expect().assertFail();
                    done();
                });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0600
         * @tc.name      : createpixelmap-callback (editable: false, pixelFormat: RGB_565, size: { height: 6, width: 8 },bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0600', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: false, pixelFormat: 2, size: {
                    height: 6, width: 8
                }
            };
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0600 err' + err);
                    done();
                    return;
                }
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0600 success');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0700
         * @tc.name      : createpixelmap-promise(editable: true, pixelFormat: unkonwn, size: { height: 6, width: 8 })
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0700', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 0, size: {
                    height: 6, width: 8
                }
            };
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0700 success');
                    done();
                })
                .catch((error: BusinessError) => {
                    console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0700 error: ' + error);
                    expect().assertFail();
                    done();
                });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0700
         * @tc.name      : create pixelmap-callback(editable: false, pixelFormat: unkonwn, size: { height: 6, width: 8 })
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using colorand opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0700', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: false, pixelFormat: 0, size: {
                    height: 6, width: 8
                }
            };
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0700 err' + err);
                    done();
                    return;
                }
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0700 success');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0800
         * @tc.name      : create pixelmap-callback(editable: true, pixelFormat: RGBA_8888, size: { height: 6, width: 8 } bytes > buffer )
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0800', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 6, width: 8
                }
            };
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0800 err' + err);
                    done();
                    return;
                }
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0800 success');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0900
         * @tc.name      : create pixelmap-callback(editable: true, pixelFormat: RGB_565, size: { height: 2, width: 3 }, bytes < buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0900', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 2, size: {
                    height: 2, width: 3
                }
            };
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0900 err' + err);
                    done();
                    return;
                }
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0900 success');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1000
         * @tc.name      : create pixelmap-callback(editable: true, pixelFormat: unkonwn, size: { height: -1, width: -1 })
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1000', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 0, size: {
                    height: -1, width: -1
                }
            };
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1000 success' + err);
                    done();
                    return;
                }
                globalpixelmap = pixelmap;
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1000 fail');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1100
         * @tc.name      : create pixelmap-callback(editable: true, pixelFormat: unsupported format, size: { height: 6, width: 8 })
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size(Unsupported formats are converted to RGBA_8888)
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1100', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 21, size: {
                    height: 6, width: 8
                }
            };
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1100 err' + err);
                    done();
                    return;
                }
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1100 success');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_PROMISE_0100
         * @tc.name      : readPixelsToBuffer-promise
         * @tc.desc      : read all pixels to an buffer
         *                 1.create PixelMap,buffer
         *                 2.call readPixelsToBuffer
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
            console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_PROMISE_0100 in');
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 4, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_PROMISE_0100 createPixelMap failed');
                        expect(false).assertTrue();
                        done();
                    }
                    const readBuffer = new ArrayBuffer(96);
                    pixelmap.readPixelsToBuffer(readBuffer).then(() => {
                        let bufferArr2 = new Uint8Array(readBuffer);
                        let res = true;
                        for (let i = 0; i < bufferArr2.length; i++) {
                            if (bufferArr2[i] != tcBuf020[i]) {
                                res = false;
                                console.info('TC_20_buffer' + bufferArr2[i]);
                                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_PROMISE_0100 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_PROMISE_0100 success');
                            done();
                        }
                    }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_PROMISE_0100 read error: ' + error);
                        expect().assertFail();
                        done();
                    });
                }).catch((error: BusinessError) => {
                console.log('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_PROMISE_0100 error: ' + error);
                expect().assertFail();
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_SYNC_0100
         * @tc.name      : readPixelsToBufferSync
         * @tc.desc      : read all pixels to buffer
         *                 1.create PixelMap, buffer
         *                 2.call readPixelsToBufferSync
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_SYNC_0100', Level.LEVEL0, async (done: Function) => {
            console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_SYNC_0100 in');
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 4, size: {
                    height: 4, width: 6
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_SYNC_0100 createPixelMap failed');
                expect(false).assertTrue();
            }
            const readBuffer = new ArrayBuffer(96);
            pixelmap.readPixelsToBufferSync(readBuffer);
            let bufferArr2 = new Uint8Array(readBuffer);
            let res = true;
            for (let i = 0; i < bufferArr2.length; i++) {
                if (bufferArr2[i] != tcBuf020[i]) {
                    res = false;
                    console.info('TC_20_buffer' + bufferArr2[i]);
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_SYNC_0100 failed');
                    expect(false).assertTrue();
                    done();
                    break;
                }
            }
            if (res) {
                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_SYNC_0100 success');
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0100
         * @tc.name      : readPixelsToBuffer-callback
         * @tc.desc      : read all pixels to an buffer
         *                 1.create PixelMap,buffer
         *                 2.call readPixelsToBuffer
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
            console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0100 in');
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 4, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0100 createPixelMap failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    const readBuffer = new ArrayBuffer(96);
                    pixelmap.readPixelsToBuffer(readBuffer, () => {
                        let bufferArr = new Uint8Array(readBuffer);
                        let res = true;
                        for (let i = 0; i < bufferArr.length; i++) {
                            if (bufferArr[i] != tcBuf020_1[i]) {
                                res = false;
                                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0100 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0100 success');
                            done();
                        }
                    });
                }
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0200
         * @tc.name      : readPixelsToBuffer-callback(buffer:0)
         * @tc.desc      : read all pixels to an buffer
         *                 1.create PixelMap,buffer
         *                 2.call readPixelsToBuffer
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0200', Level.LEVEL0, async (done: Function) => {
            console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0200 in');
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 2, size: {
                    height: 6, width: 8
                }
            };
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0200 createPixelMap failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    const readBuffer = new ArrayBuffer(0);
                    pixelmap.readPixelsToBuffer(readBuffer, () => {
                        let bufferArr = new Uint8Array(readBuffer);
                        let res = true;
                        for (let i = 0; i < bufferArr.length; i++) {
                            if (bufferArr[i] == 0) {
                                res = false;
                                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0200 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0200 success');
                            done();
                        }
                    });
                }
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0100
         * @tc.name      : readPixels-promise
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0100 createPixelMap failed');
                        expect(false).assertTrue();
                        done();
                    }
                    const area: image.PositionArea = {
                        pixels: new ArrayBuffer(8),
                        offset: 0,
                        stride: 8,
                        region: {
                            size: {
                                height: 1, width: 2
                            }, x: 0, y: 0
                        }
                    };
                    pixelmap.readPixels(area).then(() => {
                        let bufferArr2 = new Uint8Array(area.pixels);
                        let res = true;
                        for (let i = 0; i < bufferArr2.length; i++) {
                            if (bufferArr2[i] != tcBuf021[i]) {
                                res = false;
                                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0100 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0100 success');
                            done();
                        }
                    });
                })
                .catch((error: BusinessError) => {
                    console.log('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0100 error: ' + error);
                    expect().assertFail();
                    done();
                });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0100
         * @tc.name      : readPixels-callback
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0100 createPixelMap failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    const area: image.PositionArea = {
                        pixels: new ArrayBuffer(8),
                        offset: 0,
                        stride: 8,
                        region: {
                            size: {
                                height: 1, width: 2
                            }, x: 0, y: 0
                        }
                    };
                    pixelmap.readPixels(area, () => {
                        let bufferArr = new Uint8Array(area.pixels);
                        let res = true;
                        for (let i = 0; i < bufferArr.length; i++) {
                            console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0100 buffer ' + bufferArr[i]);
                            if (bufferArr[i] != tcBuf021_1[i]) {
                                res = false;
                                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0100 failed');
                                expect(false).assertTrue();
                                done();
                                break;
                            }
                        }
                        if (res) {
                            console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0100 success');
                            done();
                        }
                    });
                }
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0200
         * @tc.name      : readPixels-callback( region: { size: { height: 1, width: 2 }, x: -1, y: -1 })
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0200', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0200 create pixelmap fail');
                    done();
                } else {
                    const area: image.PositionArea = {
                        pixels: new ArrayBuffer(20),
                        offset: 0,
                        stride: 8,
                        region: {
                            size: {
                                height: 1, width: 2
                            }, x: -1, y: -1
                        }
                    };
                    pixelmap.readPixels(area).then(() => {
                        console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0200 failed');
                        expect(false).assertTrue();
                        done();
                    }).catch(() => {
                        console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0200 success');
                        done();
                    });
                }
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0200
         * @tc.name      : readPixels-promise(buffer:0)
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0200 create pixelmap failed');
                    done();
                } else {
                    const area: image.PositionArea = {
                        pixels: new ArrayBuffer(0),
                        offset: 0,
                        stride: 8,
                        region: {
                            size: {
                                height: 1, width: 2
                            }, x: 0, y: 0
                        }
                    };
                    pixelmap.readPixels(area).then(() => {
                        console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0200 failed');
                        expect(false).assertTrue();
                        done();
                    }).catch(() => {
                        console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0200 success');
                        done();
                    });
                }
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0300
         * @tc.name      : readPixels-promise(offset > buffer)
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0300 createPixelMap success');
                    done();
                }
                const area: image.PositionArea = {
                    pixels: new ArrayBuffer(20),
                    offset: 21,
                    stride: 8,
                    region: {
                        size: {
                            height: 1, width: 2
                        }, x: 0, y: 0
                    }
                };
                pixelmap.readPixels(area).then(() => {
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0300 failed');
                    expect(false).assertTrue();
                    done();
                }).catch(() => {
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0300 success');
                    done();
                });
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0400
         * @tc.name      : readPixels-promise(region: { size: { height: -1, width:-1}, x: 0, y: 0 })
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.promise return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0400 createPixelMap success');
                    done();
                }
                const area: image.PositionArea = {
                    pixels: new ArrayBuffer(20),
                    offset: 0,
                    stride: 8,
                    region: {
                        size: {
                            height: -1, width: -1
                        }, x: 0, y: 0
                    }
                };
                pixelmap.readPixels(area).then(() => {
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0400 failed');
                    expect(false).assertTrue();
                    done();
                }).catch(() => {
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0400 success');
                    done();
                });
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0100
         * @tc.name      : readPixels-sync
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.sync return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0100 createPixelMapSync failed');
                expect(false).assertTrue();
                done();
            }
            const area: image.PositionArea = {
                pixels: new ArrayBuffer(8),
                offset: 0,
                stride: 8,
                region: {
                    size: {
                        height: 1, width: 2
                    }, x: 0, y: 0
                }
            };
            pixelmap.readPixelsSync(area);
            let bufferArr2 = new Uint8Array(area.pixels);
            let res = true;
            for (let i = 0; i < bufferArr2.length; i++) {
                if (bufferArr2[i] != tcBuf021[i]) {
                    res = false;
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0100 failed');
                    expect(false).assertTrue();
                    done();
                    break;
                }
            }
            if (res) {
                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0100 success');
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0200
         * @tc.name      : readPixels-sync(buffer:0)
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.sync return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0200', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0200 create pixelmap failed');
                done();
            } else {
                const area: image.PositionArea = {
                    pixels: new ArrayBuffer(0),
                    offset: 0,
                    stride: 8,
                    region: {
                        size: {
                            height: 1, width: 2
                        }, x: 0, y: 0
                    }
                };
                let res = false;
                pixelmap.readPixelsSync(area);
                res = true;
                if (!res) {
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0200 failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0200 success');
                    done();
                }
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0300
         * @tc.name      : readPixels-sync(offset > buffer)
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.sync return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0300', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0300 createPixelMap failed');
                done();
            }
            const area: image.PositionArea = {
                pixels: new ArrayBuffer(20),
                offset: 21,
                stride: 8,
                region: {
                    size: {
                        height: 1, width: 2
                    }, x: 0, y: 0
                }
            };
            let res = false;
            pixelmap.readPixelsSync(area);
            res = true;
            if (!res) {
                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0300 failed');
                expect(false).assertTrue();
                done();
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0300 success');
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0400
         * @tc.name      : readPixels-sync(region: { size: { height: -1, width:-1}, x: 0, y: 0 })
         * @tc.desc      : 1.create PixelMap
         *                 2.call readPixels
         *                 3.sync return array
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0400', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0400 createPixelMap success');
                done();
            }
            const area: image.PositionArea = {
                pixels: new ArrayBuffer(20),
                offset: 0,
                stride: 8,
                region: {
                    size: {
                        height: -1, width: -1
                    }, x: 0, y: 0
                }
            };
            let res = false;
            pixelmap.readPixelsSync(area);
            res = true;
            if (!res) {
                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0400 failed');
                expect(false).assertTrue();
                done();
            } else {
                console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_SYNC_0400 success');
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_PROMISE_0100
         * @tc.name      : writePixels-promise
         * @tc.desc      : 1.create PixelMap
         *                 2.call writePixels
         *                 3.call return undefined
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_PROMISE_0100 createPixelMap failed');
                        expect(false).assertTrue();
                        done();
                    }
                    const area: image.PositionArea = {
                        pixels: new ArrayBuffer(8),
                        offset: 0,
                        stride: 8,
                        region: {
                            size: {
                                height: 1, width: 2
                            }, x: 0, y: 0
                        }
                    };
                    let bufferArr = new Uint8Array(area.pixels);
                    for (let i = 0; i < bufferArr.length; i++) {
                        bufferArr[i] = i + 1;
                    }
                    console.info('============ bufferArr ' + JSON.stringify(bufferArr));
                    pixelmap.writePixels(area).then(() => {
                        const readArea: image.PositionArea = {
                            pixels: new ArrayBuffer(8),
                            offset: 0,
                            stride: 8,
                            region: {
                                size: {
                                    height: 1, width: 2
                                }, x: 0, y: 0
                            }
                        };
                        console.info('============ bufferArr ' + JSON.stringify(readArea));
                        pixelmap.readPixels(readArea).then(() => {
                            let readArr = new Uint8Array(readArea.pixels);
                            let res = true;
                            for (let i = 0; i < readArr.length; i++) {
                                if (readArr[i] != tcBuf022[i]) {
                                    res = false;
                                    console.info('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_PROMISE_0100 failed');
                                    expect(false).assertTrue();
                                    done();
                                    break;
                                }
                            }
                            if (res) {
                                console.info('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_PROMISE_0100 success');
                                done();
                            }
                        });
                    });
                })
                .catch((error: BusinessError) => {
                    console.log('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_PROMISE_0100 error: ' + error);
                    expect().assertFail();
                    done();
                });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_SYNC_0100
         * @tc.name      : writePixels-sync
         * @tc.desc      : 1.create PixelMap
         *                 2.call writePixels
         *                 3.call return undefined
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_SYNC_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_SYNC_0100 createPixelMap failed');
                expect(false).assertTrue();
                done();
            }
            const area: image.PositionArea = {
                pixels: new ArrayBuffer(8),
                offset: 0,
                stride: 8,
                region: {
                    size: {
                        height: 1, width: 2
                    }, x: 0, y: 0
                }
            };
            let bufferArr = new Uint8Array(area.pixels);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            console.info('============ bufferArr ' + JSON.stringify(bufferArr));
            pixelmap.writePixelsSync(area);
            const readArea: image.PositionArea = {
                pixels: new ArrayBuffer(8),
                offset: 0,
                stride: 8,
                region: {
                    size: {
                        height: 1, width: 2
                    }, x: 0, y: 0
                }
            };
            console.info('============ bufferArr ' + JSON.stringify(readArea));
            pixelmap.readPixelsSync(readArea);
            let readArr = new Uint8Array(readArea.pixels);
            let res = true;
            for (let i = 0; i < readArr.length; i++) {
                if (readArr[i] != tcBuf022[i]) {
                    res = false;
                    console.info('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_SYNC_0100 failed');
                    expect(false).assertTrue();
                    done();
                    break;
                }
            }
            if (res) {
                console.info('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_SYNC_0100 success');
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_CALLBACK_0100
         * @tc.name      : writePixels-callback
         * @tc.desc      : 1.create PixelMap
         *                 2.call writePixels
         *                 3.call return undefined
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
            try {
                const color = new ArrayBuffer(96);
                let opts: image.InitializationOptions = {
                    editable: true, pixelFormat: 3, size: {
                        height: 4, width: 6
                    }
                };
                image.createPixelMap(color, opts, (err, pixelmap) => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_CALLBACK_0100 createPixelMap failed');
                        expect(false).assertTrue();
                        done();
                    }
                    const area: image.PositionArea = {
                        pixels: new ArrayBuffer(8),
                        offset: 0,
                        stride: 8,
                        region: {
                            size: {
                                height: 1, width: 2
                            }, x: 0, y: 0
                        }
                    };
                    let bufferArr = new Uint8Array(area.pixels);
                    for (let i = 0; i < bufferArr.length; i++) {
                        bufferArr[i] = i + 1;
                    }
                    pixelmap.writePixels(area, () => {
                        const readArea: image.PositionArea = {
                            pixels: new ArrayBuffer(8),
                            offset: 0,
                            stride: 8,
                            region: {
                                size: {
                                    height: 1, width: 2
                                }, x: 0, y: 0
                            }
                        };
                        pixelmap.readPixels(readArea, () => {
                            let readArr = new Uint8Array(readArea.pixels);
                            let res = true;
                            for (let i = 0; i < readArr.length; i++) {
                                if (readArr[i] != tcBuf022[i]) {
                                    res = false;
                                    console.info('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_CALLBACK_0100 failed');
                                    expect(false).assertTrue();
                                    done();
                                    break;
                                }
                            }
                            if (res) {
                                console.info('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_CALLBACK_0100 success');
                                done();
                            }
                        });
                    });
                });
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_CALLBACK_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_0100
         * @tc.name      : writeBufferToPixels-promise
         * @tc.desc      : 1.create PixelMap,buffer
         *                 2.call writeBufferToPixels
         *                 3.call return undefined
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_0100 createPixelMap failed');
                        expect(false).assertTrue();
                        done();
                    }
                    const writeColor = new ArrayBuffer(96);
                    let bufferArr = new Uint8Array(writeColor);
                    for (let i = 0; i < bufferArr.length; i++) {
                        bufferArr[i] = i + 1;
                    }
                    pixelmap.writeBufferToPixels(writeColor).then(() => {
                        const readBuffer = new ArrayBuffer(96);
                        pixelmap.readPixelsToBuffer(readBuffer).then(() => {
                            let bufferArr = new Uint8Array(readBuffer);
                            let res = true;
                            for (let i = 0; i < bufferArr.length; i++) {
                                if (bufferArr[i] == 0) {
                                    res = false;
                                    console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_0100 failed');
                                    expect(false).assertTrue();
                                    done();
                                    break;
                                }
                            }
                            if (res) {
                                console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_0100 success');
                                done();
                            }
                        });
                    });
                })
                .catch((error: BusinessError) => {
                    console.log('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_0100 error: ' + error);
                    expect().assertFail();
                    done();
                });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_0100
         * @tc.name      : writeBufferToPixels-callback
         * @tc.desc      : 1.create PixelMap,buffer
         *                 2.call writeBufferToPixels
         *                 3.call return undefined
         *                 4.callbackcall return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(color, opts).then(pixelmap => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_0100 failed');
                    done();
                }
                const writeColor = new ArrayBuffer(96);
                pixelmap.writeBufferToPixels(writeColor, () => {
                    const readBuffer = new ArrayBuffer(96);
                    pixelmap.readPixelsToBuffer(readBuffer, () => {
                        let bufferArr = new Uint8Array(readBuffer);
                        let res = true;
                        for (let i = 0; i < bufferArr.length; i++) {
                            if (res) {
                                if (bufferArr[i] == 0) {
                                    res = false;
                                    console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_0100 Success');
                                    done();
                                    break;
                                }
                            }
                        }
                        if (res) {
                            console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_0100 no change after writeBuffer');
                            expect(false).assertTrue();
                            done();
                        }
                    });
                });
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_SYNC_0100
         * @tc.name      : writeBufferToPixels-sync
         * @tc.desc      : 1.create PixelMap,buffer
         *                 2.call writeBufferToPixels
         *                 3.call return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_SYNC_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_SYNC_0100 createPixelMap failed');
                expect(false).assertTrue();
                done();
            }
            const writeColor = new ArrayBuffer(96);
            let bufferArr1: Uint8Array = new Uint8Array(writeColor);
            for (let i = 0; i < bufferArr1.length; i++) {
                bufferArr1[i] = i + 1;
            }
            pixelmap.writeBufferToPixelsSync(writeColor);
            const readBuffer = new ArrayBuffer(96);
            pixelmap.readPixelsToBufferSync(readBuffer);
            let bufferArr2 = new Uint8Array(readBuffer);
            let res = true;
            for (let i = 0; i < bufferArr2.length; i++) {
                if (bufferArr2[i] == 0) {
                    res = false;
                    console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_SYNC_0100 failed');
                    expect(false).assertTrue();
                    done();
                    break;
                }
            }
            if (res) {
                console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_SYNC_0100 success');
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_PROMISE_0100
         * @tc.name      : getImageInfo-pixelmap-promise
         * @tc.desc      : 1.create PixelMap,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 2, size: {
                    height: 6, width: 8
                }
            };
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_PROMISE_0100 createPixelMap failed');
                        expect(false).assertTrue();
                        done();
                    }
                    pixelmap.getImageInfo().then(imageInfo => {
                        if (imageInfo == undefined) {
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_PROMISE_0100 imageInfo is empty');
                            expect(false).assertTrue();
                            done();
                        }
                        if (imageInfo.size.height == 6 && imageInfo.size.width == 8) {
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_PROMISE_0100 success ');
                            done();
                        }
                        done();
                    }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_PROMISE_0100 getimageinfo error: ' +
                            error);
                        expect().assertFail();
                        done();
                    });
                    done();
                })
                .catch((error: BusinessError)  => {
                    console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_PROMISE_0100 error: ' + error);
                    expect().assertFail();
                    done();
                });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_SYNC_0100
         * @tc.name      : getImageInfo-pixelmap-sync
         * @tc.desc      : 1.create PixelMap,ImageInfo
         *                 2.getImageInfo
         *                 3.return imageinfo
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_SYNC_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 2, size: {
                    height: 6, width: 8
                }
            };
            let pixelmap = image.createPixelMapSync(color, opts);
            if (pixelmap == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_SYNC_0100 createPixelMap failed');
                expect(false).assertTrue();
                done();
            }
            let imageInfo = pixelmap.getImageInfoSync();
            if (imageInfo == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_SYNC_0100 imageInfo is empty');
                expect(false).assertTrue();
                done();
            }
            if (imageInfo.size.height == 6 && imageInfo.size.width == 8) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_SYNC_0100 success ');
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_CALLBACK_0100
         * @tc.name      : getImageInfo-pixelmap-callback
         * @tc.desc      : 1.create PixelMap,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(color, opts, (err, pixelmap) => {
                if (pixelmap == undefined) {
                    globalpixelmap = pixelmap;
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_CALLBACK_0100 create pixelmap fail');
                    done();
                }
                pixelmap.getImageInfo((err, imageInfo) => {
                    if (imageInfo == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_CALLBACK_0100 imageInfo is empty');
                        expect(false).assertTrue();
                        done();
                    }
                    if (imageInfo.size.height == 4 && imageInfo.size.width == 6) {
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_CALLBACK_0100 imageInfo success');
                        done();
                    }
                    done();
                });
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETBYTESNUMBERPERROW_0100
         * @tc.name      : getBytesNumberPerRow
         * @tc.desc      : 1.create PixelMap
         *                 2.set PixelMap
         *                 3.call getBytesNumberPerRow
         *                 4. call return number
         *                 5.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETBYTESNUMBERPERROW_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            const expectNum = 4 * opts.size.width;
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('TC_25-1 create pixelmap fail');
                    done();
                } else {
                    const num = pixelmap.getBytesNumberPerRow();
                    console.info('SUB_MULTIMEDIA_IMAGE_GETBYTESNUMBERPERROW_0100 num is ' + num);
                    expect(num == expectNum).assertTrue();
                    if (num == expectNum) {
                        console.info('TC_25-1 success');
                    } else {
                        console.info('TC_25-1 fail');
                    }
                    done();
                }
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETBYTESNUMBERPERROW_0200
         * @tc.name      : getPixelBytesNumber
         * @tc.desc      : 1.create PixelMap
         *                 2.set Pixel
         *                 3.call getPixelBytesNumber
         *                 4. call return number
         *                 5.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETBYTESNUMBERPERROW_0200', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            const expectNum = 4 * opts.size.width * opts.size.height;
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_GETBYTESNUMBERPERROW_0200 create pixelmap fail');
                    done();
                } else {
                    const num = pixelmap.getPixelBytesNumber();
                    console.info('SUB_MULTIMEDIA_IMAGE_GETBYTESNUMBERPERROW_0200 num is ' + num);
                    expect(num == expectNum).assertTrue();
                    if (num == expectNum) {
                        console.info('SUB_MULTIMEDIA_IMAGE_GETBYTESNUMBERPERROW_0200 success');
                    } else {
                        console.info('SUB_MULTIMEDIA_IMAGE_GETBYTESNUMBERPERROW_0200 fail');
                    }
                    done();
                }
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_PROMISE_0100
         * @tc.name      : release-pixelmap-promise
         * @tc.desc      : 1.create PixelMap
         *                 2.set Pixel
         *                 3.call release
         *                 4.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(color, opts).then(pixelmap => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_PROMISE_0100 createPixelMap failed');
                    expect(false).assertTrue();
                    done();
                }
                pixelmap.release().then(() => {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_PROMISE_0100 success');
                    done();
                }).catch((error: BusinessError) => {
                    console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_PROMISE_0100 error: ' + error);
                    expect().assertFail();
                    done();
                });
            }).catch((error: BusinessError) => {
                console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_PROMISE_0100 createPixelMap failed error: ' + error);
                expect().assertFail();
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_CALLBACK_0100
         * @tc.name      : release-pixelmap-callback
         * @tc.desc      : 1.create PixelMap
         *                 2.set Pixel
         *                 3.call release
         *                 4.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_CALLBACK_0100 createPixelMap failed');
                    expect(false).assertTrue();
                    done();
                }
                pixelmap.release(() => {
                    console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_CALLBACK_0100 success');
                    done();
                });
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0100
         * @tc.name      : createImageSource(uri)-jpg
         * @tc.desc      : 1.set uri
         *                 2.call createImageSource(uri)
         *                 3.return imagesource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0100', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(filePath);
                globalimageSource = imageSourceApi;
                expect(imageSourceApi != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0100 success');
                done();
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0200
         * @tc.name      : createImageSource(uri)-bmp
         * @tc.desc      : 1.seturi
         *                 2.call createImageSource(uri)
         *                 3.return imagesource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0200', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(filePath);
                globalimageSource = imageSourceApi;
                expect(imageSourceApi != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_UR_0200 success');
                done();
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0300
         * @tc.name      : createImageSource(uri)-gif
         * @tc.desc      : 1.seturi
         *                 2.call createImageSource(uri)
         *                 3.return imagesource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0300', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(filePath);
                globalimageSource = imageSourceApi;
                expect(imageSourceApi != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0300 success');
                done();
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0300 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0400
         * @tc.name      : createImageSource(uri)-png
         * @tc.desc      : 1.seturi
         *                 2.call createImageSource(uri)
         *                 3.return imagesource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0400', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(filePath);
                globalimageSource = imageSourceApi;
                expect(imageSourceApi != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0400 success');
                done();
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0400 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_SUFFIXFILE_0100
         * @tc.name      : createImageSource(uri)-image with wrong suffix file
         * @tc.desc      : 1.call createImageSource(uri)
         *                 2.Incoming wrong suffix file
         *                 3.imagesource null
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_SUFFIXFILE_0100', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.123');
                let imageSourceApi = image.createImageSource(filePath);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_SUFFIXFILE_0100 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        if (err) {
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_SUFFIXFILE_0100 create pixelmap failed: ' +
                                err);
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        globalpixelmap = pixelmap;
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_SUFFIXFILE_0100 success');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    });
                }
            } catch (error) {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_SUFFIXFILE_0100 err:' + error);
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_URI_0100
         * @tc.name      : createImageSource(uri)-wrong uri
         * @tc.desc      : 1.call createImageSource(uri)
         *                 2.set wrong uri
         *                 3.return null
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_URI_0100', Level.LEVEL0, async (done: Function) => {
            try {
                const imageSourceApi = image.createImageSource('file:///multimedia/test.jpg');
                globalimageSource = imageSourceApi;
                expect(imageSourceApi == undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_URI_0100 success');
                done();
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_URI_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0100
         * @tc.name      : createImageSource(fd)
         * @tc.desc      : 1.call createImageSource
         *                 2.set fd
         *                 3.return imagesource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0100', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.jpg');
                console.info(fdNumber + 'fdNumber000')
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0100 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0100 err: ' + err);
                            done();
                            return;
                        }
                        if (imageInfo != undefined) {
                            fs.closeSync(fdNumber);
                            done();
                        } else {
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0100 failed');
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_FD_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0200
         * @tc.name      : createImageSource(fd) fd<0
         * @tc.desc      : 1.call createImageSource
         *                 2.set wrong fd
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0200', Level.LEVEL0, async (done: Function) => {
            const imageSourceApi = image.createImageSource(-2);
            globalimageSource = imageSourceApi;
            expect(imageSourceApi == undefined).assertTrue();
            console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0200 success');
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0300
         * @tc.name      : createImageSource(data)
         * @tc.desc      : 1.setdata
         *                 2.createImageSource
         *                 3.return imagesource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0300', Level.LEVEL0, async (done: Function) => {
            const data = testJpg.buffer;
            const imageSourceApi = image.createImageSource(data);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0300 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                imageSourceApi.getImageInfo((err, imageInfo) => {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0300 imageInfo');
                    expect(imageInfo != undefined).assertTrue();
                    done();
                });
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0400
         * @tc.name      : createImageSource(data) buffer:0
         * @tc.desc      : 1.setdata
         *                 2.createImageSource
         *                 3.return imagesource
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0400', Level.LEVEL0, async (done: Function) => {
            const data = new ArrayBuffer(0);
            const imageSourceApi = image.createImageSource(data);
            globalimageSource = imageSourceApi;
            expect(imageSourceApi == undefined).assertTrue();
            console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0400 success');
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_JPG_0100
         * @tc.name      : release-imagesource-promise-jpg
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_JPG_0100', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_JPG_0100 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.release().then(() => {
                        console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_JPG_0100 success');
                        done();
                    }).catch((error:BusinessError) => {
                        console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_JPG_0100 error');
                        expect(false).assertTrue();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_JPG_0100 err:' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_JPG_0100
         * @tc.name      : release-imagesource-callback-jpg
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_JPG_0100', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_JPG_0100 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.release(() => {
                        console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_JPG_0100 Success');
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_JPG_0100 err:' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0100
         * @tc.name      : getImageInfo(callback: AsyncCallback<ImageInfo>)-jpg
         * @tc.desc      : 1.create imageSource
         *                 2.imageSourcecall getImageInfo(ImageInfo)
         *                 3.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0100 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0100 err:' + err);
                            done();
                            return;
                        }
                        if (imageInfo != undefined) {
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0100 imageInfo.size.height:' +
                            imageInfo.size.height);
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0100 imageInfo.size.width:' +
                            imageInfo.size.width);
                            fs.closeSync(fdNumber);
                            done();
                        } else {
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0100 failed');
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0200
         * @tc.name      : getImageInfo(callback: AsyncCallback<ImageInfo>)-bmp
         * @tc.desc      : 1.create imageSource
         *                 2.imageSourcecall getImageInfo(ImageInfo)
         *                 3.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0200', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0200 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0200 imageInfo.size.height:' +
                        imageInfo.size.height);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0200 imageInfo.size.width:' +
                        imageInfo.size.width);
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0300
         * @tc.name      : getImageInfo(callback: AsyncCallback<ImageInfo>)-png
         * @tc.desc      : 1.create imageSource
         *                 2.imageSourcecall getImageInfo(ImageInfo)
         *                 3.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0300', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0300 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0300 imageInfo.size.height:' +
                        imageInfo.size.height);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0300 imageInfo.size.width:' +
                        imageInfo.size.width);
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0300 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400
         * @tc.name      : getImageInfo(callback: AsyncCallback<ImageInfo>)-gif
         * @tc.desc      : 1.create ImageInfo
         *                 2.call getImageInfo(index, ImageInfo)
         *                 3.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo((err, imageInfo) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400 error' + err);
                            done();
                            return;
                        }
                        if (imageInfo != undefined && imageInfo != null) {
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400 imageInfo.size.height:' +
                            imageInfo.size.height);
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400 imageInfo.size.width:' +
                            imageInfo.size.width);
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400 success');
                            done();
                        } else {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400 failed');
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0500
         * @tc.name      : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-jpg
         * @tc.desc      : 1.create ImageInfo
         *                 2.call getImageInfo(index, ImageInfo)
         *                 3.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0500', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0500 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0500 imageInfo.size.height:' +
                        imageInfo.size.height);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0500 imageInfo.size.width:' +
                        imageInfo.size.width);
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0500 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0600
         * @tc.name      : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-bmp
         * @tc.desc      : 1.create ImageInfo
         *                 2.call getImageInfo(index, ImageInfo)
         *                 3.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0600', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0600 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0600 imageInfo.size.height:' +
                        imageInfo.size.height);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0600 imageInfo.size.width:' +
                        imageInfo.size.width);
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0600 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number: SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0700
         * @tc.name  : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-png
         * @tc.desc  : 1.create ImageInfo
         *             2.call getImageInfo(index, ImageInfo)
         *             3.callback return undefined
         * @tc.size  : MEDIUM MEDIUM
         * @tc.type  : Functional
         * @tc.level : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0700', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0700 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0700 imageInfo.size.height:' +
                        imageInfo.size.height);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0700 imageInfo.size.width:' +
                        imageInfo.size.width);
                        done();
                    });
                }
            } catch (error)  {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0700 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number: SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800
         * @tc.name  : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-gif
         * @tc.desc  : 1.create ImageInfo
         *             2.call getImageInfo(index, ImageInfo)
         *             3.callback return undefined
         * @tc.size  : MEDIUM MEDIUM
         * @tc.type  : Functional
         * @tc.level : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo(0, (err, imageInfo) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800 error' + err);
                            done();
                            return;
                        }
                        if (imageInfo != undefined && imageInfo != null) {
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800 imageInfo.size.height:' +
                            imageInfo.size.height);
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800 imageInfo.size.width:' +
                            imageInfo.size.width);
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800 success');
                            done();
                        } else {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800 failed');
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number: SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_CALLBACK_GIF_0100
         * @tc.name  : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-gif(frame:1)-index:1
         * @tc.desc  : 1.create ImageInfo
         *             2.call getImageInfo(index, ImageInfo)
         *             3.callback return undefined
         * @tc.size  : MEDIUM
         * @tc.type  : Functional
         * @tc.level : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_CALLBACK_GIF_0100', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_CALLBACK_GIF_0100 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo(1, (err, imageInfo) => {
                        if (imageInfo == undefined) {
                            done();
                        } else {
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_CALLBACK_GIF_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number: SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_CALLBACK_GIF_0200
         * @tc.name  : getImageInfo(index: number, callback: AsyncCallback<ImageInfo>)-gif-index:-1
         * @tc.desc  : 1.create ImageInfo
         *             2.call getImageInfo(index, ImageInfo)
         *             3.callback return undefined
         * @tc.size  : MEDIUM
         * @tc.type  : Functional
         * @tc.level : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_CALLBACK_GIF_0200', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_CALLBACK_GIF_0200 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo(-1, (err, imageInfo) => {
                        expect(imageInfo == undefined).assertTrue();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_CALLBACK_GIF_0200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0100
         * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index)
         *                 3.callbackcall ,return imageinfo
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0100 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo(0)
                        .then(imageInfo => {
                            expect(imageInfo != undefined).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0100 imageInfo');
                            console.info('imageInfo.size.height:' + imageInfo.size.height);
                            console.info('imageInfo.size.width:' + imageInfo.size.width);
                            done();
                        }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0100 error: ' + error);
                        expect().assertFail();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0200
         * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index)
         *                 3.callbackcall ,return imageinfo
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0200 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo(0)
                        .then(imageInfo => {
                            expect(imageInfo != undefined).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0200 imageInfo');
                            console.info('imageInfo.size.height:' + imageInfo.size.height);
                            console.info('imageInfo.size.width:' + imageInfo.size.width);
                            done();
                        }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0200 error: ' + error);
                        expect().assertFail();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0300
         * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-png
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index)
         *                 3.callbackcall ,return imageinfo
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0300 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo(0)
                        .then(imageInfo => {
                            expect(imageInfo != undefined).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0300 imageInfo');
                            console.info('imageInfo.size.height:' + imageInfo.size.height);
                            console.info('imageInfo.size.width:' + imageInfo.size.width);
                            done();
                        }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0300 error: ' + error);
                        expect().assertFail();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0300 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0400
         * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-gif
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index)
         *                 3.callbackcall ,return imageinfo
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0400 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo(0)
                        .then(imageInfo => {
                            if (imageInfo != undefined && imageInfo != null) {
                                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0400 imageInfo.size.height:' +
                                imageInfo.size.height);
                                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0400 imageInfo.size.width:' +
                                imageInfo.size.width);
                                done();
                            } else {
                                expect(false).assertTrue();
                                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0400 failed');
                                done();
                            }
                        }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0400 error: ' + error);
                        expect().assertFail();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0400 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number: SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0100
         * @tc.name  : getImageInfo(index?: number): Promise<ImageInfo>-gif(frame:1)-index:1
         * @tc.desc  : 1.create imagesource
         *             2.call getImageInfo(index=1)
         *             3.callback return imageinfo undefined
         * @tc.size  : MEDIUM
         * @tc.type  : Functional
         * @tc.level : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0100', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0100 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo(1)
                        .then(() => {
                            console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0100 failed');
                            expect().assertFail();
                            done();
                        }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0100 success');
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0200
         * @tc.name      : getImageInfo(index?: number): Promise<ImageInfo>-gif-index:-1
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageInfo(index=-1)
         *                 3.callback return imageinfo undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0200', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0200 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.getImageInfo(-1)
                        .then(() => {
                            console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0200 failed');
                            expect().assertFail();
                            done();
                        }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0200 success');
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_JPG_0100
         * @tc.name      : createPixelMap-promise-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_JPG_0100', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_JPG_0100 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.createPixelMap().then(pixelmap => {
                        globalpixelmap = pixelmap;
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_JPG_0100 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_JPG_0100 error: ' + error);
                        expect().assertFail();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_JPG_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_JPG_0100
         * @tc.name      : createPixelMap-callback-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_JPG_0100', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_JPG_0100 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        if (err) {
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_JPG_0100 err: ' + err);
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        globalpixelmap = pixelmap;
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_JPG_0100 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_JPG_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_0100
         * @tc.desc      : 1.create imagesource
         *                 2.return not null
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_0100', Level.LEVEL0, async (done: Function) => {
            try {
                const incSouce = image.CreateIncrementalSource(new ArrayBuffer(1));
                globalimageSource = incSouce;
                expect(incSouce != undefined).assertTrue();
                done();
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_0100 failed ' + error);
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_ArrayBuffer_NULL_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_ArrayBuffer_NULL_0100
         * @tc.desc      : 1.create imagesource
         *                 2.return not null
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_ArrayBuffer_NULL_0100', Level.LEVEL0, async (done: Function) => {
            try {
                const incSouce = image.CreateIncrementalSource(null);
                globalimageSource = incSouce;
                expect(incSouce != undefined).assertTrue();
                done();
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_ArrayBuffer_NULL_0100 failed ' + error);
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_GET_IMAGEINFO_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_GET_IMAGEINFO_0100
         * @tc.desc      : 1.call createImageSource(uri)
         *                 2.call getImageInfo(callback)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_GET_IMAGEINFO_0100', Level.LEVEL0, async (done: Function) => {
            await getFd('test.jpg');
            const imageSource = image.createImageSource(fdNumber);
            imageSource.getImageInfo((err: BusinessError, imageinfo: image.ImageInfo) => {
                if (err) {
                    console.error('Failed to get the image information.code is ${err.code},message is ${err.message}');
                    expect().assertFail();
                } else {
                    console.info('succeeded get the image information.');
                    expect(imageinfo !== undefined).assertTrue();
                }
            })
            done();
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_NOTEXIST_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_NOTEXIST_0100
         * @tc.desc      : 1.call createImageSource(uri)
         *                 2.set not exist uri
         *                 3.return null
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_NOTEXIST_0100', Level.LEVEL0, async (done: Function) => {
            try {
                const imageSourceApi = image.createImageSource('error.jpg');
                globalimageSource = imageSourceApi;
                expect(imageSourceApi == undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_NOTEXIST_0100 success');
                done();
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_NOTEXIST_0100 error: ' + error);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RECEIVER_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RECEIVER_0100
         * @tc.desc      : 1.test image createImageReceiver(size, ImageFormat, capability)
         * @tc.size      : MediumTest
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RECEIVER_0100', Level.LEVEL0, async (done: Function) => {
            let logger = "SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RECEIVER_0100";
            const receiver = image.createImageReceiver({ width: 640, height: 480 }, 4, 8);
            if (receiver !== undefined) {
                console.log(`${logger} true.`);
            } else {
                console.log(`${logger} failed.`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RECEIVER_0200
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RECEIVER_0200
         * @tc.desc      : 1.test image createImageReceiver(size, ImageFormat, capability)
         *                 2. use const format
         * @tc.size      : MediumTest
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RECEIVER_0200', Level.LEVEL0, async (done: Function) => {
            let logger = "SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RECEIVER_0200";
            const receiver = image.createImageReceiver({ width: 640, height: 480 }, image.ImageFormat.JPEG, 8);
            if (receiver !== undefined) {
                console.log(`${logger} true.`);
            } else {
                console.log(`${logger} failed.`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATOR_0100
        * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATOR_0100
        * @tc.desc      : 1.test image createImageCreator(size, ImageFormat, capability)
        *                 2. use const format
        * @tc.size      : MediumTest
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_CREATOR_0100', Level.LEVEL0, async (done: Function) => {
            let logger = "SUB_MULTIMEDIA_IMAGE_CREATOR_0100";
            const creator = image.createImageCreator({width: 640, height: 480 }, image.ImageFormat.JPEG, 8);
            if (creator !== undefined) {
                console.log(`${logger} true.`);
            } else {
                console.log(`${logger} failed.`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
        * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_PICTURE_0100
        * @tc.name      : SUB_MULTIMEDIA_IMAGE_CREATE_PICTURE_0100
        * @tc.desc      : 1.test image createImageCreator(size, ImageFormat, capability)
        *                 2. use const format
        * @tc.size      : MediumTest
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_IMAGE_CREATE_PICTURE_0100', Level.LEVEL0, async (done: Function) => {
        let logger = "SUB_MULTIMEDIA_IMAGE_CREATE_PICTURE_0100";
        await getFd('test.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        let pixelMap: image.PixelMap;
        pixelMap = await imageSourceApi.createPixelMap();
        let picture: image.Picture = image.createPicture(pixelMap);
        if (picture !== undefined) {
            console.log(`${logger} true.`);
        } else {
            console.log(`${logger} failed.`);
            expect(false).assertTrue();
        }
        done();
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100
         * @tc.name      : createIncrementalSource-updateData-png
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100', Level.LEVEL0, async (done: Function) => {
            try {
                let testimagebuffer = testPng;
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100 0003 ' +
                testimagebuffer.length);
                let bufferSize = testimagebuffer.length;
                let offset = 0;
                const incSouce = image.CreateIncrementalSource(new ArrayBuffer(1));
                globalimageSource = incSouce;
                let ret: ESObject;
                let isFinished = false;
                while (offset < testimagebuffer.length) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100 0006 ' +
                    testimagebuffer.length);
                    let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100 0007 ' + oneStep.length);
                    if (oneStep.length < bufferSize) {
                        isFinished = true;
                    }
                    ret = await incSouce.updateData(oneStep, isFinished, 0, oneStep.length);
                    if (!ret) {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100 updateData failed');
                        expect(ret).assertTrue();
                        break;
                    }
                    offset = offset + oneStep.length;
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100 0011 ' + offset);
                }
                if (ret) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100 updateData success ');
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1
                    };
                    incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100 0014' + pixelmap);
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    });
                } else {
                    done();
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100 updateData failed ' + error);
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0200
         * @tc.name      : createIncrementalSource-updateData-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.update data
         *                 3.create pixelmap
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0200', Level.LEVEL0, async (done: Function) => {
            try {
                let testimagebuffer = testJpg;
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0200 0003 ' +
                testimagebuffer.length);
                let bufferSize = testimagebuffer.length;
                let offset = 0;
                const incSouce = image.CreateIncrementalSource(new ArrayBuffer(1));
                globalimageSource = incSouce;
                let isFinished = false;
                let ret: ESObject;
                while (offset < testimagebuffer.length) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0200 0006 ' +
                    testimagebuffer.length);
                    let oneStep = testimagebuffer.slice(offset, offset + bufferSize);
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0200 0007 ' + oneStep.length);
                    if (oneStep.length < bufferSize) {
                        isFinished = true;
                    }
                    ret = await incSouce.updateData(oneStep, isFinished, 0, oneStep.length);
                    if (!ret) {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0200 updateData failed');
                        expect(ret).assertTrue();
                        break;
                    }
                    offset = offset + oneStep.length;
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0200 0011 ' + offset);
                }
                if (ret) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0200 updateData success ');
                    let decodingOptions: image.DecodingOptions = {
                        sampleSize: 1
                    };
                    incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    });
                } else {
                    done();
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0200 updateData failed ' + error);
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0100
         * @tc.name      : release ImageSource - promise - png
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0100 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.release().then(() => {
                        console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0100 success');
                        done();
                    }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0100 error: ' + error);
                        expect().assertFail();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0100
         * @tc.name      : release ImageSource - callback - png
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0100 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.release(async (err) => {
                        if (err) {
                            console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0100 err:' + err);
                            expect(false).assertTrue();
                            done();
                            return;
                        }
                        console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0100 Success');
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0200
         * @tc.name      : release ImageSource - promise - bmp
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0200 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.release().then(() => {
                        console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0200 success');
                        done();
                    }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0200 error: ' + error);
                        expect().assertFail();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0200
         * @tc.name      : release ImageSource - callback - bmp
         * @tc.desc      : 1.create ImageSource
         *                 2.create SourceStream
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0200', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0200 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.release(async () => {
                        console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0200 Success');
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0300
         * @tc.name      : release ImageSource - promise - gif
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0300 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.release().then(() => {
                        console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0300 success');
                        done();
                    }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0300 error: ' + error);
                        expect().assertFail();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0300 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0300
         * @tc.name      : release ImageSource - callback - gif
         * @tc.desc      : 1.create ImageSource
         *                 2.call release()
         *                 3.return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0300', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0300 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.release(() => {
                        console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0300 Success');
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0300 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0800
         * @tc.name      : createPixelMap-promise-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0800', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('moving_test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0800 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.createPixelMap().then(pixelmap => {
                        globalpixelmap = pixelmap;
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0800 success ');
                        expect(pixelmap !== undefined).assertTrue();
                        done();
                    }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0800 error: ' + error);
                        expect().assertFail();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0800 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1200
         * @tc.name      : createPixelMap-callback-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1200', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('moving_test.gif');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1200 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        globalpixelmap = pixelmap;
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1200 success ');
                        expect(pixelmap !== undefined).assertTrue();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0900
         * @tc.name      : createPixelMap-promise-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0900', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0900 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.createPixelMap().then(pixelmap => {
                        globalpixelmap = pixelmap;
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0900 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0900 error: ' + error);
                        expect().assertFail();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0900 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1300
         * @tc.name      : createPixelMap-callback-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1300', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.bmp');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1300 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        globalpixelmap = pixelmap;
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1300 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1300 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_1000
         * @tc.name      : createPixelMap-promise-png
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_1000', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_1000 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.createPixelMap().then(pixelmap => {
                        globalpixelmap = pixelmap;
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_1000 success');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }).catch((error: BusinessError) => {
                        console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_1000 error: ' + error);
                        expect().assertFail();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_1000 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1400
         * @tc.name      : createPixelMap-callback-png
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1400', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.png');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1400 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        globalpixelmap = pixelmap;
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1400 success');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    });
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1400 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_0100
         * @tc.name      : imagesource supportedFormats
         * @tc.desc      : 1.create imagesource
         *                 2.call supportedFormats
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_0100', Level.LEVEL0, async (done: Function) => {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_0100 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalimageSource = imageSourceApi;
                    expect(imageSourceApi.supportedFormats != undefined).assertTrue();
                    console.info(imageSourceApi.supportedFormats + 'imageSourceApi.supportedFormats');
                    console.info('SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_0100 success ');
                    done();
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_IMAGEPACKER_SUPPORTEDFORMATS_0100
         * @tc.name      : imagepacker supportedFormats
         * @tc.desc      : 1.create imagepacker
         *                 2.call supportedFormats
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_IMAGEPACKER_SUPPORTEDFORMATS_0100', Level.LEVEL0, async (done: Function) => {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_IMAGEPACKER_SUPPORTEDFORMATS_0100 create image packer failed');
                expect(false).assertTrue();
                done();
            } else {
                globalpacker = imagePackerApi;
                expect(imagePackerApi.supportedFormats != undefined).assertTrue();
                console.info(imagePackerApi.supportedFormats + 'imageSourceApi.supportedFormats');
                console.info('SUB_MULTIMEDIA_IMAGE_IMAGEPACKER_SUPPORTEDFORMATS_0100 success ');
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_ISEDITABLE_0100
         * @tc.name      : isEditable
         * @tc.desc      : 1.create pixelmap
         *                 2.call isEditable
         *                 3.return true
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_ISEDITABLE_0100', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 3, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(Color, opts, (error, pixelmap) => {
                if (pixelmap == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_ISEDITABLE_0100 create pixelmap failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    globalpixelmap = pixelmap;
                    expect(pixelmap.isEditable == true).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_ISEDITABLE_0100 success ');
                    done();
                }
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_EDITABLE_0100
         * @tc.name      : create pixelmap-callback (editable: true, pixelFormat: ARGB_8888,
         *                 size: { height: 4, width: 6 },bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_EDITABLE_0100', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let edit = true;
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 1, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_EDITABLE_0100 editable: ' +
                pixelmap.isEditable);
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_EDITABLE_0100 edit: ' + edit);
                expect(pixelmap.isEditable == edit).assertTrue();
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_EDITABLE_0200
         * @tc.name      : create pixelmap-callback (editable: false, pixelFormat: ARGB_8888,
         *                 size: { height: 4, width: 6 },bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixelFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_EDITABLE_0200', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let edit = false;
            let opts: image.InitializationOptions = {
                editable: false, pixelFormat: 1, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_EDITABLE_0200 editable: ' +
                pixelmap.isEditable);
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_EDITABLE_0200 edit: ' + edit);
                expect(pixelmap.isEditable == edit).assertTrue();
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_EDITABLE_0100
         * @tc.name      : create pixelmap-promise (editable: true, pixelFormat: RGB_565,
         *                 size: { height: 4, width: 6 }, bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_EDITABLE_0100', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let edit = true;
            let opts: image.InitializationOptions = {
                editable: true, pixelFormat: 2, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_EDITABLE_0100 editable: ' +
                    pixelmap.isEditable);
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    expect(pixelmap.isEditable == opts.editable).assertTrue();
                    expect(pixelmap.isEditable == edit).assertTrue();
                    done();
                })
                .catch((error: BusinessError) => {
                    console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_EDITABLE_0100 err' + error);
                    expect(false).assertTrue();
                    done();
                });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_EDITABLE_0200
         * @tc.name      : create pixelmap-promise (editable: false, pixelFormat: RGB_565,
         *                 size: { height: 4, width: 6 }, bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_EDITABLE_0200', Level.LEVEL0, async (done: Function) => {
            const Color = new ArrayBuffer(96);
            let edit = false;
            let opts: image.InitializationOptions = {
                editable: false, pixelFormat: 2, size: {
                    height: 4, width: 6
                }
            };
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_EDITABLE_0200 editable: ' +
                    pixelmap.isEditable);
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    expect(pixelmap.isEditable == opts.editable).assertTrue();
                    expect(pixelmap.isEditable == edit).assertTrue();
                    done();
                })
                .catch((error:BusinessError) => {
                    console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_EDITABLE_0200 err' + error);
                    expect(false).assertTrue();
                    done();
                });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_MARSHALLING_AND_UNMARSHALLIGN_PROMISE_EDITABLE_0100
         * @tc.name      : marshalling and unmarshalling pixelmap-promise (editable: false,
         *                 pixelFormat: RGB_565, size: { height: 4, width: 6 }, bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.marshalling pixelmap into the messageSequence
         *                 5.unmarshalling pixelmap from the messageSequence
         *                 6.return pixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_MARSHALLING_AND_UNMARSHALLIGN_PROMISE_EDITABLE_0100', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let  i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = 0x80;
            }
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: image.PixelMapFormat.RGB_565,
                size: {
                    height: 4, width: 6
                },
                alphaType: 1
            };
            // let pixelMap;
            // let pixelMap: image.PixelMap | undefined = undefined;
            await image.createPixelMap(color, opts).then((pixelmap) => {
                pixelMap = pixelmap;
                globalpixelmap = pixelmap;
                console.info('SUB_MULTIMEDIA_IMAGE_MARSHALLING_AND_UNMARSHALLIGN_PROMISE_EDITABLE_0100 editable: ' +
                pixelmap.isEditable);
            });
            let parcelable: ESObject = new MySequence1(pixelMap);
            let data = rpc.MessageSequence.create();
            data.writeParcelable(parcelable);
            // let pixel_map = undefined;
            let ret: ESObject = new MySequence2(pixelMap);
            await data.readParcelable(ret);
            if (ret.pixel_map == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_MARSHALLING_AND_UNMARSHALLIGN_PROMISE_EDITABLE_0100 unmarshalling pixelmap failed');
                expect(false).assertTrue();
                done();
            } else {
                expect(ret.pixel_map.isEditable == opts.editable).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_MARSHALLING_AND_UNMARSHALLIGN_PROMISE_EDITABLE_0100 success');
                done();
            }
        });
        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_MARSHALLING_AND_UNMARSHALLIGN_PROMISE_EDITABLE_0200
         * @tc.name      : marshalling and unmarshalling pixelmap-promise (editable: false,
         *                 pixelFormat: BGRA_8888, size: { height: 4, width: 6 }, bytes = buffer)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.marshalling pixelmap into the messageSequence
         *                 5.unmarshalling pixelmap from the messageSequence
         *                 6.return pixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_GRAPHIC_IMAGE_MARSHALLING_AND_UNMARSHALLIGN_PROMISE_EDITABLE_0200', Level.LEVEL0, async (done: Function) => {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = 0x80;
            }
            let opts: image.InitializationOptions = {
                editable: false,
                pixelFormat: 4,
                size: {
                    height: 4, width: 6
                },
                alphaType: 3
            };
            // let pixelMap;
            await image.createPixelMap(color, opts).then((pixelmap) => {
                pixelMap = pixelmap;
                globalpixelmap = pixelmap;
                console.info('SUB_GRAPHIC_IMAGE_MARSHALLING_AND_UNMARSHALLIGN_PROMISE_EDITABLE_0200 editable: ' +
                pixelmap.isEditable);
            });
            let parcelable: ESObject = new MySequence1(pixelMap);
            let data = rpc.MessageSequence.create();
            data.writeParcelable(parcelable);
            // let pixel_map = undefined;
            let ret: ESObject = new MySequence3(pixel_map);
            data.readParcelable(ret);
            if (ret.pixel_map == undefined) {
                console.info('SUB_GRAPHIC_IMAGE_MARSHALLING_AND_UNMARSHALLIGN_PROMISE_EDITABLE_0200 unmarshalling pixelmap failed');
                expect(false).assertTrue();
                done();
            } else {
                expect(ret.pixel_map.isEditable == opts.editable).assertTrue();
                console.info('SUB_GRAPHIC_IMAGE_MARSHALLING_AND_UNMARSHALLIGN_PROMISE_EDITABLE_0200 success');
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0100
         * @tc.name      : imageSource-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0100',
                'test.jpg', 'image/jpeg', 'Promise');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0200
         * @tc.name      : imageSource-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0200',
                'test.jpeg', 'image/jpeg', 'Promise');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0300
         * @tc.name      : imageSource-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0300',
                'test.png', 'image/png', 'PromiseNumber');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0400
         * @tc.name      : imageSource-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0400',
                'test.gif', 'image/gif', 'PromiseNumber');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0500
         * @tc.name      : imageSource-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0500', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0500',
                'moving_test.webp', 'image/webp', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0600
         * @tc.name      : imageSource-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0600', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0600',
                'test.ico', 'image/x-icon', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0700
         * @tc.name      : imageSource-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0700', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0700',
                'test.svg', 'image/svg+xml', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0800
         * @tc.name      : imageSource-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0800', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0800',
                'test.bmp', 'image/bmp', 'CallbackNumber');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0900
         * @tc.name      : imageSource-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0900', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0900',
                'test.dng', 'image/x-adobe-dng', 'CallbackNumber');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0100
         * @tc.name      : imageSource-pixelmap-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0100',
                'test.jpeg', 'image/jpeg', 'Promise');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0200
         * @tc.name      : imageSource-pixelmap-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0200',
                'test.png', 'image/png', 'Promise');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0300
         * @tc.name      : imageSource-pixelmap-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0300',
                'test.gif', 'image/gif', 'PromiseNumber');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0400
         * @tc.name      : imageSource-pixelmap-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0400',
                'test.bmp', 'image/bmp', 'PromiseNumber');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0500
         * @tc.name      : imageSource-pixelmap-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0500', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0500',
                'moving_test.webp', 'image/webp', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0600
         * @tc.name      : imageSource-pixelmap-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0600', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0600',
                'test.ico', 'image/x-icon', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0700
         * @tc.name      : imageSource-pixelmap-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0700', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0700',
                'test.svg', 'image/svg+xml', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0800
         * @tc.name      : imageSource-pixelmap-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0800', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0800',
                'test.jpg', 'image/jpeg', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0900
         * @tc.name      : imageSource-pixelmap-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0900', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0900',
                'test.dng', 'image/x-adobe-dng', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0100
         * @tc.name      : wrongSuffixImage-imageSource-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0100',
                'wrong_suffix_jpg.jpeg', 'image/jpeg', 'Promise');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0200
         * @tc.name      : wrongSuffixImage-imageSource-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0200',
                'wrong_suffix_jpeg.png', 'image/jpeg', 'Promise');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0300
         * @tc.name      : wrongSuffixImage-imageSource-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0300',
                'wrong_suffix_png.gif', 'image/png', 'PromiseNumber');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0400
         * @tc.name      : wrongSuffixImage-imageSource-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_0400',
                'wrong_suffix_gif.tiff', 'image/gif', 'PromiseNumber');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0500
         * @tc.name      : wrongSuffixImage-imageSource-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0500', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done,
                'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0500', 'wrong_suffix_webp.ico',
                'image/webp', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0600
         * @tc.name      : wrongSuffixImage-imageSource-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0600', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done,
                'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0600', 'wrong_suffix_ico.svg',
                'image/x-icon', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0700
         * @tc.name      : wrongSuffixImage-imageSource-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0700', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done,
                'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0700', 'wrong_suffix_svg.bmp',
                'image/svg+xml', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0800
         * @tc.name      : wrongSuffixImage-imageSource-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0800', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done,
                'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0800', 'wrong_suffix_bmp.dng',
                'image/bmp', 'CallbackNumber');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0900
         * @tc.name      : wrongSuffixImage-imageSource-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0900', Level.LEVEL0, async (done: Function) => {
            await testImageSourceImageInfoMimetype(done,
                'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_0900', 'wrong_suffix_dng.jpg',
                'image/x-adobe-dng', 'CallbackNumber');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0100
         * @tc.name      : wrongSuffixImage-imageSource-pixelmap-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done,
                'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0100',
                'wrong_suffix_jpeg.png', 'image/jpeg', 'Promise');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0200
         * @tc.name      : wrongSuffixImage-imageSource-pixelmap-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done,
                'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0200', 'wrong_suffix_png.gif',
                'image/png', 'Promise');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0300
         * @tc.name      : wrongSuffixImage-imageSource-pixelmap-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done,
                'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0300',
                'wrong_suffix_gif.tiff', 'image/gif', 'PromiseNumber');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0400
         * @tc.name      : wrongSuffixImage-imageSource-pixelmap-getImageInfo-promise-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done,
                'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_PROMISE_0400', 'wrong_suffix_bmp.dng',
                'image/bmp', 'PromiseNumber');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0500
         * @tc.name      : wrongSuffixImage-imageSource-pixelmap-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0500', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done,
                'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0500',
                'wrong_suffix_webp.ico', 'image/webp', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0600
         * @tc.name      : wrongSuffixImage-imageSource-pixelmap-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0600', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done,
                'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0500',
                'wrong_suffix_ico.svg', 'image/x-icon', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0700
         * @tc.name      : wrongSuffixImage-imageSource-pixelmap-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0700', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done,
                'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0700',
                'wrong_suffix_svg.bmp', 'image/svg+xml', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0800
         * @tc.name      : wrongSuffixImage-imageSource-pixelmap-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0800', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done,
                'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0800',
                'wrong_suffix_jpg.jpeg', 'image/jpeg', 'Callback');
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0900
         * @tc.name      : wrongSuffixImage-imageSource-pixelmap-getImageInfo-callback-mimetype
         * @tc.desc      : 1.create ImageSource,ImageInfo
         *                 2.call getImageInfo
         *                 3.call return imageinfo
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0900', Level.LEVEL0, async (done: Function) => {
            await testPixelMapImageInfoMimetype(done,
                'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_BYPIXELMAP_GETIMAGEINFO_MIMETYPE_CALLBACK_0900',
                'wrong_suffix_dng.jpg', 'image/x-adobe-dng', 'Callback');
        });
        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_SUB_GRAPHIC_IMAGE_SCALESYNC_0100
         * @tc.name      : Test_ImageScaleSync
         * @tc.desc      : Synchronous scaling of images based on input width and height
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('Test_ImageScaleSync', Level.LEVEL0, async (done: Function) => {
            let color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: false,
                pixelFormat: 4,
                size: {
                    height: 4, width: 6
                },
                alphaType: 3
            };
            let msg = 'Test_ImageScaleSync';
            let scaleX = 2.0;
            let scaleY = 1.0;
            image.createPixelMap(color, opts).then((pixelmap) => {
                console.log(msg + ' Succeed in calling image.createPixelMap');
                let pixelMap = pixelmap;
                try {
                    pixelMap.scaleSync(scaleX, scaleY);
                    console.log(msg + ' Succeed in calling pixelMap.scaleSync');
                    done();
                } catch (err) {
                    console.error(msg + ' Failed in calling pixelMap.scaleSync ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
            });
        });
        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_SUB_GRAPHIC_IMAGE_GETIMAGEINFOSYNC_0100
         * @tc.name      : Test_getImageInfoSync
         * @tc.desc      : Obtaining Image Pixel Information by Synchronous Method
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('Test_getImageInfoSync', Level.LEVEL0, async (done: Function) => {
            let color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: false,
                pixelFormat: 4,
                size: {
                    height: 4, width: 6
                },
                alphaType: 3
            };
            let msg = 'Test_getImageInfoSync';
            image.createPixelMap(color, opts).then((pixelmap) => {
                console.log(msg + ' Succeed in calling image.createPixelMap');
                let pixelMap = pixelmap;
                try {
                    pixelMap.getImageInfoSync();
                    console.log(msg + ' Succeed in calling pixelMap.getImageInfoSync');
                    done();
                } catch (err) {
                    console.log(msg + ' Failed in calling pixelMap.getImageInfoSync ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
            });
        });
        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_SUB_GRAPHIC_IMAGE_CREATEPIXELMAPSYNC_PIXELFORMAT_ALPHATYPE_0100
         * @tc.name      : Test_CreatePixelMapSyncProperty_PixelFormat_AlphaType
         * @tc.desc      : This new interface createPixelMapSync adds properties pixelFormat and alphaType
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('Test_CreatePixelMapSyncProperty_PixelFormat_AlphaType', Level.LEVEL0, async (done: Function) => {
            let color = new ArrayBuffer(96);
            let opts: image.InitializationOptions = {
                editable: false,
                pixelFormat: 4,
                size: {
                    height: 4, width: 6
                },
                alphaType: 3
            };
            let msg = 'Test_CreatePixelMapSyncProperty_PixelFormat_AlphaType';
            try {
                let pixelmap = image.createPixelMapSync(color, opts);
                console.log(msg + ' Succeed in calling image.createPixelMapSync ' + pixelmap);
                done();
            } catch (err) {
                console.log(msg + ' Failed in calling image.createPixelMapSync ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_SUB_GRAPHIC_IMAGE_CREATEPIXELMAPSYNC_PARAMETER_0200
         * @tc.name      : Test_CreatePixelMapSyncPropertyParameter
         * @tc.desc      : This new interface createPixelMapSync adds parameter
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('Test_CreatePixelMapSyncPropertyParameter', Level.LEVEL0, async (done: Function) => {
            let color = new ArrayBuffer(96);
            let initializationOptions: image.InitializationOptions = {
                editable: true,
                pixelFormat: 7,
                size: {
                    height: 7, width: 9
                },
                alphaType: 0
            };
            let msg = 'Test_CreatePixelMapSyncPropertyParameter';
            try {
                let pixelmap = image.createPixelMapSync(color, initializationOptions);
                console.log(msg + ' Succeed in calling image.createPixelMapSync ' + pixelmap);
                done();
            } catch (err) {
                console.log(msg + ' Failed in calling image.createPixelMapSync' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_SUB_GRAPHIC_IMAGE_READPIXELSTOBUFFERSYNC_0100
         * @tc.name      : Test_ReadPixelsToBufferSync
         * @tc.desc      : Read PixelMap to the Buffer in a synchronous way
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('Test_ReadPixelsToBufferSync', Level.LEVEL0, async (done: Function) => {
            let color = new ArrayBuffer(96);
            let InitializationOptions: image.InitializationOptions = {
                editable: false,
                pixelFormat: 4,
                size: {
                    height: 4, width: 6
                },
                alphaType: 3
            };
            let msg = 'Test_ReadPixelsToBufferSync';
            image.createPixelMap(color, InitializationOptions).then((pixelmap) => {
                console.log(msg + ' Succeed in calling image.createPixelMap');
                let pixelMap = pixelmap;
                try {
                    const readBuffer = new ArrayBuffer(96);
                    console.log(msg + ' Succeed in calling ArrayBuffer ');
                    let readPixelsToBufferSyncA = pixelMap.readPixelsToBufferSync(readBuffer);
                    console.log(msg + ' Succeed in calling pixelMap.readPixelsToBufferSync ' +
                    JSON.stringify(readPixelsToBufferSyncA));
                    done();
                } catch (err) {
                    console.log(msg + ' Failed in calling pixelMap.readPixelsToBufferSync ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
            });
        });
        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_SUB_GRAPHIC_IMAGE_WRITEPIXELSSYNC_0100
         * @tc.name      : Test_WritePixelsSync
         * @tc.desc      : Read PixelMap to the Buffer in a synchronous way
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('Test_WritePixelsSync', Level.LEVEL0, async (done: Function) => {
            let msg = 'Test_WritePixelsSync';
            let PositionArea: image.PositionArea = {
                pixels: new ArrayBuffer(8),
                offset: 0,
                stride: 8,
                region: {
                    size: {
                        height: 1, width: 2
                    }, x: 0, y: 0
                }
            };
            let bufferArr = new Uint8Array(PositionArea.pixels);
            let color = new ArrayBuffer(96);
            let InitializationOptions: image.InitializationOptions = {
                editable: false,
                pixelFormat: 4,
                size: {
                    height: 4, width: 6
                },
                alphaType: 3
            };
            for (let i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            image.createPixelMap(color, InitializationOptions).then((pixelmap) => {
                console.log(msg + ' Succeed in calling image.createPixelMap');
                let pixelMap = pixelmap;
                try {
                    let writePixelsSyncA = pixelMap.writePixelsSync(PositionArea);
                    console.log(msg + ' Succeed in calling pixelMap.writePixelsSync ' +
                    JSON.stringify(writePixelsSyncA));
                    done();
                } catch (err) {
                    console.log(msg + ' Failed in calling pixelMap.readPixelsToBufferSync ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0001
         * @tc.name      : create pixelmap-sync (pixelFormat: 0, size: { width: 2, height: 2 },
         alphaType:image.AlphaType.UNPREMUL)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0001", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 0, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            createPixeMapSync(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0001", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0002
         * @tc.name      : create pixelmap-sync (pixelFormat: 0, size: { width: 2, height: 2 },
         alphaType:image.AlphaType.UNPREMUL)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0002", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 2, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            createPixeMapSync(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0002", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0003
         * @tc.name      : create pixelmap-sync (pixelFormat: 0, size: { width: 2, height: 2 },
         alphaType:image.AlphaType.UNPREMUL)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0003", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 3, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            createPixeMapSync(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0003", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0004
         * @tc.name      : create pixelmap-sync (pixelFormat: 0, size: { width: 2, height: 2 },
         alphaType:image.AlphaType.UNPREMUL)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0004", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 4, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            createPixeMapSync(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0004", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0005
         * @tc.name      : create pixelmap-sync (pixelFormat: 0, size: { width: 2, height: 2 },
         alphaType:image.AlphaType.UNPREMUL)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0005", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 5, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            createPixeMapSync(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0005", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0006
         * @tc.name      : create pixelmap-sync (pixelFormat: 0, size: { width: 2, height: 2 },
         alphaType:image.AlphaType.UNPREMUL)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0006", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 6, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            createPixeMapSync(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0006", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0007
         * @tc.name      : create pixelmap-sync (pixelFormat: 0, size: { width: 2, height: 2 },
         alphaType:image.AlphaType.UNPREMUL)
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0007", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 7, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            createPixeMapSync(done, "SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_SYNC_0007", opts);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0100
         * @tc.name      : create PremultiplyPixelMap-promise
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.PremultiplyPixelMap
         *                 5.return color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0100", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 0, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 0, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, opts);
            let dstpixelmap1 = image.createPixelMapSync(opts);
            let constprepixelmap1 = image.createPixelMapSync(color, optsPre);
            image.createPremultipliedPixelMap(srcpixelmap1, dstpixelmap1)
                .then(() => {
                    dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                        constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                            .then(() => {
                                let src = new Uint8Array(readBuffer_1);
                                let dst = new Uint8Array(readBuffer_2);
                                for (let i = 0; i < src.length; i++) {
                                    if (Math.abs(src[i] - dst[i]) > 1) {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0100 failed');
                                        expect(false).assertTrue();
                                        done();
                                        break;
                                    } else {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0100 success');
                                        done();
                                    }
                                }
                            }).catch((error: BusinessError) => {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0100 failed');
                            done();
                        });
                    }).catch((error: BusinessError) => {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0100 failed');
                        done();
                    });
                }).catch((error: BusinessError) => {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0100 failed');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0200
         * @tc.name      : create PremultiplyPixelMap-promise
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.PremultiplyPixelMap
         *                 5.return color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0200", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 2, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 2, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, opts);
            let dstpixelmap1 = image.createPixelMapSync(opts);
            let constprepixelmap1 = image.createPixelMapSync(color, optsPre);
            image.createPremultipliedPixelMap(srcpixelmap1, dstpixelmap1)
                .then(() => {
                    dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                        constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                            .then(() => {
                                let src = new Uint8Array(readBuffer_1);
                                let dst = new Uint8Array(readBuffer_2);
                                for (let i = 0; i < src.length; i++) {
                                    if (Math.abs(src[i] - dst[i]) != 0) {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0200 failed');
                                        expect(false).assertTrue();
                                        done();
                                        break;
                                    } else {
                                        expect(false).assertTrue();
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0200 failed');
                                        done();
                                    }
                                }
                            }).catch((error: BusinessError) => {
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0200 success');
                            done();
                        });
                    }).catch((error: BusinessError) => {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0200 success');
                        done();
                    });
                }).catch((error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0200 success');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0300
         * @tc.name      : create PremultiplyPixelMap-promise
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.PremultiplyPixelMap
         *                 5.return color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0300", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 3, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 3, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, opts);
            let dstpixelmap1 = image.createPixelMapSync(opts);
            let constprepixelmap1 = image.createPixelMapSync(color, optsPre);
            image.createPremultipliedPixelMap(srcpixelmap1, dstpixelmap1)
                .then(() => {
                    dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                        constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                            .then(() => {
                                let src = new Uint8Array(readBuffer_1);
                                let dst = new Uint8Array(readBuffer_2);
                                for (let i = 0; i < src.length; i++) {
                                    if (Math.abs(src[i] - dst[i]) > 1) {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0300 failed');
                                        expect(false).assertTrue();
                                        done();
                                        break;
                                    } else {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0300 success');
                                        done();
                                    }
                                }
                            }).catch((error: BusinessError) => {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0300 failed');
                            done();
                        });
                    }).catch((error: BusinessError) => {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0300 failed');
                        done();
                    });
                }).catch((error: BusinessError) => {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0300 failed');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0400
         * @tc.name      : create PremultiplyPixelMap-promise
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.PremultiplyPixelMap
         *                 5.return color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0400", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 4, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 4, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, opts);
            let dstpixelmap1 = image.createPixelMapSync(opts);
            let constprepixelmap1 = image.createPixelMapSync(color, optsPre);
            image.createPremultipliedPixelMap(srcpixelmap1, dstpixelmap1)
                .then(() => {
                    dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                        constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                            .then(() => {
                                let src = new Uint8Array(readBuffer_1);
                                let dst = new Uint8Array(readBuffer_2);
                                for (let i = 0; i < src.length; i++) {
                                    if (Math.abs(src[i] - dst[i]) > 1) {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0400 failed');
                                        expect(false).assertTrue();
                                        done();
                                        break;
                                    } else {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0400 success');
                                        done();
                                    }
                                }
                            }).catch((error: BusinessError) => {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0400 failed');
                            done();
                        });
                    }).catch((error: BusinessError) => {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0400 failed');
                        done();
                    });
                }).catch((error: BusinessError) => {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0400 failed');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0500
         * @tc.name      : create PremultiplyPixelMap-promise
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.PremultiplyPixelMap
         *                 5.return color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0500", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 5, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 5, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, opts);
            let dstpixelmap1 = image.createPixelMapSync(opts);
            let constprepixelmap1 = image.createPixelMapSync(color, optsPre);
            image.createPremultipliedPixelMap(srcpixelmap1, dstpixelmap1)
                .then(() => {
                    dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                        constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                            .then(() => {
                                let src = new Uint8Array(readBuffer_1);
                                let dst = new Uint8Array(readBuffer_2);
                                for (let i = 0; i < src.length; i++) {
                                    if (Math.abs(src[i] - dst[i]) != 0) {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0500 failed');
                                        expect(false).assertTrue();
                                        done();
                                        break;
                                    } else {
                                        expect(false).assertTrue();
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0500 failed');
                                        done();
                                    }
                                }
                            }).catch((error: BusinessError) => {
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0500 success');
                            done();
                        });
                    }).catch((error: BusinessError) => {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0500 success');
                        done();
                    });
                }).catch((error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0500 success');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0600
         * @tc.name      : create PremultiplyPixelMap-promise
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.PremultiplyPixelMap
         *                 5.return color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0600", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 6, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 6, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, opts);
            let dstpixelmap1 = image.createPixelMapSync(opts);
            let constprepixelmap1 = image.createPixelMapSync(color, optsPre);
            image.createPremultipliedPixelMap(srcpixelmap1, dstpixelmap1)
                .then(() => {
                    dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                        constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                            .then(() => {
                                let src = new Uint8Array(readBuffer_1);
                                let dst = new Uint8Array(readBuffer_2);
                                for (let i = 0; i < src.length; i++) {
                                    if (Math.abs(src[i] - dst[i]) > 1) {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0600 failed');
                                        expect(false).assertTrue();
                                        done();
                                        break;
                                    } else {
                                        expect(false).assertTrue();
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0600 failed');
                                        done();
                                    }
                                }
                            }).catch((error: BusinessError) => {
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0600 success');
                            done();
                        });
                    }).catch((error: BusinessError) => {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0600 success');
                        done();
                    });
                }).catch((error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0600 success');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0700
         * @tc.name      : create PremultiplyPixelMap-promise
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.PremultiplyPixelMap
         *                 5.return color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0700", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 7, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 7, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, opts);
            let dstpixelmap1 = image.createPixelMapSync(opts);
            let constprepixelmap1 = image.createPixelMapSync(color, optsPre);
            image.createPremultipliedPixelMap(srcpixelmap1, dstpixelmap1)
                .then(() => {
                    dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                        constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                            .then(() => {
                                let src = new Uint8Array(readBuffer_1);
                                let dst = new Uint8Array(readBuffer_2);
                                for (let i = 0; i < src.length; i++) {
                                    if (Math.abs(src[i] - dst[i]) != 0) {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0700 failed');
                                        expect(false).assertTrue();
                                        done();
                                        break;
                                    } else {
                                        expect(false).assertTrue();
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0700 failed');
                                        done();
                                    }
                                }
                            }).catch((error: BusinessError) => {
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0700 success');
                            done();
                        });
                    }).catch((error: BusinessError) => {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0700 success');
                        done();
                    });
                }).catch((error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_PROMISE_0700 success');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0100
         * @tc.name      : create PremultiplyPixelMap-callback
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.PremultiplyPixelMap
         *                 5.callback result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 0, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 0, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, opts);
            let dstpixelmap1 = image.createPixelMapSync(opts);
            let constprepixelmap1 = image.createPixelMapSync(color, optsPre);
            let res = false;
            image.createPremultipliedPixelMap(srcpixelmap1, dstpixelmap1, () => {
                dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                    constprepixelmap1.readPixelsToBuffer(readBuffer_2).then(() => {
                        let src = new Uint8Array(readBuffer_1);
                        let dst = new Uint8Array(readBuffer_2);
                        for (let i = 0; i < src.length; i++) {
                            if (Math.abs(src[i] - dst[i]) <= 1) {
                                res = true;
                            } else {
                                res = false;
                                break;
                            }
                        }
                    });
                });
            });
            await sleep(300);
            if (res) {
                expect(res == true).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0100 success');
            } else {
                expect(res.valueOf() == true).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0100 failed');
            }
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0200
         * @tc.name      : create PremultiplyPixelMap-callback
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.PremultiplyPixelMap
         *                 5.callback result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0200', Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 2, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 2, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, opts);
            let dstpixelmap1 = image.createPixelMapSync(opts);
            let constprepixelmap1 = image.createPixelMapSync(color, optsPre);
            let res = false;
            image.createPremultipliedPixelMap(srcpixelmap1, dstpixelmap1, (err) => {
                if (!err) {
                    res = true;
                }
            });
            await sleep(300);
            expect(res == false).assertTrue();
            console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0200 success');
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0300
         * @tc.name      : create PremultiplyPixelMap-callback
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.PremultiplyPixelMap
         *                 5.callback result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0300', Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 3, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 3, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, opts);
            let dstpixelmap1 = image.createPixelMapSync(opts);
            let constprepixelmap1 = image.createPixelMapSync(color, optsPre);
            let res = false;
            image.createPremultipliedPixelMap(srcpixelmap1, dstpixelmap1, () => {
                dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                    constprepixelmap1.readPixelsToBuffer(readBuffer_2).then(() => {
                        let src = new Uint8Array(readBuffer_1);
                        let dst = new Uint8Array(readBuffer_2);
                        for (let i = 0; i < src.length; i++) {
                            if (Math.abs(src[i] - dst[i]) <= 1) {
                                res = true;
                            } else {
                                res = false;
                                break;
                            }
                        }
                    });
                });
            });
            await sleep(300);
            if (res) {
                expect(res == true).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0300 success');
            } else {
                expect(res == false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0300 failed');
            }
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0400
         * @tc.name      : create PremultiplyPixelMap-callback
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.PremultiplyPixelMap
         *                 5.callback result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0400', Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 4, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 4, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, opts);
            let dstpixelmap1 = image.createPixelMapSync(opts);
            let constprepixelmap1 = image.createPixelMapSync(color, optsPre);
            let res = false;
            image.createPremultipliedPixelMap(srcpixelmap1, dstpixelmap1, () => {
                dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                    constprepixelmap1.readPixelsToBuffer(readBuffer_2).then(() => {
                        let src = new Uint8Array(readBuffer_1);
                        let dst = new Uint8Array(readBuffer_2);
                        for (let i = 0; i < src.length; i++) {
                            if (Math.abs(src[i] - dst[i]) <= 1) {
                                res = true;
                            } else {
                                res = false;
                                break;
                            }
                        }
                    });
                });
            });
            await sleep(300);
            if (res) {
                expect(res == true).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0400 success');
            } else {
                expect(res == false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0400 failed');
            }
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0500
         * @tc.name      : create PremultiplyPixelMap-callback
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.PremultiplyPixelMap
         *                 5.callback result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0500', Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 5, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 5, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, opts);
            let dstpixelmap1 = image.createPixelMapSync(opts);
            let constprepixelmap1 = image.createPixelMapSync(color, optsPre);
            let res = false;
            image.createPremultipliedPixelMap(srcpixelmap1, dstpixelmap1, (err) => {
                if (!err) {
                    res = true;
                }
            });
            await sleep(300);
            expect(res == false).assertTrue();
            console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0200 success');
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0600
         * @tc.name      : create PremultiplyPixelMap-callback
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.PremultiplyPixelMap
         *                 5.callback result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0600', Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 6, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 6, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, opts);
            let dstpixelmap1 = image.createPixelMapSync(opts);
            let constprepixelmap1 = image.createPixelMapSync(color, optsPre);
            let res = false;
            image.createPremultipliedPixelMap(srcpixelmap1, dstpixelmap1, () => {
                dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                    constprepixelmap1.readPixelsToBuffer(readBuffer_2).then(() => {
                        let src = new Uint8Array(readBuffer_1);
                        let dst = new Uint8Array(readBuffer_2);
                        for (let i = 0; i < src.length; i++) {
                            if (Math.abs(src[i] - dst[i]) <= 1) {
                                res = true;
                            } else {
                                res = false;
                                break;
                            }
                        }
                    });
                });
            });
            await sleep(300);
            if (res) {
                expect(res == true).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0600 success');
            } else {
                expect(res == false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0600 failed');
            }
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0700
         * @tc.name      : create PremultiplyPixelMap-callback
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.PremultiplyPixelMap
         *                 5.callback result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0700', Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 7, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 7, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, opts);
            let dstpixelmap1 = image.createPixelMapSync(opts);
            let constprepixelmap1 = image.createPixelMapSync(color, optsPre);
            let res = false;
            image.createPremultipliedPixelMap(srcpixelmap1, dstpixelmap1, (err) => {
                if (!err) {
                    res = true;
                }
            });
            await sleep(300);
            expect(res == false).assertTrue();
            console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0700 success');
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0100
         * @tc.name      : create UnPremultiplyPixelMap-promise
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.UnPremultiplyPixelMap
         *                 5.return color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0100", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 0, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 0, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, optsPre);
            let dstpixelmap1 = image.createPixelMapSync(optsPre);
            let constprepixelmap1 = image.createPixelMapSync(color, opts);
            image.createUnpremultipliedPixelMap(srcpixelmap1, dstpixelmap1)
                .then(() => {
                    dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                        constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                            .then(() => {
                                let src = new Uint8Array(readBuffer_1);
                                let dst = new Uint8Array(readBuffer_2);
                                for (let i = 0; i < src.length; i++) {
                                    if (Math.abs(src[i] - dst[i]) > 1) {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0100 failed');
                                        expect(false).assertTrue();
                                        done();
                                        break;
                                    } else {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0100 success');
                                        done();
                                    }
                                }
                            }).catch((error: BusinessError) => {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0100 failed');
                            done();
                        });
                    }).catch((error: BusinessError) => {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0100 failed');
                        done();
                    });
                }).catch((error: BusinessError) => {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0100 failed');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0200
         * @tc.name      : create UnPremultiplyPixelMap-promise
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.UnPremultiplyPixelMap
         *                 5.return color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0200", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 2, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 2, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, optsPre);
            let dstpixelmap1 = image.createPixelMapSync(optsPre);
            let constprepixelmap1 = image.createPixelMapSync(color, opts);
            image.createUnpremultipliedPixelMap(srcpixelmap1, dstpixelmap1)
                .then(() => {
                    dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                        constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                            .then(() => {
                                let src = new Uint8Array(readBuffer_1);
                                let dst = new Uint8Array(readBuffer_2);
                                for (let i = 0; i < src.length; i++) {
                                    if (Math.abs(src[i] - dst[i]) != 0) {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0200 failed');
                                        expect(false).assertTrue();
                                        done();
                                        break;
                                    } else {
                                        expect(false).assertTrue();
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0200 failed');
                                        done();
                                    }
                                }
                            }).catch((error: BusinessError) => {
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0200 success');
                            done();
                        });
                    }).catch((error: BusinessError) => {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0200 success');
                        done();
                    });
                }).catch((error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0100 success');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0300
         * @tc.name      : create UnPremultiplyPixelMap-promise
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.UnPremultiplyPixelMap
         *                 5.return color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0300", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 3, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 3, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, optsPre);
            let dstpixelmap1 = image.createPixelMapSync(optsPre);
            let constprepixelmap1 = image.createPixelMapSync(color, opts);
            image.createUnpremultipliedPixelMap(srcpixelmap1, dstpixelmap1)
                .then(() => {
                    dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                        constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                            .then(() => {
                                let src = new Uint8Array(readBuffer_1);
                                let dst = new Uint8Array(readBuffer_2);
                                for (let i = 0; i < src.length; i++) {
                                    if (Math.abs(src[i] - dst[i]) > 1) {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0300 failed');
                                        expect(false).assertTrue();
                                        done();
                                        break;
                                    } else {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0300 success');
                                        done();
                                    }
                                }
                            }).catch((error: BusinessError) => {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0300 failed');
                            done();
                        });
                    }).catch((error: BusinessError) => {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0300 failed');
                        done();
                    });
                }).catch((error: BusinessError) => {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0300 failed');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0400
         * @tc.name      : create UnPremultiplyPixelMap-promise
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.UnPremultiplyPixelMap
         *                 5.return color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0400", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 4, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 4, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, optsPre);
            let dstpixelmap1 = image.createPixelMapSync(optsPre);
            let constprepixelmap1 = image.createPixelMapSync(color, opts);
            image.createUnpremultipliedPixelMap(srcpixelmap1, dstpixelmap1)
                .then(() => {
                    dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                        constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                            .then(() => {
                                let src = new Uint8Array(readBuffer_1);
                                let dst = new Uint8Array(readBuffer_2);
                                for (let i = 0; i < src.length; i++) {
                                    if (Math.abs(src[i] - dst[i]) > 1) {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0400 failed');
                                        expect(false).assertTrue();
                                        done();
                                        break;
                                    } else {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0400 success');
                                        done();
                                    }
                                }
                            }).catch((error: BusinessError) => {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0400 failed');
                            done();
                        });
                    }).catch((error: BusinessError) => {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0400 failed');
                        done();
                    });
                }).catch((error: BusinessError) => {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0400 failed');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0500
         * @tc.name      : create UnPremultiplyPixelMap-promise
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.UnPremultiplyPixelMap
         *                 5.return color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0500", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 5, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 5, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, optsPre);
            let dstpixelmap1 = image.createPixelMapSync(optsPre);
            let constprepixelmap1 = image.createPixelMapSync(color, opts);
            image.createUnpremultipliedPixelMap(srcpixelmap1, dstpixelmap1)
                .then(() => {
                    dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                        constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                            .then(() => {
                                let src = new Uint8Array(readBuffer_1);
                                let dst = new Uint8Array(readBuffer_2);
                                for (let i = 0; i < src.length; i++) {
                                    if (Math.abs(src[i] - dst[i]) != 0) {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0500 failed');
                                        expect(false).assertTrue();
                                        done();
                                        break;
                                    } else {
                                        expect(false).assertTrue();
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0500 failed');
                                        done();
                                    }
                                }
                            }).catch((error: Function) => {
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0500 success');
                            done();
                        });
                    }).catch((error: Function) => {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0500 success');
                        done();
                    });
                }).catch((error: Function) => {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0500 success');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0600
         * @tc.name      : create UnPremultiplyPixelMap-promise
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.UnPremultiplyPixelMap
         *                 5.return color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0600", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 6, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 6, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, optsPre);
            let dstpixelmap1 = image.createPixelMapSync(optsPre);
            let constprepixelmap1 = image.createPixelMapSync(color, opts);
            image.createUnpremultipliedPixelMap(srcpixelmap1, dstpixelmap1)
                .then(() => {
                    dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                        constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                            .then(() => {
                                let src = new Uint8Array(readBuffer_1);
                                let dst = new Uint8Array(readBuffer_2);
                                for (let i = 0; i < src.length; i++) {
                                    if (Math.abs(src[i] - dst[i]) > 1) {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0600 failed');
                                        expect(false).assertTrue();
                                        done();
                                        break;
                                    } else {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0600 success');
                                        done();
                                    }
                                }
                            }).catch((error: BusinessError) => {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0600 failed');
                            done();
                        });
                    }).catch((error: BusinessError) => {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0600 failed');
                        done();
                    });
                }).catch((error: BusinessError) => {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0600 failed');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0700
         * @tc.name      : create UnPremultiplyPixelMap-promise
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.UnPremultiplyPixelMap
         *                 5.return color
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0700", Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 7, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 7, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, optsPre);
            let dstpixelmap1 = image.createPixelMapSync(optsPre);
            let constprepixelmap1 = image.createPixelMapSync(color, opts);
            image.createUnpremultipliedPixelMap(srcpixelmap1, dstpixelmap1)
                .then(() => {
                    dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                        constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                            .then(() => {
                                let src = new Uint8Array(readBuffer_1);
                                let dst = new Uint8Array(readBuffer_2);
                                for (let i = 0; i < src.length; i++) {
                                    if (Math.abs(src[i] - dst[i]) != 0) {
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0700 failed');
                                        expect(false).assertTrue();
                                        done();
                                        break;
                                    } else {
                                        expect(false).assertTrue();
                                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0700 failed');
                                        done();
                                    }
                                }
                            }).catch((error: BusinessError) => {
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0700 success');
                            done();
                        });
                    }).catch((error: BusinessError) => {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0700 success');
                        done();
                    });
                }).catch((error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_PROMISE_0700 success');
                done();
            });
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0100
         * @tc.name      : create PremultiplyPixelMap-callback
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.UnPremultiplyPixelMap
         *                 5.callback result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 0, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 0, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, optsPre);
            let dstpixelmap1 = image.createPixelMapSync(optsPre);
            let constprepixelmap1 = image.createPixelMapSync(color, opts);
            let res = false;
            image.createUnpremultipliedPixelMap(srcpixelmap1, dstpixelmap1, () => {
                dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                    constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                        .then(() => {
                            let src = new Uint8Array(readBuffer_1);
                            let dst = new Uint8Array(readBuffer_2);
                            for (let i = 0; i < src.length; i++) {
                                if (Math.abs(src[i] - dst[i]) <= 1) {
                                    res = true;
                                } else {
                                    res = false;
                                    break;
                                }
                            }
                        });
                });
            });
            await sleep(300);
            if (res) {
                expect(res == true).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0600 success');
            } else {
                expect(res == false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0600 failed');
            }
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0200
         * @tc.name      : create PremultiplyPixelMap-callback
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.UnPremultiplyPixelMap
         *                 5.callback result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0200', Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 2, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 2, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, optsPre);
            let dstpixelmap1 = image.createPixelMapSync(optsPre);
            let constprepixelmap1 = image.createPixelMapSync(color, opts);
            let res = false;
            image.createUnpremultipliedPixelMap(srcpixelmap1, dstpixelmap1, (err) => {
                if (!err) {
                    res = true;
                }
            });
            await sleep(300);
            expect(res == false).assertTrue();
            console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0200 success');
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0300
         * @tc.name      : create PremultiplyPixelMap-callback
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.UnPremultiplyPixelMap
         *                 5.callback result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0300', Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 3, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 3, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, optsPre);
            let dstpixelmap1 = image.createPixelMapSync(optsPre);
            let constprepixelmap1 = image.createPixelMapSync(color, opts);
            let res = false;
            image.createUnpremultipliedPixelMap(srcpixelmap1, dstpixelmap1, () => {
                dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                    constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                        .then(() => {
                            let src = new Uint8Array(readBuffer_1);
                            let dst = new Uint8Array(readBuffer_2);
                            for (let i = 0; i < src.length; i++) {
                                if (Math.abs(src[i] - dst[i]) <= 1) {
                                    res = true;
                                } else {
                                    res = false;
                                    break;
                                }
                            }
                        });
                });
            });
            await sleep(300);
            if (res) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0300 success');
            } else {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0300 failed');
            }
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0400
         * @tc.name      : create PremultiplyPixelMap-callback
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.UnPremultiplyPixelMap
         *                 5.callback result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0400', Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 4, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 4, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, optsPre);
            let dstpixelmap1 = image.createPixelMapSync(optsPre);
            let constprepixelmap1 = image.createPixelMapSync(color, opts);
            let res = false;
            image.createUnpremultipliedPixelMap(srcpixelmap1, dstpixelmap1, () => {
                dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                    constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                        .then(() => {
                            let src = new Uint8Array(readBuffer_1);
                            let dst = new Uint8Array(readBuffer_2);
                            for (let i = 0; i < src.length; i++) {
                                if (Math.abs(src[i] - dst[i]) <= 1) {
                                    res = true;
                                } else {
                                    res = false;
                                    break;
                                }
                            }
                        });
                });
            });
            await sleep(300);
            if (res) {
                expect(res == true).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0600 success');
            } else {
                expect(res == false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0600 failed');
            }
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0500
         * @tc.name      : create PremultiplyPixelMap-callback
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.UnPremultiplyPixelMap
         *                 5.callback result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0500', Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 5, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 5, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, optsPre);
            let dstpixelmap1 = image.createPixelMapSync(optsPre);
            let constprepixelmap1 = image.createPixelMapSync(color, opts);
            let res = false;
            image.createUnpremultipliedPixelMap(srcpixelmap1, dstpixelmap1, (err) => {
                if (!err) {
                    res = true;
                }
            });
            await sleep(300);
            expect(res == false).assertTrue();
            console.info('SUB_MULTIMEDIA_IMAGE_CREATEPREMULTIPLIEDPIXELMAP_CALLBACK_0500 success');
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0600
         * @tc.name      : create PremultiplyPixelMap-callback
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.UnPremultiplyPixelMap
         *                 5.callback result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0600', Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 6, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 6, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, optsPre);
            let dstpixelmap1 = image.createPixelMapSync(optsPre);
            let constprepixelmap1 = image.createPixelMapSync(color, opts);
            let res = false;
            image.createUnpremultipliedPixelMap(srcpixelmap1, dstpixelmap1, () => {
                dstpixelmap1.readPixelsToBuffer(readBuffer_1).then(() => {
                    constprepixelmap1.readPixelsToBuffer(readBuffer_2)
                        .then(() => {
                            let src = new Uint8Array(readBuffer_1);
                            let dst = new Uint8Array(readBuffer_2);
                            for (let i = 0; i < src.length; i++) {
                                if (Math.abs(src[i] - dst[i]) <= 1) {
                                    res = true;
                                } else {
                                    res = false;
                                    break;
                                }
                            }
                        });
                });
            });
            await sleep(300);
            if (res) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0600 success');
            } else {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0600 failed');
            }
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0700
         * @tc.name      : create PremultiplyPixelMap-callback
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size,color
         *                 3.using color and opts create newPixelMap
         *                 4.UnPremultiplyPixelMap
         *                 5.callback result
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0700', Level.LEVEL0, async (done: Function) => {
            let opts: image.InitializationOptions = {
                pixelFormat: 7, size: {
                    width: 2, height: 2
                }, alphaType: 3
            };
            let optsPre: image.InitializationOptions = {
                pixelFormat: 7, size: {
                    width: 2, height: 2
                }, alphaType: 2
            };
            const color = new ArrayBuffer(2 * 2 * 4);
            let bufferArr = new Uint8Array(color);
            bufferArr[0] = 255; //b
            bufferArr[1] = 0; //g
            bufferArr[2] = 153; //r
            bufferArr[3] = 127; //a
            bufferArr[4] = 0; //b
            bufferArr[5] = 255; //g
            bufferArr[6] = 153; //r
            bufferArr[7] = 127; //a
            bufferArr[8] = 153; //b
            bufferArr[9] = 0; //g
            bufferArr[10] = 255; //r
            bufferArr[11] = 102; //a
            bufferArr[12] = 153; //b
            bufferArr[13] = 153; //g
            bufferArr[14] = 153; //r
            bufferArr[15] = 127; //a
            const readBuffer_1 = new ArrayBuffer(2 * 2 * 4);
            const readBuffer_2 = new ArrayBuffer(2 * 2 * 4);
            let srcpixelmap1 = image.createPixelMapSync(color, optsPre);
            let dstpixelmap1 = image.createPixelMapSync(optsPre);
            let constprepixelmap1 = image.createPixelMapSync(color, opts);
            let res = false;
            image.createUnpremultipliedPixelMap(srcpixelmap1, dstpixelmap1, (err) => {
                if (!err) {
                    res = true;
                }
            });
            await sleep(300);
            expect(res == false).assertTrue();
            console.info('SUB_MULTIMEDIA_IMAGE_CREATEUNPREMULTIPLIEDPIXELMAP_CALLBACK_0700 success');
            done();
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0100
         * @tc.name      : create pixlelmap of RGB_565
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0100', Level.LEVEL0, async (done: Function) => {
            const RGB_565 = image.PixelMapFormat.RGB_565;
            const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
            const BGRA_8888 = image.PixelMapFormat.BGRA_8888;
            const RGB_888 = image.PixelMapFormat.RGB_888;
            const ALPHA_8 = image.PixelMapFormat.ALPHA_8;
            const RGBA_F16 = image.PixelMapFormat.RGBA_F16;
            const NV21 = image.PixelMapFormat.NV21;
            const NV12 = image.PixelMapFormat.NV12;
            const gPixelFormat = new Map([
                [RGB_565, "PixelFormat::RGB_565"],
                [RGBA_8888, "PixelFormat::RGBA_8888"],
                [BGRA_8888, "PixelFormat::BGRA_8888"],
                [RGB_888, "PixelFormat::RGB_888"],
                [ALPHA_8, "PixelFormat::ALPHA_8"],
                [RGBA_F16, "PixelFormat::RGBA_F16"],
                [NV21, "PixelFormat::NV21"],
                [NV12, "PixelFormat::NV12"]
            ]);
            let options: image.InitializationOptions = {
                editable: true,
                srcPixelFormat: image.PixelMapFormat.UNKNOWN,
                pixelFormat: image.PixelMapFormat.UNKNOWN,
                alphaType: image.AlphaType.OPAQUE,
                size: {
                    height: 3,
                    width: 2
                }
            };
            // RGB_565 to others
            options.srcPixelFormat = RGB_565;
            for (let item of gPixelFormat.keys()) {
                let colorlength = 12;
                const color = new ArrayBuffer(colorlength);
                let buffer = new Uint8Array(color);
                for (let i = 0; i < colorlength; i += 6) {
                    buffer[i] = 0xEA;
                    buffer[i + 1] = 0x8E;
                    buffer[i + 2] = 0x0A;
                    buffer[i + 3] = 0x87;
                    buffer[i + 4] = 0x0B;
                    buffer[i + 5] = 0x87;
                }
                options.pixelFormat = item;
                let pixelMap1 = image.createPixelMap(color, options);
                if (pixelMap1 != undefined) {
                    expect(pixelMap1 != undefined).assertTrue();
                    console.info("SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0100 success");
                    done();
                }
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0200
         * @tc.name      : create pixlelmap of RGBA_8888
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0200', Level.LEVEL0, async (done: Function) => {
            const RGB_565 = image.PixelMapFormat.RGB_565;
            const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
            const BGRA_8888 = image.PixelMapFormat.BGRA_8888;
            const RGB_888 = image.PixelMapFormat.RGB_888;
            const ALPHA_8 = image.PixelMapFormat.ALPHA_8;
            const RGBA_F16 = image.PixelMapFormat.RGBA_F16;
            const NV21 = image.PixelMapFormat.NV21;
            const NV12 = image.PixelMapFormat.NV12;
            const gPixelFormat = new Map([
                [RGB_565, "PixelFormat::RGB_565"],
                [RGBA_8888, "PixelFormat::RGBA_8888"],
                [BGRA_8888, "PixelFormat::BGRA_8888"],
                [RGB_888, "PixelFormat::RGB_888"],
                [ALPHA_8, "PixelFormat::ALPHA_8"],
                [RGBA_F16, "PixelFormat::RGBA_F16"],
                [NV21, "PixelFormat::NV21"],
                [NV12, "PixelFormat::NV12"]
            ]);
            let options: image.InitializationOptions = {
                editable: true,
                srcPixelFormat: image.PixelMapFormat.UNKNOWN,
                pixelFormat: image.PixelMapFormat.UNKNOWN,
                alphaType: image.AlphaType.OPAQUE,
                size: {
                    height: 3,
                    width: 2
                }
            };
            // RGBA_8888 to others
            options.srcPixelFormat = RGBA_8888;
            for (let item of gPixelFormat.keys()) {
                let colorlength = 24;
                const color = new ArrayBuffer(colorlength);
                let buffer = new Uint8Array(color);
                for (let i = 0; i < colorlength; i += 4) {
                    buffer[i] = 0x83;
                    buffer[i + 1] = 0xDF;
                    buffer[i + 2] = 0x52;
                    buffer[i + 3] = 0x78;
                }
                options.pixelFormat = item;
                let pixelMap1 = image.createPixelMap(color, options);
                if (pixelMap1 != undefined) {
                    expect(pixelMap1 != undefined).assertTrue();
                    console.info("SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0200 success");
                    done();
                }
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0300
         * @tc.name      : create pixlelmap of BGRA_8888
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0300', Level.LEVEL0, async (done: Function) => {
            const RGB_565 = image.PixelMapFormat.RGB_565;
            const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
            const BGRA_8888 = image.PixelMapFormat.BGRA_8888;
            const RGB_888 = image.PixelMapFormat.RGB_888;
            const ALPHA_8 = image.PixelMapFormat.ALPHA_8;
            const RGBA_F16 = image.PixelMapFormat.RGBA_F16;
            const NV21 = image.PixelMapFormat.NV21;
            const NV12 = image.PixelMapFormat.NV12;
            const gPixelFormat = new Map([
                [RGB_565, "PixelFormat::RGB_565"],
                [RGBA_8888, "PixelFormat::RGBA_8888"],
                [BGRA_8888, "PixelFormat::BGRA_8888"],
                [RGB_888, "PixelFormat::RGB_888"],
                [ALPHA_8, "PixelFormat::ALPHA_8"],
                [RGBA_F16, "PixelFormat::RGBA_F16"],
                [NV21, "PixelFormat::NV21"],
                [NV12, "PixelFormat::NV12"]
            ]);
            let options: image.InitializationOptions = {
                editable: true,
                srcPixelFormat: image.PixelMapFormat.UNKNOWN,
                pixelFormat: image.PixelMapFormat.UNKNOWN,
                alphaType: image.AlphaType.OPAQUE,
                size: {
                    height: 3,
                    width: 2
                }
            };
            // BGRA_8888 to others
            options.srcPixelFormat = BGRA_8888;
            for (let item of gPixelFormat.keys()) {
                let colorlength = 24;
                const color = new ArrayBuffer(colorlength);
                let buffer = new Uint8Array(color);
                for (let i = 0; i < colorlength; i += 4) {
                    buffer[i] = 0x83;
                    buffer[i + 1] = 0xDF;
                    buffer[i + 2] = 0x52;
                    buffer[i + 3] = 0x78;
                }
                options.pixelFormat = item;
                let pixelMap1 = image.createPixelMap(color, options);
                if (pixelMap1 != undefined) {
                    expect(pixelMap1 != undefined).assertTrue();
                    console.info("SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0300 success");
                    done();
                }
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0400
         * @tc.name      : create pixlelmap of RGB_888
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0400', Level.LEVEL0, async (done: Function) => {
            const RGB_565 = image.PixelMapFormat.RGB_565;
            const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
            const BGRA_8888 = image.PixelMapFormat.BGRA_8888;
            const RGB_888 = image.PixelMapFormat.RGB_888;
            const ALPHA_8 = image.PixelMapFormat.ALPHA_8;
            const RGBA_F16 = image.PixelMapFormat.RGBA_F16;
            const NV21 = image.PixelMapFormat.NV21;
            const NV12 = image.PixelMapFormat.NV12;
            const gPixelFormat = new Map([
                [RGB_565, "PixelFormat::RGB_565"],
                [RGBA_8888, "PixelFormat::RGBA_8888"],
                [BGRA_8888, "PixelFormat::BGRA_8888"],
                [RGB_888, "PixelFormat::RGB_888"],
                [ALPHA_8, "PixelFormat::ALPHA_8"],
                [RGBA_F16, "PixelFormat::RGBA_F16"],
                [NV21, "PixelFormat::NV21"],
                [NV12, "PixelFormat::NV12"]
            ]);
            let options: image.InitializationOptions = {
                editable: true,
                srcPixelFormat: image.PixelMapFormat.UNKNOWN,
                pixelFormat: image.PixelMapFormat.UNKNOWN,
                alphaType: image.AlphaType.OPAQUE,
                size: {
                    height: 3,
                    width: 2
                }
            };
            // RGB_888 to others
            options.srcPixelFormat = RGB_888;
            for (let item of gPixelFormat.keys()) {
                let colorlength = 18;
                const color = new ArrayBuffer(colorlength);
                let buffer = new Uint8Array(20);
                for (let i = 0; i < colorlength; i += 3) {
                    buffer[i] = 0x83;
                    buffer[i + 1] = 0xDF;
                    buffer[i + 2] = 0x52;
                }
                options.pixelFormat = item;
                let pixelMap1 = image.createPixelMap(color, options);
                if (pixelMap1 != undefined) {
                    expect(pixelMap1 != undefined).assertTrue();
                    console.info("SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0400 success");
                    done();
                }
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0500
         * @tc.name      : create pixlelmap of ALPHA_8
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0500', Level.LEVEL0, async (done: Function) => {
            const RGB_565 = image.PixelMapFormat.RGB_565;
            const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
            const BGRA_8888 = image.PixelMapFormat.BGRA_8888;
            const RGB_888 = image.PixelMapFormat.RGB_888;
            const ALPHA_8 = image.PixelMapFormat.ALPHA_8;
            const RGBA_F16 = image.PixelMapFormat.RGBA_F16;
            const NV21 = image.PixelMapFormat.NV21;
            const NV12 = image.PixelMapFormat.NV12;
            const gPixelFormat = new Map([
                [RGB_565, "PixelFormat::RGB_565"],
                [RGBA_8888, "PixelFormat::RGBA_8888"],
                [BGRA_8888, "PixelFormat::BGRA_8888"],
                [RGB_888, "PixelFormat::RGB_888"],
                [ALPHA_8, "PixelFormat::ALPHA_8"],
                [RGBA_F16, "PixelFormat::RGBA_F16"],
                [NV21, "PixelFormat::NV21"],
                [NV12, "PixelFormat::NV12"]
            ]);
            let options: image.InitializationOptions = {
                editable: true,
                srcPixelFormat: image.PixelMapFormat.UNKNOWN,
                pixelFormat: image.PixelMapFormat.UNKNOWN,
                alphaType: image.AlphaType.OPAQUE,
                size: {
                    height: 3,
                    width: 2
                }
            };
            // ALPHA_8 to others
            options.srcPixelFormat = ALPHA_8;
            for (let item of gPixelFormat.keys()) {
                let colorlength = 6;
                const color = new ArrayBuffer(6);
                let buffer = new Uint8Array(8);
                for (let i = 0; i < colorlength; i++) {
                    buffer[i] = 0x78;
                }
                options.pixelFormat = item;
                let pixelMap1 = image.createPixelMap(color, options);
                if (pixelMap1 != undefined) {
                    expect(pixelMap1 != undefined).assertTrue();
                    console.info("SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0500 success");
                    done();
                }
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0600
         * @tc.name      : create pixlelmap of RGBA_F16
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0600', Level.LEVEL0, async (done: Function) => {
            const RGB_565 = image.PixelMapFormat.RGB_565;
            const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
            const BGRA_8888 = image.PixelMapFormat.BGRA_8888;
            const RGB_888 = image.PixelMapFormat.RGB_888;
            const ALPHA_8 = image.PixelMapFormat.ALPHA_8;
            const RGBA_F16 = image.PixelMapFormat.RGBA_F16;
            const NV21 = image.PixelMapFormat.NV21;
            const NV12 = image.PixelMapFormat.NV12;
            const gPixelFormat = new Map([
                [RGB_565, "PixelFormat::RGB_565"],
                [RGBA_8888, "PixelFormat::RGBA_8888"],
                [BGRA_8888, "PixelFormat::BGRA_8888"],
                [RGB_888, "PixelFormat::RGB_888"],
                [ALPHA_8, "PixelFormat::ALPHA_8"],
                [RGBA_F16, "PixelFormat::RGBA_F16"],
                [NV21, "PixelFormat::NV21"],
                [NV12, "PixelFormat::NV12"]
            ]);
            let options: image.InitializationOptions = {
                editable: true,
                srcPixelFormat: image.PixelMapFormat.UNKNOWN,
                pixelFormat: image.PixelMapFormat.UNKNOWN,
                alphaType: image.AlphaType.OPAQUE,
                size: {
                    height: 3,
                    width: 2
                }
            };
            // RGBA_F16 to others
            options.srcPixelFormat = RGBA_F16;
            for (let item of gPixelFormat.keys()) {
                let colorlength = 48;
                const color = new ArrayBuffer(colorlength);
                let buffer = new Uint8Array(color);
                for (let i = 0; i < colorlength; i += 8) {
                    buffer[i] = 0xEF;
                    buffer[i + 1] = 0x82;
                    buffer[i + 2] = 0x05;
                    buffer[i + 3] = 0xDF;
                    buffer[i + 4] = 0x05;
                    buffer[i + 5] = 0x52;
                    buffer[i + 6] = 0x78;
                    buffer[i + 7] = 0x78;
                }
                options.pixelFormat = item;
                let pixelMap1 = image.createPixelMap(color, options);
                if (pixelMap1 != undefined) {
                    expect(pixelMap1 != undefined).assertTrue();
                    console.info("SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0600 success");
                    done();
                }
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0700
         * @tc.name      : create pixlelmap of NV21
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0700', Level.LEVEL0, async (done: Function) => {
            const RGB_565 = image.PixelMapFormat.RGB_565;
            const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
            const BGRA_8888 = image.PixelMapFormat.BGRA_8888;
            const RGB_888 = image.PixelMapFormat.RGB_888;
            const ALPHA_8 = image.PixelMapFormat.ALPHA_8;
            const RGBA_F16 = image.PixelMapFormat.RGBA_F16;
            const NV21 = image.PixelMapFormat.NV21;
            const NV12 = image.PixelMapFormat.NV12;
            const gPixelFormat = new Map([
                [RGB_565, "PixelFormat::RGB_565"],
                [RGBA_8888, "PixelFormat::RGBA_8888"],
                [BGRA_8888, "PixelFormat::BGRA_8888"],
                [RGB_888, "PixelFormat::RGB_888"],
                [ALPHA_8, "PixelFormat::ALPHA_8"],
                [RGBA_F16, "PixelFormat::RGBA_F16"],
                [NV21, "PixelFormat::NV21"],
                [NV12, "PixelFormat::NV12"]
            ]);
            let options: image.InitializationOptions = {
                editable: true,
                srcPixelFormat: image.PixelMapFormat.UNKNOWN,
                pixelFormat: image.PixelMapFormat.UNKNOWN,
                alphaType: image.AlphaType.OPAQUE,
                size: {
                    height: 3,
                    width: 2
                }
            };
            // NV21 to others
            options.srcPixelFormat = NV21;
            for (let item of gPixelFormat.keys()) {
                let buffer = new Uint8Array(12);
                let yLen = options.size.width * options.size.height; // yLen is 6
                let w = (options.size.width % 2 == 0) ? (options.size.width) : (options.size.width + 1);
                let h = (options.size.height % 2 == 0) ? (options.size.height) : (options.size.height + 1);
                let uvLen = w * h / 2; // uvLen is 4
                for (let i = 0; i < yLen; i++) {
                    buffer[i] = 0xAA;
                }
                for (let i = yLen; i < yLen + uvLen; i += 2) {
                    buffer[i] = 0x62;
                    buffer[i + 1] = 0x50;
                }
                let colorlength = yLen + uvLen;
                const color = new ArrayBuffer(colorlength);
                buffer = new Uint8Array(color);
                options.pixelFormat = item;
                let pixelMap1 = image.createPixelMap(color, options);
                if (pixelMap1 != undefined) {
                    expect(pixelMap1 != undefined).assertTrue();
                    console.info("SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0700 success");
                    done();
                }
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0800
         * @tc.name      : create pixlelmap of NV12
         * @tc.desc      : 1.create InitializationOptions object
         *                 2.set editable,pixeFormat,size
         *                 3.using color and opts create newPixelMap
         *                 4.return newpixelmap not empty
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0800', Level.LEVEL0, async (done: Function) => {
            const RGB_565 = image.PixelMapFormat.RGB_565;
            const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
            const BGRA_8888 = image.PixelMapFormat.BGRA_8888;
            const RGB_888 = image.PixelMapFormat.RGB_888;
            const ALPHA_8 = image.PixelMapFormat.ALPHA_8;
            const RGBA_F16 = image.PixelMapFormat.RGBA_F16;
            const NV21 = image.PixelMapFormat.NV21;
            const NV12 = image.PixelMapFormat.NV12;
            const gPixelFormat = new Map([
                [RGB_565, "PixelFormat::RGB_565"],
                [RGBA_8888, "PixelFormat::RGBA_8888"],
                [BGRA_8888, "PixelFormat::BGRA_8888"],
                [RGB_888, "PixelFormat::RGB_888"],
                [ALPHA_8, "PixelFormat::ALPHA_8"],
                [RGBA_F16, "PixelFormat::RGBA_F16"],
                [NV21, "PixelFormat::NV21"],
                [NV12, "PixelFormat::NV12"]
            ]);
            let options: image.InitializationOptions = {
                editable: true,
                srcPixelFormat: image.PixelMapFormat.UNKNOWN,
                pixelFormat: image.PixelMapFormat.UNKNOWN,
                alphaType: image.AlphaType.OPAQUE,
                size: {
                    height: 3,
                    width: 2
                }
            };
            // NV12 to others
            options.srcPixelFormat = NV12;
            for (let item of gPixelFormat.keys()) {
                let buffer = new Uint8Array(12);
                let yLen = options.size.width * options.size.height; // yLen is 6
                let w = (options.size.width % 2 == 0) ? (options.size.width) : (options.size.width + 1);
                let h = (options.size.height % 2 == 0) ? (options.size.height) : (options.size.height + 1);
                let uvLen = w * h / 2; // uvLen is 4
                for (let i = 0; i < yLen; i++) {
                    buffer[i] = 0xAA;
                }
                for (let i = yLen; i < yLen + uvLen; i += 2) {
                    buffer[i] = 0x50;
                    buffer[i + 1] = 0x62;
                }
                let colorlength = yLen + uvLen;
                const color = new ArrayBuffer(colorlength);
                buffer = new Uint8Array(color);
                options.pixelFormat = item;
                let pixelMap1 = image.createPixelMap(color, options);
                if (pixelMap1 != undefined) {
                    expect(pixelMap1 != undefined).assertTrue();
                    console.info("SUB_MULTIMEDIA_IMAGE_PIXELFORMATTOAVPIXELFORMAT_0800 success");
                    done();
                }
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_0100
         * @tc.desc      : 1.test Image getDecodeSupportedFormats
         * @tc.size      : MediumTest
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_0100', Level.LEVEL0, async (done: Function) => {
            let logger = "SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_0100";
            const srcSupportedFormatsList: Array<string> = await image.getImageSourceSupportedFormats();
            const dstSupportedFormatsList: Array<string> = image.createImageSource(testContext.filesDir + '/' + "test.jpg").supportedFormats;
            console.log(`${logger}, srcSupportedFormatsList: ` + JSON.stringify(srcSupportedFormatsList));
            console.log(`${logger}, dstSupportedFormatsList: ` + JSON.stringify(dstSupportedFormatsList));
            const ret = (JSON.stringify(srcSupportedFormatsList) == JSON.stringify(dstSupportedFormatsList));
            console.log("compare result is: " + ret);
            expect(ret).assertTrue();
            done();
        })
    
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_0100
         * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_0100
         * @tc.desc      : 1.test image getEncodeSupportedFormats
         * @tc.size      : MediumTest
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_0100', Level.LEVEL0, async (done: Function) => {
            let logger = "SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_0100";
            const srcSupportedFormatsList: Array<string> = await image.getImagePackerSupportedFormats();
            const dstSupportedFormatsList: Array<string> = image.createImagePacker().supportedFormats;
            console.log(`${logger}, srcSupportedFormatsList: ` + JSON.stringify(srcSupportedFormatsList));
            console.log(`${logger}, dstSupportedFormatsList: ` + JSON.stringify(dstSupportedFormatsList));
            const ret = (JSON.stringify(srcSupportedFormatsList) == JSON.stringify(dstSupportedFormatsList));
            console.log("compare result is: " + ret);
            expect(ret).assertTrue();
            done();
        })
    })
}
