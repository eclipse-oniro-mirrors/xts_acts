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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import ndkTest from 'libentry.so'
import { camera } from '@kit.CameraKit';
import { common } from '@kit.AbilityKit';
import { isSupportedCameras } from './common'

export default function ImageReceiverNDKTest() {
    describe('ImageReceiverNDKTest', () => {
        let isSupportedCamerasResult = isSupportedCameras();
        const WIDTH = 8192;
        const HEIGHT = 8;
        const CAPACITY = 8;
        const RGBA = 12;
        const Jpg_Stride = 1;
        const RECEIVER_FORMAT = 2000;
        const JPEG = image.ComponentType.JPEG;
        let myName:string;
        let logger = (caseName: string): ESObject => {
            return {
                myName: caseName,
                log: (msg: string) => {
                    console.info(myName + ' ' + msg);
                }
            };
        }

        let sleep = (ms:number): Promise<void> => {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        beforeAll(() => {
            console.info('beforeAll case');
        });
        beforeEach(() => {
            console.info('beforeEach case');
        });
        afterEach(() => {
            console.info('afterEach case');
        });
        afterAll(() => {
            console.info('afterAll case');
        });

        let createReceiverErr = (done:Function, log:ESObject, ...params: ESObject[]) => {
            let mlg: ESObject = logger(log);
            try {
                mlg.log(log);
                let myReceiver: image.ImageReceiver  = ndkTest.createImageReceiver(params);
                expect(myReceiver == undefined).assertTrue();
                done();
            }
            catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        }

        let isString = (value: ESObject): boolean => {
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
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100', 0, async (done: Function) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              expect(true).assertTrue();
              done();
              return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100");
                let myReceiver: ESObject = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                expect(myReceiver != undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0100
         * @tc.name      : createImageReceiver_1
         * @tc.desc      : 1.set width,height,format,capacity
         *               : 2.createImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0100', 0, async (done: Function) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              expect(true).assertTrue();
              done();
              return;
            }
            createReceiverErr(done, "SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0100", 'a', HEIGHT, RECEIVER_FORMAT,
                CAPACITY);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0200
         * @tc.name      : createImageReceiver_2
         * @tc.desc      : 1.set width,height,format,capacity
         *               : 2.createImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0200', 0, async (done: Function) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              expect(true).assertTrue();
              done();
              return;
            }
            createReceiverErr(done, "SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0200", WIDTH, {
                a: 1
            }, RECEIVER_FORMAT, CAPACITY);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0300
         * @tc.name      : createImageReceiver_3
         * @tc.desc      : 1.set width,height,format,capacity
         *               : 2.createImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0300', 0, async (done: Function) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              expect(true).assertTrue();
              done();
              return;
            }
            createReceiverErr(done, "SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0300", WIDTH, HEIGHT, null, CAPACITY);
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0400
         * @tc.name      : createImageReceiver_4
         * @tc.desc      : 1.set width,height,format,capacity
         *               : 2.createImageReceiver
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0400', 0, async (done: Function) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              expect(true).assertTrue();
              done();
              return;
            }
            createReceiverErr(done, "SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0400", WIDTH, HEIGHT, RECEIVER_FORMAT, true);
        });
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
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200', 0, async (done: Function) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              expect(true).assertTrue();
              done();
              return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200");
                let myReceiver : image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let size: ndkTest.imageSize = ndkTest.getSize(myReceiver);
                let capacity: number = ndkTest.getCapacity(myReceiver);
                let format : number= ndkTest.getFormat(myReceiver);
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
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300
         * @tc.name      : getReceivingSurfaceId
         * @tc.desc      : 1.createImageReceiver
         *               : 2.getReceivingSurfaceId
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300', 0, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              expect(true).assertTrue();
              done();
              return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let sId : string = ndkTest.getReceivingSurfaceId(myReceiver);
                mlg.log("sId " + sId);
                expect(isString(sId)).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0400
         * @tc.name      : readLatestImage
         * @tc.desc      : 1.createImageReceiver
         *               : 2.readLatestImage
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0400', 0, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              expect(true).assertTrue();
              done();
              return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0400");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0400");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let dummy: ESObject = myReceiver['test'];
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);
                mlg.log("myLatestImage " + JSON.stringify(myLatestImage));
                expect(myLatestImage != undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0500
         * @tc.name      : readNextImage
         * @tc.desc      : 1.createImageReceiver
         *               : 2.readNextImage
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0500', 0, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              expect(true).assertTrue();
              done();
              return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0500");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0500");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let dummy: ESObject = myReceiver['test'];
                let myNextImage: image.Image = ndkTest.readNextImage(myReceiver);
                mlg.log("myNextImage " + JSON.stringify(myNextImage));
                expect(myNextImage != undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600
         * @tc.name      : on
         * @tc.desc      : 1.createImageReceiver
         *               : 2.on
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600', 0, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              expect(true).assertTrue();
              done();
              return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: ESObject = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                let dummy: ESObject = myReceiver['test'];
                await sleep(2000);
                expect(onRet != undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
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
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0700', 0, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              expect(true).assertTrue();
              done();
              return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0700");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0700");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
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
        });
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
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0800', 0, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              expect(true).assertTrue();
              done();
              return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0800");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0800");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
                mlg.log("dummy test !!! ");
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);
                let myImageClipRect: ndkTest.imageClipRectSize = ndkTest.imageClipRect(myLatestImage);
                let myImageSize: ndkTest.imageSize = ndkTest.imageSize(myLatestImage);
                let myImageFormat: number = ndkTest.imageFormat(myLatestImage);
                let myImageComponent: ndkTest.imageComponent= ndkTest.imageGetComponent(myLatestImage, JPEG);
                let bufferArr: Uint8Array = new Uint8Array(myImageComponent.byteBuffer);
                mlg.log("myImageComponent.byteBuffer size " + JSON.stringify(bufferArr.length));
                for (let i = 0; i < 30; i++) {
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
        });
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
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900', 0, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              expect(true).assertTrue();
              done();
              return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
                mlg.log("dummy test !!! ");
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);
                let myImageComponent: ndkTest.imageComponent = ndkTest.imageGetComponent(myLatestImage, JPEG);
                let bufferArr: Uint8Array = new Uint8Array(myImageComponent.byteBuffer);
                mlg.log("myImageComponent.byteBuffer size " + JSON.stringify(bufferArr.length));
                for (let i = 0; i < 30; i++) {
                    mlg.log("myImageComponent.byteBuffer data " + JSON.stringify(bufferArr[i]));
                }
                expect(myImageComponent.byteBuffer != undefined).assertTrue();
                let releaseRes: number = ndkTest.imageRelease(myLatestImage);
                mlg.log('release result ' + JSON.stringify(releaseRes));
                expect(releaseRes != undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1000
         * @tc.name      : receiver.release
         * @tc.desc      : 1.createImageReceiver
         *               : 2.release
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1000', 0, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              expect(true).assertTrue();
              done();
              return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1000");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1000");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let releaseRes: number = ndkTest.receiverRelease(myReceiver);
                mlg.log('release result ' + JSON.stringify(releaseRes));
                expect(releaseRes != undefined).assertTrue();
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
    })
}