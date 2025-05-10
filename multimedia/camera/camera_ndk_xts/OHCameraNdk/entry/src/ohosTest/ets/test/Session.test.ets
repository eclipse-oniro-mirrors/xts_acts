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

function sessionAddInput() {
  console.log(TAG + "添加相机输入");
  let ret = cameras.oHCaptureSessionAddInput(0);
  if (ret != 0) {
    console.log(TAG + "sessionAddInput FAILED" + ret);
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

function createPreviewOutput() {
  let ret = cameras.oHCameraManagerCreatePreviewOutput(0);
  if (ret != 0) {
    console.info(TAG + "createPreviewOutput FAILED:" + ret);
    expect().assertFail();
  }
}

function captureSessionAddPreviewOutput() {
  let ret = cameras.oHCaptureSessionAddPreviewOutput(0);
  if (ret != 0) {
    console.info(TAG + "captureSessionAddPreviewOutput FAILED");
    expect().assertFail();
  }
}

function captureSessionAddPhotoOutput() {
  let ret = cameras.oHCaptureSessionAddPhotoOutput(0);
  if (ret != 0) {
    console.info(TAG + "captureSessionAddPhotoOutput FAILED:" + ret);
    expect().assertFail();
  }
}

function captureSessionCommitConfig() {
  let ret = cameras.oHCaptureSessionCommitConfig(0);
  if (ret != 0) {
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

export default function SessionTest() {
  describe('SessionTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      await getPermissions();
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapabilityInstance()

    })
    beforeEach(() => {
      createCameraInput();
      createCaptureSession();
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionBeginConfig0100
     * @tc.name       : testOHCaptureSessionBeginConfig0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionBeginConfig0100', Level.LEVEL0, () => {

      let ret = cameras.oHCaptureSessionBeginConfig(0);
      console.log(TAG+"testOHCaptureSessionBeginConfig0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionBeginConfig0200
     * @tc.name       : testOHCaptureSessionBeginConfig0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionBeginConfig0200', Level.LEVEL0, () => {

      let ret = cameras.oHCaptureSessionBeginConfig(1);
      console.log(TAG+"testOHCaptureSessionBeginConfig0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionAddInput0100
     * @tc.name       : testOHCaptureSessionAddInput0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionAddInput0100', Level.LEVEL0, () => {

      sessionBeginConfig();
      let ret = cameras.oHCaptureSessionAddInput(0);
      console.log(TAG+"testOHCaptureSessionAddInput0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionAddInput0200
     * @tc.name       : testOHCaptureSessionAddInput0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionAddInput0200', Level.LEVEL0, () => {

      sessionBeginConfig();
      let ret = cameras.oHCaptureSessionAddInput(1);
      console.log(TAG+"testOHCaptureSessionAddInput0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRemoveInput0100
     * @tc.name       : testOHCaptureSessionRemoveInput0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRemoveInput0100', Level.LEVEL0, () => {
      sessionBeginConfig();
      sessionAddInput();
      let ret = cameras.oHCaptureSessionRemoveInput(0);
      console.log(TAG+"testOHCaptureSessionRemoveInput0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRemoveInput0200
     * @tc.name       : testOHCaptureSessionRemoveInput0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRemoveInput0200', Level.LEVEL0, () => {
      sessionBeginConfig();
      sessionAddInput();
      let ret = cameras.oHCaptureSessionRemoveInput(1);
      console.log(TAG+"testOHCaptureSessionRemoveInput0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRemoveInput0300
     * @tc.name       : testOHCaptureSessionRemoveInput0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRemoveInput0300', Level.LEVEL0, () => {
      sessionBeginConfig();
      sessionAddInput();
      let ret = cameras.oHCaptureSessionRemoveInput(2);
      console.log(TAG+"testOHCaptureSessionRemoveInput0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionAddPreviewOutput0100
     * @tc.name       : testOHCaptureSessionAddPreviewOutput0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionAddPreviewOutput0100', Level.LEVEL0, () => {

      sessionBeginConfig();
      sessionAddInput();
      createPreviewOutput();
      let ret = cameras.oHCaptureSessionAddPreviewOutput(0);
      console.log(TAG+"testOHCaptureSessionAddPreviewOutput0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionAddPreviewOutput0200
     * @tc.name       : testOHCaptureSessionAddPreviewOutput0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionAddPreviewOutput0200', Level.LEVEL0, () => {

      sessionBeginConfig();
      sessionAddInput();
      createPreviewOutput();
      let ret = cameras.oHCaptureSessionAddPreviewOutput(1);
      console.log(TAG+"testOHCaptureSessionAddPreviewOutput0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionAddPreviewOutput0300
     * @tc.name       : testOHCaptureSessionAddPreviewOutput0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionAddPreviewOutput0300', Level.LEVEL0, () => {

      sessionBeginConfig();
      sessionAddInput();
      createPreviewOutput();
      let ret = cameras.oHCaptureSessionAddPreviewOutput(2);
      console.log(TAG+"testOHCaptureSessionAddPreviewOutput0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionCommitConfig0100
     * @tc.name       : testOHCaptureSessionCommitConfig0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCommitConfig0100', Level.LEVEL0, () => {
      sessionBeginConfig();
      sessionAddInput();
      createPreviewOutput()
      captureSessionAddPreviewOutput();
      let ret = cameras.oHCaptureSessionCommitConfig(0);
      console.log(TAG+"testOHCaptureSessionCommitConfig0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionCommitConfig0200
     * @tc.name       : testOHCaptureSessionCommitConfig0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionCommitConfig0200', Level.LEVEL0, () => {
      sessionBeginConfig();
      sessionAddInput();
      createPreviewOutput()
      captureSessionAddPreviewOutput();
      let ret = cameras.oHCaptureSessionCommitConfig(1);
      console.log(TAG+"testOHCaptureSessionCommitConfig0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionAddPhotoOutput0100
     * @tc.name       : testOHCaptureSessionAddPhotoOutput0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionAddPhotoOutput0100', Level.LEVEL0, () => {
      sessionBeginConfig();
      sessionAddInput();
      createPreviewOutput()
      captureSessionAddPreviewOutput();
      let ret = cameras.oHCaptureSessionAddPhotoOutput(0);
      console.log(TAG+"testOHCaptureSessionAddPhotoOutput0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
      cameras.oHCaptureSessionRemovePhotoOutput(0);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionAddPhotoOutput0200
     * @tc.name       : testOHCaptureSessionAddPhotoOutput0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionAddPhotoOutput0200', Level.LEVEL0, () => {

      sessionBeginConfig();
      sessionAddInput();
      createPreviewOutput()
      captureSessionAddPreviewOutput();
      let ret = cameras.oHCaptureSessionAddPhotoOutput(1);
      console.log(TAG+"testOHCaptureSessionAddPhotoOutput0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionAddPhotoOutput0300
     * @tc.name       : testOHCaptureSessionAddPhotoOutput0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionAddPhotoOutput0300', Level.LEVEL0, () => {

      sessionBeginConfig();
      sessionAddInput();
      createPreviewOutput()
      captureSessionAddPreviewOutput();
      let ret = cameras.oHCaptureSessionAddPhotoOutput(2);
      console.log(TAG+"testOHCaptureSessionAddPhotoOutput0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRemovePhotoOutput0100
     * @tc.name       : testOHCaptureSessionRemovePhotoOutput0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRemovePhotoOutput0100', Level.LEVEL0, () => {
      sessionBeginConfig();
      sessionAddInput();
      createPreviewOutput()
      captureSessionAddPreviewOutput();
      captureSessionAddPhotoOutput();
      let ret = cameras.oHCaptureSessionRemovePhotoOutput(0);
      console.log(TAG+"testOHCaptureSessionRemovePhotoOutput0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRemovePhotoOutput0200
     * @tc.name       : testOHCaptureSessionRemovePhotoOutput0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRemovePhotoOutput0200', Level.LEVEL0, () => {
      sessionBeginConfig();
      sessionAddInput();
      createPreviewOutput()
      captureSessionAddPreviewOutput();
      captureSessionAddPhotoOutput();
      let ret = cameras.oHCaptureSessionRemovePhotoOutput(1);
      console.log(TAG+"testOHCaptureSessionRemovePhotoOutput0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
      cameras.oHCaptureSessionRemovePhotoOutput(0);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRemovePhotoOutput0300
     * @tc.name       : testOHCaptureSessionRemovePhotoOutput0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRemovePhotoOutput0300', Level.LEVEL0, () => {
      sessionBeginConfig();
      sessionAddInput();
      createPreviewOutput()
      captureSessionAddPreviewOutput();
      captureSessionAddPhotoOutput();
      let ret = cameras.oHCaptureSessionRemovePhotoOutput(2);
      console.log(TAG+"testOHCaptureSessionRemovePhotoOutput0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRemovePreviewOutput0100
     * @tc.name       : testOHCaptureSessionRemovePreviewOutput0100
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRemovePreviewOutput0100', Level.LEVEL0, () => {
      sessionBeginConfig();
      sessionAddInput();
      createPreviewOutput()
      captureSessionAddPreviewOutput();
      let ret = cameras.oHCaptureSessionRemovePreviewOutput(0);
      console.log(TAG+"testOHCaptureSessionRemovePreviewOutput0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRemovePreviewOutput0200
     * @tc.name       : testOHCaptureSessionRemovePreviewOutput0200
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRemovePreviewOutput0200', Level.LEVEL0, () => {
      sessionBeginConfig();
      sessionAddInput();
      createPreviewOutput()
      captureSessionAddPreviewOutput();
      let ret = cameras.oHCaptureSessionRemovePreviewOutput(1);
      console.log(TAG+"testOHCaptureSessionRemovePreviewOutput0200:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCaptureSessionRemovePreviewOutput0300
     * @tc.name       : testOHCaptureSessionRemovePreviewOutput0300
     * @tc.size       : MediumTest
     * @tc.desc       : The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCaptureSessionRemovePreviewOutput0300', Level.LEVEL0, () => {
      sessionBeginConfig();
      sessionAddInput();
      createPreviewOutput()
      captureSessionAddPreviewOutput();
      let ret = cameras.oHCaptureSessionRemovePreviewOutput(2);
      console.log(TAG+"testOHCaptureSessionRemovePreviewOutput0300:"+ret);
      expect(ret).assertEqual(CAMERA_ERROR_7400101);
    })

  })
}