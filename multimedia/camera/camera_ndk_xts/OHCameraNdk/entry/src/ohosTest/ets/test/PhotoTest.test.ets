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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import cameras from 'libentry.so'
import image from '@ohos.multimedia.image';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

const TAG = "CAMERA_LOGTAG_JS";
const CAMERA_OK = 0;
const CAMERA_ERROR_7400101 = 7400101; //参数错误
let receiver: image.ImageReceiver;
let mPhotoSurface: string;
interface PhotoSettings {
  quality: number, // 照片质量
  rotation: number, // 照片方向
  mirror: boolean, // 是否镜像
  latitude: number, // 纬度坐标
  longitude: number, // 经度坐标
  altitude: number // 高度坐标
};


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

function getSupportedCamerasInstance() {
  let cameraInfo = cameras.oHCameraManagerGetSupportedCameras(0);
  if (isEmpty(cameraInfo)) {
    console.info(TAG + "getSupportedCamerasInstance FAILED");
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

function sessionBeginConfig() {
  let ret = cameras.oHCaptureSessionBeginConfig(0);
  if (ret != 0) {
    console.info(TAG + "sessionBeginConfig FAILED:" + ret);
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

async function stopCameraSession() {
  console.info(TAG + "Enter stopCameraSession");

  let ret = cameras.oHCaptureSessionRelease(0);
  if (ret != 0) {
    console.info(TAG + "sessionStop FAILED");
    expect().assertFail();
  }
  await releaseInput();
  await releaseOutput();

  console.info(TAG + "Exit stopCameraSession");

  return true;
}

async function releaseInput() {
  console.info('Enter releaseInput');
  await cameras.oHCameraInputClose(0);
  console.info('Exit releaseInput');
  return true;
}

async function releaseOutput() {
  console.info('Enter releaseOutput');
  await cameras.oHPreviewOutputRelease(0);
  await cameras.oHPhotoOutputRelease(0);

  console.info('Exit releaseOutput');
  return true;
}

function isEmpty(data: cameras.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
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

export default function PhotoTest() {
  describe('PhotoTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      await getPermissions();
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      
    })
    beforeEach(async () => {
      startCameraSession();
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await stopCameraSession();
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputStart0100
     * @tc.name       : testOHPreviewOutputStart0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputStart0100', Level.LEVEL0, () => {

      let ret = cameras.oHPreviewOutputStart(0);
      console.log(TAG+"testOHPreviewOutputStart0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputStart0200
     * @tc.name       : testOHPreviewOutputStart0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputStart0200', Level.LEVEL0, () => {

      let ret = cameras.oHPreviewOutputStart(1);
      console.log(TAG+"testOHPreviewOutputStart0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputStop0100
     * @tc.name       : testOHPreviewOutputStop0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputStop0100', Level.LEVEL0, () => {

      cameras.oHPreviewOutputStart(0);
      let ret = cameras.oHPreviewOutputStop(0);
      console.log(TAG+"testOHPreviewOutputStop0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputStop0200
     * @tc.name       : testOHPreviewOutputStop0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputStop0200', Level.LEVEL0, () => {

      let ret = cameras.oHPreviewOutputStop(1);
      console.log(TAG+"testOHPreviewOutputStop0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterCallback0100
     * @tc.name       : testOHPhotoOutputRegisterCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterCallback0100', Level.LEVEL0, () => {
      let ret = cameras.oHPhotoOutputRegisterCallback(0);
      console.log(TAG+"testOHPhotoOutputRegisterCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterCallback0200
     * @tc.name       : testOHPhotoOutputRegisterCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterCallback0200', Level.LEVEL0, () => {

      let ret = cameras.oHPhotoOutputRegisterCallback(1);
      console.log(TAG+"testOHPhotoOutputRegisterCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRegisterCallback0300
     * @tc.name       : testOHPhotoOutputRegisterCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputRegisterCallback0300', Level.LEVEL0, () => {

      let ret = cameras.oHPhotoOutputRegisterCallback(2);
      console.log(TAG+"testOHPhotoOutputRegisterCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterCallback0100
     * @tc.name       : testOHPhotoOutputUnregisterCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterCallback0100', Level.LEVEL0, () => {

      let ret = cameras.oHPhotoOutputUnregisterCallback(0);
      console.log(TAG+"testOHPhotoOutputUnregisterCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterCallback0200
     * @tc.name       : testOHPhotoOutputUnregisterCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterCallback0200', Level.LEVEL0, () => {

      let ret = cameras.oHPhotoOutputUnregisterCallback(1);
      console.log(TAG+"testOHPhotoOutputUnregisterCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputUnregisterCallback0300
     * @tc.name       : testOHPhotoOutputUnregisterCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputUnregisterCallback0300', Level.LEVEL0, () => {

      let ret = cameras.oHPhotoOutputUnregisterCallback(2);
      console.log(TAG+"testOHPhotoOutputUnregisterCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputIsMirrorSupported0100
     * @tc.name       : testOHPhotoOutputIsMirrorSupported0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputIsMirrorSupported0100', Level.LEVEL0, () => {
      let ret = cameras.oHPhotoOutputIsMirrorSupported(0);
      console.log(TAG+"testOHPhotoOutputIsMirrorSupported0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputIsMirrorSupported0200
     * @tc.name       : testOHPhotoOutputIsMirrorSupported0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputIsMirrorSupported0200', Level.LEVEL0, () => {

      let ret = cameras.oHPhotoOutputIsMirrorSupported(1);
      console.log(TAG+"testOHPhotoOutputIsMirrorSupported0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputIsMirrorSupported0300
     * @tc.name       : testOHPhotoOutputIsMirrorSupported0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputIsMirrorSupported0300', Level.LEVEL0, () => {

      let ret = cameras.oHPhotoOutputIsMirrorSupported(2);
      console.log(TAG+"testOHPhotoOutputIsMirrorSupported0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputEnableMirror0100
     * @tc.name       : testOHPhotoOutputEnableMirror0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputEnableMirror0100', Level.LEVEL0, () => {
      let ret = cameras.oHPhotoOutputEnableMirror(0);
      console.log(TAG+"testOHPhotoOutputEnableMirror0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputEnableMirror0200
     * @tc.name       : testOHPhotoOutputEnableMirror0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputEnableMirror0200', Level.LEVEL0, () => {
      
      let ret = cameras.oHPhotoOutputEnableMirror(1);
      console.log(TAG+"testOHPhotoOutputEnableMirror0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputCapture0100
     * @tc.name       : testOHPhotoOutputCapture0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputCapture0100', Level.LEVEL0, () => {
      cameras.oHPhotoOutputRegisterCaptureReadyCallback();
      let ret = cameras.oHPhotoOutputCapture(0);
      console.log(TAG+"testOHPhotoOutputCapture0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputCapture0200
     * @tc.name       : testOHPhotoOutputCapture0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputCapture0200', Level.LEVEL0, () => {
      let ret = cameras.oHPhotoOutputCapture(1);
      console.log(TAG+"testOHPhotoOutputCapture0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputCapture0300
     * @tc.name       : testOHPhotoOutputCapture0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputCapture0300', Level.LEVEL0, () => {

      let ret = cameras.oHPhotoOutputCapture(2);
      console.log(TAG+"testOHPhotoOutputCapture0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputCaptureWithCaptureSetting0100
     * @tc.name       : testOHPhotoOutputCaptureWithCaptureSetting0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPhotoOutputCaptureWithCaptureSetting0100', Level.LEVEL0, () => {
      let photoSettings: PhotoSettings = {
        quality: 0,
        rotation: 0,
        mirror: false,
        latitude: 12.9698,
        longitude: 77.7500,
        altitude: 1000
      };
      let ret = cameras.oHPhotoOutputCaptureWithCaptureSetting(photoSettings,0);
      console.log(TAG+"testOHPhotoOutputCaptureWithCaptureSetting0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputCaptureWithCaptureSetting0200
     * @tc.name       : testOHPhotoOutputCaptureWithCaptureSetting0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
   /* it('testOHPhotoOutputCaptureWithCaptureSetting0200', Level.LEVEL0, () => {
      let photoSettings: PhotoSettings = {
        quality: 0,
        rotation: 0,
        mirror: false,
        latitude: 12.9698,
        longitude: 77.7500,
        altitude: 1000
      };
      let ret = cameras.oHPhotoOutputCaptureWithCaptureSetting(photoSettings,1);
      console.log(TAG+"testOHPhotoOutputCaptureWithCaptureSetting0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })*/
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputCaptureWithCaptureSetting0300
     * @tc.name       : testOHPhotoOutputCaptureWithCaptureSetting0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
   /* it('testOHPhotoOutputCaptureWithCaptureSetting0300', Level.LEVEL0, () => {
      let photoSettings: PhotoSettings = {
        quality: 0,
        rotation: 0,
        mirror: false,
        latitude: -12.9698,
        longitude: -77.7500,
        altitude: -1000
      };
      let ret = cameras.oHPhotoOutputCaptureWithCaptureSetting(photoSettings,2);
      console.log(TAG+"testOHPhotoOutputCaptureWithCaptureSetting0300:"+ret);
      cameras.oHPhotoOutputUnRegisterCaptureReadyCallback();
      expect(ret).assertEqual(CAMERA_OK);
    })*/
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRelease0100
     * @tc.name       : testOHPhotoOutputRelease0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    /*it('testOHPhotoOutputRelease0100', Level.LEVEL0, () => {
      let ret = cameras.oHPhotoOutputRelease(0);
      console.log(TAG+"testOHPhotoOutputRelease0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })*/
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPhotoOutputRelease0200
     * @tc.name       : testOHPhotoOutputRelease0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    /*it('testOHPhotoOutputRelease0200', Level.LEVEL0, () => {

      let ret = cameras.oHPhotoOutputRelease(1);
      console.log(TAG+"testOHPhotoOutputRelease0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })*/
        /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputRelease0100
     * @tc.name       : testOHPreviewOutputRelease0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputRelease0100', Level.LEVEL0, () => {

      let ret = cameras.oHPreviewOutputRelease(0);
      console.log(TAG+"testOHPreviewOutputRelease0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHPreviewOutputRelease0200
     * @tc.name       : testOHPreviewOutputRelease0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHPreviewOutputRelease0200', Level.LEVEL0, () => {

      let ret = cameras.oHPreviewOutputRelease(1);
      console.log(TAG+"testOHPreviewOutputRelease0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
  })
}