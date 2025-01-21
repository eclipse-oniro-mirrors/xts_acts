/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import cameras from 'libentry.so'
import image from '@ohos.multimedia.image';
import { Camera_Position, Camera_Type } from './Constants';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

const TAG = "CAMERA_LOGTAG_JS";
const CAMERA_OK = 0;
const CAMERA_ERROR_7400101 = 7400101; //参数错误
let receiver: image.ImageReceiver;
let mPhotoSurface: string;
function getCameraManagerInstance(index: number) {
  console.info(TAG + 'mSurfaceId : ' + mPhotoSurface);
  let ret = cameras.initCamera(mPhotoSurface, index);
  console.info(TAG + 'initCamera : ' + ret);
  if (ret != 0) {
    console.info(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }
}

function getSupportedCamerasInstance() {
  let cameraInfo = cameras.oHCameraManagerGetSupportedCameras(0);
  if (isEmpty(cameraInfo)) {
    console.info(TAG + "getSupportedCamerasInstance FAILED");
    expect().assertFail();
  }
}

function getSupportedCameraOutputCapabilityInstance() {
  let ret = cameras.oHGetSupportedCameraOutputCapability(0);
  if (ret != 0) {
    console.info(TAG + "getSupportedCameraOutputCapabilityInstance FAILED");
    expect().assertFail();
  }
}

function createPreviewOutputInstance() {
  let ret = cameras.oHCameraManagerCreatePreviewOutput(0);
  if (ret != 0) {
    console.info(TAG + "createPreviewOutputInstance FAILED");
    expect().assertFail();
  }
}

async function getPhotoReceiverSurface() {
  console.log(TAG + '通过宽、高、图片格式、容量创建ImageReceiver实例。');
  receiver = image.createImageReceiver({ width: 640, height: 480 }, 4, 8);
  if (receiver !== undefined) {
    console.log(TAG + '创建ImageReceiver实例 successfully');
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.log(TAG + '创建ImageReceiver实例 failed');
  }
}

function isEmpty(data: cameras.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.CAMERA" | "ohos.permission.READ_MEDIA" | "ohos.permission.WRITE_MEDIA";
  let list: MyPermissions[] = ['ohos.permission.CAMERA', 'ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.ohcamerandk', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
};

export default function CameraManagerTest() {


  describe('CameraManagerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      await getPermissions();
      await getPhotoReceiverSurface();

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraGetCameraManager0100
     * @tc.name       : testOHCameraGetCameraManager0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraGetCameraManager0100', 0, () => {
      let ret = cameras.oHCameraGetCameraManager(0);
      console.log(TAG+"testOHCameraGetCameraManager0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraGetCameraManager0200
     * @tc.name       : testOHCameraGetCameraManager0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraGetCameraManager0200', 0, () => {
      let ret = cameras.oHCameraGetCameraManager(1);
      console.log(TAG+"testOHCameraGetCameraManager0200:"+ret);
      expect(ret).assertEqual(-1);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterCallback0100
     * @tc.name       : testOHCameraManagerRegisterCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerRegisterCallback0100', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCameraManagerRegisterCallback(0);
      console.log(TAG+"testOHCameraManagerRegisterCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterCallback0200
     * @tc.name       : testOHCameraManagerRegisterCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerRegisterCallback0200', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCameraManagerRegisterCallback(1);
      console.log(TAG+"testOHCameraManagerRegisterCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterCallback0300
     * @tc.name       : testOHCameraManagerRegisterCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerRegisterCallback0300', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCameraManagerRegisterCallback(2);
      console.log(TAG+"testOHCameraManagerRegisterCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraDeleteCameraManager0100
     * @tc.name       : testOHCameraDeleteCameraManager0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraDeleteCameraManager0100', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCameraDeleteCameraManager(0);
      console.log(TAG+"testOHCameraDeleteCameraManager0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraDeleteCameraManager0200
     * @tc.name       : testOHCameraDeleteCameraManager0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraDeleteCameraManager0200', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCameraDeleteCameraManager(1)
      console.log(TAG+"testOHCameraDeleteCameraManager0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCreateCameraInputWithPositionAndType0100
     * @tc.name       : testOHCreateCameraInputWithPositionAndType0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCreateCameraInputWithPositionAndType0100', 0, () => {
      getCameraManagerInstance(0);
      let ret =  cameras.oHCreateCameraInputWithPositionAndType(Camera_Position.CAMERA_POSITION_UNSPECIFIED, Camera_Type.CAMERA_TYPE_DEFAULT, 0);
      console.log(TAG+"testOHCreateCameraInputWithPositionAndType0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCreateCameraInputWithPositionAndType0200
     * @tc.name       : testOHCreateCameraInputWithPositionAndType0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCreateCameraInputWithPositionAndType0200', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCreateCameraInputWithPositionAndType(Camera_Position.CAMERA_POSITION_BACK, Camera_Type.CAMERA_TYPE_DEFAULT, 0);
      console.log(TAG+"testOHCreateCameraInputWithPositionAndType0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCreateCameraInputWithPositionAndType0300
     * @tc.name       : testOHCreateCameraInputWithPositionAndType0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCreateCameraInputWithPositionAndType0300', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCreateCameraInputWithPositionAndType(Camera_Position.CAMERA_POSITION_FRONT, Camera_Type.CAMERA_TYPE_DEFAULT, 0);
      console.log(TAG+"testOHCreateCameraInputWithPositionAndType0300:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCreateCameraInputWithPositionAndType0400
     * @tc.name       : testOHCreateCameraInputWithPositionAndType0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCreateCameraInputWithPositionAndType0400', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCreateCameraInputWithPositionAndType(Camera_Position.CAMERA_POSITION_FRONT, Camera_Type.CAMERA_TYPE_WIDE_ANGLE, 0)
      console.log(TAG+"testOHCreateCameraInputWithPositionAndType0400:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCreateCameraInputWithPositionAndType0500
     * @tc.name       : testOHCreateCameraInputWithPositionAndType0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCreateCameraInputWithPositionAndType0500', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCreateCameraInputWithPositionAndType(Camera_Position.CAMERA_POSITION_FRONT, Camera_Type.CAMERA_TYPE_ULTRA_WIDE, 0)
      console.log(TAG+"testOHCreateCameraInputWithPositionAndType0500:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCreateCameraInputWithPositionAndType0600
     * @tc.name       : testOHCreateCameraInputWithPositionAndType0600
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCreateCameraInputWithPositionAndType0600', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCreateCameraInputWithPositionAndType(Camera_Position.CAMERA_POSITION_FRONT, Camera_Type.CAMERA_TYPE_TELEPHOTO, 0)
      console.log(TAG+"testOHCreateCameraInputWithPositionAndType0600:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCreateCameraInputWithPositionAndType0700
     * @tc.name       : testOHCreateCameraInputWithPositionAndType0700
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCreateCameraInputWithPositionAndType0700', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCreateCameraInputWithPositionAndType(Camera_Position.CAMERA_POSITION_FRONT, Camera_Type.CAMERA_TYPE_TRUE_DEPTH, 0)
      console.log(TAG+"testOHCreateCameraInputWithPositionAndType0700:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCreateCameraInputWithPositionAndType0800
     * @tc.name       : testOHCreateCameraInputWithPositionAndType0800
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCreateCameraInputWithPositionAndType0800', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCreateCameraInputWithPositionAndType(Camera_Position.CAMERA_POSITION_FRONT, Camera_Type.CAMERA_TYPE_TRUE_DEPTH, 4)
      console.log(TAG+"testOHCreateCameraInputWithPositionAndType0800:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCreateCameraInputWithPositionAndType0900
     * @tc.name       : testOHCreateCameraInputWithPositionAndType0900
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCreateCameraInputWithPositionAndType0900', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCreateCameraInputWithPositionAndType(Camera_Position.CAMERA_POSITION_FRONT, Camera_Type.CAMERA_TYPE_TRUE_DEPTH, 1)
      console.log(TAG+"testOHCreateCameraInputWithPositionAndType0900:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateCaptureSession0100
     * @tc.name       : testOHCameraManagerCreateCaptureSession0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateCaptureSession0100', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCameraManagerCreateCaptureSession(0)
      console.log(TAG+"testOHCameraManagerCreateCaptureSession0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateCaptureSession0200
     * @tc.name       : testOHCameraManagerCreateCaptureSession0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateCaptureSession0200', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCameraManagerCreateCaptureSession(1)
      console.log(TAG+"testOHCameraManagerCreateCaptureSession0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateCaptureSession0300
     * @tc.name       : testOHCameraManagerCreateCaptureSession0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateCaptureSession0300', 0, () => {
      getCameraManagerInstance(0);
      let ret = cameras.oHCameraManagerCreateCaptureSession(3)
      console.log(TAG+"testOHCameraManagerCreateCaptureSession0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerGetSupportedCameras0100
     * @tc.name       : testOHCameraManagerGetSupportedCameras0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameras0100', 0, () => {
      getCameraManagerInstance(0);
      let cameraInfo = cameras.oHCameraManagerGetSupportedCameras(0);
      if (isEmpty(cameraInfo)) {
        expect().assertFail();
      } else {
        expect(true).assertTrue();
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerGetSupportedCameras0200
     * @tc.name       : testOHCameraManagerGetSupportedCameras0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameras0200', 0, () => {
      getCameraManagerInstance(0);
      let cameraInfo = cameras.oHCameraManagerGetSupportedCameras(1);
      if (isEmpty(cameraInfo)) {
        expect(true).assertTrue();
      } else {
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerGetSupportedCameras0300
     * @tc.name       : testOHCameraManagerGetSupportedCameras0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameras0300', 0, () => {
      getCameraManagerInstance(0);
      let cameraInfo = cameras.oHCameraManagerGetSupportedCameras(2);
      if (isEmpty(cameraInfo)) {
        expect(true).assertTrue();
      } else {
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerGetSupportedCameras0400
     * @tc.name       : testOHCameraManagerGetSupportedCameras0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameras0400', 0, () => {
      getCameraManagerInstance(0);
      let cameraInfo = cameras.oHCameraManagerGetSupportedCameras(3);
      if (isEmpty(cameraInfo)) {
        expect(true).assertTrue();
      } else {
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerDeleteSupportedCameras0100
     * @tc.name       : testOHCameraManagerDeleteSupportedCameras0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerDeleteSupportedCameras0100', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      let ret = cameras.oHCameraManagerDeleteSupportedCameras(0);
      console.log(TAG+"testOHCameraManagerDeleteSupportedCameras0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerDeleteSupportedCameras0200
     * @tc.name       : testOHCameraManagerDeleteSupportedCameras0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerDeleteSupportedCameras0200', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      let ret = cameras.oHCameraManagerDeleteSupportedCameras(1);
      console.log(TAG+"testOHCameraManagerDeleteSupportedCameras0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerDeleteSupportedCameras0300
     * @tc.name       : testOHCameraManagerDeleteSupportedCameras0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerDeleteSupportedCameras0300', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      let ret = cameras.oHCameraManagerDeleteSupportedCameras(2);
      console.log(TAG+"testOHCameraManagerDeleteSupportedCameras0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerDeleteSupportedCameras0400
     * @tc.name       : testOHCameraManagerDeleteSupportedCameras0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerDeleteSupportedCameras0400', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      let ret = cameras.oHCameraManagerDeleteSupportedCameras(3);
      console.log(TAG+"testOHCameraManagerDeleteSupportedCameras0400:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateCameraInput0100
     * @tc.name       : testOHCameraManagerCreateCameraInput0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateCameraInput0100', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      let ret = cameras.oHCameraManagerCreateCameraInput(0);
      console.log(TAG+"testOHCameraManagerCreateCameraInput0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateCameraInput0200
     * @tc.name       : testOHCameraManagerCreateCameraInput0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateCameraInput0200', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      let ret = cameras.oHCameraManagerCreateCameraInput(1);
      console.log(TAG+"testOHCameraManagerCreateCameraInput0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateCameraInput0300
     * @tc.name       : testOHCameraManagerCreateCameraInput0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateCameraInput0300', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance();
      let ret = cameras.oHCameraManagerCreateCameraInput(2);
      console.log(TAG+"testOHCameraManagerCreateCameraInput0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreateCameraInput0400
     * @tc.name       : testOHCameraManagerCreateCameraInput0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreateCameraInput0400', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      let ret = cameras.oHCameraManagerCreateCameraInput(3);
      console.log(TAG+"testOHCameraManagerCreateCameraInput0400:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHGetSupportedCameraOutputCapability0100
     * @tc.name       : testOHGetSupportedCameraOutputCapability0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHGetSupportedCameraOutputCapability0100', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      let ret = cameras.oHGetSupportedCameraOutputCapability(0);
      console.log(TAG+"testOHGetSupportedCameraOutputCapability0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHGetSupportedCameraOutputCapability0200
     * @tc.name       : testOHGetSupportedCameraOutputCapability0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHGetSupportedCameraOutputCapability0200', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      let ret = cameras.oHGetSupportedCameraOutputCapability(1);
      console.log(TAG+"testOHGetSupportedCameraOutputCapability0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHGetSupportedCameraOutputCapability0300
     * @tc.name       : testOHGetSupportedCameraOutputCapability0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHGetSupportedCameraOutputCapability0300', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      let ret = cameras.oHGetSupportedCameraOutputCapability(2);
      console.log(TAG+"testOHGetSupportedCameraOutputCapability0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHGetSupportedCameraOutputCapability0400
     * @tc.name       : testOHGetSupportedCameraOutputCapability0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHGetSupportedCameraOutputCapability0400', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      let ret = cameras.oHGetSupportedCameraOutputCapability(3);
      console.log(TAG+"testOHGetSupportedCameraOutputCapability0400:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerDeleteSupportedCameraOutputCapability0100
     * @tc.name       : testOHCameraManagerDeleteSupportedCameraOutputCapability0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerDeleteSupportedCameraOutputCapability0100', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance()
      let ret = cameras.oHCameraManagerDeleteSupportedCameraOutputCapability(0);
      console.log(TAG+"testOHCameraManagerDeleteSupportedCameraOutputCapability0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerDeleteSupportedCameraOutputCapability0200
     * @tc.name       : testOHCameraManagerDeleteSupportedCameraOutputCapability0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerDeleteSupportedCameraOutputCapability0200', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance()
      let ret = cameras.oHCameraManagerDeleteSupportedCameraOutputCapability(1);
      console.log(TAG+"testOHCameraManagerDeleteSupportedCameraOutputCapability0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerDeleteSupportedCameraOutputCapability0300
     * @tc.name       : testOHCameraManagerDeleteSupportedCameraOutputCapability0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerDeleteSupportedCameraOutputCapability0300', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance()
      let ret = cameras.oHCameraManagerDeleteSupportedCameraOutputCapability(2);
      console.log(TAG+"testOHCameraManagerDeleteSupportedCameraOutputCapability0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePreviewOutput0100
     * @tc.name       : testOHCameraManagerCreatePreviewOutput0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePreviewOutput0100', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance()
      let ret = cameras.oHCameraManagerCreatePreviewOutput(0);
      console.log(TAG+"testOHCameraManagerCreatePreviewOutput0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePreviewOutput0200
     * @tc.name       : testOHCameraManagerCreatePreviewOutput0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePreviewOutput0200', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance();
      let ret = cameras.oHCameraManagerCreatePreviewOutput(1)
      console.log(TAG+"testOHCameraManagerCreatePreviewOutput0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePreviewOutput0300
     * @tc.name       : testOHCameraManagerCreatePreviewOutput0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePreviewOutput0300', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance();
      let ret = cameras.oHCameraManagerCreatePreviewOutput(2)
      console.log(TAG+"testOHCameraManagerCreatePreviewOutput0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePreviewOutput0400
     * @tc.name       : testOHCameraManagerCreatePreviewOutput0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePreviewOutput0400', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance()
      let ret = cameras.oHCameraManagerCreatePreviewOutput(3)
      console.log(TAG+"testOHCameraManagerCreatePreviewOutput0400:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePreviewOutput0500
     * @tc.name       : testOHCameraManagerCreatePreviewOutput0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePreviewOutput0500', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance();
      let ret =cameras.oHCameraManagerCreatePreviewOutput(4);
      console.log(TAG+"testOHCameraManagerCreatePreviewOutput0500:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputRegisterCallback0100
     * @tc.name       : testOHPreviewOutputRegisterCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputRegisterCallback0100', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance();
      createPreviewOutputInstance()
      let ret = cameras.oHPreviewOutputRegisterCallback(0)
      console.log(TAG+"testOHPreviewOutputRegisterCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputRegisterCallback0200
     * @tc.name       : testOHPreviewOutputRegisterCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputRegisterCallback0200', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance();
      createPreviewOutputInstance();
      let ret = cameras.oHPreviewOutputRegisterCallback(1)
      console.log(TAG+"testOHPreviewOutputRegisterCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputRegisterCallback0300
     * @tc.name       : testOHPreviewOutputRegisterCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputRegisterCallback0300', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance();
      createPreviewOutputInstance();
      let ret = cameras.oHPreviewOutputRegisterCallback(2);
      console.log(TAG+"testOHPreviewOutputRegisterCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnRegisterCallback0100
     * @tc.name       : testOHCameraManagerUnRegisterCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerUnRegisterCallback0100', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance();
      createPreviewOutputInstance();
      let ret = cameras.oHCameraManagerUnRegisterCallback(0)
      console.log(TAG+"testOHCameraManagerUnRegisterCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnRegisterCallback0200
     * @tc.name       : testOHCameraManagerUnRegisterCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerUnregisterCallback0200', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance();
      createPreviewOutputInstance()
      let ret = cameras.oHCameraManagerUnRegisterCallback(1);
      console.log(TAG+"testOHCameraManagerUnregisterCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnRegisterCallback0300
     * @tc.name       : testOHCameraManagerUnRegisterCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerUnregisterCallback0300', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance();
      createPreviewOutputInstance()
      let ret = cameras.oHCameraManagerUnRegisterCallback(2)
      console.log(TAG+"testOHCameraManagerUnregisterCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePhotoOutput0100
     * @tc.name       : testOHCameraManagerCreatePhotoOutput0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutput0100', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance();
      let ret = cameras.oHCameraManagerCreatePhotoOutput(mPhotoSurface, 0)
      console.log(TAG+"testOHCameraManagerCreatePhotoOutput0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePhotoOutput0200
     * @tc.name       : testOHCameraManagerCreatePhotoOutput0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutput0200', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance();
      let ret = cameras.oHCameraManagerCreatePhotoOutput(mPhotoSurface, 1)
      console.log(TAG+"testOHCameraManagerCreatePhotoOutput0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePhotoOutput0300
     * @tc.name       : testOHCameraManagerCreatePhotoOutput0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutput0300', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance();
      let ret = cameras.oHCameraManagerCreatePhotoOutput(mPhotoSurface, 2);
      console.log(TAG+"testOHCameraManagerCreatePhotoOutput0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePhotoOutput0400
     * @tc.name       : testOHCameraManagerCreatePhotoOutput0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutput0400', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance();
      let ret = cameras.oHCameraManagerCreatePhotoOutput(mPhotoSurface, 3);
      console.log(TAG+"testOHCameraManagerCreatePhotoOutput0400:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerCreatePhotoOutput0500
     * @tc.name       : testOHCameraManagerCreatePhotoOutput0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerCreatePhotoOutput0500', 0, () => {
      getCameraManagerInstance(0);
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapabilityInstance();
      let ret = cameras.oHCameraManagerCreatePhotoOutput(mPhotoSurface, 4)
      console.log(TAG+"testOHCameraManagerCreatePhotoOutput0500:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })

  })
}

