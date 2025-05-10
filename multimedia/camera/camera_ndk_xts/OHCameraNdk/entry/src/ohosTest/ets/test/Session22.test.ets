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
import { Camera_FlashMode, Camera_ExposureMode ,Camera_FocusMode,Camera_VideoStabilizationMode} from './Constants';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

const TAG = "CAMERA_LOGTAG_JS";
const CAMERA_OK = 0;
const CAMERA_ERROR_7400101 = 7400101; //参数错误
let receiver: image.ImageReceiver;
let mPhotoSurface: string;

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

function getCameraManagerInstance() {
  console.info(TAG + 'mSurfaceId : ' + mPhotoSurface);
  let ret = cameras.initCamera(mPhotoSurface, 0);
  console.info(TAG + 'initCamera : ' + ret);
  if (ret != 0) {
    console.info(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }
}

function createCaptureSession() {
  console.log(TAG + "创建捕获会话实例");
  let ret = cameras.oHCameraManagerCreateCaptureSession(0);

  if (ret != 0) {
    console.log(TAG + "createCaptureSession FAILED");
    expect().assertFail();
  }
  let registerCallback = cameras.oHCaptureSessionRegisterCallback(0);
  if (registerCallback != 0) {
    console.log(TAG + "SessionRegisterCallback FAILED");
    expect().assertFail();
  }
}

function createCameraInput() {
  console.log(TAG + "创建相机输入实例。");
  let ret = cameras.oHCameraManagerCreateCameraInput(0);
  cameras.oHCameraInputOpen(0);
  if (ret != 0) {
    console.log(TAG + "createCameraInput FAILED");
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
  let output = cameras.oHCameraManagerCreatePreviewOutput(0);
  if (output != 0) {
    console.info(TAG + "createPreviewOutputInstance FAILED");
    expect().assertFail();
  }
  let callback = cameras.oHPreviewOutputRegisterCallback(0)
  if (callback != 0) {
    console.info(TAG + "outputRegisterCallback FAILED");
    expect().assertFail();
  }
  let mPhotoOutput = cameras.oHCameraManagerCreatePhotoOutput(mPhotoSurface, 0);
  if (mPhotoOutput != 0) {
    console.info(TAG + "mPhotoOutput FAILED");
    expect().assertFail();
  }
}

function sessionBeginConfig() {
  let ret = cameras.oHCaptureSessionBeginConfig(0);
  if (ret != 0) {
    console.info(TAG + "sessionBeginConfig FAILED:" + ret);
    expect().assertFail();
  }
}


function startCameraSession() {
  createCaptureSession();
  sessionBeginConfig();

  createCameraInput();
  getSupportedCameraOutputCapabilityInstance()

  console.log(TAG + "添加相机输入");
  let ret = cameras.oHCaptureSessionAddInput(0);
  if (ret != 0) {
    console.log(TAG + "sessionAddInput FAILED" + ret);
    expect().assertFail();
  }

  let addPreviewOutput = cameras.oHCaptureSessionAddPreviewOutput(0);
  if (addPreviewOutput != 0) {
    console.info(TAG + "captureSessionAddPreviewOutput FAILED");
    expect().assertFail();
  }

  let addPhotoOutput = cameras.oHCaptureSessionAddPhotoOutput(0);
  if (addPhotoOutput != 0) {
    console.info(TAG + "captureSessionAddPhotoOutput FAILED:" + ret);
    expect().assertFail();
  }

  let commitConfig = cameras.oHCaptureSessionCommitConfig(0);
  if (commitConfig != 0) {
    console.info(TAG + "captureSessionCommitConfig FAILED");
    expect().assertFail();
  }
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.CAMERA" | "ohos.permission.READ_MEDIA" | "ohos.permission.WRITE_MEDIA"| "ohos.permission.MICROPHONE";
  let list: MyPermissions[] = ['ohos.permission.CAMERA', 'ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA', 'ohos.permission.MICROPHONE'];
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

function isEmpty(data: cameras.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

export default function SessionTest22() {
  describe('SessionTest2', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      await getPermissions();
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getSupportedCamerasInstance();

      startCameraSession()


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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionStart0100
     * @tc.name       : testOHCaptureSessionStart0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionStart0100', 0, () => {

      let ret = cameras.oHCaptureSessionStart(0);
      console.log(TAG+"testOHCaptureSessionStart0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionStart0200
     * @tc.name       : testOHCaptureSessionStart0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionStart0200', 0, () => {

      let ret = cameras.oHCaptureSessionStart(1);
      console.log(TAG+"testOHCaptureSessionStart0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionStop0100
     * @tc.name       : testOHCaptureSessionStop0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionStop0100', 0, () => {

      cameras.oHCaptureSessionStart(0);
      let ret = cameras.oHCaptureSessionStop(0);
      console.log(TAG+"testOHCaptureSessionStop0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionStop0200
     * @tc.name       : testOHCaptureSessionStop0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionStop0200', 0, () => {

      cameras.oHCaptureSessionStart(0);
      let ret = cameras.oHCaptureSessionStop(1);
      console.log(TAG+"testOHCaptureSessionStop0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRegisterCallback0100
     * @tc.name       : testOHCaptureSessionRegisterCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallback0100', 0, () => {

      let ret = cameras.oHCaptureSessionRegisterCallback(0);
      console.log(TAG+"testOHCaptureSessionRegisterCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRegisterCallback0200
     * @tc.name       : testOHCaptureSessionRegisterCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallback0200', 0, () => {

      let ret = cameras.oHCaptureSessionRegisterCallback(1);
      console.log(TAG+"testOHCaptureSessionRegisterCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRegisterCallback0300
     * @tc.name       : testOHCaptureSessionRegisterCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRegisterCallback0300', 0, () => {

      let ret = cameras.oHCaptureSessionRegisterCallback(2);
      console.log(TAG+"testOHCaptureSessionRegisterCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionUnregisterCallback0100
     * @tc.name       : testOHCaptureSessionUnregisterCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallback0100', 0, () => {

      let ret = cameras.oHCaptureSessionUnregisterCallback(0);
      console.log(TAG+"testOHCaptureSessionUnregisterCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionUnregisterCallback0200
     * @tc.name       : testOHCaptureSessionUnregisterCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallback0200', 0, () => {

      let ret = cameras.oHCaptureSessionUnregisterCallback(1);
      console.log(TAG+"testOHCaptureSessionUnregisterCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionUnregisterCallback0300
     * @tc.name       : testOHCaptureSessionUnregisterCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionUnregisterCallback0300', 0, () => {

      let ret = cameras.oHCaptureSessionUnregisterCallback(3);
      console.log(TAG+"testOHCaptureSessionUnregisterCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetExposureBias0100
     * @tc.name       : testOHCaptureSessionGetExposureBias0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetExposureBias0100', 0, () => {

      let ret = cameras.oHCaptureSessionGetExposureBias(0);
      console.log(TAG+"testOHCaptureSessionGetExposureBias0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);

    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetExposureBias0200
     * @tc.name       : testOHCaptureSessionGetExposureBias0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetExposureBias0200', 0, () => {

      let ret = cameras.oHCaptureSessionGetExposureBias(1);
      console.log(TAG+"testOHCaptureSessionGetExposureBias0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);

    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetExposureBias0300
     * @tc.name       : testOHCaptureSessionGetExposureBias0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetExposureBias0300', 0, () => {

      let ret = cameras.oHCaptureSessionGetExposureBias(2);
      console.log(TAG+"testOHCaptureSessionGetExposureBias0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetExposureBiasRange0100
     * @tc.name       : testOHCaptureSessionGetExposureBiasRange0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetExposureBiasRange0100', 0, () => {

      let ret = cameras.oHCaptureSessionGetExposureBiasRange(0);
      console.log(TAG+"testOHCaptureSessionGetExposureBiasRange0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetExposureBiasRange0200
     * @tc.name       : testOHCaptureSessionGetExposureBiasRange0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetExposureBiasRange0200', 0, () => {

      let ret = cameras.oHCaptureSessionGetExposureBiasRange(1);
      console.log(TAG+"testOHCaptureSessionGetExposureBiasRange0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetExposureBiasRange0300
     * @tc.name       : testOHCaptureSessionGetExposureBiasRange0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetExposureBiasRange0300', 0, () => {

      let ret = cameras.oHCaptureSessionGetExposureBiasRange(2);
      console.log(TAG+"testOHCaptureSessionGetExposureBiasRange0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetExposureBiasRange0400
     * @tc.name       : testOHCaptureSessionGetExposureBiasRange0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetExposureBiasRange0400', 0, () => {

      let ret = cameras.oHCaptureSessionGetExposureBiasRange(3);
      console.log(TAG+"testOHCaptureSessionGetExposureBiasRange0400:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetExposureBiasRange0500
     * @tc.name       : testOHCaptureSessionGetExposureBiasRange0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetExposureBiasRange0500', 0, () => {

      let ret = cameras.oHCaptureSessionGetExposureBiasRange(4);
      console.log(TAG+"testOHCaptureSessionGetExposureBiasRange0500:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetExposureMode0100
     * @tc.name       : testOHCaptureSessionGetExposureMode0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetExposureMode0100', 0, () => {

      let ret = cameras.oHCaptureSessionGetExposureMode(0);
      console.log(TAG+"testOHCaptureSessionGetExposureMode0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetExposureMode0200
     * @tc.name       : testOHCaptureSessionGetExposureMode0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetExposureMode0200', 0, () => {

      let ret = cameras.oHCaptureSessionGetExposureMode(1);
      console.log(TAG+"testOHCaptureSessionGetExposureMode0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetExposureMode0300
     * @tc.name       : testOHCaptureSessionGetExposureMode0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetExposureMode0300', 0, () => {

      let ret = cameras.oHCaptureSessionGetExposureMode(2);
      console.log(TAG+"testOHCaptureSessionGetExposureMode0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsExposureModeSupported0100
     * @tc.name       : testOHCaptureSessionIsExposureModeSupported0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsExposureModeSupported0100', 0, () => {

      let ret = cameras.oHCaptureSessionIsExposureModeSupported(Camera_ExposureMode.EXPOSURE_MODE_LOCKED, 0);
      console.log(TAG+"testOHCaptureSessionIsExposureModeSupported0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsExposureModeSupported0200
     * @tc.name       : testOHCaptureSessionIsExposureModeSupported0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsExposureModeSupported0200', 0, () => {

      let ret = cameras.oHCaptureSessionIsExposureModeSupported(Camera_ExposureMode.EXPOSURE_MODE_AUTO, 0);
      console.log(TAG+"testOHCaptureSessionIsExposureModeSupported0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsExposureModeSupported0300
     * @tc.name       : testOHCaptureSessionIsExposureModeSupported0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsExposureModeSupported0300', 0, () => {

      let ret = cameras.oHCaptureSessionIsExposureModeSupported(Camera_ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO, 0);
      console.log(TAG+"testOHCaptureSessionIsExposureModeSupported0300:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsExposureModeSupported0400
     * @tc.name       : testOHCaptureSessionIsExposureModeSupported0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsExposureModeSupported0400', 0, () => {

      let ret = cameras.oHCaptureSessionIsExposureModeSupported(Camera_ExposureMode.EXPOSURE_MODE_LOCKED, 1);
      console.log(TAG+"testOHCaptureSessionIsExposureModeSupported0400:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsExposureModeSupported0500
     * @tc.name       : testOHCaptureSessionIsExposureModeSupported0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsExposureModeSupported0500', 0, () => {

      let ret = cameras.oHCaptureSessionIsExposureModeSupported(Camera_ExposureMode.EXPOSURE_MODE_LOCKED, 2);
      console.log(TAG+"testOHCaptureSessionIsExposureModeSupported0500:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsExposureModeSupported0600
     * @tc.name       : testOHCaptureSessionIsExposureModeSupported0600
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsExposureModeSupported0600', 0, () => {

      let ret = cameras.oHCaptureSessionIsExposureModeSupported(Camera_ExposureMode.EXPOSURE_MODE_LOCKED, 3);
      console.log(TAG+"testOHCaptureSessionIsExposureModeSupported0600:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetExposureMode0100
     * @tc.name       : testOHCaptureSessionSetExposureMode0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetExposureMode0100', 0, () => {
      let ret = cameras.oHCaptureSessionSetExposureMode(Camera_ExposureMode.EXPOSURE_MODE_LOCKED, 0);
      console.log(TAG+"testOHCaptureSessionSetExposureMode0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetExposureMode0200
     * @tc.name       : testOHCaptureSessionSetExposureMode0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetExposureMode0200', 0, () => {
      let ret = cameras.oHCaptureSessionSetExposureMode(Camera_ExposureMode.EXPOSURE_MODE_AUTO, 0);
      console.log(TAG+"testOHCaptureSessionSetExposureMode0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetExposureMode0300
     * @tc.name       : testOHCaptureSessionSetExposureMode0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetExposureMode0300', 0, () => {
    let isSupported = cameras.oHCaptureSessionIsExposureModeSupportedForCheck(Camera_ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO, 0)
    console.log(TAG+"oHCaptureSessionIsExposureModeSupportedForCheck: " + isSupported);
      if (isSupported == undefined ) {
        console.log(TAG+"current device does not support ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO");
        expect(true).assertTrue();
      } else if (isSupported) {
        let ret = cameras.oHCaptureSessionSetExposureMode(Camera_ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO, 0);
        console.log(TAG+"testOHCaptureSessionSetExposureMode0300:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } 
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetExposureMode0400
     * @tc.name       : testOHCaptureSessionSetExposureMode0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetExposureMode0400', 0, () => {
      let ret = cameras.oHCaptureSessionSetExposureMode(Camera_ExposureMode.EXPOSURE_MODE_LOCKED, 1);
      console.log(TAG+"testOHCaptureSessionSetExposureMode0400:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetExposureMode0500
     * @tc.name       : testOHCaptureSessionSetExposureMode0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetExposureMode0500', 0, () => {
      let ret = cameras.oHCaptureSessionSetExposureMode(Camera_ExposureMode.EXPOSURE_MODE_LOCKED, 2);
      console.log(TAG+"testOHCaptureSessionSetExposureMode0500:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionHasFlash0100
     * @tc.name       : testOHCaptureSessionHasFlash0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionHasFlash0100', 0, () => {
      let ret = cameras.oHCaptureSessionHasFlash(0);
      console.log(TAG+"testOHCaptureSessionHasFlash0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionHasFlash0200
     * @tc.name       : testOHCaptureSessionHasFlash0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionHasFlash0200', 0, () => {
      let ret = cameras.oHCaptureSessionHasFlash(1);
      console.log(TAG+"testOHCaptureSessionHasFlash0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionHasFlash0300
     * @tc.name       : testOHCaptureSessionHasFlash0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionHasFlash0300', 0, () => {
      let ret = cameras.oHCaptureSessionHasFlash(2);
      console.log(TAG+"testOHCaptureSessionHasFlash0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsFlashModeSupported0100
     * @tc.name       : testOHCaptureSessionIsFlashModeSupported0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsFlashModeSupported0100', 0, () => {
      let ret = cameras.oHCaptureSessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_CLOSE, 0);
      console.log(TAG+"testOHCaptureSessionIsFlashModeSupported0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsFlashModeSupported0200
     * @tc.name       : testOHCaptureSessionIsFlashModeSupported0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsFlashModeSupported0200', 0, () => {
      let ret = cameras.oHCaptureSessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_OPEN, 0);
      console.log(TAG+"testOHCaptureSessionIsFlashModeSupported0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsFlashModeSupported0300
     * @tc.name       : testOHCaptureSessionIsFlashModeSupported0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsFlashModeSupported0300', 0, () => {
      let ret = cameras.oHCaptureSessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_AUTO, 0);
      console.log(TAG+"testOHCaptureSessionIsFlashModeSupported0300:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsFlashModeSupported0400
     * @tc.name       : testOHCaptureSessionIsFlashModeSupported0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsFlashModeSupported0400', 0, () => {
      let ret = cameras.oHCaptureSessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN, 0);
      console.log(TAG+"testOHCaptureSessionIsFlashModeSupported0400:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsFlashModeSupported0500
     * @tc.name       : testOHCaptureSessionIsFlashModeSupported0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsFlashModeSupported0500', 0, () => {
      let ret = cameras.oHCaptureSessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN, 1);
      console.log(TAG+"testOHCaptureSessionIsFlashModeSupported0500:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsFlashModeSupported0600
     * @tc.name       : testOHCaptureSessionIsFlashModeSupported0600
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsFlashModeSupported0600', 0, () => {
      let ret = cameras.oHCaptureSessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN, 2);
      console.log(TAG+"testOHCaptureSessionIsFlashModeSupported0600:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsFlashModeSupported0700
     * @tc.name       : testOHCaptureSessionIsFlashModeSupported0700
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsFlashModeSupported0700', 0, () => {
      let ret = cameras.oHCaptureSessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN, 3);
      console.log(TAG+"testOHCaptureSessionIsFlashModeSupported0700:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetFlashMode0100
     * @tc.name       : testOHCaptureSessionSetFlashMode0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetFlashMode0100', 0, () => {
      let isSupported = cameras.oHCaptureSessionIsFlashModeSupportedForCheck(Camera_FlashMode.FLASH_MODE_CLOSE, 0)
      console.log(TAG+"oHCaptureSessionIsFlashModeSupportedForCheck: " + isSupported);
      if (isSupported == undefined ) {
        console.log(TAG+"current device does not support FlashMode.FLASH_MODE_CLOSE");
        expect(true).assertTrue();
      } else if (isSupported) {
        let ret = cameras.oHCaptureSessionSetFlashMode(Camera_FlashMode.FLASH_MODE_CLOSE, 0);
        console.log(TAG+"testOHCaptureSessionSetFlashMode0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } 
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetFlashMode0200
     * @tc.name       : testOHCaptureSessionSetFlashMode0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetFlashMode0200', 0, () => {
      let isSupported = cameras.oHCaptureSessionIsFlashModeSupportedForCheck(Camera_FlashMode.FLASH_MODE_OPEN, 0)
      console.log(TAG+"oHCaptureSessionIsFlashModeSupportedForCheck: " + isSupported);
      if (isSupported == undefined ) {
        console.log(TAG+"current device does not support FlashMode.FLASH_MODE_OPEN");
        expect(true).assertTrue();
      } else if (isSupported) {
        let ret = cameras.oHCaptureSessionSetFlashMode(Camera_FlashMode.FLASH_MODE_OPEN, 0);
        console.log(TAG+"testOHCaptureSessionSetFlashMode0200:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } 
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetFlashMode0300
     * @tc.name       : testOHCaptureSessionSetFlashMode0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetFlashMode0300', 0, () => {
      let isSupported = cameras.oHCaptureSessionIsFlashModeSupportedForCheck(Camera_FlashMode.FLASH_MODE_AUTO, 0)
      console.log(TAG+"oHCaptureSessionIsFlashModeSupportedForCheck: " + isSupported);
      if (isSupported == undefined ) {
        console.log(TAG+"current device does not support FlashMode.FLASH_MODE_AUTO");
        expect(true).assertTrue();
      } else if (isSupported) {
        let ret = cameras.oHCaptureSessionSetFlashMode(Camera_FlashMode.FLASH_MODE_AUTO, 0);
        console.log(TAG+"testOHCaptureSessionSetFlashMode0300:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } 
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetFlashMode0400
     * @tc.name       : testOHCaptureSessionSetFlashMode0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetFlashMode0400', 0, () => {
      let isSupported = cameras.oHCaptureSessionIsFlashModeSupportedForCheck(Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN, 0)
      console.log(TAG+"oHCaptureSessionIsFlashModeSupportedForCheck: " + isSupported);
      if (isSupported == undefined ) {
        console.log(TAG+"current device does not support FlashMode.FLASH_MODE_ALWAYS_OPEN");
        expect(true).assertTrue();
      } else if (isSupported) {
        let ret = cameras.oHCaptureSessionSetFlashMode(Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN, 0);
        console.log(TAG+"testOHCaptureSessionSetFlashMode0400:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } 
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetFlashMode0500
     * @tc.name       : testOHCaptureSessionSetFlashMode0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetFlashMode0500', 0, () => {
      let isSupported = cameras.oHCaptureSessionIsFlashModeSupportedForCheck(Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN, 0)
      console.log(TAG+"oHCaptureSessionIsFlashModeSupportedForCheck: " + isSupported);
      if (isSupported == undefined ) {
        console.log(TAG+"current device does not support FlashMode.FLASH_MODE_ALWAYS_OPEN");
        expect(true).assertTrue();
      } else if (isSupported) {
        let ret = cameras.oHCaptureSessionSetFlashMode(Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN, 1);
        console.log(TAG+"testOHCaptureSessionSetFlashMode0500:"+ret);
        expect(ret).assertEqual(CAMERA_ERROR_7400101);
      } 
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetFlashMode0600
     * @tc.name       : testOHCaptureSessionSetFlashMode0600
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetFlashMode0600', 0, () => {
      let isSupported = cameras.oHCaptureSessionIsFlashModeSupportedForCheck(Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN, 0)
      console.log(TAG+"oHCaptureSessionIsFlashModeSupportedForCheck: " + isSupported);
      if (isSupported == undefined ) {
        console.log(TAG+"current device does not support FlashMode.FLASH_MODE_ALWAYS_OPEN");
        expect(true).assertTrue();
      } else if (isSupported) {
        let ret = cameras.oHCaptureSessionSetFlashMode(Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN, 2);
        console.log(TAG+"testOHCaptureSessionSetFlashMode0600:"+ret);
        expect(ret).assertEqual(CAMERA_ERROR_7400101);
      } 
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetFlashMode0100
     * @tc.name       : testOHCaptureSessionGetFlashMode0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetFlashMode0100', 0, () => {
      let ret = cameras.oHCaptureSessionGetFlashMode(0);
      console.log(TAG+"testOHCaptureSessionGetFlashMode0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetFlashMode0200
     * @tc.name       : testOHCaptureSessionGetFlashMode0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetFlashMode0200', 0, () => {
      let ret = cameras.oHCaptureSessionGetFlashMode(1);
      console.log(TAG+"testOHCaptureSessionGetFlashMode0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetFlashMode0300
     * @tc.name       : testOHCaptureSessionGetFlashMode0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetFlashMode0300', 0, () => {
      let ret = cameras.oHCaptureSessionGetFlashMode(2);
      console.log(TAG+"testOHCaptureSessionGetFlashMode0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsFocusModeSupported0100
     * @tc.name       : testOHCaptureSessionIsFocusModeSupported0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsFocusModeSupported0100', 0, () => {
      let ret = cameras.oHCaptureSessionIsFocusModeSupported(Camera_FocusMode.FOCUS_MODE_MANUAL, 0);
      console.log(TAG+"testOHCaptureSessionIsFocusModeSupported0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsFocusModeSupported0200
     * @tc.name       : testOHCaptureSessionIsFocusModeSupported0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsFocusModeSupported0200', 0, () => {
      let ret = cameras.oHCaptureSessionIsFocusModeSupported(Camera_FocusMode.FOCUS_MODE_CONTINUOUS_AUTO, 0);
      console.log(TAG+"testOHCaptureSessionIsFocusModeSupported0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsFocusModeSupported0300
     * @tc.name       : testOHCaptureSessionIsFocusModeSupported0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsFocusModeSupported0300', 0, () => {
      let ret = cameras.oHCaptureSessionIsFocusModeSupported(Camera_FocusMode.FOCUS_MODE_AUTO, 0);
      console.log(TAG+"testOHCaptureSessionIsFocusModeSupported0300:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsFocusModeSupported0400
     * @tc.name       : testOHCaptureSessionIsFocusModeSupported0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsFocusModeSupported0400', 0, () => {
      let ret = cameras.oHCaptureSessionIsFocusModeSupported(Camera_FocusMode.FOCUS_MODE_LOCKED, 0);
      console.log(TAG+"testOHCaptureSessionIsFocusModeSupported0400:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsFocusModeSupported0500
     * @tc.name       : testOHCaptureSessionIsFocusModeSupported0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsFocusModeSupported0500', 0, () => {
      let ret = cameras.oHCaptureSessionIsFocusModeSupported(Camera_FocusMode.FOCUS_MODE_MANUAL, 1);
      console.log(TAG+"testOHCaptureSessionIsFocusModeSupported0500:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsFocusModeSupported0600
     * @tc.name       : testOHCaptureSessionIsFocusModeSupported0600
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsFocusModeSupported0600', 0, () => {
      let ret = cameras.oHCaptureSessionIsFocusModeSupported(Camera_FocusMode.FOCUS_MODE_MANUAL, 2);
      console.log(TAG+"testOHCaptureSessionIsFocusModeSupported0600:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsFocusModeSupported0700
     * @tc.name       : testOHCaptureSessionIsFocusModeSupported0700
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsFocusModeSupported0700', 0, () => {
      let ret = cameras.oHCaptureSessionIsFocusModeSupported(Camera_FocusMode.FOCUS_MODE_MANUAL, 3);
      console.log(TAG+"testOHCaptureSessionIsFocusModeSupported0700:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetFocusMode0100
     * @tc.name       : testOHCaptureSessionGetFocusMode0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetFocusMode0100', 0, () => {

      let ret = cameras.oHCaptureSessionGetFocusMode(0);
      console.log(TAG+"testOHCaptureSessionGetFocusMode0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetFocusMode0200
     * @tc.name       : testOHCaptureSessionGetFocusMode0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetFocusMode0200', 0, () => {

      let ret = cameras.oHCaptureSessionGetFocusMode(1);
      console.log(TAG+"testOHCaptureSessionGetFocusMode0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetFocusMode0300
     * @tc.name       : testOHCaptureSessionGetFocusMode0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetFocusMode0300', 0, () => {

      let ret = cameras.oHCaptureSessionGetFocusMode(2);
      console.log(TAG+"testOHCaptureSessionGetFocusMode0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetFocusPoint0100
     * @tc.name       : testOHCaptureSessionGetFocusPoint0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetFocusPoint0100', 0, () => {

      let ret = cameras.oHCaptureSessionGetFocusPoint(0);
      console.log(TAG+"testOHCaptureSessionGetFocusPoint0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetFocusPoint0200
     * @tc.name       : testOHCaptureSessionGetFocusPoint0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetFocusPoint0200', 0, () => {

      let ret = cameras.oHCaptureSessionGetFocusPoint(1);
      console.log(TAG+"testOHCaptureSessionGetFocusPoint0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetFocusPoint0300
     * @tc.name       : testOHCaptureSessionGetFocusPoint0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetFocusPoint0300', 0, () => {

      let ret = cameras.oHCaptureSessionGetFocusPoint(2);
      console.log(TAG+"testOHCaptureSessionGetFocusPoint0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetFocusPoint0100
     * @tc.name       : testOHCaptureSessionSetFocusPoint0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetFocusPoint0100', 0, () => {

      let ret = cameras.oHCaptureSessionSetFocusPoint({x:1,y:1},0);
      console.log(TAG+"testOHCaptureSessionSetFocusPoint0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetFocusPoint0200
     * @tc.name       : testOHCaptureSessionSetFocusPoint0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetFocusPoint0200', 0, () => {

      let ret = cameras.oHCaptureSessionSetFocusPoint({x:1,y:1},1);
      console.log(TAG+"testOHCaptureSessionSetFocusPoint0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetFocusPoint0300
     * @tc.name       : testOHCaptureSessionSetFocusPoint0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetFocusPoint0300', 0, () => {

      let ret = cameras.oHCaptureSessionSetFocusPoint({x:null,y:-1},2);
      console.log(TAG+"testOHCaptureSessionSetFocusPoint0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetMeteringPoint0100
     * @tc.name       : testOHCaptureSessionGetMeteringPoint0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetMeteringPoint0100', 0, () => {

      let ret = cameras.oHCaptureSessionGetMeteringPoint(0);
      console.log(TAG+"testOHCaptureSessionGetMeteringPoint0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetMeteringPoint0200
     * @tc.name       : testOHCaptureSessionGetMeteringPoint0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetMeteringPoint0200', 0, () => {

      let ret = cameras.oHCaptureSessionGetMeteringPoint(1);
      console.log(TAG+"testOHCaptureSessionGetMeteringPoint0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetMeteringPoint0300
     * @tc.name       : testOHCaptureSessionGetMeteringPoint0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetMeteringPoint0300', 0, () => {

      let ret = cameras.oHCaptureSessionGetMeteringPoint(2);
      console.log(TAG+"testOHCaptureSessionGetMeteringPoint0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetZoomRatio0100
     * @tc.name       : testOHCaptureSessionGetZoomRatio0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetZoomRatio0100', 0, () => {

      let ret = cameras.oHCaptureSessionGetZoomRatio(0);
      console.log(TAG+"testOHCaptureSessionGetZoomRatio0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetZoomRatio0200
     * @tc.name       : testOHCaptureSessionGetZoomRatio0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetZoomRatio0200', 0, () => {

      let ret = cameras.oHCaptureSessionGetZoomRatio(1);
      console.log(TAG+"testOHCaptureSessionGetZoomRatio0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetZoomRatio0300
     * @tc.name       : testOHCaptureSessionGetZoomRatio0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetZoomRatio0300', 0, () => {

      let ret = cameras.oHCaptureSessionGetZoomRatio(2);
      console.log(TAG+"testOHCaptureSessionGetZoomRatio0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetZoomRatioRange0100
     * @tc.name       : testOHCaptureSessionGetZoomRatioRange0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetZoomRatioRange0100', 0, () => {

      let ret = cameras.oHCaptureSessionGetZoomRatioRange(0);
      console.log(TAG+"testOHCaptureSessionGetZoomRatioRange0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetZoomRatioRange0200
     * @tc.name       : testOHCaptureSessionGetZoomRatioRange0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetZoomRatioRange0200', 0, () => {

      let ret = cameras.oHCaptureSessionGetZoomRatioRange(1);
      console.log(TAG+"testOHCaptureSessionGetZoomRatioRange0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetZoomRatioRange0300
     * @tc.name       : testOHCaptureSessionGetZoomRatioRange0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetZoomRatioRange0300', 0, () => {

      let ret = cameras.oHCaptureSessionGetZoomRatioRange(2);
      console.log(TAG+"testOHCaptureSessionGetZoomRatioRange0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetZoomRatioRange0400
     * @tc.name       : testOHCaptureSessionGetZoomRatioRange0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetZoomRatioRange0400', 0, () => {

      let ret = cameras.oHCaptureSessionGetZoomRatioRange(3);
      console.log(TAG+"testOHCaptureSessionGetZoomRatioRange0400:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetZoomRatio0100
     * @tc.name       : testOHCaptureSessionSetZoomRatio0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetZoomRatio0100', 0, () => {

      let ret = cameras.oHCaptureSessionSetZoomRatio(0,0);
      console.log(TAG+"testOHCaptureSessionSetZoomRatio0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetZoomRatio0200
     * @tc.name       : testOHCaptureSessionSetZoomRatio0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetZoomRatio0200', 0, () => {

      let ret = cameras.oHCaptureSessionSetZoomRatio(0,1);
      console.log(TAG+"testOHCaptureSessionSetZoomRatio0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetZoomRatio0300
     * @tc.name       : testOHCaptureSessionSetZoomRatio0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetZoomRatio0300', 0, () => {

      let ret = cameras.oHCaptureSessionSetZoomRatio(1000,2);
      console.log(TAG+"testOHCaptureSessionSetZoomRatio0300:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetMeteringPoint0100
     * @tc.name       : testOHCaptureSessionSetMeteringPoint0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetMeteringPoint0100', 0, () => {

      let ret = cameras.oHCaptureSessionSetMeteringPoint({x:1,y:1},0);
      console.log(TAG+"testOHCaptureSessionSetMeteringPoint0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetMeteringPoint0200
     * @tc.name       : testOHCaptureSessionSetMeteringPoint0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetMeteringPoint0200', 0, () => {

      let ret = cameras.oHCaptureSessionSetMeteringPoint({x:1,y:1},1);
      console.log(TAG+"testOHCaptureSessionSetMeteringPoint0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetMeteringPoint0300
     * @tc.name       : testOHCaptureSessionSetMeteringPoint0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetMeteringPoint0300', 0, () => {

      let ret = cameras.oHCaptureSessionSetMeteringPoint({x:1,y:-1001},2);
      console.log(TAG+"testOHCaptureSessionSetMeteringPoint0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsVideoStabilizationModeSupported0100
     * @tc.name       : testOHCaptureSessionIsVideoStabilizationModeSupported0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsVideoStabilizationModeSupported0100', 0, () => {
      let ret = cameras.oHCaptureSessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_OFF, 0);
      console.log(TAG+"testOHCaptureSessionIsVideoStabilizationModeSupported0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsVideoStabilizationModeSupported0200
     * @tc.name       : testOHCaptureSessionIsVideoStabilizationModeSupported0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsVideoStabilizationModeSupported0200', 0, () => {
      let ret = cameras.oHCaptureSessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_LOW, 0);
      console.log(TAG+"testOHCaptureSessionIsVideoStabilizationModeSupported0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsVideoStabilizationModeSupported0300
     * @tc.name       : testOHCaptureSessionIsVideoStabilizationModeSupported0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsVideoStabilizationModeSupported0300', 0, () => {
      let ret = cameras.oHCaptureSessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_MIDDLE, 0);
      console.log(TAG+"testOHCaptureSessionIsVideoStabilizationModeSupported0300:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsVideoStabilizationModeSupported0400
     * @tc.name       : testOHCaptureSessionIsVideoStabilizationModeSupported0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsVideoStabilizationModeSupported0400', 0, () => {
      let ret = cameras.oHCaptureSessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_HIGH, 0);
      console.log(TAG+"testOHCaptureSessionIsVideoStabilizationModeSupported0400:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsVideoStabilizationModeSupported0500
     * @tc.name       : testOHCaptureSessionIsVideoStabilizationModeSupported0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsVideoStabilizationModeSupported0500', 0, () => {
      let ret = cameras.oHCaptureSessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_AUTO, 0);
      console.log(TAG+"testOHCaptureSessionIsVideoStabilizationModeSupported0500:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsVideoStabilizationModeSupported0600
     * @tc.name       : testOHCaptureSessionIsVideoStabilizationModeSupported0600
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsVideoStabilizationModeSupported0600', 0, () => {
      let ret = cameras.oHCaptureSessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_OFF, 1);
      console.log(TAG+"testOHCaptureSessionIsVideoStabilizationModeSupported0600:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsVideoStabilizationModeSupported0700
     * @tc.name       : testOHCaptureSessionIsVideoStabilizationModeSupported0700
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsVideoStabilizationModeSupported0700', 0, () => {
      let ret = cameras.oHCaptureSessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_OFF, 2);
      console.log(TAG+"testOHCaptureSessionIsVideoStabilizationModeSupported0700:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionIsVideoStabilizationModeSupported0800
     * @tc.name       : testOHCaptureSessionIsVideoStabilizationModeSupported0800
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionIsVideoStabilizationModeSupported0800', 0, () => {
      let ret = cameras.oHCaptureSessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_OFF, 3);
      console.log(TAG+"testOHCaptureSessionIsVideoStabilizationModeSupported0800:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetVideoStabilizationMode0100
     * @tc.name       : testOHCaptureSessionGetVideoStabilizationMode0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetVideoStabilizationMode0100', 0, () => {

      let ret = cameras.oHCaptureSessionGetVideoStabilizationMode(0);
      console.log(TAG+"testOHCaptureSessionGetVideoStabilizationMode0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetVideoStabilizationMode0200
     * @tc.name       : testOHCaptureSessionGetVideoStabilizationMode0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetVideoStabilizationMode0200', 0, () => {

      let ret = cameras.oHCaptureSessionGetVideoStabilizationMode(1);
      console.log(TAG+"testOHCaptureSessionGetVideoStabilizationMode0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionGetVideoStabilizationMode0300
     * @tc.name       : testOHCaptureSessionGetVideoStabilizationMode0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionGetVideoStabilizationMode0300', 0, () => {

      let ret = cameras.oHCaptureSessionGetVideoStabilizationMode(2);
      console.log(TAG+"testOHCaptureSessionGetVideoStabilizationMode0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetVideoStabilizationMode0100
     * @tc.name       : testOHCaptureSessionSetVideoStabilizationMode0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetVideoStabilizationMode0100', 0, () => {
      let isSupported = cameras.oHCaptureSessionIsVideoStabilizationModeSupportedForCheck(Camera_VideoStabilizationMode.STABILIZATION_MODE_OFF, 0)
      console.log(TAG+"oHCaptureSessionIsVideoStabilizationModeSupportedForCheck: " + isSupported);
      if (isSupported == undefined ) {
        console.log(TAG+"current device does not support VideoStabilizationMode.STABILIZATION_MODE_OFF");
        expect(true).assertTrue();
      } else if (isSupported) {
        let ret = cameras.oHCaptureSessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_OFF, 0);
        console.log(TAG+"testOHCaptureSessionSetVideoStabilizationMode0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } 
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetVideoStabilizationMode0200
     * @tc.name       : testOHCaptureSessionSetVideoStabilizationMode0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetVideoStabilizationMode0200', 0, () => {
      let isSupported = cameras.oHCaptureSessionIsVideoStabilizationModeSupportedForCheck(Camera_VideoStabilizationMode.STABILIZATION_MODE_LOW, 0)
      console.log(TAG+"oHCaptureSessionIsVideoStabilizationModeSupportedForCheck: " + isSupported);
      if (isSupported == undefined ) {
        console.log(TAG+"current device does not support VideoStabilizationMode.STABILIZATION_MODE_LOW");
        expect(true).assertTrue();
      } else if (isSupported) {
        let ret = cameras.oHCaptureSessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_LOW, 0);
        console.log(TAG+"testOHCaptureSessionSetVideoStabilizationMode0200:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } 
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetVideoStabilizationMode0300
     * @tc.name       : testOHCaptureSessionSetVideoStabilizationMode0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetVideoStabilizationMode0300', 0, () => {
      let isSupported = cameras.oHCaptureSessionIsVideoStabilizationModeSupportedForCheck(Camera_VideoStabilizationMode.STABILIZATION_MODE_MIDDLE, 0)
      console.log(TAG+"oHCaptureSessionIsVideoStabilizationModeSupportedForCheck: " + isSupported);
      if (isSupported == undefined ) {
        console.log(TAG+"current device does not support VideoStabilizationMode.STABILIZATION_MODE_MIDDLE");
        expect(true).assertTrue();
      } else if (isSupported) {
        let ret = cameras.oHCaptureSessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_MIDDLE, 0);
        console.log(TAG+"testOHCaptureSessionSetVideoStabilizationMode0300:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } 
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetVideoStabilizationMode0400
     * @tc.name       : testOHCaptureSessionSetVideoStabilizationMode0400
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetVideoStabilizationMode0400', 0, () => {
      let isSupported = cameras.oHCaptureSessionIsVideoStabilizationModeSupportedForCheck(Camera_VideoStabilizationMode.STABILIZATION_MODE_HIGH, 0)
      console.log(TAG+"oHCaptureSessionIsVideoStabilizationModeSupportedForCheck: " + isSupported);
      if (isSupported == undefined ) {
        console.log(TAG+"current device does not support VideoStabilizationMode.STABILIZATION_MODE_HIGH");
        expect(true).assertTrue();
      } else if (isSupported) {
        let ret = cameras.oHCaptureSessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_HIGH, 0);
        console.log(TAG+"testOHCaptureSessionSetVideoStabilizationMode0400:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } 
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetVideoStabilizationMode0500
     * @tc.name       : testOHCaptureSessionSetVideoStabilizationMode0500
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetVideoStabilizationMode0500', 0, () => {
      let isSupported = cameras.oHCaptureSessionIsVideoStabilizationModeSupportedForCheck(Camera_VideoStabilizationMode.STABILIZATION_MODE_AUTO, 0)
      console.log(TAG+"oHCaptureSessionIsVideoStabilizationModeSupportedForCheck: " + isSupported);
      if (isSupported == undefined ) {
        console.log(TAG+"current device does not support VideoStabilizationMode.STABILIZATION_MODE_AUTO");
        expect(true).assertTrue();
      } else if (isSupported) {
        let ret = cameras.oHCaptureSessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_AUTO, 0);
        console.log(TAG+"testOHCaptureSessionSetVideoStabilizationMode0500:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } 
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetVideoStabilizationMode0600
     * @tc.name       : testOHCaptureSessionSetVideoStabilizationMode0600
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetVideoStabilizationMode0600', 0, () => {
      let ret = cameras.oHCaptureSessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_OFF, 1);
      console.log(TAG+"testOHCaptureSessionSetVideoStabilizationMode0600:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionSetVideoStabilizationMode0700
     * @tc.name       : testOHCaptureSessionSetVideoStabilizationMode0700
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionSetVideoStabilizationMode0700', 0, () => {
      let ret = cameras.oHCaptureSessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_OFF, 2);
      console.log(TAG+"testOHCaptureSessionSetVideoStabilizationMode0700:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRelease0100
     * @tc.name       : testOHCaptureSessionRelease0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRelease0100', 0, () => {

      let ret = cameras.oHCaptureSessionRelease(0);
      console.log(TAG+"testOHCaptureSessionRelease0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRelease0200
     * @tc.name       : testOHCaptureSessionRelease0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRelease0200', 0, () => {

      let ret = cameras.oHCaptureSessionRelease(1);
      console.log(TAG+"testOHCaptureSessionRelease0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
  })
}