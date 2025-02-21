// @ts-nocheck
/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'
// @ts-ignore
import ndkTest from 'libImageReceiverNDKTest.so'

export default function ImageReceiverNDKTest() {
    describe('ImageReceiverNDKTest', function () {
        const WIDTH = 8192;
        const HEIGHT = 8;
        const CAPACITY = 8;
        const RGBA = 12;
        const Jpg_Stride = 1;
        const RECEIVER_FORMAT = 2000;
        const { JPEG } = image.ComponentType;
        function logger(caseName) {
            return {
                myName: caseName,
                log: function (msg) {
                    console.info(this.myName + ' ' + msg);
                }
            }
        }
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
        beforeAll(function () { console.info('beforeAll case'); })

        beforeEach(function () { console.info('beforeEach case'); })

        afterEach(function () { console.info('afterEach case'); })

        afterAll(function () { console.info('afterAll case'); })

        function createReceiverErr(done, log, ...params) {
            let mlg = logger(log);
            try {
                mlg.log(log);
                let myReceiver = ndkTest.createImageReceiver(params);
                expect(myReceiver == undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        function isString(value) {
            return typeof value === "string";
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100
         * @tc.name      : createImageReceiver
         * @tc.desc      : 1.set width,height,format,capacity
         *               : 2.createImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100");
                let myReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                expect(myReceiver != undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0100
         * @tc.name      : createImageReceiver_1
         * @tc.desc      : 1.set width,height,format,capacity
         *               : 2.createImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0100', 0, async function (done) {
            createReceiverErr(done, "SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0100", 'a', HEIGHT, RECEIVER_FORMAT, CAPACITY);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0200
         * @tc.name      : createImageReceiver_2
         * @tc.desc      : 1.set width,height,format,capacity
         *               : 2.createImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0200', 0, async function (done) {
            createReceiverErr(done, "SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0200", WIDTH, { a: 1 }, RECEIVER_FORMAT,
                CAPACITY);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0300
         * @tc.name      : createImageReceiver_3
         * @tc.desc      : 1.set width,height,format,capacity
         *               : 2.createImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0300', 0, async function (done) {
            createReceiverErr(done, "SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0300", WIDTH, HEIGHT, null, CAPACITY);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0400
         * @tc.name      : createImageReceiver_4
         * @tc.desc      : 1.set width,height,format,capacity
         *               : 2.createImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0400', 0, async function (done) {
            createReceiverErr(done, "SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0400", WIDTH, HEIGHT, RECEIVER_FORMAT, true);
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200
         * @tc.name      : createImageReceiver_5
         * @tc.desc      : 1.set width,height,format,capacity
         *               : 2.createImageReceiver
         *               : 3.getSize,getFormat,getCapacity
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200");
                let myReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let size = ndkTest.getSize(myReceiver);
                let capacity = ndkTest.getCapacity(myReceiver);
                let format = ndkTest.getFormat(myReceiver);
                expect(size.width == WIDTH).assertTrue();
                expect(size.height == HEIGHT).assertTrue();
                expect(capacity == CAPACITY).assertTrue();
                expect(format == RECEIVER_FORMAT).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300
         * @tc.name      : getReceivingSurfaceId
         * @tc.desc      : 1.createImageReceiver
         *               : 2.getReceivingSurfaceId
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300");
                let myReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let sId = ndkTest.getReceivingSurfaceId(myReceiver);
                mlg.log("sId " + sId);
                expect(isString(sId)).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0400
         * @tc.name      : readLatestImage
         * @tc.desc      : 1.createImageReceiver
         *               : 2.readLatestImage
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0400', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0400");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0400");
                let myReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                var dummy = myReceiver.test;
                let myLatestImage = ndkTest.readLatestImage(myReceiver);
                mlg.log("myLatestImage " + JSON.stringify(myLatestImage));
                expect(myLatestImage != undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0500
         * @tc.name      : readNextImage
         * @tc.desc      : 1.createImageReceiver
         *               : 2.readNextImage
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0500', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0500");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0500");
                let myReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                var dummy = myReceiver.test;
                let myNextImage = ndkTest.readNextImage(myReceiver);
                mlg.log("myNextImage " + JSON.stringify(myNextImage));
                expect(myNextImage != undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600
         * @tc.name      : on
         * @tc.desc      : 1.createImageReceiver
         *               : 2.on
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600");
                let myReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                var dummy = myReceiver.test;
                await sleep(2000);
                expect(onRet != undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0700
         * @tc.name      : getOnEventCount
         * @tc.desc      : 1.createImageReceiver
         *               : 2.on
         *               : 3.getOnEventCount
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0700', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0700");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0700");
                let myReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                var dummy = myReceiver.test;
                mlg.log("dummy test !!! ");
                let loop = 5;
                let onCount = 0;
                while (loop > 0) {
                    onCount = ndkTest.getOnEventCount(myReceiver);
                    mlg.log("onCount " + JSON.stringify(onCount));
                    if (onCount > 0) {
                        break;
                    }
                    await sleep(500);
                    loop--;
                }
                if (onCount == 0) {
                    expect(false).assertTrue();
                    done();
                    return;
                }
                expect(true).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })


        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0800
         * @tc.name      : imageGetComponent
         * @tc.desc      : 1.createImageReceiver
         *               : 2.on
         *               : 3.imageGetComponent
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0800', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0800");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0800");
                let myReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                var dummy = myReceiver.test;
                mlg.log("dummy test !!! ")
                let myLatestImage = ndkTest.readLatestImage(myReceiver);
                let myImageClipRect = ndkTest.imageClipRect(myLatestImage);
                let myImageSize = ndkTest.imageSize(myLatestImage);
                let myImageFormat = ndkTest.imageFormat(myLatestImage);
                let myImageComponent = ndkTest.imageGetComponent(myLatestImage, JPEG);
                var bufferArr = new Uint8Array(myImageComponent.byteBuffer);
                mlg.log("myImageComponent.byteBuffer size " + JSON.stringify(bufferArr.length));
                for (var i = 0; i < 30; i++) {
                    mlg.log("myImageComponent.byteBuffer data " + JSON.stringify(bufferArr[i]));
                }
                expect(myImageClipRect != undefined).assertTrue();
                expect(myImageSize.width == WIDTH && myImageSize.height == HEIGHT).assertTrue();
                expect(myImageFormat == RGBA).assertTrue();
                expect(myImageComponent.byteBuffer != undefined).assertTrue();
                expect(myImageComponent.componentType == JPEG).assertTrue();
                expect(myImageComponent.rowStride >= WIDTH).assertTrue();
                expect(myImageComponent.pixelStride == Jpg_Stride).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900
         * @tc.name      : img.release
         * @tc.desc      : 1.createImageReceiver
         *               : 2.readLatestImage
         *               : 3.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900");
                let myReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                var dummy = myReceiver.test;
                mlg.log("dummy test !!! ")
                let myLatestImage = ndkTest.readLatestImage(myReceiver);
                let myImageComponent = ndkTest.imageGetComponent(myLatestImage, JPEG);
                var bufferArr = new Uint8Array(myImageComponent.byteBuffer);
                mlg.log("myImageComponent.byteBuffer size " + JSON.stringify(bufferArr.length));
                for (var i = 0; i < 30; i++) {
                    mlg.log("myImageComponent.byteBuffer data " + JSON.stringify(bufferArr[i]));
                }
                expect(myImageComponent.byteBuffer != undefined).assertTrue();
                let releaseRes = ndkTest.imageRelease(myLatestImage);
                mlg.log('release result ' + JSON.stringify(releaseRes));
                expect(releaseRes != undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1000
         * @tc.name      : receiver.release
         * @tc.desc      : 1.createImageReceiver
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1000', 0, async function (done) {
            let mlg = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1000");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1000");
                let myReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);

                let releaseRes = ndkTest.receiverRelease(myReceiver);
                mlg.log('release result ' + JSON.stringify(releaseRes));
                expect(releaseRes != undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        })
    })
}
