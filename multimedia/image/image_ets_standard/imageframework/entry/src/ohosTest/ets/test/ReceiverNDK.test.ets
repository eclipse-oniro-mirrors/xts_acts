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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import ndkTest from 'libentry.so'
import { camera } from '@kit.CameraKit';
import { common } from '@kit.AbilityKit';

const IMAGE_SUCCESS = 0;
const CALLBACK_FUC_DE = -1;
const CALLBACK_FUC_01 = 1;
const CALLBACK_FUC_02 = 2;
const CALLBACK_FUC_03 = 3;
const CALLBACK_FUC_04 = 4;

const PARA_ERROR_CODE = 7900201;

interface pixelMapPots {
    width: number,
    height: number,
    pixelFormat: number,
    editable: number,
    alphaType: number,
    scaleMode: number
}

let opts: pixelMapPots = {
    width: 4,
    height: 6,
    pixelFormat: 4,
    editable: 1,
    alphaType: 0,
    scaleMode: 1
};

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

        beforeAll(async() => {
            await sleep(5000);
            console.info('beforeAll case');
        });
        beforeEach(() => {
            console.info('beforeEach case');
        });
        afterEach(() => {
            console.info('afterEach case');
        });
        afterAll(async() => {
            await sleep(5000);
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
         * @tc.name   SUB_MULTIMEDIA_IMAGE_FORMAT_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_FORMAT_0100
         * @tc.desc   test OHOS_IMAGE_FORMAT_YCBCR_422_SP
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_IMAGE_FORMAT_0100', Level.LEVEL3, async (done: ESObject) => {
            let result: number = ndkTest.imageFormatYcbcr422Sp();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_FORMAT_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_FORMAT_0200
         * @tc.desc   test OHOS_IMAGE_FORMAT_JPEG
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_IMAGE_FORMAT_0200', Level.LEVEL3, async (done: ESObject) => {
            let result: number = ndkTest.imageFormatJPEG();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_GETCOMPONENT_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_GETCOMPONENT_0100
         * @tc.desc   OH_Image_GetComponent error code is IMAGE_RESULT_SUCCESS
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_IMAGE_GETCOMPONENT_0100', Level.LEVEL3, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
                console.info('Failed to obtain the default camera or device object.Not support usb camera');
                done();
                return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_GETCOMPONENT_0100");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_GETCOMPONENT_0100");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
                mlg.log("dummy test !!! ");
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);
                let myImageFormat: number = ndkTest.imageFormat(myLatestImage);
                let myImageComponent: number = ndkTest.imageGetComponent(myLatestImage, JPEG);

                expect(myImageFormat).assertEqual(0);
                expect(myImageComponent).assertEqual(0);

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


        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_GETCOMPONENT_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_GETCOMPONENT_0200
         * @tc.desc   OH_Image_GetComponent, error code is IMAGE_RESULT_JNI_ENV_ABNORMAL
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_IMAGE_GETCOMPONENT_0200', Level.LEVEL3, async (done: ESObject) => {
            let result: number = ndkTest.imageGetComponentJniEnvAbnormal();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_OHIMAGEFORMAT_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_OHIMAGEFORMAT_0100
         * @tc.desc   OH_Image_Format error code is IMAGE_RESULT_SUCCESS
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_IMAGE_OHIMAGEFORMAT_0100', Level.LEVEL3, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
                console.info('Failed to obtain the default camera or device object.Not support usb camera');
                done();
                return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_OHIMAGEFORMAT_0100");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_OHIMAGEFORMAT_0100");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
                mlg.log("dummy test !!! ");
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);
                let myImageFormat: number = ndkTest.imageFormat(myLatestImage);

                expect(myImageFormat).assertEqual(0);

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


        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_OHIMAGEFORMAT_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_OHIMAGEFORMAT_0200
         * @tc.desc   OH_Image_Format, error code is IMAGE_RESULT_JNI_ENV_ABNORMAL
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_IMAGE_OHIMAGEFORMAT_0200', Level.LEVEL3, async (done: ESObject) => {
            let result: number = ndkTest.imageFormatJniEnvAbnormal();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0100
         * @tc.desc   enum is OHOS_IMAGE_COMPONENT_FORMAT_YUV_Y
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0100', Level.LEVEL3, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
                console.info('Failed to obtain the default camera or device object.Not support usb camera');
                done();
                return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0100");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0100");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
                mlg.log("dummy test !!! ");
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);
                let myImageFormat: number = ndkTest.imageFormat(myLatestImage);
                let myImageComponent: number = ndkTest.imageComponentFormatYUVY(myLatestImage);

                expect(myImageFormat).assertEqual(0);
                expect(myImageComponent).assertEqual(0);

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


        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0200
         * @tc.desc   enum is OHOS_IMAGE_COMPONENT_FORMAT_YUV_U
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0200', Level.LEVEL3, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
                console.info('Failed to obtain the default camera or device object.Not support usb camera');
                done();
                return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0200");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0200");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
                mlg.log("dummy test !!! ");
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);
                let myImageFormat: number = ndkTest.imageFormat(myLatestImage);
                let myImageComponent: number = ndkTest.imageComponentFormatYUVU(myLatestImage);

                expect(myImageFormat).assertEqual(0);
                expect(myImageComponent).assertEqual(0);

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

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0300
         * @tc.desc   enum is OHOS_IMAGE_COMPONENT_FORMAT_YUV_V
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0300', Level.LEVEL0, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
                console.info('Failed to obtain the default camera or device object.Not support usb camera');
                done();
                return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0300");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0300");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
                mlg.log("dummy test !!! ");
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);
                let myImageFormat: number = ndkTest.imageFormat(myLatestImage);
                let myImageComponent: number = ndkTest.imageComponentFormatYUVV(myLatestImage);

                expect(myImageFormat).assertEqual(0);
                expect(myImageComponent).assertEqual(0);

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

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0400
         * @tc.desc   enum is OHOS_IMAGE_COMPONENT_FORMAT_JPEG
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0400', Level.LEVEL3, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
                console.info('Failed to obtain the default camera or device object.Not support usb camera');
                done();
                return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0400");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_COMPONENTFORMAT_0400");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
                mlg.log("dummy test !!! ");
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);
                let myImageFormat: number = ndkTest.imageFormat(myLatestImage);
                let myImageComponent: number = ndkTest.imageComponentFormatJPEG(myLatestImage);

                expect(myImageFormat).assertEqual(0);
                expect(myImageComponent).assertEqual(0);

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




        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_OHIMAGERELEASE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_OHIMAGERELEASE_0100
         * @tc.desc   OH_Image_Release error code is IMAGE_RESULT_SUCCESS
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_OHIMAGERELEASE_0100', Level.LEVEL0, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
                console.info('Failed to obtain the default camera or device object.Not support usb camera');
                done();
                return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_OHIMAGERELEASE_0100");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_OHIMAGERELEASE_0100");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
                mlg.log("dummy test !!! ");
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);

                let releaseRes: number = ndkTest.imageRelease(myLatestImage);
                mlg.log('release result ' + JSON.stringify(releaseRes));
                expect(releaseRes).assertEqual(0);
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        });


        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_OHIMAGECLIPRECT_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_OHIMAGECLIPRECT_0100
         * @tc.desc   OH_Image_ClipRect error code is IMAGE_RESULT_SUCCESS
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_IMAGE_OHIMAGECLIPRECT_0100', Level.LEVEL3, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
                console.info('Failed to obtain the default camera or device object.Not support usb camera');
                done();
                return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_OHIMAGECLIPRECT_0100");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_OHIMAGECLIPRECT_0100");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
                mlg.log("dummy test !!! ");
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);
                let myImageClipRect: ndkTest.imageClipRectSize = ndkTest.imageClipRect(myLatestImage);
                expect(myImageClipRect).assertEqual(0);
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_OHIMAGECLIPRECT_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_OHIMAGECLIPRECT_0300
         * @tc.desc   OH_Image_ClipRect, error code is IMAGE_RESULT_BAD_PARAMETER
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_IMAGE_OHIMAGECLIPRECT_0300', Level.LEVEL3, async (done: ESObject) => {
            let result: number = ndkTest.imageClipBadParameter();
            expect(result).assertEqual(0);
            done();
        });


        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_OHIMAGESIZE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_OHIMAGESIZE_0100
         * @tc.desc   OH_Image_Size error code is IMAGE_RESULT_SUCCESS
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_IMAGE_OHIMAGESIZE_0100', Level.LEVEL3, async (done: ESObject) => {
            if (!isSupportedCamerasResult) {
                console.info('Failed to obtain the default camera or device object.Not support usb camera');
                done();
                return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_OHIMAGESIZE_0100");
            try {
                mlg.log("SUB_MULTIMEDIA_IMAGE_OHIMAGESIZE_0100");
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                mlg.log("onRet " + JSON.stringify(onRet));
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
                mlg.log("dummy test !!! ");
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);
                let myImageClipRect: ndkTest.imageClipRectSize = ndkTest.imageClipRect(myLatestImage);
                let myImageSize: ndkTest.imageSize = ndkTest.imageSize(myLatestImage);
                expect(myImageClipRect).assertEqual(0);
                expect(myImageSize).assertEqual(0);
                done();
            } catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        });


        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_OHIMAGESIZE_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_OHIMAGESIZE_0200
         * @tc.desc   OH_Image_Size, error code is IMAGE_RESULT_JNI_ENV_ABNORMAL
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('SUB_MULTIMEDIA_IMAGE_OHIMAGESIZE_0200', Level.LEVEL3, async (done: ESObject) => {
            let result: number = ndkTest.imageSizeJniEnvAbnormal();
            expect(result).assertEqual(0);
            done();
        });



    })
}

function isSupportedCameras() : boolean {
    const cameraAvailable = canIUse('SystemCapability.Multimedia.Camera.Core');
    let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext

    let isSupportedCameras = true;
    let isSupportedCameraManager = false;
    let mCameraManager: camera.CameraManager;
    let mCameraDevicesArray: Array<camera.CameraDevice>;

    let isEmpty = (data: ESObject) => {
        if (data == null || data == undefined) {
            return true;
        }
        return false;
    }

    console.info('Enter getCameraManagerInstance');
    try {
        mCameraManager = camera.getCameraManager(context);
        if (isEmpty(mCameraManager)) {
            console.info("getCameraManager FAILED");
            isSupportedCameraManager = false;
            return isSupportedCameraManager;
        }
        console.info('Exit getCameraManagerInstance');
        mCameraDevicesArray = mCameraManager.getSupportedCameras();
        if (isEmpty(mCameraDevicesArray)) {
            isSupportedCameras = false;
        }
    } catch (err) {
        console.error("getCameraManager FAILED. errorMessage:", err);
        isSupportedCameraManager = false;
        return isSupportedCameraManager;
    }
    if (cameraAvailable && isSupportedCameras) {
        isSupportedCameraManager = true;
    } else {
        isSupportedCameraManager = false;
    }
    return isSupportedCameraManager;
}