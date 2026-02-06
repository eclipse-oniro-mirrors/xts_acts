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
import { JSON } from '@kit.ArkTS';
import { camera } from '@kit.CameraKit';

const TAG = "ImageReceiverTest: ";
const delegator = abilityDelegatorRegistry.getAbilityDelegator();
let testContext: common.UIAbilityContext;
let atManager = abilityAccessCtrl.createAtManager();
let button: UiComponent | null;

let getPermission = async () => {
  console.info('getPermission start');
  let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('thisContext') as common.UIAbilityContext
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.CAMERA'];
  console.info('permissions: Array<Permissions> = [\'ohos.permission.CAMERA\']')
  try {
    atManager.requestPermissionsFromUser(testContext, permissions).then((data: PermissionRequestResult) => {
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

export default function ImagePackerNativeTest() {

  describe('ImagePackerNativeTest', () => {
    let isSupportedCamerasResult = isSupportedCameras();
    const WIDTH = 1280;
    const HEIGHT = 960;
    const CAPACITY = 8;
    const SET_WIDTH = 1024;
    const SET_HEIGHT = 768;
    const SET_CAPACITY = 6;
    const ERR_PARA = -1;
    const Jpg_Stride = 1;
    const RECEIVER_FORMAT = 2000;

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
      testContext = AppStorage.get<common.UIAbilityContext>('thisContext') as common.UIAbilityContext;
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
        mPhotoSurface = ndkTest.jsGetReceivingSurfaceId(receiver);
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGESIZE_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGESIZE_0100
     * @tc.desc      : OH_ImageNative_GetImageSize error code is IMAGE_SUCCESS
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGESIZE_0100', Level.LEVEL3, async (done: Function) => {
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
        let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGESIZE_0100");
        getCameraManagerInstance();
        getCameraSupportDevicesArray();
        try {
          let options: number = ndkTest.jsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);

          let myReceiver: image.ImageReceiver = ndkTest.jsCreateImageReceiver(options);
          let onRet: number = ndkTest.jsImageReceiverNativeOn(myReceiver, (receiver: image.ImageReceiver) => {
            mlg.log("Image receiver callback success " + JSON.stringify(receiver));
            imageArrival = true;
          });

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
          imageArrival = false;

          lastestImage = ndkTest.jsReadLatestImage(myReceiver);
          let res : number = ndkTest.jsGetImageSize(lastestImage);

          expect(res).assertEqual(0);
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGESIZE_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGESIZE_0200
     * @tc.desc      : OH_ImageNative_GetImageSize error code is IMAGE_BAD_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGESIZE_0200', Level.LEVEL3, async (done: Function) => {
      let result: number = ndkTest.jsGetImageSizeBadParameter();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGECOMPONENTTYPES_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGECOMPONENTTYPES_0100
     * @tc.desc      : OH_ImageNative_GetComponentTypes error code is IMAGE_SUCCESS
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGECOMPONENTTYPES_0100', Level.LEVEL3, async (done: Function) => {
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
        let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETIMAGECOMPONENTTYPES_0100");
        getCameraManagerInstance();
        getCameraSupportDevicesArray();
        try {
          let options: number = ndkTest.jsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
          let myReceiver: image.ImageReceiver = ndkTest.jsCreateImageReceiver(options);
          let onRet: number = ndkTest.jsImageReceiverNativeOn(myReceiver, (receiver: image.ImageReceiver) => {
            mlg.log("Image receiver callback success " + JSON.stringify(receiver));
            imageArrival = true;
          });

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
          imageArrival = false;
          lastestImage = ndkTest.jsReadLatestImage(myReceiver);


          let types : number[] = ndkTest.jsGetImageComponentTypes(lastestImage);
          expect(Array.isArray(types)).assertEqual(true);
          expect(types.length > 0).assertEqual(true);
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETBYTEBUFFER_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_GETBYTEBUFFER_0100
     * @tc.desc      : OH_ImageNative_GetByteBuffer error code is IMAGE_SUCCESS
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETBYTEBUFFER_0100', Level.LEVEL3, async (done: Function) => {
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
        let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETBYTEBUFFER_0100");
        getCameraManagerInstance();
        getCameraSupportDevicesArray();
        try {
          let options: number = ndkTest.jsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
          let myReceiver: image.ImageReceiver = ndkTest.jsCreateImageReceiver(options);
          let onRet: number = ndkTest.jsImageReceiverNativeOn(myReceiver, (receiver: image.ImageReceiver) => {
            mlg.log("Image receiver callback success " + JSON.stringify(receiver));
            imageArrival = true;
          });

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
          imageArrival = false;
          lastestImage = ndkTest.jsReadLatestImage(myReceiver);

          let types : number[] = ndkTest.jsGetImageComponentTypes(lastestImage);

          console.log("types is"+JSON.stringify(types[0]))
          expect(Array.isArray(types)).assertEqual(true);
          expect(types.length > 0).assertEqual(true);

          let type : ESObject= types[0];
          let nativeBuffer: number = ndkTest.jsGetImageByteBuffer(lastestImage, type);
          expect(nativeBuffer).assertEqual(0);

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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETBYTEBUFFER_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_GETBYTEBUFFER_0200
     * @tc.desc      : OH_ImageNative_GetByteBuffer error code is IMAGE_BAD_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETBYTEBUFFER_0200', Level.LEVEL3, async (done: Function) => {
      let result: number = ndkTest.jsGetImageByteBufferBadParameter();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETBUFFERSIZE_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_GETBUFFERSIZE_0100
     * @tc.desc      : OH_ImageNative_GetBufferSize error code is IMAGE_SUCCESS
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETBUFFERSIZE_0100', Level.LEVEL3, async (done: Function) => {
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
        let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETBUFFERSIZE_0100");
        getCameraManagerInstance();
        getCameraSupportDevicesArray();
        try {
          let options: number = ndkTest.jsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
          let myReceiver: image.ImageReceiver = ndkTest.jsCreateImageReceiver(options);
          let onRet: number = ndkTest.jsImageReceiverNativeOn(myReceiver, (receiver: image.ImageReceiver) => {
            mlg.log("Image receiver callback success " + JSON.stringify(receiver));
            imageArrival = true;
          });

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
          imageArrival = false;
          lastestImage = ndkTest.jsReadLatestImage(myReceiver);

          let types : number[] = ndkTest.jsGetImageComponentTypes(lastestImage);

          console.log("types is"+JSON.stringify(types[0]))
          expect(Array.isArray(types)).assertEqual(true);
          expect(types.length > 0).assertEqual(true);

          let type : ESObject= types[0];
          let bufferSize: number = ndkTest.jsGetImageBufferSize(lastestImage, type);
          expect(bufferSize).assertEqual(0);

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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETBUFFERSIZE_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_GETBUFFERSIZE_0200
     * @tc.desc      : OH_ImageNative_GetBufferSize error code is IMAGE_BAD_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETBUFFERSIZE_0200', Level.LEVEL3, async (done: Function) => {
      let result: number = ndkTest.jsGetImageBufferSizeBadParameter();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETROWSTRIDE_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_GETROWSTRIDE_0100
     * @tc.desc      : OH_ImageNative_GetRowStride error code is IMAGE_SUCCESS
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETROWSTRIDE_0100', Level.LEVEL3, async (done: Function) => {
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
        let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETROWSTRIDE_0100");
        getCameraManagerInstance();
        getCameraSupportDevicesArray();
        try {
          let options: number = ndkTest.jsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
          let myReceiver: image.ImageReceiver = ndkTest.jsCreateImageReceiver(options);
          let onRet: number = ndkTest.jsImageReceiverNativeOn(myReceiver, (receiver: image.ImageReceiver) => {
            mlg.log("Image receiver callback success " + JSON.stringify(receiver));
            imageArrival = true;
          });

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
          imageArrival = false;
          lastestImage = ndkTest.jsReadLatestImage(myReceiver);

          let types : number[] = ndkTest.jsGetImageComponentTypes(lastestImage);

          console.log("types is"+JSON.stringify(types[0]))
          expect(Array.isArray(types)).assertEqual(true);
          expect(types.length > 0).assertEqual(true);

          let type : ESObject= types[0];
          let rowStride: number = ndkTest.jsGetImageRowStride(lastestImage, type);
          expect(rowStride).assertEqual(0);

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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETROWSTRIDE_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_GETROWSTRIDE_0200
     * @tc.desc      : OH_ImageNative_GetRowStride error code is IMAGE_BAD_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETROWSTRIDE_0200', Level.LEVEL3, async (done: Function) => {
      let result: number = ndkTest.jsGetImageRowStrideBadParameter();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETPIXELSTRIDE_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_GETPIXELSTRIDE_0100
     * @tc.desc      : OH_ImageNative_GetPixelStride error code is IMAGE_SUCCESS
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETPIXELSTRIDE_0100', Level.LEVEL3, async (done: Function) => {
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
        let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETPIXELSTRIDE_0100");
        getCameraManagerInstance();
        getCameraSupportDevicesArray();
        try {
          let options: number = ndkTest.jsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
          let myReceiver: image.ImageReceiver = ndkTest.jsCreateImageReceiver(options);
          let onRet: number = ndkTest.jsImageReceiverNativeOn(myReceiver, (receiver: image.ImageReceiver) => {
            mlg.log("Image receiver callback success " + JSON.stringify(receiver));
            imageArrival = true;
          });

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
          imageArrival = false;
          lastestImage = ndkTest.jsReadLatestImage(myReceiver);

          let types : number[] = ndkTest.jsGetImageComponentTypes(lastestImage);

          console.log("types is"+JSON.stringify(types[0]))
          expect(Array.isArray(types)).assertEqual(true);
          expect(types.length > 0).assertEqual(true);

          let type : ESObject= types[0];
          let pixelStride : number= ndkTest.jsGetImagePixelStride(lastestImage, type);
          expect(pixelStride).assertEqual(0);

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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETPIXELSTRIDE_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_GETPIXELSTRIDE_0200
     * @tc.desc      : OH_ImageNative_GetPixelStride error code is IMAGE_BAD_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETPIXELSTRIDE_0200', Level.LEVEL3, async (done: Function) => {
      let result: number = ndkTest.jsGetImagePixelStrideBadParameter();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETTIMESTAMP_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_GETTIMESTAMP_0100
     * @tc.desc      : OH_ImageNative_GetTimestamp error code is IMAGE_SUCCESS
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETTIMESTAMP_0100', Level.LEVEL3, async (done: Function) => {
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
        let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_GETTIMESTAMP_0100");
        getCameraManagerInstance();
        getCameraSupportDevicesArray();
        try {
          let options: number = ndkTest.jsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
          let myReceiver: image.ImageReceiver = ndkTest.jsCreateImageReceiver(options);
          let onRet: number = ndkTest.jsImageReceiverNativeOn(myReceiver, (receiver: image.ImageReceiver) => {
            mlg.log("Image receiver callback success " + JSON.stringify(receiver));
            imageArrival = true;
          });

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
          imageArrival = false;
          lastestImage = ndkTest.jsReadLatestImage(myReceiver);

          let res:Number = ndkTest.jsGetImageTimestamp(lastestImage);
          expect(res).assertEqual(0);
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_GETTIMESTAMP_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_GETTIMESTAMP_0200
     * @tc.desc      : OH_ImageNative_GetTimestamp error code is IMAGE_BAD_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_GETTIMESTAMP_0200', Level.LEVEL3, async (done: Function) => {
      let result: number = ndkTest.jsGetImageTimestampBadParameter();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_RELEASE_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_RELEASE_0100
     * @tc.desc      : OH_ImageNative_Release error code is IMAGE_SUCCESS
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_RELEASE_0100', Level.LEVEL3, async (done: Function) => {
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
        let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_NATIVE_RELEASE_0100");
        getCameraManagerInstance();
        getCameraSupportDevicesArray();
        try {
          let options: number = ndkTest.jsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
          let myReceiver: image.ImageReceiver = ndkTest.jsCreateImageReceiver(options);
          let onRet: number = ndkTest.jsImageReceiverNativeOn(myReceiver, (receiver: image.ImageReceiver) => {
            mlg.log("Image receiver callback success " + JSON.stringify(receiver));
            imageArrival = true;
          });

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
          imageArrival = false;
          lastestImage = ndkTest.jsReadLatestImage(myReceiver);

          let res:Number = ndkTest.jsReleaseImage(lastestImage);
          expect(res).assertEqual(0);
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NATIVE_RELEASE_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NATIVE_RELEASE_0200
     * @tc.desc      : OH_ImageNative_Release error code is IMAGE_BAD_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NATIVE_RELEASE_0200', Level.LEVEL3, async (done: Function) => {
      let result: number = ndkTest.jsReleaseImageBadParameter();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_DYNAMIC_RANGE_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_DYNAMIC_RANGE_0100
     * @tc.desc      : Test the IMAGE_PACKER_DYNAMIC_RANGE_AUTO in the enumeration IMAGE_PACKER_DYNAMIC_RANGE.
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_DYNAMIC_RANGE_0100', Level.LEVEL3, async (done: Function) => {
      let result: number = ndkTest.jSImagePackerDynamicRangeAuto();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_DYNAMIC_RANGE_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_DYNAMIC_RANGE_0200
     * @tc.desc      : Test the IMAGE_PACKER_DYNAMIC_RANGE_SDR in the enumeration IMAGE_PACKER_DYNAMIC_RANGE.
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_DYNAMIC_RANGE_0200', Level.LEVEL3, async (done: Function) => {
      let result: number = ndkTest.jSImagePackerDynamicRangeSdr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_OHPACKINGOPTIONSCREATE_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_OHPACKINGOPTIONSCREATE_0100
     * @tc.desc      : OH_PackingOptions_Create return IMAGE_SUCCESS
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_OHPACKINGOPTIONSCREATE_0100', Level.LEVEL3, async (done: Function) => {
      let result: number = ndkTest.jsIOHPackingOptionsCreate();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETMIMETYPE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETMIMETYPE_ERROR_0100
     * @tc.desc     : OH_PackingOptions_SetMimeType return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETMIMETYPE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let mimeType = "IMAGE/jpeg";
      let packingOps: image.PackingOption = ndkTest.createPackingOptions();
      let res: number = ndkTest.jsPackingOptionsSetMimeType(packingOps, mimeType);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETMIMETYPE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETMIMETYPE_ERROR_0200
     * @tc.desc     : OH_PackingOptions_SetMimeType return IMAGE_ALLOC_FAILED
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETMIMETYPE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let mimeType = "IMAGE/jpeg";
      let packingOps: image.PackingOption = ndkTest.createPackingOptions();
      let res: number = ndkTest.jsPackingOptionsSetMimeTypeImageAllocFailed(packingOps, mimeType);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETMIMETYPE_ERROR_0300
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETMIMETYPE_ERROR_0300
     * @tc.desc     : OH_PackingOptions_SetMimeType return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETMIMETYPE_ERROR_0300", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsSetMimeTypeImageBadParameter();
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPE_ERROR_0100
     * @tc.desc     : OH_PackingOptions_GetMimeType return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let mimeType = "IMAGE/jpeg";
      let packingOps: image.PackingOption = ndkTest.createPackingOptions();
      let res: number = ndkTest.jsPackingOptionsSetMimeType(packingOps, mimeType);
      res = ndkTest.jsPackingOptionsGetMimeType(packingOps);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPE_ERROR_0200
     * @tc.desc     : OH_PackingOptions_GetMimeType return IMAGE_ALLOC_FAILED
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let mimeType = "IMAGE/jpeg";
      let packingOps: image.PackingOption = ndkTest.createPackingOptions();
      let res: number = ndkTest.jsPackingOptionsSetMimeType(packingOps, mimeType);
      res = ndkTest.jsPackingOptionsGetMimeTypeImageAllocFailed(packingOps);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPE_ERROR_0300
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPE_ERROR_0300
     * @tc.desc     : OH_PackingOptions_GetMimeType return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPE_ERROR_0300", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsGetMimeTypeImageBadParameter();
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPEWITHNULL_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPEWITHNULL_ERROR_0100
     * @tc.desc     : OH_PackingOptions_GetMimeTypeWithNull return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPEWITHNULL_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let mimeType = "IMAGE/jpeg";
      let packingOps: image.PackingOption = ndkTest.createPackingOptions();
      let res: number = ndkTest.jsPackingOptionsSetMimeType(packingOps, mimeType);
      res = ndkTest.jsPackingOptionsGetMimeTypeNull(packingOps);
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPEWITHNULL_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPEWITHNULL_ERROR_0200
     * @tc.desc     : OH_PackingOptions_GetMimeTypeWithNull return IMAGE_PACKER_INVALID_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETMIMETYPEWITHNULL_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number  = ndkTest.jsPackingOptionsGetMimeTypeNullInvalidParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETQUALITY_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETQUALITY_ERROR_0100
     * @tc.desc     : OH_PackingOptions_SetQuality return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETQUALITY_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let packingOps: image.PackingOption = ndkTest.createPackingOptions();
      let res: number = ndkTest.jsPackingOptionsSetQuality(packingOps, 30);
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETQUALITY_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETQUALITY_ERROR_0200
     * @tc.desc     : OH_PackingOptions_SetQuality return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETQUALITY_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsSetQualityBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETQUALITY_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETQUALITY_ERROR_0100
     * @tc.desc     : OH_PackingOptions_GetQuality return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETQUALITY_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let packingOps: image.PackingOption = ndkTest.createPackingOptions();
      let res: number = ndkTest.jsPackingOptionsSetQuality(packingOps, 30);
      res = ndkTest.jsPackingOptionsGetQuality(packingOps);
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETQUALITY_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETQUALITY_ERROR_0200
     * @tc.desc     : OH_PackingOptions_GetQuality return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETQUALITY_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsGetQualityBadParameter();
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETNEEDSPACKPROPERTIES_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETNEEDSPACKPROPERTIES_ERROR_0100
     * @tc.desc     : OH_PackingOptions_GetNeedsPackProperties return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETNEEDSPACKPROPERTIES_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let packingOps: image.PackingOption = ndkTest.createPackingOptions();
      let res: number = ndkTest.jsPackingOptionsSetNeedsPackProperties(packingOps, 1);
      res = ndkTest.jsPackingOptionsGetNeedsPackProperties(packingOps);
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETNEEDSPACKPROPERTIES_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETNEEDSPACKPROPERTIES_ERROR_0200
     * @tc.desc     : OH_PackingOptions_GetNeedsPackProperties return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETNEEDSPACKPROPERTIES_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsGetNeedsPackPropertiesBadParameter();
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETNEEDSPACKPROPERTIES_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETNEEDSPACKPROPERTIES_ERROR_0100
     * @tc.desc     : OH_PackingOptions_SetNeedsPackProperties return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETNEEDSPACKPROPERTIES_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let packingOps: image.PackingOption = ndkTest.createPackingOptions();
      let res: number = ndkTest.jsPackingOptionsSetNeedsPackProperties(packingOps, 1);
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETNEEDSPACKPROPERTIES_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETNEEDSPACKPROPERTIES_ERROR_0200
     * @tc.desc     : OH_PackingOptions_SetNeedsPackProperties return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETNEEDSPACKPROPERTIES_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsSetDesiredDynamicRangeBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDESIREDDYNAMICRANGE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDESIREDDYNAMICRANGE_ERROR_0100
     * @tc.desc     : OH_PackingOptions_GetDesiredDynamicRange return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDESIREDDYNAMICRANGE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let packingOps: image.PackingOption = ndkTest.createPackingOptions();
      let res: number = ndkTest.jsPackingOptionsSetDesiredDynamicRange(packingOps, 2);
      res = ndkTest.jsPackingOptionsGetDesiredDynamicRange(packingOps);
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDESIREDDYNAMICRANGE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDESIREDDYNAMICRANGE_ERROR_0200
     * @tc.desc     : OH_PackingOptions_GetDesiredDynamicRange return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDESIREDDYNAMICRANGE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsGetQualityBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDESIREDDYNAMICRANGE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDESIREDDYNAMICRANGE_ERROR_0100
     * @tc.desc     : OH_PackingOptions_SetDesiredDynamicRange return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDESIREDDYNAMICRANGE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let packingOps: image.PackingOption = ndkTest.createPackingOptions();
      let res: number = ndkTest.jsPackingOptionsSetDesiredDynamicRange(packingOps, 2);
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDESIREDDYNAMICRANGE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDESIREDDYNAMICRANGE_ERROR_0200
     * @tc.desc     : OH_PackingOptions_SetDesiredDynamicRange return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDESIREDDYNAMICRANGE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsSetDesiredDynamicRangeBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSRELEASE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSRELEASE_ERROR_0100
     * @tc.desc     : OH_PackingOptions_Release return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSRELEASE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let packingOps: image.PackingOption = ndkTest.createPackingOptions();
      let res: number = ndkTest.jsPackingOptionsRelease(packingOps);
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSRELEASE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSRELEASE_ERROR_0200
     * @tc.desc     : OH_PackingOptions_Release return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSRELEASE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsReleaseBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSFORSEQUENCECREATE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSFORSEQUENCECREATE_ERROR_0100
     * @tc.desc     : OH_PackingOptionsForSequence_Create return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSFORSEQUENCECREATE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceCreate();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSFORSEQUENSETFRAMECOUNT_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSFORSEQUENSETFRAMECOUNT_ERROR_0100
     * @tc.desc     : OH_PackingOptionsForSequence_SetFrameCount return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSFORSEQUENSETFRAMECOUNT_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceSetFrameCount();
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSFORSEQUENSETFRAMECOUNT_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSFORSEQUENSETFRAMECOUNT_ERROR_0200
     * @tc.desc     : OH_PackingOptionsForSequence_SetFrameCount return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_PACKINGOPTIONSFORSEQUENSETFRAMECOUNT_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceSetFrameCountBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDELAYTIMELIST_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDELAYTIMELIST_ERROR_0100
     * @tc.desc     : OH_PackingOptionsForSequence_SetDelayTimeList return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDELAYTIMELIST_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceSetDelayTimeList();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDELAYTIMELIST_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDELAYTIMELIST_ERROR_0200
     * @tc.desc     : OH_PackingOptionsForSequence_SetDelayTimeList return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDELAYTIMELIST_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceSetDelayTimeListBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDELAYTIMELIST_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDELAYTIMELIST_ERROR_0100
     * @tc.desc     : OH_PackingOptionsForSequence_GetDelayTimeList return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDELAYTIMELIST_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceGetDelayTimeList();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDELAYTIMELIST_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDELAYTIMELIST_ERROR_0200
     * @tc.desc     : OH_PackingOptionsForSequence_GetDelayTimeList return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDELAYTIMELIST_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceGetDelayTimeListBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDISPOSALTYPES_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDISPOSALTYPES_ERROR_0100
     * @tc.desc     : OH_PackingOptionsForSequence_SetDisposalTypes return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDISPOSALTYPES_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceSetDisposalTypes();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDISPOSALTYPES_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDISPOSALTYPES_ERROR_0200
     * @tc.desc     : OH_PackingOptionsForSequence_SetDisposalTypes return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETDISPOSALTYPES_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceSetDisposalTypesBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDISPOSALTYPES_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDISPOSALTYPES_ERROR_0100
     * @tc.desc     : OH_PackingOptionsForSequence_GetDisposalTypes return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDISPOSALTYPES_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceGetDisposalTypes();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDISPOSALTYPES_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDISPOSALTYPES_ERROR_0200
     * @tc.desc     : OH_PackingOptionsForSequence_GetDisposalTypes return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETDISPOSALTYPES_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceGetDisposalTypesBadParameter();
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETLOOPCOUNT_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETLOOPCOUNT_ERROR_0100
     * @tc.desc     : OH_PackingOptionsForSequence_SetLoopCount return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETLOOPCOUNT_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceSetLoopCount();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETLOOPCOUNT_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETLOOPCOUNT_ERROR_0200
     * @tc.desc     : OH_PackingOptionsForSequence_SetLoopCount return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SETLOOPCOUNT_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceSetLoopCountBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETLOOPCOUNT_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETLOOPCOUNT_ERROR_0100
     * @tc.desc     : OH_PackingOptionsForSequence_GetLoopCount return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETLOOPCOUNT_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceGetLoopCount();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETLOOPCOUNT_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETLOOPCOUNT_ERROR_0200
     * @tc.desc     : OH_PackingOptionsForSequence_GetLoopCount return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GETLOOPCOUNT_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceGetLoopCountBadParameter();
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONSFORSEQUENCE_RELEASE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONSFORSEQUENCE_RELEASE_ERROR_0100
     * @tc.desc     : OH_PackingOptionsForSequence_Release return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONSFORSEQUENCE_RELEASE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceRelease();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONSFORSEQUENCE_RELEASE_ERROR_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONSFORSEQUENCE_RELEASE_ERROR_0200
     * @tc.desc     : OH_PackingOptionsForSequence_Release return IMAGE_BAD_PARAMETER
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONSFORSEQUENCE_RELEASE_ERROR_0200", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsPackingOptionsForSequenceReleaseBadParameter();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_CREATE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_CREATE_ERROR_0100
     * @tc.desc     : OH_ImagePackerNative_Create return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_NATIVE_CREATE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = ndkTest.jsImagePackerNativeCreate();
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASLATESTIMAGE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASLATESTIMAGE_ERROR_0100
     * @tc.desc     : OH_ImageReceiverNative_ReadLatestImage return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASLATESTIMAGE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
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
        let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASLATESTIMAGE_ERROR_0100");
        getCameraManagerInstance();
        getCameraSupportDevicesArray();
        try {
          let options: number = ndkTest.jsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
          let myReceiver: image.ImageReceiver = ndkTest.jsCreateImageReceiver(options);
          let onRet: number = ndkTest.jsImageReceiverNativeOn(myReceiver, (receiver: image.ImageReceiver) => {
            mlg.log("Image receiver callback success " + JSON.stringify(receiver));
            imageArrival = true;
          });

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
          imageArrival = false;
          lastestImage = ndkTest.jsReadLatestImage(myReceiver);

          expect(lastestImage != undefined ).assertTrue();
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
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASNEXTIMAGE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASNEXTIMAGE_ERROR_0100
     * @tc.desc     : OH_ImageReceiverNative_ReadNextImage return IMAGE_SUCCESS
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASNEXTIMAGE_ERROR_0100", Level.LEVEL3, async (done: Function) => {
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
        let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVER_NATIVE_REASNEXTIMAGE_ERROR_0100");
        getCameraManagerInstance();
        getCameraSupportDevicesArray();
        try {
          let options: number = ndkTest.jsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
          let myReceiver: image.ImageReceiver = ndkTest.jsCreateImageReceiver(options);
          let onRet: number = ndkTest.jsImageReceiverNativeOn(myReceiver, (receiver: image.ImageReceiver) => {
            mlg.log("Image receiver callback success " + JSON.stringify(receiver));
            imageArrival = true;
          });

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
          imageArrival = false;
          lastestImage = ndkTest.jsReadNextImage(myReceiver);

          expect(lastestImage != undefined ).assertTrue();
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
