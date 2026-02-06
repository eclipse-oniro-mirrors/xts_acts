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
import featureAbility from '@ohos.ability.featureAbility';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import {UiDriver, BY, UiComponent} from '@ohos.UiTest'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import ndkTest from 'libentry.so'
import common from '@ohos.app.ability.common';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { isSupportedCameras } from './common'

const TAG = "ImageReceiverTest: ";
const delegator = abilityDelegatorRegistry.getAbilityDelegator();
let testContext: common.UIAbilityContext;
let atManager = abilityAccessCtrl.createAtManager();
let button: UiComponent | null;

let getPermission = async () => {
  console.info('getPermission start');
  let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext
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

    
let sleep = (ms?: number | undefined): Promise<void> => {
    return new Promise(resolve => setTimeout(resolve, ms));
}

export default function ImageReceiverTest() {

    describe('ImageReceiverTest', () => {
        let isSupportedCamerasResult = isSupportedCameras();
        const WIDTH = 1280;
        const HEIGHT = 960;
        const CAPACITY = 8;
        const SET_WIDTH = 1024;
        const SET_HEIGHT = 768;
        const SET_CAPACITY = 6;
        const ERR_PARA = -1;
        const Jpg_Stride = 1;
        let captureLocation: cameraObj.Location = {
            latitude: 0,
            longitude: 0,
            altitude: 0,
        };
        let mCameraManager: cameraObj.CameraManager;
        let cameraOutputCap: cameraObj.CameraOutputCapability;
        let mCameraDevicesArray: cameraObj.CameraDevice[];
        let mCameraSession: cameraObj.CaptureSession;
        let mCameraNum: number;
        let mCameraInput: cameraObj.CameraInput;
        let mPreviewOutput: cameraObj.PreviewOutput;
        let mPhotoSurface: string;
        let mPhotoOutput: cameraObj.PhotoOutput;
        let nextImage: image.Image;
        let lastestImage: image.Image;
        let isSupportCameraVideoProfiles = true;
        let imageArrival = false;

        let logger = (caseName: string): ESObject => {
            return {
                myName: caseName,
                log: (msg: string) => {
                    console.info(caseName + ' ' + msg);
                }
            };
        }

        beforeAll(async () => {
            console.info('beforeAll case');
            if (!isSupportedCamerasResult) {
              return;
            }
            await getPermission();
            await permissionClick();
            testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
            mCameraManager = cameraObj.getCameraManager(testContext);
            if (!mCameraManager) {
                console.error("camera.getCameraManager error");
                return;
            }
            let cameras = mCameraManager.getSupportedCameras();
            let cameraDevice = cameras[0];
            let cameraOutputCapability = mCameraManager.getSupportedOutputCapability(cameraDevice);
            if (cameraOutputCapability?.videoProfiles) {
                console.info('Support camera video profiles');
            }
            else {
                isSupportCameraVideoProfiles = false;
                console.info('Not support camera Video Profiles');
            }
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

        let isEmpty = (data: ESObject) => {
            if (data == null || data == undefined) {
                return true;
            }
            return false;
        }

        let getCameraManagerInstance = () => {
            console.info(TAG + 'Enter getCameraManagerInstance');
            mCameraManager = cameraObj.getCameraManager(testContext);
            if (isEmpty(mCameraManager)) {
                console.info(TAG + "getCameraManager FAILED");
                return false;
            }
            console.info(TAG + 'Exit getCameraManagerInstance');
            return true;
        }

        let getCameraSupportDevicesArray = () => {
            console.info(TAG + 'Enter getCameraSupportDevicesArray');
            mCameraDevicesArray = mCameraManager.getSupportedCameras();
            if (isEmpty(mCameraDevicesArray)) {
                console.info(TAG + "getSupportedCameras FAILED");
                return false;
            }
            mCameraNum = mCameraDevicesArray.length;
            console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
            console.info(TAG + 'Exit getCameraSupportDevicesArray');
            return true;
        }

        let getPhotoReceiverSurface = async (receiver: image.ImageReceiver) => {
            console.log(TAG + 'Entering getPhotoReceiverSurface');
            console.log(TAG + 'before receiver check');
            if (receiver !== undefined) {
                mPhotoSurface = ndkTest.JsGetReceivingSurfaceId(receiver);
                console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
            }
            else {
                console.log(TAG + 'Photo receiver is created failed');
            }
            console.log(TAG + 'Exit getPhotoReceiverSurface');
        }

        let beginCameraSessionConfig = () => {
            console.info(TAG + 'Enter beginCameraSessionConfig');
            mCameraSession.beginConfig();
            console.info(TAG + 'Exit beginCameraSessionConfig');
            return true;
        }

        let createCameraSessionInstance = () => {
            console.info(TAG + 'Enter createCameraSessionInstance');
            try {
                mCameraSession = mCameraManager.createCaptureSession();
            }
            catch {
                console.info(TAG + 'createCaptureSession FAILED');
            }
            if (isEmpty(mCameraSession)) {
                console.info(TAG + "createCaptureSession FAILED with empty CameraSession");
                return false;
            }
            beginCameraSessionConfig();
            console.info(TAG + 'Exit createCameraSessionInstance');
            return true;
        }

        let createInput = async (idx: ESObject) => {
            console.info(TAG + 'Enter createInput');
            if (isEmpty(mCameraDevicesArray)) {
                console.info(TAG + "Entering createInputs FAILED with NoCamera");
                return false;
            }
            mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx]);
            if (isEmpty(mCameraInput)) {
                console.info(TAG + "createCameraInput FAILED");
                return false;
            }
            await mCameraInput.open();
            sleep(100);
            console.info(idx + 'th CameraInput is: ' + mCameraInput);
            console.info(TAG + 'Exit createInput');
            return true;
        }

        let createOutput = async (idx: ESObject) => {
            console.info(TAG + 'Enter createOutput');
            cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx]);
            if (!isEmpty(cameraOutputCap)) {
                if (!isEmpty(cameraOutputCap.previewProfiles)) {
                    console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
                    for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
                        mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], globalThis.surfaceId);
                        if (!isEmpty(mPreviewOutput)) {
                            break;
                        }
                    }
                    if (isEmpty(mPreviewOutput)) {
                        console.info(TAG + "createPreviewOutput FAILED");
                    }
                    console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
                }
            }
            if (!isEmpty(cameraOutputCap.photoProfiles)) {
                console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);
                for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
                    mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i], mPhotoSurface);
                    if (!isEmpty(mPhotoOutput)) {
                        break;
                    }
                }
                if (isEmpty(mPhotoOutput)) {
                    console.info(TAG + "createPhotoOutput FAILED");
                }
                console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
            }
            console.info(TAG + 'Exit createOutputs');
            return true;
        }

        let commitCameraSessionConfig = async () => {
            console.info(TAG + 'Enter commitCameraSessionConfig');
            await mCameraSession.commitConfig();
            sleep(500);
            console.info(TAG + 'Exit commitCameraSessionConfig');
            return true;
        }

        let waitUntilImageArrival = async () => {
            let waitTime = 0;
            let step = 100;
            while (imageArrival == false) {
                await sleep(step);
                waitTime += step;
            }
            console.info(TAG + 'image arrival cost(ms): ' + waitTime);
        }

        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_RELEASE_0100
         * @tc.name      : test release image receiver options
         * @tc.desc      : 1.create image receiver options
         *                 2.create image receiver
         *                 3.release image receiver options
         *                 4.recreate image receiver failed
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_RELEASE_0100', Level.LEVEL0, async (done: Function) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              done();
              return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_RELEASE_0100");
            try {
                let options: number = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                let myReceiver: image.ImageReceiver = ndkTest.JsCreateImageReceiver(options);
                expect(myReceiver != undefined).assertTrue();
                mlg.log("Create receiver success");
                let ret: number = ndkTest.JsReleaseImageReceiverOptions(options);
                expect(ret != undefined).assertTrue();
                ret = ndkTest.JsReleaseImageReceiverOptions(options);
                expect(ret == undefined).assertTrue();
                mlg.log("Release receiver options success");
                let newReceiver: image.ImageReceiver = ndkTest.JsCreateImageReceiver(options);
                expect(newReceiver == undefined).assertTrue();
                mlg.log("Can't recreate receiver, case success.");
                done();
            }
            catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_RELEASE_0200
         * @tc.name      : test release image receiver
         * @tc.desc      : 1.create image receiver options
         *                 2.create image receiver
         *                 3.release image receiver
         *                 4.get image receiver properties failed
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_RELEASE_0200', Level.LEVEL0, async (done: Function) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              done();
              return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_RELEASE_0200");
            try {
                let options: number = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                let myReceiver: image.ImageReceiver = ndkTest.JsCreateImageReceiver(options);
                expect(myReceiver != undefined).assertTrue();
                mlg.log("Create receiver success");
                let ret: number = ndkTest.JsReleaseImageReceiver(myReceiver);
                expect(ret != undefined).assertTrue();
                ret = ndkTest.JsReleaseImageReceiver(myReceiver);
                expect(ret == undefined).assertTrue();
                mlg.log("Release receiver success");
                let size: ESObject = ndkTest.JsGetSize(myReceiver);
                let capacity: ESObject = ndkTest.JsGetCapacity(myReceiver);
                expect(size == undefined).assertTrue();
                expect(capacity == undefined).assertTrue();
                mlg.log("Can't get receiver properties, case success.");
                done();
            }
            catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0100
         * @tc.name      : test set callback image receiver
         * @tc.desc      : 1.create image receiver options
         *                 2.create image receiver
         *                 3.make receiver callback on, take photo, check callback status
         *                 4.make receiver callback off, take photo, check callback status
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0100', Level.LEVEL0, async (done: Function) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              done();
              return;
            }
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object. Not support usb camera');
                done();
            }
            else {
                let captureSetting: cameraObj.PhotoCaptureSetting = {
                    quality: cameraObj.QualityLevel.QUALITY_LEVEL_LOW,
                    rotation: cameraObj.ImageRotation.ROTATION_0,
                    location: captureLocation,
                    mirror: false
                };
                let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0100");
                getCameraManagerInstance();
                getCameraSupportDevicesArray();
                try {
                    let options: number = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                    let myReceiver: image.ImageReceiver = ndkTest.JsCreateImageReceiver(options);
                    let capacity: number = CAPACITY;
                    let onRet: number = ndkTest.JsOn(myReceiver, (receiver: image.ImageReceiver) => {
                        mlg.log("Image receiver callback success " + JSON.stringify(receiver));
                        imageArrival = true;
                        capacity = capacity + 1;
                        ndkTest.JsImageReceiverOptionsSetCapacity(options, capacity);
                        mlg.log("OnCallback success");
                        expect(receiver != undefined).assertTrue();
                    });
                    expect(onRet != undefined).assertTrue();
                    await getPhotoReceiverSurface(myReceiver);
                    await createInput(0);
                    createCameraSessionInstance();
                    mCameraSession.addInput(mCameraInput);
                    createOutput(0);
                    mCameraSession.addOutput(mPreviewOutput);
                    mCameraSession.addOutput(mPhotoOutput);
                    await commitCameraSessionConfig();
                    await mCameraSession.start();
                    mPhotoOutput.capture(captureSetting).then((result) => {
                        console.info('capture success :' + result);
                    }).catch((err: BusinessError) => {
                        console.info('capture failed :' + err);
                    });
                    await waitUntilImageArrival();
                    nextImage = ndkTest.JsReadNextImage(myReceiver);
                    mlg.log("mTestImage 1 " + JSON.stringify(nextImage));
                    let capacityAfterOn: number = ndkTest.JsImageReceiverOptionsGetCapacity(options);
                    expect(capacityAfterOn == CAPACITY + 1).assertTrue();
                    imageArrival = false;
                    mPhotoOutput.capture(captureSetting).then((result) => {
                        console.info('capture success :' + result);
                    }).catch((err: BusinessError) => {
                        console.info('capture failed: ' + err);
                    });
                    await waitUntilImageArrival();
                    lastestImage = ndkTest.JsReadLatestImage(myReceiver);
                    mlg.log("mTestImage 2 " + JSON.stringify(lastestImage));
                    let capacityAfterOff: number = ndkTest.JsImageReceiverOptionsGetCapacity(options);
                    expect(capacityAfterOff == CAPACITY + 2).assertTrue();
                    await mCameraSession.stop();
                    await sleep(1000);
                    let onOFF: number = ndkTest.JsOff(myReceiver);
                    expect(onOFF != undefined).assertTrue();
                    ndkTest.JsReleaseImageReceiverOptions(options);
                    ndkTest.JsReleaseImageReceiver(myReceiver);
                    done();
                }
                catch (error) {
                    mlg.log("Test exception " + error);
                    expect().assertFail();
                    done();
                }
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0200
         * @tc.name      : test set image receiver options
         * @tc.desc      : 1.create image receiver options
         *                 2.set image receiver options
         *                 3.create image receiver
         *                 4.get image receiver properties
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0200', Level.LEVEL0, async (done: Function) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              done();
              return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0200");
            try {
                let options: number = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                ndkTest.JsImageReceiverOptionsSetCapacity(options, SET_CAPACITY);
                ndkTest.JsImageReceiverOptionsSetSize(options, SET_WIDTH, SET_HEIGHT);
                mlg.log("Set options finished");
                let imageReceiver: image.ImageReceiver = ndkTest.JsCreateImageReceiver(options);
                let receiverSize: ndkTest.imageSize = ndkTest.JsGetSize(imageReceiver);
                let receiverCapacity: number = ndkTest.JsGetCapacity(imageReceiver);
                expect(receiverSize.width == SET_WIDTH).assertTrue();
                expect(receiverSize.height == SET_HEIGHT).assertTrue();
                expect(receiverCapacity == SET_CAPACITY).assertTrue();
                done();
            }
            catch (error) {
                mlg.log("Test exception " + error);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0300
         * @tc.name      : test set image receiver options fail
         * @tc.desc      : 1.create image receiver options
         *                 2.set image receiver options with wrong parameter type
         *                 3.create image receiver
         *                 4.get image receiver properties
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0300', Level.LEVEL0, async (done: Function) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              done();
              return;
            }
            let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0300");
            try {
                let options: number = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                ndkTest.JsImageReceiverOptionsSetCapacity(options, true);
                ndkTest.JsImageReceiverOptionsSetSize(options, 'width', 'height');
                mlg.log("Set options finished");
                let imageReceiver: image.ImageReceiver = ndkTest.JsCreateImageReceiver(options);
                let receiverSize: ndkTest.imageSize = ndkTest.JsGetSize(imageReceiver);
                let receiverCapacity: number = ndkTest.JsGetCapacity(imageReceiver);
                expect(receiverSize.width == WIDTH).assertTrue();
                expect(receiverSize.height == HEIGHT).assertTrue();
                expect(receiverCapacity == CAPACITY).assertTrue();
                done();
            }
            catch (error) {
                mlg.log("Test exception " + error);
                expect().assertTrue();
                done();
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0400
         * @tc.name      : test get image receiver properties
         * @tc.desc      : 1.create image receiver options
         *                 2.create image receiver
         *                 3.get image receiver properties
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0400', Level.LEVEL0, async (done: Function) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              done();
              return;
            }
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object. Not support usb camera');
                done();
            }
            else {
                let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0400");
                try {
                    let options: number = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
                    let myReceiver : image.ImageReceiver= ndkTest.JsCreateImageReceiver(options);
                    let optionsSize: ndkTest.imageSize = ndkTest.JsImageReceiverOptionsGetSize(options);
                    let optionsCapacity: number = ndkTest.JsImageReceiverOptionsGetCapacity(options);
                    let receiverSize : ndkTest.imageSize= ndkTest.JsGetSize(myReceiver);
                    let receiverCapacity: number = ndkTest.JsGetCapacity(myReceiver);
                    let lastestSize : ndkTest.imageSize = ndkTest.JsGetImageSize(lastestImage);
                    let nextSize: ndkTest.imageSize = ndkTest.JsGetImageSize(nextImage);
                    mlg.log("Get all properties success");
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
                    done();
                }
                catch (error) {
                    mlg.log("Test exception " + error);
                    expect().assertFail();
                    done();
                }
            }
        });
        /**
         * @tc.number    : SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0500
         * @tc.name      : test get image properties in image receiver
         * @tc.desc      : 1.create image receiver options
         *                 2.create image receiver
         *                 3.get image in receiver
         *                 4.get image properties
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0500', Level.LEVEL0, async (done: Function) => {
            if (!isSupportedCamerasResult) {
              console.info('Failed to obtain the default camera or device object.Not support usb camera');
              done();
              return;
            }
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object. Not support usb camera');
                done();
            }
            else {
                let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0500");
                try {
                    let size : ndkTest.imageSize = ndkTest.JsGetImageSize(lastestImage);
                    expect(size.height > 0).assertTrue();
                    expect(size.width > 0).assertTrue();
                    mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0500" + size.height);
                    mlg.log("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_NORMAL_0500" + size.width);
                    let types : number[] = ndkTest.JsGetImageComponentTypes(lastestImage);
                    expect(Array.isArray(types)).assertEqual(true);
                    expect(types.length > 0).assertEqual(true);
                    mlg.log("JsGetImageComponentTypes types " + JSON.stringify(types));
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
                    done();
                }
                catch (error) {
                    mlg.log("Test exception " + error);
                    expect().assertFail();
                    done();
                }
            }
        });
    })
}