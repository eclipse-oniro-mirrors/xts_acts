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
import fileio from '@ohos.fileio'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { testPng, testJpg } from './testImg'
import { tcBuf020, tcBuf020_1, tcBuf021, tcBuf021_1, tcBuf022 } from './testImg'
import featureAbility from '@ohos.ability.featureAbility'

export default function imageJsTest() {
    describe('imageJsTest', function () {
        let filePath;
        let fdNumber;
        let globalpixelmap;
        let globalimageSource;
        let globalpacker;
        class MySequence1 {
            pixel_map;
            constructor(pixelmap) {
              this.pixel_map = pixelmap;
            }
            marshalling(messageSequence) {
              this.pixel_map.marshalling(messageSequence);
              return true;
            }
            async unmarshalling(messageSequence) {
              await image.unmarshalling(messageSequence).then(async (pixelMap) => {
                this.pixel_map = pixelMap;
              })
              return true;
            }
          }        
          class MySequence2 {
            pixel_map;
            constructor(pixelmap) {
                this.pixel_map = pixelmap;
            }
            marshalling(messageSequence) {
                this.pixel_map.marshalling(messageSequence);
                return true;
            }
            async unmarshalling(messageSequence) {
              await image.unmarshalling(messageSequence).then(async(pixelMap) => {
                this.pixel_map = pixelMap;
              })
              return true;
            }
        }
        class MySequence3 {
            pixel_map;
            constructor(pixelmap) {
                this.pixel_map = pixelmap;
            }
            marshalling(messageSequence) {
                this.pixel_map.marshalling(messageSequence);
                return true;
            }
            async unmarshalling(messageSequence) {
                this.pixel_map = image.createPixelMapFromParcel(messageSequence);
                return true;
            }
        }
        async function getFd(fileName) {
            let context = await featureAbility.getContext();
            await context.getFilesDir().then((data) => {
                filePath = data + '/' + fileName;
                console.info('image case filePath is ' + filePath);
            })
            await fileio.open(filePath).then((data) => {
                fdNumber = data;
                console.info("image case open fd success " + fdNumber);
            }, (err) => {
                console.info("image cese open fd fail" + err)
            }).catch((err) => {
                console.info("image case open fd err " + err);
            })
        }
        beforeAll(async function () {
            console.info('beforeAll case');
        })

        beforeEach(function () {
            console.info('beforeEach case');
        })

        afterEach(async function () {
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
        })

        afterAll(async function () {
            console.info('afterAll case');
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0500', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0500 success');
                    done();
                })
                .catch(error => {
                    console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0500 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0500', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: false, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0500 err' + err);
                    done();
                    return
                }
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0500 success');
                done();
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0600', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 2, size: { height: 6, width: 8 } }
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0600 success');
                    done();
                })
                .catch(error => {
                    console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0600 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0600', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: false, pixelFormat: 2, size: { height: 6, width: 8 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0600 err' + err);
                    done();
                    return
                }
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0600 success');
                done();
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0700', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 0, size: { height: 6, width: 8 } }
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0700 success');
                    done();
                })
                .catch(error => {
                    console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0700 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0700', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: false, pixelFormat: 0, size: { height: 6, width: 8 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0700 err' + err);
                    done();
                    return
                }
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0700 success');
                done();
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0800', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 6, width: 8 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0800 err' + err);
                    done();
                    return
                }
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0800 success');
                done();
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0900', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 2, size: { height: 2, width: 3 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0900 err' + err);
                    done();
                    return
                }
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_0900 success');
                done();
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1000', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 0, size: { height: -1, width: -1 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(true).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1000 success' + err);
                    done();
                    return
                }
                globalpixelmap = pixelmap;
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1000 fail');
                done();
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1100', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 21, size: { height: 6, width: 8 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1100 err' + err);
                    done();
                    return
                }
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1100 success');
                done();
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_PROMISE_0100', 0, async function (done) {
            console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_PROMISE_0100 in');
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }

            let opts = { editable: true, pixelFormat: 4, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_PROMISE_0100 createPixelMap failed');
                        expect(false).assertTrue()
                        done();
                    }
                    const readBuffer = new ArrayBuffer(96);
                    pixelmap.readPixelsToBuffer(readBuffer).then(() => {
                        var bufferArr2 = new Uint8Array(readBuffer);
                        var res = true;
                        for (var i = 0; i < bufferArr2.length; i++) {
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
                            expect(true).assertTrue()
                            done();
                        }
                    }).catch(error => {
                        console.log('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_PROMISE_0100 read error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }).catch(error => {
                    console.log('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_PROMISE_0100 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0100', 0, async function (done) {
            console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0100 in');
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }

            let opts = { editable: true, pixelFormat: 4, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0100 createPixelMap failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    const readBuffer = new ArrayBuffer(96);
                    pixelmap.readPixelsToBuffer(readBuffer, () => {
                        var bufferArr = new Uint8Array(readBuffer);
                        var res = true;
                        for (var i = 0; i < bufferArr.length; i++) {
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
                            expect(true).assertTrue()
                            done();
                        }
                    })
                }
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0200', 0, async function (done) {
            console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0200 in');
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }

            let opts = { editable: true, pixelFormat: 2, size: { height: 6, width: 8 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0200 createPixelMap failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    const readBuffer = new ArrayBuffer(0);
                    pixelmap.readPixelsToBuffer(readBuffer, () => {
                        var bufferArr = new Uint8Array(readBuffer);
                        var res = true;
                        for (var i = 0; i < bufferArr.length; i++) {
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
                            expect(true).assertTrue()
                            done();
                        }
                    })
                }
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0100', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0100 createPixelMap failed');
                        expect(false).assertTrue()
                        done();
                    }
                    const area = {
                        pixels: new ArrayBuffer(8),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                    }
                    pixelmap.readPixels(area).then(() => {
                        var bufferArr2 = new Uint8Array(area.pixels);
                        var res = true;
                        for (var i = 0; i < bufferArr2.length; i++) {
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
                            expect(true).assertTrue()
                            done();
                        }
                    })
                })
                .catch(error => {
                    console.log('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0100 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0100', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELSTOBUFFER_CALLBACK_0100 createPixelMap failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    const area = {
                        pixels: new ArrayBuffer(8),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                    }
                    pixelmap.readPixels(area, () => {
                        var bufferArr = new Uint8Array(area.pixels);
                        var res = true;
                        for (var i = 0; i < bufferArr.length; i++) {
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
                            expect(true).assertTrue()
                            done();
                        }
                    })
                }
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0200', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0200 create pixelmap fail');
                    done();
                } else {
                    const area = {
                        pixels: new ArrayBuffer(20),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: -1, y: -1 }
                    }
                    pixelmap.readPixels(area).then(() => {
                        console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0200 failed');
                        expect(false).assertTrue();
                        done();
                    }).catch(() => {
                        expect(true).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_CALLBACK_0200 success');
                        done();
                    })
                }
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0200', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0200 create pixelmap failed');
                    done();
                } else {
                    const area = {
                        pixels: new ArrayBuffer(0),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                    }
                    pixelmap.readPixels(area).then(() => {
                        console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0200 failed');
                        expect(false).assertTrue();
                        done();
                    }).catch(() => {
                        expect(true).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0200 success');
                        done();
                    })
                }
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0300', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0300 createPixelMap success');
                    done();
                }
                const area = {
                    pixels: new ArrayBuffer(20),
                    offset: 21,
                    stride: 8,
                    region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                }
                pixelmap.readPixels(area).then(() => {
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0300 failed');
                    expect(false).assertTrue();
                    done();
                }).catch(() => {
                    expect(true).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0300 success');
                    done();
                })
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0400', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0400 createPixelMap success');
                    done();
                }
                const area = {
                    pixels: new ArrayBuffer(20),
                    offset: 0,
                    stride: 8,
                    region: { size: { height: -1, width: -1 }, x: 0, y: 0 }
                }
                pixelmap.readPixels(area).then(() => {
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0400 failed');
                    expect(false).assertTrue();
                    done();
                }).catch(() => {
                    expect(true).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_READPIXELS_PROMISE_0400 success');
                    done();
                })
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_PROMISE_0100', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_PROMISE_0100 createPixelMap failed');
                        expect(false).assertTrue()
                        done();
                    }

                    const area = {
                        pixels: new ArrayBuffer(8),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                    }
                    var bufferArr = new Uint8Array(area.pixels);
                    for (var i = 0; i < bufferArr.length; i++) {
                        bufferArr[i] = i + 1;
                    }
                    console.info('============ bufferArr ' + JSON.stringify(bufferArr));
                    pixelmap.writePixels(area).then(() => {
                        const readArea = {
                            pixels: new ArrayBuffer(8),
                            offset: 0,
                            stride: 8,
                            region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                        }
                        console.info('============ bufferArr ' + JSON.stringify(readArea));
                        pixelmap.readPixels(readArea).then(() => {
                            var readArr = new Uint8Array(readArea.pixels);
                            var res = true;
                            for (var i = 0; i < readArr.length; i++) {
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
                                expect(true).assertTrue()
                                done();
                            }
                        })
                    })
                })
                .catch(error => {
                    console.log('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_PROMISE_0100 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_CALLBACK_0100', 0, async function (done) {
            try {
                const color = new ArrayBuffer(96);
                let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
                image.createPixelMap(color, opts, (err, pixelmap) => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_CALLBACK_0100 createPixelMap failed');
                        expect(false).assertTrue()
                        done();
                    }
                    const area = {
                        pixels: new ArrayBuffer(8),
                        offset: 0,
                        stride: 8,
                        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                    }
                    var bufferArr = new Uint8Array(area.pixels);
                    for (var i = 0; i < bufferArr.length; i++) {
                        bufferArr[i] = i + 1;
                    }
                    pixelmap.writePixels(area, () => {
                        const readArea = {
                            pixels: new ArrayBuffer(8),
                            offset: 0,
                            stride: 8,
                            region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
                        }
                        pixelmap.readPixels(readArea, () => {
                            var readArr = new Uint8Array(readArea.pixels);
                            var res = true;
                            for (var i = 0; i < readArr.length; i++) {
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
                                expect(true).assertTrue()
                                done();
                            }
                        })
                    })
                })
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_WRITEPIXELS_CALLBACK_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_0100', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_0100 createPixelMap failed');
                        expect(false).assertTrue()
                        done();
                    }

                    const writeColor = new ArrayBuffer(96);
                    var bufferArr = new Uint8Array(writeColor);
                    for (var i = 0; i < bufferArr.length; i++) {
                        bufferArr[i] = i + 1;
                    }
                    pixelmap.writeBufferToPixels(writeColor).then(() => {
                        const readBuffer = new ArrayBuffer(96);
                        pixelmap.readPixelsToBuffer(readBuffer).then(() => {
                            var bufferArr = new Uint8Array(readBuffer);
                            var res = true;
                            for (var i = 0; i < bufferArr.length; i++) {
                                if (bufferArr[i] == 0) {
                                    res = false;
                                    console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_0100 failed');
                                    expect(false).assertTrue()
                                    done();
                                    break;
                                }
                            }
                            if (res) {
                                console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_0100 success');
                                expect(true).assertTrue();
                                done();
                            }
                        })
                    })
                })
                .catch(error => {
                    console.log('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_0100 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_0100', 0, async function (done) {
            const color = new ArrayBuffer(96);
            var bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = i + 1;
            }
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts).then(pixelmap => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue()
                    console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_0100 failed');
                    done();
                }
                const writeColor = new ArrayBuffer(96);
                pixelmap.writeBufferToPixels(writeColor, () => {
                    const readBuffer = new ArrayBuffer(96);
                    pixelmap.readPixelsToBuffer(readBuffer, () => {
                        var bufferArr = new Uint8Array(readBuffer);
                        var res = true;
                        for (var i = 0; i < bufferArr.length; i++) {
                            if (res) {
                                if (bufferArr[i] == 0) {
                                    res = false;
                                    console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_0100 Success');
                                    expect(true).assertTrue()
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
                    })
                })
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_PROMISE_0100', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 2, size: { height: 6, width: 8 } }
            image.createPixelMap(color, opts)
                .then(pixelmap => {
                    globalpixelmap = pixelmap;
                    if (pixelmap == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_PROMISE_0100 createPixelMap failed');
                        expect(false).assertTrue()
                        done();
                    }
                    pixelmap.getImageInfo().then(imageInfo => {
                        if (imageInfo == undefined) {
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_PROMISE_0100 imageInfo is empty');
                            expect(false).assertTrue()
                            done();
                        }
                        if (imageInfo.size.height == 6 && imageInfo.size.width == 8) {
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_PROMISE_0100 success ');
                            expect(true).assertTrue()
                            done();
                        }
                        done();
                    }).catch(error => {
                        console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_PROMISE_0100 getimageinfo error: ' + error);
                        expect().assertFail();
                        done();
                    })
                    done();
                })
                .catch(error => {
                    console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_PROMISE_0100 error: ' + error);
                    expect().assertFail();
                    done();
                })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_CALLBACK_0100', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                if (pixelmap == undefined) {
                    globalpixelmap = pixelmap;
                    expect(false).assertTrue()
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_CALLBACK_0100 create pixelmap fail');
                    done();
                }
                pixelmap.getImageInfo((err, imageInfo) => {
                    if (imageInfo == undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_CALLBACK_0100 imageInfo is empty');
                        expect(false).assertTrue()
                        done();
                    }
                    if (imageInfo.size.height == 4 && imageInfo.size.width == 6) {
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PIXELMAP_CALLBACK_0100 imageInfo success');
                        expect(true).assertTrue()
                        done();
                    }
                    done();
                })
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETBYTESNUMBERPERROW_0100', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            const expectNum = 4 * opts.size.width;
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue()
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
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETBYTESNUMBERPERROW_0200', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            const expectNum = 4 * opts.size.width * opts.size.height;
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    expect(false).assertTrue()
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
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_PROMISE_0100', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts).then(pixelmap => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_PROMISE_0100 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }
                pixelmap.release().then(() => {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_PROMISE_0100 success');
                    expect(true).assertTrue();
                    done();
                }).catch(error => {
                    console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_PROMISE_0100 error: ' + error);
                    expect().assertFail();
                    done();
                })
            }).catch(error => {
                console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_PROMISE_0100 createPixelMap failed error: ' + error);
                expect().assertFail();
                done();
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_CALLBACK_0100', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
            image.createPixelMap(color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (pixelmap == undefined) {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_CALLBACK_0100 createPixelMap failed');
                    expect(false).assertTrue()
                    done();
                }
                pixelmap.release(() => {
                    expect(true).assertTrue();
                    console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_PIXELMAP_CALLBACK_0100 success');
                    done();
                })
            })
        })



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
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0100', 0, async function (done) {
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
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0200', 0, async function (done) {
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
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0300', 0, async function (done) {
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

        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_0400', 0, async function (done) {
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

        })

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
         it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_SUFFIXFILE_0100', 0, async function (done) {
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
                        if (err){
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_SUFFIXFILE_0100 create pixelmap failed: ' + err);
                            expect(false).assertTrue();
                            done();
                            return
                        }
                        globalpixelmap = pixelmap;
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_SUFFIXFILE_0100 success');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                expect(false).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_SUFFIXFILE_0100 err:' + error);
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_URI_0100', 0, async function (done) {
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
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0100', 0, async function (done) {
            try {
                await getFd('test.jpg');
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
                            return
                        }
                        if (imageInfo != undefined) {
                            expect(true).assertTrue();
                            fileio.closeSync(fdNumber);
                            done();
                        } else {
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0100 failed');
                            expect(false).assertTrue();
                            done();
                        }

                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_FD_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0200', 0, async function (done) {
            const imageSourceApi = image.createImageSource(-2);
            globalimageSource = imageSourceApi;
            expect(imageSourceApi == undefined).assertTrue();
            console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0200 success');
            done();
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0300', 0, async function (done) {
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
                })
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0400', 0, async function (done) {
            const data = new ArrayBuffer(0);
            const imageSourceApi = image.createImageSource(data);
            globalimageSource = imageSourceApi;
            expect(imageSourceApi == undefined).assertTrue();
            console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_0400 success');
            done();
        })

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
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_JPG_0100', 0, async function (done) {
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
                        expect(true).assertTrue();
                        done();
                    }).catch(error => {
                        console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_JPG_0100 error');
                        expect(false).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_JPG_0100 err:' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_JPG_0100', 0, async function (done) {
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
                        expect(true).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_JPG_0100 err:' + error);
                expect(false).assertTrue();
                done();
            }
        })

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

        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0100', 0, async function (done) {
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
                            return
                        }
                        if (imageInfo != undefined) {
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0100 imageInfo.size.height:' + imageInfo.size.height);
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0100 imageInfo.size.width:' + imageInfo.size.width);
                            expect(true).assertTrue();
                            fileio.closeSync(fdNumber);
                            done();
                        } else {
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0100 failed');
                            expect(false).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })


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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0200', 0, async function (done) {
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
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0200 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0200 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0300', 0, async function (done) {
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
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0300 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0300 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0300 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400', 0, async function (done) {
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
                            return
                        }
                        if (imageInfo != undefined && imageInfo != null) {
                            expect(true).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400 imageInfo.size.height:' + imageInfo.size.height);
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400 imageInfo.size.width:' + imageInfo.size.width);
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400 success')
                            done();
                        } else {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400 failed')
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0400 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0500', 0, async function (done) {
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
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0500 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0500 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0500 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0600', 0, async function (done) {
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
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0600 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0600 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0600 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0700', 0, async function (done) {
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
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0700 imageInfo.size.height:' + imageInfo.size.height);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0700 imageInfo.size.width:' + imageInfo.size.width);
                        done();
                    })
                }
            } catch {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0700 error: ' + error);
                expect(false).assertTrue();
                done();
            }

        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800', 0, async function (done) {
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
                            return
                        }
                        if (imageInfo != undefined && imageInfo != null) {
                            expect(true).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800 imageInfo.size.height:' + imageInfo.size.height);
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800 imageInfo.size.width:' + imageInfo.size.width);
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800 success')
                            done();
                        } else {
                            expect(false).assertTrue();
                            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800 failed')
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_0800 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_CALLBACK_GIF_0100', 0, async function (done) {
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
                            expect(true).assertTrue();
                            done();
                        } else {
                            expect(false).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_CALLBACK_GIF_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_CALLBACK_GIF_0200', 0, async function (done) {
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
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_CALLBACK_GIF_0200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0100', 0, async function (done) {
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
                        }).catch(error => {
                            console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0100 error: ' + error);
                            expect().assertFail();
                            done();
                        })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0200', 0, async function (done) {
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
                        }).catch(error => {
                            console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0200 error: ' + error);
                            expect().assertFail();
                            done();
                        })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0300', 0, async function (done) {
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
                        }).catch(error => {
                            console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0300 error: ' + error);
                            expect().assertFail();
                            done();
                        })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0300 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0400', 0, async function (done) {
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
                                expect(true).assertTrue();
                                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0400 imageInfo.size.height:' + imageInfo.size.height);
                                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0400 imageInfo.size.width:' + imageInfo.size.width);
                                done();
                            } else {
                                expect(false).assertTrue();
                                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0400 failed');
                                done();
                            }
                        }).catch(error => {
                            console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0400 error: ' + error);
                            expect().assertFail();
                            done();
                        })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_0400 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0100', 0, async function (done) {
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
                        }).catch(error => {
                            console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0100 success');
                            expect(true).assertTrue();
                            done();
                        })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0200', 0, async function (done) {
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
                        }).catch(error => {
                            console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0200 success');
                            expect(true).assertTrue();
                            done();
                        })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_0200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_JPG_0100', 0, async function (done) {
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
                    }).catch(error => {
                        console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_JPG_0100 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_JPG_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_JPG_0100', 0, async function (done) {
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
                        if(err){
                            console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_JPG_0100 err: ' + err);
                            expect(false).assertTrue();
                            done();
                            return
                        }
                        globalpixelmap = pixelmap;
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_JPG_0100 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_JPG_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100', 0, async function (done) {
            try {
                let testimagebuffer = testPng;
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100 0003 ' + testimagebuffer.length);
                let bufferSize = testimagebuffer.length;
                let offset = 0;
                const incSouce = image.CreateIncrementalSource(new ArrayBuffer(1));
                globalimageSource = incSouce;
                let ret;
                let isFinished = false;
                while (offset < testimagebuffer.length) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100 0006 ' + testimagebuffer.length);
                    var oneStep = testimagebuffer.slice(offset, offset + bufferSize);
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
                    let decodingOptions = {
                        sampleSize: 1
                    };
                    incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                        console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100 0014' + pixelmap);
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    })
                } else {
                    done();
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0100 updateData failed ' + error);
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0200', 0, async function (done) {
            try {
                let testimagebuffer = testJpg;
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0200 0003 ' + testimagebuffer.length);
                let bufferSize = testimagebuffer.length;
                let offset = 0;
                const incSouce = image.CreateIncrementalSource(new ArrayBuffer(1));
                globalimageSource = incSouce;
                let isFinished = false;
                let ret;
                while (offset < testimagebuffer.length) {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0200 0006 ' + testimagebuffer.length);
                    var oneStep = testimagebuffer.slice(offset, offset + bufferSize);
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
                    let decodingOptions = {
                        sampleSize: 1
                    };
                    incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    })
                } else {
                    done();
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_0200 updateData failed ' + error);
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0100', 0, async function (done) {
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
                        expect(true).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0100 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0100', 0, async function (done) {
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
                            return
                        }
                        console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0100 Success');
                        expect(true).assertTrue();
                        expect(true).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0200', 0, async function (done) {
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
                        expect(true).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0200 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0200', 0, async function (done) {
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
                        expect(true).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0300', 0, async function (done) {
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
                        expect(true).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0300 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_0300 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0300', 0, async function (done) {
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
                        expect(true).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_0300 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0800', 0, async function (done) {
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
                    }).catch(error => {
                        console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0800 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0800 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1200', 0, async function (done) {
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
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1200 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0900', 0, async function (done) {
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
                    }).catch(error => {
                        console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0900 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_0900 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1300', 0, async function (done) {
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
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1300 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_1000', 0, async function (done) {
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
                    }).catch(error => {
                        console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_1000 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_1000 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1400', 0, async function (done) {
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
                    })
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_1400 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_0100
         * @tc.name      : imagesource supportedFormats
         * @tc.desc      : 1.create imagesource
         *                 2.call supportedFormats
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_0100', 0, async function (done) {
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
                    console.info(imageSourceApi.supportedFormats);
                    console.info('SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_0100 success ');
                    done();
                }
            } catch (error) {
                console.info('SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_0100 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_IMAGEPACKER_SUPPORTEDFORMATS_0100
         * @tc.name      : imagepacker supportedFormats
         * @tc.desc      : 1.create imagepacker
         *                 2.call supportedFormats
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_IMAGEPACKER_SUPPORTEDFORMATS_0100', 0, async function (done) {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_IMAGEPACKER_SUPPORTEDFORMATS_0100 create image packer failed');
                expect(false).assertTrue();
                done();
            } else {
                globalpacker = imagePackerApi;
                expect(imagePackerApi.supportedFormats != undefined).assertTrue();
                console.info(imagePackerApi.supportedFormats);
                console.info('SUB_MULTIMEDIA_IMAGE_IMAGEPACKER_SUPPORTEDFORMATS_0100 success ');
                done();
            }
        })

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
        it('SUB_MULTIMEDIA_IMAGE_ISEDITABLE_0100', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
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
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_EDITABLE_0100', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let edit = true;
            let opts = { editable: true, pixelFormat: 1, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_EDITABLE_0100 editable: ' + pixelmap.isEditable);
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_EDITABLE_0100 edit: ' + edit);
                expect(pixelmap.isEditable == edit).assertTrue();
                done();
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_EDITABLE_0200', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let edit = false;
            let opts = { editable: false, pixelFormat: 1, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                expect(pixelmap != undefined).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_EDITABLE_0200 editable: ' + pixelmap.isEditable);
                expect(pixelmap.isEditable == opts.editable).assertTrue();
                console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_EDITABLE_0200 edit: ' + edit);
                expect(pixelmap.isEditable == edit).assertTrue();
                done();
            })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_EDITABLE_0100', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let edit = true;
            let opts = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_EDITABLE_0100 editable: ' + pixelmap.isEditable);
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    expect(pixelmap.isEditable == opts.editable).assertTrue();
                    expect(pixelmap.isEditable == edit).assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_EDITABLE_0100 err' + error);
                    expect(false).assertTrue();
                    done();
                })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_EDITABLE_0200', 0, async function (done) {
            const Color = new ArrayBuffer(96);
            let edit = false;
            let opts = { editable: false, pixelFormat: 2, size: { height: 4, width: 6 } }
            image.createPixelMap(Color, opts)
                .then(pixelmap => {
                    console.info('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_EDITABLE_0200 editable: ' + pixelmap.isEditable);
                    globalpixelmap = pixelmap;
                    expect(pixelmap != undefined).assertTrue();
                    expect(pixelmap.isEditable == opts.editable).assertTrue();
                    expect(pixelmap.isEditable == edit).assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_EDITABLE_0200 err' + error);
                    expect(false).assertTrue();
                    done();
                })
        })

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
        it('SUB_MULTIMEDIA_IMAGE_MARSHALLING_AND_UNMARSHALLIGN_PROMISE_EDITABLE_0100', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = 0x80;
            }
            let opts = {
                editable: true,
                pixelFormat: image.PixelMapFormat.RGB_565,
                size: { height: 4, width: 6 },
                alphaType: 1
            }
            let pixelMap;
            await image.createPixelMap(color, opts).then((pixelmap) => {
                pixelMap = pixelmap;
                globalpixelmap = pixelmap;
                console.info('SUB_MULTIMEDIA_IMAGE_MARSHALLING_AND_UNMARSHALLIGN_PROMISE_EDITABLE_0100 editable: ' + pixelmap.isEditable);
            })
            let parcelable = new MySequence1(pixelMap);
            let data = rpc.MessageSequence.create();
            data.writeParcelable(parcelable);
            let pixel_map = undefined;
            let ret = new MySequence2(pixel_map);
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
        })

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
        it('SUB_GRAPHIC_IMAGE_MARSHALLING_AND_UNMARSHALLIGN_PROMISE_EDITABLE_0200', 0, async function (done) {
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            for (var i = 0; i < bufferArr.length; i++) {
                bufferArr[i] = 0x80;
            }
            let opts = {
                editable: false,
                pixelFormat: 4,
                size: { height: 4, width: 6 },
                alphaType: 3
            }
            let pixelMap;
            await image.createPixelMap(color, opts).then((pixelmap) => {
                pixelMap = pixelmap;
                globalpixelmap = pixelmap;
                console.info('SUB_GRAPHIC_IMAGE_MARSHALLING_AND_UNMARSHALLIGN_PROMISE_EDITABLE_0200 editable: ' + pixelmap.isEditable);
            })
            let parcelable = new MySequence1(pixelMap);
            let data = rpc.MessageSequence.create();
            data.writeParcelable(parcelable);
            let pixel_map = undefined;
            let ret = new MySequence3(pixel_map);
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
        })
    })
}
