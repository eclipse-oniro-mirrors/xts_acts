/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import cameraObj from '@ohos.multimedia.camera';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {UiDriver, BY } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import ndkTest from 'libentry.so';
import common from '@ohos.app.ability.common';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { image } from '@kit.ImageKit';
import { PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { colorSpaceManager } from '@kit.ArkGraphics2D';
import { isSupportedCameras } from './common';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';
import arriveOnNdkTest from 'libArriveOnNdk.so';

let WIDTH = 1280;
let HEIGHT = 960;
let CAPACITY = 8;
let SET_WIDTH = 1024;
let SET_HEIGHT = 768;
let SET_CAPACITY = 6;
let Jpg_Stride = 1;
let isSupportedCamerasResult = isSupportedCameras();
let isSupportCameraVideoProfiles = true;
let isSupportHdr: Boolean;

let RGBA = 12;
let RECEIVER_FORMAT = 2000;
const IMAGE_SUCCESS = 0;
const CALLBACK_FUC_DE = -1;
const CALLBACK_FUC_01 = 1;
const CALLBACK_FUC_02 = 2;
const CALLBACK_FUC_03 = 3;
const CALLBACK_FUC_04 = 4;
const PARA_ERROR_CODE = 7900201;
const UNSUPPORT_CAMERA_FORMAT = -1;

const TEST_TYPE_PREVIEW = 0;
const TEST_TYPE_PHOTO = 1;
const CAMERA_FORMAT_JPEG = cameraObj.CameraFormat.CAMERA_FORMAT_JPEG;
const CAMERA_FORMAT_RGBA_8888 = cameraObj.CameraFormat.CAMERA_FORMAT_RGBA_8888;
const CAMERA_FORMAT_YUV_420_SP = cameraObj.CameraFormat.CAMERA_FORMAT_YUV_420_SP;
const CAMERA_FORMAT_YCBCR_P010 = cameraObj.CameraFormat.CAMERA_FORMAT_YCBCR_P010;
const CAMERA_FORMAT_YCRCB_P010 = cameraObj.CameraFormat.CAMERA_FORMAT_YCRCB_P010;

let sleep = (ms?: number | undefined): Promise<void> => {
    return new Promise(resolve => setTimeout(resolve, ms));
}

let getPermission = async () => {
    console.info('getPermission start');
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    let permissions: Array<Permissions> = ['ohos.permission.CAMERA'];
    console.info('permissions: Array<Permissions> = [\'ohos.permission.CAMERA\']')
    try {
        atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
            console.info('data:' + JSON.stringify(data))
            console.info('data permissions:' + data.permissions)
      })
    } catch (err) {
        console.info('err is ' + err);
    }
  }

async function permissionClick() {
    console.info(`come in permissionClick`);
    let driver = await UiDriver.create();
    console.info(`driver is ${JSON.stringify(driver)}`);
    await sleep(100);
    console.info(`UiDriver start`);
    let button = await driver.findComponent(BY.text('允许'));
    if (button == null) {
        let delegator = abilityDelegatorRegistry.getAbilityDelegator();
        let cmd = "hidumper -s WindowManagerService -a'-a'"
        await delegator.executeShellCommand(cmd);
    }
    console.info(`button is ${JSON.stringify(button)}`);
    await sleep(100);
    await button.click();
    await sleep(1000);
}

let createReceiverErr = async (done: Function, TAG: String, width: ESObject, height: ESObject, format: ESObject, capacity: ESObject) => {
    try {
        let myReceiver: image.ImageReceiver  = ndkTest.createImageReceiver(width, height, format, capacity);
        expect(myReceiver == undefined).assertTrue();
        done();
    }
    catch (error) {
        console.error(`${TAG} fail, error is ${error}, ${error.code}`);
        expect(false).assertTrue();
        done();
    }
}

function isValidColorSpace(value: number): boolean {
  return Object.values(colorSpaceManager.ColorSpace).includes(value);
}

let getUserData = (userCallBackId: number, userNum: number, userStr: string, userCallbackTag: boolean): arriveOnNdkTest.onImageArriveData => {
    const userData: arriveOnNdkTest.onImageArriveData = {
        callBackId: userCallBackId, 
        num: userNum,
        str: userStr,
        callbackTriggered: userCallbackTag
    }
    return userData;
}

const receiveCallBackDataRecursively = (logger: string, myDataList: Array<arriveOnNdkTest.onImageArriveData>, myDataListIndex: number, callBackCount: number) => {
    if (callBackCount <= 0) {
        console.log("All data received. Exiting.");
        return;
    }
    let srcData = myDataList[myDataListIndex - callBackCount];
    console.info(`${logger} waitForCondition before, callBackId: ${srcData.callBackId}`);
    const result = arriveOnNdkTest.waitForCondition(srcData.callBackId, srcData.num, myDataListIndex - callBackCount);
    if (result && typeof result != 'number') {
        console.info(`${logger} Data received ${myDataListIndex - callBackCount}`);
        console.info(`${logger} callback result is ${JSON.stringify(result)}`);
        let ret = (srcData.callBackId == result.callBackId) && (srcData.num == result.num) &&
                  (srcData.str == result.str) && (result.callbackTriggered == true);
        console.info(`${logger} compare callback result is ${ret}`);
        expect(ret).assertTrue();
        receiveCallBackDataRecursively(logger, myDataList, myDataListIndex, callBackCount - 1);
    } else {
        console.info(`No data received or wait ended unexpectedly`);
        expect(false).assertTrue();
    }
}

const checkWaitForResultIsObj = (logger: string, myData: arriveOnNdkTest.onImageArriveData, myDataIndex: number) => {
    const result = arriveOnNdkTest.waitForCondition(myData.callBackId, myData.num, myDataIndex);
    if (typeof result == 'object') {
        let ret1 = (myData.callBackId == result.callBackId) && (myData.num == result.num) &&
        (myData.str == result.str) && (result.callbackTriggered == true);
        console.info(`${logger} result is object, ret1 is ${ret1}`);
        expect(ret1).assertTrue();
    } else {
        console.info(`${logger} result is not object, result is ${result}`);
        expect(false).assertTrue();
    }
    return;
}

const checkWaitForResultIsNum = (logger: string, myData: arriveOnNdkTest.onImageArriveData, myDataIndex: number) => {
    const result = arriveOnNdkTest.waitForCondition(myData.callBackId, myData.num, myDataIndex);
    if (typeof result == 'number') {
        console.info(`${logger} No data received, result is ${result}`);
        expect(result == IMAGE_SUCCESS).assertTrue();
    } else {
        console.info(`${logger} result is not number, result is ${result}`);
        expect(false).assertTrue();
    }
    return;
}

//相机拍照
export async function cameraCaptureRelyOnNum(TAG: string, photoOutput: ESObject) {
    let captureLocation: cameraObj.Location = {
        latitude: 0,
        longitude: 0,
        altitude: 0
    }
    let photoCaptureSetting: cameraObj.PhotoCaptureSetting = {
        quality: cameraObj.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: cameraObj.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
    }
    //使用当前拍照设置进行拍照。
    console.info(`${TAG} start take first photo`);
    await photoOutput.capture(photoCaptureSetting);
    await sleep(10000);
    console.info(`${TAG} start take second photo`);
    await photoOutput.capture(photoCaptureSetting);
    await sleep(10000);
    console.info(`${TAG} capture two images success`);
}

export default function ImageReceiverTest() {

    describe('ImageReceiverTest', () => {
        beforeAll(async () => {
            console.info('beforeAll case');
            if (!isSupportedCamerasResult) {
                console.info(`Not support camera, result is ${isSupportedCamerasResult}`);
                return;
            }
            await getPermission();
            await permissionClick();
            let testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
            let mCameraManager: cameraObj.CameraManager = cameraObj.getCameraManager(testContext);
            if (!mCameraManager) {
                console.error(`get camera manager fail`);
                return;
            }
            let cameras = mCameraManager.getSupportedCameras();
            let cameraDevice = cameras[0];
            let cameraOutputCapability = mCameraManager.getSupportedOutputCapability(cameraDevice);
            if (cameraOutputCapability?.videoProfiles) {
                console.info(`support camera Video Profiles`);
            }
            else {
                isSupportCameraVideoProfiles = false;
                console.info(`Not support camera Video Profiles`);
            }
            isSupportHdr = !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
                           display.getDefaultDisplaySync().hdrFormats.length != 0;
        });

        beforeEach(() => {
            console.info(`beforeEach case`);
        });

        afterEach(async () => {
            console.info(`afterEach case`);
            await sleep(200);
        });

        afterAll(() => {
            console.info(`afterAll case`);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0000
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0000
         * @tc.desc   test imageArriveOn
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0000', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0000`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            const myData1 = getUserData(CALLBACK_FUC_01, 666, "on image arrive myData1", false);
            const myData2 = getUserData(CALLBACK_FUC_01, 888, "on image arrive myData2", false);
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData1) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData2) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageReceiverTest(receiver) == IMAGE_SUCCESS).assertTrue();
            await sleep(1000);
            checkWaitForResultIsObj(TAG, myData1, 0);
            checkWaitForResultIsNum(TAG, myData2, 1);
            arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_DE);
            arriveOnNdkTest.releaseImageReceiver(receiver);
            console.info(`${TAG} success`);
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0100
         * @tc.desc   1.createImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0100', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0100`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            expect(arriveOnNdkTest.imageArriveOn_Error(receiver, false) == PARA_ERROR_CODE).assertTrue();
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0200
         * @tc.desc   test imageArriveOn
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0200', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0200`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            expect(arriveOnNdkTest.imageArriveOn_Error(receiver, true) == PARA_ERROR_CODE).assertTrue();
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0300
         * @tc.desc   test imageArriveOn
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0300', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0300`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            expect(arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_01) == PARA_ERROR_CODE).assertTrue();
            arriveOnNdkTest.releaseImageReceiver(receiver);
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0400
         * @tc.desc   test imageArriveOn
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0400', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_ERROR_0400`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            expect(arriveOnNdkTest.imageArriveOff_Error() == PARA_ERROR_CODE).assertTrue();
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_0100
         * @tc.desc   1.create image receiver options
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_0100', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_0100`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            try {
                let options: number = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                console.info(`${TAG} create receiver options success`);
                let myReceiver: image.ImageReceiver = ndkTest.JsCreateImageReceiver(options);
                expect(myReceiver != undefined).assertTrue();
                console.info(`${TAG} create receiver success`);
                let ret: number = ndkTest.JsReleaseImageReceiverOptions(options);
                expect(ret != undefined).assertTrue();
                console.info(`${TAG} release receiver success`);
                ret = ndkTest.JsReleaseImageReceiverOptions(options);
                expect(ret == undefined).assertTrue();
                console.info(`${TAG} release receiver options success`);
                let newReceiver: image.ImageReceiver = ndkTest.JsCreateImageReceiver(options);
                expect(newReceiver == undefined).assertTrue();
                done();
            }
            catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_0200
         * @tc.desc   1.create image receiver options
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_0200', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_0200`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            try {
                let options: number = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                console.info(`${TAG} create receiver options success`);
                let myReceiver: image.ImageReceiver = ndkTest.JsCreateImageReceiver(options);
                expect(myReceiver != undefined).assertTrue();
                console.info(`${TAG} create receiver success`);
                let ret: number = ndkTest.JsReleaseImageReceiver(myReceiver);
                expect(ret != undefined).assertTrue();
                console.info(`${TAG} release receiver success`);
                ret = ndkTest.JsReleaseImageReceiver(myReceiver);
                expect(ret == undefined).assertTrue();
                console.info(`${TAG} failed to release the receiver for the second time`);
                let size: ESObject = ndkTest.JsGetSize(myReceiver);
                expect(size == undefined).assertTrue();
                console.info(`${TAG} failed to get size`);
                let capacity: ESObject = ndkTest.JsGetCapacity(myReceiver);
                expect(capacity == undefined).assertTrue();
                console.info(`${TAG} failed to get capacity`);
                done();
            }
            catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_0300
         * @tc.desc   1.create image receiver options
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_0300', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_0300`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            try {
                let options: number = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                console.info(`${TAG} create receiver options success`);
                ndkTest.JsImageReceiverOptionsSetCapacity(options, SET_CAPACITY);
                console.info(`${TAG} set capacity success`);
                ndkTest.JsImageReceiverOptionsSetSize(options, SET_WIDTH, SET_HEIGHT);
                console.info(`${TAG} set size success`);
                let imageReceiver: image.ImageReceiver = ndkTest.JsCreateImageReceiver(options);
                console.info(`${TAG} create receiver success`);
                let receiverSize: ndkTest.imageSize = ndkTest.JsGetSize(imageReceiver);
                let receiverCapacity: number = ndkTest.JsGetCapacity(imageReceiver);
                expect(receiverSize.width == SET_WIDTH).assertTrue();
                expect(receiverSize.height == SET_HEIGHT).assertTrue();
                expect(receiverCapacity == SET_CAPACITY).assertTrue();
                let ret: number = ndkTest.JsReleaseImageReceiver(imageReceiver);
                expect(ret != undefined).assertTrue();
                console.info(`${TAG} release receiver success`);
                ret = ndkTest.JsReleaseImageReceiverOptions(options);
                expect(ret != undefined).assertTrue();
                console.info(`${TAG} release receiver options success`);
                done();
            }
            catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_0400
         * @tc.desc   1.create image receiver options
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_0400', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_0400`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            try {
                let options: number = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                console.info(`${TAG} create receiver options success`);
                ndkTest.JsImageReceiverOptionsSetCapacity(options, true);
                console.info(`${TAG} set capacity success`);
                ndkTest.JsImageReceiverOptionsSetSize(options, 'width', 'height');
                console.info(`${TAG} set size success`);
                let imageReceiver: image.ImageReceiver = ndkTest.JsCreateImageReceiver(options);
                console.info(`${TAG} create receiver success`);
                let receiverSize: ndkTest.imageSize = ndkTest.JsGetSize(imageReceiver);
                let receiverCapacity: number = ndkTest.JsGetCapacity(imageReceiver);
                expect(receiverSize.width == WIDTH).assertTrue();
                expect(receiverSize.height == HEIGHT).assertTrue();
                expect(receiverCapacity == CAPACITY).assertTrue();
                let ret: number = ndkTest.JsReleaseImageReceiver(imageReceiver);
                expect(ret != undefined).assertTrue();
                console.info(`${TAG} release receiver success`);
                ret = ndkTest.JsReleaseImageReceiverOptions(options);
                expect(ret != undefined).assertTrue();
                console.info(`${TAG} release receiver options success`);
                done();
            }
            catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0100
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0100', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0100`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            await createReceiverErr(done, TAG, 'a', HEIGHT, RECEIVER_FORMAT, CAPACITY);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0200
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0200', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0200`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            await createReceiverErr(done, TAG, WIDTH, {a: 1}, RECEIVER_FORMAT, CAPACITY);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0300
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0300', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0300`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            await createReceiverErr(done, TAG, WIDTH, HEIGHT, null, CAPACITY);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0400
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0400', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_ERR_0300`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            await createReceiverErr(done, TAG, WIDTH, HEIGHT, RECEIVER_FORMAT, true);
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0100`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            try {
                let myReceiver: ESObject = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                expect(myReceiver != undefined).assertTrue();
                let releaseRes: number = ndkTest.receiverRelease(myReceiver);
                console.info(`${TAG} release result is ${JSON.stringify(releaseRes)}`);
                expect(releaseRes != undefined).assertTrue();
                done();
            } catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200
         * @tc.desc   1.set width,height,format,capacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0200`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            try {
                let myReceiver : image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let size: ndkTest.imageSize = ndkTest.getSize(myReceiver);
                let capacity: number = ndkTest.getCapacity(myReceiver);
                let format : number= ndkTest.getFormat(myReceiver);
                expect(size.width == WIDTH).assertTrue();
                expect(size.height == HEIGHT).assertTrue();
                expect(capacity == CAPACITY).assertTrue();
                expect(format == RECEIVER_FORMAT).assertTrue();
                let releaseRes: number = ndkTest.receiverRelease(myReceiver);
                console.info(`${TAG} release result is ${releaseRes}`);
                expect(releaseRes != undefined).assertTrue();
                done();
            } catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300
         * @tc.desc   1.createImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0300`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            try {
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let sId : string = ndkTest.getReceivingSurfaceId(myReceiver);
                console.info(`${TAG} sId is ${sId}`);
                expect(typeof(sId) === "string").assertTrue();
                let releaseRes: number = ndkTest.receiverRelease(myReceiver);
                console.info(`${TAG} release result is ${JSON.stringify(releaseRes)}`);
                expect(releaseRes != undefined).assertTrue();
                done();
            } catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0400
         * @tc.desc   1.createImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0400', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0400`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            try {
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let dummy: ESObject = myReceiver['test'];
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);
                console.info(`${TAG} myLatestImage is ${myLatestImage}`);
                expect(myLatestImage != undefined).assertTrue();
                let releaseRes: number = ndkTest.receiverRelease(myReceiver);
                console.info(`${TAG} release result is ${releaseRes}`);
                expect(releaseRes != undefined).assertTrue();
                done();
            } catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0500
         * @tc.desc   1.createImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0500', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0500`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            try {
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let dummy: ESObject = myReceiver['test'];
                let myNextImage: image.Image = ndkTest.readNextImage(myReceiver);
                console.info(`${TAG} myNextImage is ${myNextImage}`);
                expect(myNextImage != undefined).assertTrue();
                let releaseRes: number = ndkTest.receiverRelease(myReceiver);
                console.info(`${TAG} release result is ${releaseRes}`);
                expect(releaseRes != undefined).assertTrue();
                done();
            } catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600
         * @tc.desc   1.createImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0600`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            try {
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: ESObject = ndkTest.on(myReceiver);
                console.info(`${TAG} onRet is ${onRet}`);
                let dummy: ESObject = myReceiver['test'];
                expect(onRet != undefined).assertTrue();
                let releaseRes: number = ndkTest.receiverRelease(myReceiver);
                console.info(`${TAG} release result is ${releaseRes}`);
                expect(releaseRes != undefined).assertTrue();
                done();
            } catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0700
         * @tc.desc   1.createImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0700', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0700`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            try {
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                console.info(`${TAG} onRet is ${onRet}`);
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
                let loop = 5;
                let onCount = 0;
                while (loop > 0) {
                    onCount = ndkTest.getOnEventCount(myReceiver);
                    console.info(`${TAG} onCount is ${onCount}`);
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
                let releaseRes: number = ndkTest.receiverRelease(myReceiver);
                console.info(`${TAG} release result is ${releaseRes}`);
                expect(releaseRes != undefined).assertTrue();
                done();
            } catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0800
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0800
         * @tc.desc   1.createImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0800', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0800`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            try {
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                console.info(`${TAG} onRet is ${onRet}`);
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);
                let myImageClipRect: ndkTest.imageClipRectSize = ndkTest.imageClipRect(myLatestImage);
                let myImageSize: ndkTest.imageSize = ndkTest.imageSize(myLatestImage);
                let myImageFormat: number = ndkTest.imageFormat(myLatestImage);
                let myImageComponent: ndkTest.imageComponent= ndkTest.imageGetComponent(myLatestImage, image.ComponentType.JPEG);
                let bufferArr: Uint8Array = new Uint8Array(myImageComponent.byteBuffer);
                console.info(`${TAG} myImageComponent.byteBuffer size is ${JSON.stringify(bufferArr.length)}`);
                for (let i = 0; i < 30; i++) {
                    console.info(`${TAG} myImageComponent.byteBuffer data is ${JSON.stringify(bufferArr[i])}`);
                }
                expect(myImageClipRect != undefined).assertTrue();
                expect(myImageSize.width == WIDTH && myImageSize.height == HEIGHT).assertTrue();
                expect(myImageFormat == RGBA).assertTrue();
                expect(myImageComponent.byteBuffer != undefined).assertTrue();
                expect(myImageComponent.componentType == image.ComponentType.JPEG).assertTrue();
                expect(myImageComponent.rowStride >= WIDTH).assertTrue();
                expect(myImageComponent.pixelStride == Jpg_Stride).assertTrue();
                let releaseRes: number = ndkTest.receiverRelease(myReceiver);
                console.info(`${TAG} release result is ${releaseRes}`);
                expect(releaseRes != undefined).assertTrue();
                done();
            } catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900
         * @tc.desc   1.createImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_0900`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            try {
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let onRet: number = ndkTest.on(myReceiver);
                console.info(`${TAG} onRet is ${onRet}`);
                expect(onRet != undefined).assertTrue();
                let dummy: ESObject = myReceiver['test'];
                let myLatestImage: image.Image = ndkTest.readLatestImage(myReceiver);
                let myImageComponent: ndkTest.imageComponent = ndkTest.imageGetComponent(myLatestImage, image.ComponentType.JPEG);
                let bufferArr: Uint8Array = new Uint8Array(myImageComponent.byteBuffer);
                console.info(`${TAG} myImageComponent.byteBuffer size is ${JSON.stringify(bufferArr.length)}`);
                for (let i = 0; i < 30; i++) {
                    console.info(`${TAG} myImageComponent.byteBuffer data is ${JSON.stringify(bufferArr[i])}`);
                }
                expect(myImageComponent.byteBuffer != undefined).assertTrue();
                let releaseRes: number = ndkTest.imageRelease(myLatestImage);
                console.info(`${TAG} release result is ${releaseRes}`);
                expect(releaseRes != undefined).assertTrue();
                done();
            } catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1000
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1000
         * @tc.desc   1.createImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1000', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_1000`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            try {
                let myReceiver: image.ImageReceiver = ndkTest.createImageReceiver(WIDTH, HEIGHT, RECEIVER_FORMAT, CAPACITY);
                let releaseRes: number = ndkTest.receiverRelease(myReceiver);
                console.info(`${TAG} release result is ${releaseRes}`);
                expect(releaseRes != undefined).assertTrue();
                done();
            } catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0100
         * @tc.desc   test imageArriveOn
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0100', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0100`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            const myData1 = getUserData(CALLBACK_FUC_01, 888, "on image arrive", false);
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData1) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageReceiverTest(receiver) == IMAGE_SUCCESS).assertTrue();
            const myDataList: Array<arriveOnNdkTest.onImageArriveData> = [myData1];
            receiveCallBackDataRecursively(TAG, myDataList, 1, 1);
            expect(arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_DE) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.releaseImageReceiver(receiver) == IMAGE_SUCCESS).assertTrue();
            console.info(`${TAG} success`);
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0200
         * @tc.desc   test imageArriveOn
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0200', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0200`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            const myData1 = getUserData(CALLBACK_FUC_01, 666, "on image arrive myData1", false);
            const myData2 = getUserData(CALLBACK_FUC_02, 888, "on image arrive myData2", false);
            const myData3 = getUserData(CALLBACK_FUC_03, 999, "on image arrive myData3", false);
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData1) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData2) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData3) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageReceiverTest(receiver) == IMAGE_SUCCESS).assertTrue();
            const myDataList: Array<arriveOnNdkTest.onImageArriveData> = [myData1, myData2, myData3];
            receiveCallBackDataRecursively(TAG, myDataList, 3, 3);
            arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_DE);
            arriveOnNdkTest.releaseImageReceiver(receiver);
            console.info(`${TAG} success`);
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0300
         * @tc.desc   test imageArriveOn
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0300', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0300`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            const myData1 = getUserData(CALLBACK_FUC_01, 888, "on image arrive myData1", false);
            const myData2 = getUserData(CALLBACK_FUC_04, 999, "on image arrive myData2", false);
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData1) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.nativeOn(receiver, myData2) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageReceiverTest(receiver) == IMAGE_SUCCESS).assertTrue();
            checkWaitForResultIsObj(TAG, myData2, 1);
            checkWaitForResultIsObj(TAG, myData1, 0);
            arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_DE);
            arriveOnNdkTest.nativeOff(receiver);
            arriveOnNdkTest.releaseImageReceiver(receiver);
            console.info(`${TAG} success`);
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0400
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0400
         * @tc.desc   test imageArriveOn
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0400', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0400`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            const myData1 = getUserData(CALLBACK_FUC_04, 888, "on image arrive myData1", false);
            const myData2 = getUserData(CALLBACK_FUC_01, 999, "on image arrive myData2", false);
            expect(arriveOnNdkTest.nativeOn(receiver, myData1) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData2) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageReceiverTest(receiver) == IMAGE_SUCCESS).assertTrue();
            const myDataList: Array<arriveOnNdkTest.onImageArriveData> = [myData1, myData2];
            receiveCallBackDataRecursively(TAG, myDataList, 2, 2);
            arriveOnNdkTest.nativeOff(receiver);
            arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_DE);
            arriveOnNdkTest.releaseImageReceiver(receiver);
            console.info(`${TAG} success`);
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0500
         * @tc.desc   test imageArriveOn
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0500', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0500`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            const myData1 = getUserData(CALLBACK_FUC_01, 999, "on image arrive myData2", false);
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData1) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_01) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageReceiverTest(receiver) == IMAGE_SUCCESS).assertTrue();
            checkWaitForResultIsNum(TAG, myData1, 0);
            arriveOnNdkTest.releaseImageReceiver(receiver);
            console.info(`${TAG} success`);
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0600
         * @tc.desc   test imageArriveOn
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0600', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0600`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            const myData1 = getUserData(CALLBACK_FUC_01, 888, "on image arrive myData1", false);
            const myData2 = getUserData(CALLBACK_FUC_02, 999, "on image arrive myData2", false);
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData1) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData2) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_DE) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageReceiverTest(receiver) == IMAGE_SUCCESS).assertTrue();
            checkWaitForResultIsNum(TAG, myData1, 0);
            checkWaitForResultIsNum(TAG, myData2, 1);
            arriveOnNdkTest.releaseImageReceiver(receiver);
            console.info(`${TAG} success`);
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0700
         * @tc.desc   test imageArriveOn
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0700', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0700`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            const myData1 = getUserData(CALLBACK_FUC_01, 888, "on image arrive myData1", false);
            const myData2 = getUserData(CALLBACK_FUC_02, 999, "on image arrive myData2", false);
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData1) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData2) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_01) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageReceiverTest(receiver) == IMAGE_SUCCESS).assertTrue();
            checkWaitForResultIsNum(TAG, myData1, 0);
            checkWaitForResultIsObj(TAG, myData2, 1);
            arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_DE);
            arriveOnNdkTest.releaseImageReceiver(receiver);
            console.info(`${TAG} success`);
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0800
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0800
         * @tc.desc   1.createImageReceiver
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0800', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_ARRIVE_NATIVE_0800`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            const myData1 = getUserData(CALLBACK_FUC_01, 888, "on image arrive myData1", false);
            const myData2 = getUserData(CALLBACK_FUC_02, 999, "on image arrive myData2", false);
            expect(arriveOnNdkTest.nativeOn(receiver, myData1) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData2) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.nativeOff(receiver) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageReceiverTest(receiver) == IMAGE_SUCCESS).assertTrue();
            checkWaitForResultIsNum(TAG, myData1, 0);
            checkWaitForResultIsObj(TAG, myData2, 1);
            arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_DE);
            arriveOnNdkTest.releaseImageReceiver(receiver);
            console.info(`${TAG} success`);
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_0500
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_0500
         * @tc.desc   1.create image receiver options
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_0500', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_0500`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            if (!isSupportCameraVideoProfiles) {
                console.info(`${TAG} Failed to obtain the default videoProfiles object. Not support usb camera`);
                done();
                return;
            }
            try {
                // NDK创建预览配置
                let options: number = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                let myReceiver: image.ImageReceiver = ndkTest.JsCreateImageReceiver(options);
                expect(myReceiver != undefined).assertTrue();
                console.info(`${TAG} create receiver success`);
                let capacity: number = CAPACITY;
                let onRet: number = ndkTest.JsOn(myReceiver, (receiver: image.ImageReceiver) => {
                    console.info(`${TAG} Image receiver callback success, receiver is ${JSON.stringify(receiver)}`);
                    capacity = capacity + 1;
                    ndkTest.JsImageReceiverOptionsSetCapacity(options, capacity);
                    console.info(`${TAG} OnCallback success`);
                    expect(receiver != undefined).assertTrue();
                });
                expect(onRet != undefined).assertTrue();
                let mPhotoSurface = ndkTest.JsGetReceivingSurfaceId(myReceiver);
                console.info(TAG + 'mPhotoSurface is: ' + JSON.stringify(mPhotoSurface));
                console.info(`${TAG} start create input`);
                let testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
                let mCameraManager: cameraObj.CameraManager = await cameraObj.getCameraManager(testContext);
                let mCameraDevicesArray: cameraObj.CameraDevice[] = await mCameraManager.getSupportedCameras();
                // 创建输入流
                let mCameraInput: cameraObj.CameraInput = await mCameraManager.createCameraInput(mCameraDevicesArray[0]);
                expect(mCameraInput != null && mCameraInput != undefined).assertTrue();
                console.info(`${TAG} create mCameraInput success, mCameraInput is ${mCameraInput}`);
                await mCameraInput.open();
                await sleep(100);
                console.info(`${TAG} start create output`);
                let cameraOutputCap: cameraObj.CameraOutputCapability = await mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0]);
                expect(cameraOutputCap != null && cameraOutputCap != undefined).assertTrue();
                expect(cameraOutputCap.previewProfiles != null && cameraOutputCap.previewProfiles != undefined).assertTrue();
                // 创建会话
                let mCameraSession: cameraObj.CaptureSession = await mCameraManager.createCaptureSession();
                // 启用配置
                await mCameraSession.beginConfig()
                // 会话添加输入流
                await mCameraSession.addInput(mCameraInput);
                // 创建预览流
                let mPreviewOutput: cameraObj.PreviewOutput = await mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[0], globalThis.surfaceId);
                expect(mPreviewOutput != null && mPreviewOutput != undefined).assertTrue();
                console.info(`${TAG} create mPreviewOutput success`);
                // 创建拍照流
                let mPhotoOutput: cameraObj.PhotoOutput = await mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[0], mPhotoSurface);
                expect(mPhotoOutput != null && mPhotoOutput != undefined).assertTrue();
                console.info(`${TAG} create mPhotoOutput success`);
                // 会话添加预览流
                await mCameraSession.addOutput(mPreviewOutput);
                // 会话添加相机流
                await mCameraSession.addOutput(mPhotoOutput);
                // 提交相机配置
                await mCameraSession.commitConfig();
                // 启动会话
                await mCameraSession.start();
                await sleep(500);
                // 拍两张图
                await cameraCaptureRelyOnNum(TAG, mPhotoOutput);
                // 查看下一张图片
                let nextImage: image.Image = ndkTest.JsReadNextImage(myReceiver);
                console.info(`${TAG} read next image success, image is ${JSON.stringify(nextImage)}`);
                // 查看最新图片
                let lastestImage = ndkTest.JsReadLatestImage(myReceiver);
                console.info(`${TAG} read lastest image success, image is ${JSON.stringify(lastestImage)}`);
                await mCameraSession.stop();
                await sleep(500);
                // 环境恢复
                let onOFF: number = ndkTest.JsOff(myReceiver);
                expect(onOFF != undefined).assertTrue();
                await mCameraInput.close();
                await mPreviewOutput.release();
                await mPhotoOutput.release();
                await mCameraSession.release();
                ndkTest.JsReleaseImageReceiverOptions(options);
                ndkTest.JsReleaseImageReceiver(myReceiver);
                done();
            }
            catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_0600
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_0600
         * @tc.desc   1.create image receiver options
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_0600', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_0600`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            if (!isSupportCameraVideoProfiles) {
                console.info(`${TAG} Failed to obtain the default videoProfiles object. Not support usb camera`);
                done();
                return;
            }
            try {
                let options: number = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                console.info(`${TAG} create receiver options success`);
                let myReceiver : image.ImageReceiver= ndkTest.JsCreateImageReceiver(options);
                console.info(`${TAG} create receiver success`);
                let optionsSize: ndkTest.imageSize = ndkTest.JsImageReceiverOptionsGetSize(options);
                console.info(`${TAG} get size of receiver options success`);
                let optionsCapacity: number = ndkTest.JsImageReceiverOptionsGetCapacity(options);
                console.info(`${TAG} get capacity of receiver options success`);
                let receiverSize : ndkTest.imageSize= ndkTest.JsGetSize(myReceiver);
                let receiverCapacity: number = ndkTest.JsGetCapacity(myReceiver);
                let mPhotoSurface = ndkTest.JsGetReceivingSurfaceId(myReceiver);
                console.info(TAG + 'mPhotoSurface is: ' + JSON.stringify(mPhotoSurface));
                // 拍照
                let testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
                let mCameraManager: cameraObj.CameraManager = await cameraObj.getCameraManager(testContext);
                let mCameraDevicesArray: cameraObj.CameraDevice[] = await mCameraManager.getSupportedCameras();
                // 创建输入流
                let mCameraInput: cameraObj.CameraInput = await mCameraManager.createCameraInput(mCameraDevicesArray[0]);
                expect(mCameraInput != null && mCameraInput != undefined).assertTrue();
                console.info(`${TAG} create mCameraInput success, mCameraInput is ${mCameraInput}`);
                await mCameraInput.open();
                await sleep(100);
                console.info(`${TAG} start create output`);
                let cameraOutputCap: cameraObj.CameraOutputCapability = await mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0]);
                expect(cameraOutputCap != null && cameraOutputCap != undefined).assertTrue();
                expect(cameraOutputCap.previewProfiles != null && cameraOutputCap.previewProfiles != undefined).assertTrue();
                // 创建会话
                let mCameraSession: cameraObj.CaptureSession = await mCameraManager.createCaptureSession();
                // 启用配置
                await mCameraSession.beginConfig()
                // 会话添加输入流
                await mCameraSession.addInput(mCameraInput);
                // 创建预览流
                let mPreviewOutput: cameraObj.PreviewOutput = await mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[0], globalThis.surfaceId);
                expect(mPreviewOutput != null && mPreviewOutput != undefined).assertTrue();
                console.info(`${TAG} create mPreviewOutput success`);
                // 创建拍照流
                let mPhotoOutput: cameraObj.PhotoOutput = await mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[0], mPhotoSurface);
                expect(mPhotoOutput != null && mPhotoOutput != undefined).assertTrue();
                console.info(`${TAG} create mPhotoOutput success`);
                // 会话添加预览流
                await mCameraSession.addOutput(mPreviewOutput);
                // 会话添加相机流
                await mCameraSession.addOutput(mPhotoOutput);
                // 提交相机配置
                await mCameraSession.commitConfig();
                // 启动会话
                await mCameraSession.start();
                await sleep(500);
                // 拍两张图
                await cameraCaptureRelyOnNum(TAG, mPhotoOutput);
                // 校验两张图
                let nextImage: image.Image = ndkTest.JsReadNextImage(myReceiver);
                let lastestImage = ndkTest.JsReadLatestImage(myReceiver);
                let nextSize: ndkTest.imageSize = ndkTest.JsGetImageSize(nextImage);
                let lastestSize : ndkTest.imageSize = ndkTest.JsGetImageSize(lastestImage);
                expect(optionsSize.width == WIDTH).assertTrue();
                expect(optionsSize.height == HEIGHT).assertTrue();
                expect(optionsCapacity == CAPACITY).assertTrue();
                expect(receiverSize.width == WIDTH).assertTrue();
                expect(receiverSize.height == HEIGHT).assertTrue();
                expect(receiverCapacity == CAPACITY).assertTrue();
                expect(lastestSize.height > 0).assertTrue();
                expect(lastestSize.width > 0).assertTrue();
                expect(nextSize.height > 0).assertTrue();
                expect(nextSize.width > 0).assertTrue();
                // 环境恢复
                let onOFF: number = ndkTest.JsOff(myReceiver);
                expect(onOFF != undefined).assertTrue();
                await mCameraInput.close();
                await mPreviewOutput.release();
                await mPhotoOutput.release();
                await mCameraSession.release();
                ndkTest.JsReleaseImageReceiverOptions(options);
                ndkTest.JsReleaseImageReceiver(myReceiver);
                done();
            }
            catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_0700
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_0700
         * @tc.desc   1.create image receiver options
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_0700', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_0700`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            if (!isSupportCameraVideoProfiles) {
                console.info(`${TAG} Failed to obtain the default videoProfiles object. Not support usb camera`);
                done();
                return;
            }
            try {
                // NDK创建预览配置
                let options: number = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                let myReceiver: image.ImageReceiver = ndkTest.JsCreateImageReceiver(options);
                expect(myReceiver != undefined).assertTrue();
                console.info(`${TAG} create receiver success`);
                let capacity: number = CAPACITY;
                let onRet: number = ndkTest.JsOn(myReceiver, (receiver: image.ImageReceiver) => {
                    console.info(`${TAG} Image receiver callback success, receiver is ${JSON.stringify(receiver)}`);
                    capacity = capacity + 1;
                    ndkTest.JsImageReceiverOptionsSetCapacity(options, capacity);
                    console.info(`${TAG} OnCallback success`);
                    expect(receiver != undefined).assertTrue();
                });
                expect(onRet != undefined).assertTrue();
                let mPhotoSurface = ndkTest.JsGetReceivingSurfaceId(myReceiver);
                console.info(TAG + 'mPhotoSurface is: ' + JSON.stringify(mPhotoSurface));
                console.info(`${TAG} start create input`);
                let testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
                let mCameraManager: cameraObj.CameraManager = await cameraObj.getCameraManager(testContext);
                let mCameraDevicesArray: cameraObj.CameraDevice[] = await mCameraManager.getSupportedCameras();
                // 创建输入流
                let mCameraInput: cameraObj.CameraInput = await mCameraManager.createCameraInput(mCameraDevicesArray[0]);
                expect(mCameraInput != null && mCameraInput != undefined).assertTrue();
                console.info(`${TAG} create mCameraInput success, mCameraInput is ${mCameraInput}`);
                await mCameraInput.open();
                await sleep(100);
                console.info(`${TAG} start create output`);
                let cameraOutputCap: cameraObj.CameraOutputCapability = await mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[0]);
                expect(cameraOutputCap != null && cameraOutputCap != undefined).assertTrue();
                expect(cameraOutputCap.previewProfiles != null && cameraOutputCap.previewProfiles != undefined).assertTrue();
                // 创建会话
                let mCameraSession: cameraObj.CaptureSession = await mCameraManager.createCaptureSession();
                // 启用配置
                await mCameraSession.beginConfig()
                // 会话添加输入流
                await mCameraSession.addInput(mCameraInput);
                // 创建预览流
                let mPreviewOutput: cameraObj.PreviewOutput = await mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[0], globalThis.surfaceId);
                expect(mPreviewOutput != null && mPreviewOutput != undefined).assertTrue();
                console.info(`${TAG} create mPreviewOutput success`);
                // 创建拍照流
                let mPhotoOutput: cameraObj.PhotoOutput = await mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[0], mPhotoSurface);
                expect(mPhotoOutput != null && mPhotoOutput != undefined).assertTrue();
                console.info(`${TAG} create mPhotoOutput success`);
                // 会话添加预览流
                await mCameraSession.addOutput(mPreviewOutput);
                // 会话添加相机流
                await mCameraSession.addOutput(mPhotoOutput);
                // 提交相机配置
                await mCameraSession.commitConfig();
                // 启动会话
                await mCameraSession.start();
                await sleep(500);
                // 拍两张图
                await cameraCaptureRelyOnNum(TAG, mPhotoOutput);
                let nextImage: image.Image = ndkTest.JsReadNextImage(myReceiver);
                let lastestImage = ndkTest.JsReadLatestImage(myReceiver);
                let size : ndkTest.imageSize = ndkTest.JsGetImageSize(lastestImage);
                expect(size.height > 0).assertTrue();
                expect(size.width > 0).assertTrue();
                console.info(`${TAG} size.height is ${size.height}`);
                console.info(`${TAG} size.width is ${size.width}`);
                let types : number[] = ndkTest.JsGetImageComponentTypes(lastestImage);
                expect(Array.isArray(types)).assertEqual(true);
                expect(types.length > 0).assertEqual(true);
                console.info(`${TAG} JsGetImageComponentTypes types is ${JSON.stringify(types)}`);
                let type : ESObject= types[0];
                let nativeBuffer: number = ndkTest.JsGetImageByteBuffer(lastestImage, type);
                let bufferSize: number = ndkTest.JsGetImageBufferSize(lastestImage, type);
                let rowStride: number = ndkTest.JsGetImageRowStride(lastestImage, type);
                let pixelStride : number= ndkTest.JsGetImagePixelStride(lastestImage, type);
                ndkTest.JsReleaseImage(lastestImage);
                ndkTest.JsReleaseImage(nextImage);
                let sizeAfterRelease: ESObject = ndkTest.JsGetImageSize(lastestImage);
                expect(bufferSize > 0).assertTrue();
                expect(nativeBuffer != undefined).assertTrue();
                expect(type >= 0).assertTrue();
                expect(rowStride >= 0).assertTrue();
                expect(pixelStride == Jpg_Stride).assertTrue();
                expect(sizeAfterRelease == undefined).assertTrue();
                // 环境恢复
                let onOFF: number = ndkTest.JsOff(myReceiver);
                expect(onOFF != undefined).assertTrue();
                await mCameraInput.close();
                await mPreviewOutput.release();
                await mPhotoOutput.release();
                await mCameraSession.release();
                ndkTest.JsReleaseImageReceiverOptions(options);
                ndkTest.JsReleaseImageReceiver(myReceiver);
                done();
            }
            catch (error) {
                console.info(`${TAG} fail, error is ${error}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_PREVIEW_READ_IMAGE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_PREVIEW_READ_IMAGE_0100
         * @tc.desc   1.createImageReceiver
         *            2.start preview
         *            3.readNextImage
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_PREVIEW_READ_IMAGE_0100', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_PREVIEW_READ_IMAGE_0100`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            if (!isSupportHdr) {
                console.info(`${TAG} device is not supported HDR, skipping test case`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            const myData = getUserData(CALLBACK_FUC_01, 888, "on image arrive", false);
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData) == IMAGE_SUCCESS).assertTrue();
            let status = arriveOnNdkTest.imageReceiverTest(receiver, CAMERA_FORMAT_YUV_420_SP, TEST_TYPE_PREVIEW);
            if (status == UNSUPPORT_CAMERA_FORMAT) {
                console.info(`${TAG} device is not supported YCRCB_P010 format, skipping test case`);
                expect(arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_DE) == IMAGE_SUCCESS).assertTrue();
                expect(arriveOnNdkTest.releaseImageReceiver(receiver) == IMAGE_SUCCESS).assertTrue();
                done();
                return;
            }
            expect(status == IMAGE_SUCCESS).assertTrue();
            const result = arriveOnNdkTest.waitForCondition(myData.callBackId, myData.num, 0);
            expect(arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_DE) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.releaseImageReceiver(receiver) == IMAGE_SUCCESS).assertTrue();
            let ret = false;
            if (typeof result != 'number') {
                console.info(`${TAG} waitForCondition result is ${JSON.stringify(result)}`);
                ret = result.imageInfo!.format == 25 &&
                      result.imageInfo!.strideAlignedRet == true &&
                      isValidColorSpace(result.imageInfo!.colorSpace) &&
                      result.pixelMapInfo!.width > 0 &&
                      result.pixelMapInfo!.height > 0 &&
                      result.pixelMapInfo!.pixelFormat == image.PixelMapFormat.NV21;
            } else {
                console.info(`${TAG} result is number ${result}`);
            }
            expect(ret).assertTrue();
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_PREVIEW_READ_IMAGE_0200
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_PREVIEW_READ_IMAGE_0200
         * @tc.desc   1.createImageReceiver
         *            2.start preview
         *            3.readNextImage
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_PREVIEW_READ_IMAGE_0200', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_PREVIEW_READ_IMAGE_0200`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            if (!isSupportHdr) {
                console.info(`${TAG} device is not supported HDR, skipping test case`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            const myData = getUserData(CALLBACK_FUC_01, 888, "on image arrive", false);
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData) == IMAGE_SUCCESS).assertTrue();
            let status = arriveOnNdkTest.imageReceiverTest(receiver, CAMERA_FORMAT_YCBCR_P010, TEST_TYPE_PREVIEW);
            if (status == UNSUPPORT_CAMERA_FORMAT) {
                console.info(`${TAG} device is not supported YCRCB_P010 format, skipping test case`);
                expect(arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_DE) == IMAGE_SUCCESS).assertTrue();
                expect(arriveOnNdkTest.releaseImageReceiver(receiver) == IMAGE_SUCCESS).assertTrue();
                done();
                return;
            }
            expect(status == IMAGE_SUCCESS).assertTrue();
            const result = arriveOnNdkTest.waitForCondition(myData.callBackId, myData.num, 0);
            expect(arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_DE) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.releaseImageReceiver(receiver) == IMAGE_SUCCESS).assertTrue();
            let ret = false;
            if (typeof result != 'number') {
                console.info(`${TAG} waitForCondition result is ${JSON.stringify(result)}`);
                ret = result.imageInfo!.format == 35 &&
                      result.imageInfo!.strideAlignedRet == true &&
                      isValidColorSpace(result.imageInfo!.colorSpace);
            } else {
                console.info(`${TAG} result is number ${result}`);
            }
            expect(ret).assertTrue();
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_PREVIEW_READ_IMAGE_0300
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_PREVIEW_READ_IMAGE_0300
         * @tc.desc   1.createImageReceiver
         *            2.start preview
         *            3.readNextImage
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_PREVIEW_READ_IMAGE_0300', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_PREVIEW_READ_IMAGE_0300`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            if (!isSupportHdr) {
                console.info(`${TAG} device is not supported HDR, skipping test case`);
                done();
                return;
            }
            const receiver: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            const myData = getUserData(CALLBACK_FUC_01, 888, "on image arrive", false);
            expect(arriveOnNdkTest.imageArriveOn(receiver, myData) == IMAGE_SUCCESS).assertTrue();
            let status = arriveOnNdkTest.imageReceiverTest(receiver, CAMERA_FORMAT_YCRCB_P010, TEST_TYPE_PREVIEW);
            if (status == UNSUPPORT_CAMERA_FORMAT) {
                console.info(`${TAG} device is not supported YCRCB_P010 format, skipping test case`);
                expect(arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_DE) == IMAGE_SUCCESS).assertTrue();
                expect(arriveOnNdkTest.releaseImageReceiver(receiver) == IMAGE_SUCCESS).assertTrue();
                done();
                return;
            }
            expect(status == IMAGE_SUCCESS).assertTrue();
            const result = arriveOnNdkTest.waitForCondition(myData.callBackId, myData.num, 0);
            expect(arriveOnNdkTest.imageArriveOff(receiver, CALLBACK_FUC_DE) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.releaseImageReceiver(receiver) == IMAGE_SUCCESS).assertTrue();
            let ret = false;
            if (typeof result != 'number') {
                console.info(`${TAG} waitForCondition result is ${JSON.stringify(result)}`);
                ret = result.imageInfo!.format == 36 &&
                      result.imageInfo!.strideAlignedRet == true &&
                      isValidColorSpace(result.imageInfo!.colorSpace);
            } else {
                console.info(`${TAG} result is number ${result}`);
            }
            expect(ret).assertTrue();
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_PHOTO_READ_IMAGE_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_PHOTO_READ_IMAGE_0100
         * @tc.desc   1.createImageReceiver
         *            2.start Photo
         *            3.readNextImage
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_PHOTO_READ_IMAGE_0100', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_PHOTO_READ_IMAGE_0100`;
            if (!isSupportedCamerasResult) {
                console.info(`${TAG} Failed to obtain the default camera or device object. Not support usb camera`);
                done();
                return;
            }
            if (!isSupportHdr) {
                console.info(`${TAG} device is not supported HDR, skipping test case`);
                done();
                return;
            }
            const receiverPhoto: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            const receiverPreview: image.ImageReceiver = arriveOnNdkTest.createReceiver();
            const myData = getUserData(CALLBACK_FUC_01, 888, "on image arrive", false);
            expect(arriveOnNdkTest.imageArriveOn(receiverPhoto, myData) == IMAGE_SUCCESS).assertTrue();
            expect(arriveOnNdkTest.imageReceiverTest(receiverPhoto, CAMERA_FORMAT_JPEG, TEST_TYPE_PHOTO, receiverPreview) == IMAGE_SUCCESS).assertTrue();
            const result = arriveOnNdkTest.waitForCondition(myData.callBackId, myData.num, 0);
            expect(arriveOnNdkTest.imageArriveOff(receiverPhoto, CALLBACK_FUC_DE) == IMAGE_SUCCESS).assertTrue();
            arriveOnNdkTest.releaseImageReceiver(receiverPhoto);
            arriveOnNdkTest.releaseImageReceiver(receiverPreview);
            let ret = false;
            if (typeof result != 'number') {
                console.info(`${TAG} waitForCondition result is ${JSON.stringify(result)}`);
                ret = result.imageInfo!.format == 38 &&
                      isValidColorSpace(result.imageInfo!.colorSpace);
            } else {
                console.info(`${TAG} result is number ${result}`);
            }
            expect(ret).assertTrue();
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_GET_FORMAT_ERROR_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_GET_FORMAT_ERROR_0100
         * @tc.desc   1.get format with nullptr
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_GET_FORMAT_ERROR_0100', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_GET_FORMAT_ERROR_0100`;
            let errorData: arriveOnNdkTest.errorData = arriveOnNdkTest.testGetFormatNullptr();
            console.info(`${TAG} testGetFormatNullptr result is ${JSON.stringify(errorData)}`);
            expect(errorData.err1 == 401 && errorData.err2 == 401).assertTrue();
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_GET_COLORSPACE_ERROR_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_GET_COLORSPACE_ERROR_0100
         * @tc.desc   1.get colorspace with nullptr
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_GET_COLORSPACE_ERROR_0100', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_GET_COLORSPACE_ERROR_0100`;
            let errorData: arriveOnNdkTest.errorData = arriveOnNdkTest.testGetColorSpaceNullptr();
            console.info(`${TAG} testGetColorSpaceNullptr result is ${JSON.stringify(errorData)}`);
            expect(errorData.err1 == 401 && errorData.err2 == 401).assertTrue();
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_GET_BUFFER_DATA_ERROR_0100
         * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_GET_BUFFER_DATA_ERROR_0100
         * @tc.desc   1.get buffer data with nullptr
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVER_GET_BUFFER_DATA_ERROR_0100', Level.LEVEL0, async (done: Function) => {
            const TAG = `SUB_MULTIMEDIA_IMAGE_RECEIVER_GET_BUFFER_DATA_ERROR_0100`;
            let errorData: arriveOnNdkTest.errorData = arriveOnNdkTest.testGetBufferDataNullptr();
            console.info(`${TAG} testGetBufferDataNullptr result is ${JSON.stringify(errorData)}`);
            expect(errorData.err1 == 401 && errorData.err2 == 401).assertTrue();
            done();
        });
    })
}