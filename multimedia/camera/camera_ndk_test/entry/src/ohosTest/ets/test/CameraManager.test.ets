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
import cameraObj from 'libentry.so'
import image from '@ohos.multimedia.image';
//import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import { Camera_SceneMode, Parameter_Setting, Torch_Mode } from './Constants';
import { abilityAccessCtrl, Context, PermissionRequestResult, common ,Permissions} from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';

const TAG = "CAMERA_LOGTAG_JS ";
const CAMERA_OK = 0;
const CAMERA_INVALID_ARGUMENT = 7400101;
const CAMERA_OPERATION_NOT_ALLOWED = 7400102;
const CAMERA_SERVICE_FATAL_ERROR = 7400201;



let receiver: image.ImageReceiver;
let mPhotoSurface: string;
function getCameraManagerInstance() {
  console.info(TAG + 'mSurfaceId : ' + mPhotoSurface);
  let ret = cameraObj.initCamera(mPhotoSurface);
  console.info(TAG + 'initCamera : ' + ret);
  if (ret != 0) {
    console.error(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }
}

function getSupportedCamerasInstance() {
  let cameraInfo = cameraObj.getSupportedCameras();
  if (isEmpty(cameraInfo)) {
    console.error(TAG + "getSupportedCamerasInstance FAILED");
    expect().assertFail();
  }
}

function getSupportedSceneModes(index: number) {
  let supportedSceneModes = cameraObj.oHCameraManagerGetSupportedSceneModes(index);
  if (supportedSceneModes.errorCode != 0) {
    console.error(TAG + "getSupportedSceneModes FAILED");
    expect().assertFail();
  }
  if (supportedSceneModes.isNormalPhoto) {
    console.info(TAG + "NORMAL_PHOTO is supported.");
  }
  if (supportedSceneModes.isNormalVideo) {
    console.info(TAG + "NORMAL_VIDEO is supported.");
  }
  if (supportedSceneModes.isSecurePhoto) {
    console.info(TAG + "SECURE_PHOTO is supported.");
  }
  cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
  return supportedSceneModes;
}

function getSupportedCameraOutputCapability() {
  let cameraOutputCapability = cameraObj.getSupportedOutputCapability();
  console.info(TAG + 'cameraOutputCapability[0] = ' + cameraOutputCapability.previewProfilesSize);
  console.info(TAG + 'cameraOutputCapability[1] = ' + cameraOutputCapability.photoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[2] = ' + cameraOutputCapability.videoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[3] = ' + cameraOutputCapability.metadataProfilesSize);
  return true;
}

function isTorchSupported() {
  let ret = cameraObj.oHCameraManagerIsTorchSupported(0);
  if (ret.errorCode != 0) {
    console.error(TAG + "isTorchSupported FAILED");
    expect().assertFail();
  }
  return ret.isTorchSupported;
}

function torchMode(index: number) {
  let ret = cameraObj.oHCameraManagerTorchMode(index);
  if (ret != 0) {
    console.error(TAG + "torchMode FAILED");
    expect().assertFail();
  }
}

function isTorchSupportedByTorchMode() {
  let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(0);
  if (ret.errorCode != 0) {
    console.error(TAG + "isTorchSupportedByTorchMode FAILED");
    expect().assertFail();
  }
  return ret.isTorchSupportedByTorchMode;
}

function setSceneMode(index_sceneMode: number) {
  let ret = cameraObj.oHCameraManagerSetSceneMode(index_sceneMode);
  if (ret != 0) {
    console.error(TAG + "setSceneMode FAILED");
    expect().assertFail();
  }
  if (index_sceneMode == Camera_SceneMode.NORMAL_PHOTO) {
    console.info(TAG + "set sceneMode: NORMAL_PHOTO");
  } else if (index_sceneMode == Camera_SceneMode.NORMAL_VIDEO) {
    console.info(TAG + "set sceneMode: NORMAL_VIDEO");
  } else if (index_sceneMode == Camera_SceneMode.SECURE_PHOTO) {
    console.info(TAG + "set sceneMode: SECURE_PHOTO");
  }
}

async function getPhotoReceiverSurface() {
  console.info(TAG + 'createImageReceiver start.');
  receiver = image.createImageReceiver({ width: 640, height: 480 }, 4, 8);
  if (receiver !== undefined) {
    console.error(TAG + 'createImageReceiver successfully');
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.info(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.error(TAG + 'createImageReceiver failed');
  }
}

function isEmpty(data: cameraObj.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}


function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

let getPermissions1 = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.CAMERA'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info('data:' + JSON.stringify(data))
    console.info('data permissions:' + data.permissions)

  }).catch((err: BusinessError) => {
    console.info('data:' + JSON.stringify(err))
  })
}
let getPermissions2 = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info('data:' + JSON.stringify(data))
    console.info('data permissions:' + data.permissions)
  }).catch((err: BusinessError) => {
    console.info('data:' + JSON.stringify(err))
  })
}

let driveFn = async () => {
  let dr = Driver.create();
  await sleep(500);
  let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
  await sleep(500);
  await power?.click();
  await sleep(500);
}

function releaseCamera() {
  let ret = cameraObj.releaseCamera();
  if (ret != 0) {
    console.error(TAG + "releaseCamera FAILED");
    expect().assertFail();
  }
}

export default function CameraManagerTest() {
  describe('CameraManagerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      await getPermissions1();
      await driveFn();
      await getPermissions2();
      await driveFn();
      await getPhotoReceiverSurface();
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      releaseCamera();
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedSceneModes0100
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedSceneModes0100
     * @tc.desc   Test OH_CameraManager_GetSupportedSceneModes in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedSceneModes0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
      console.info(TAG+"testOHCameraManagerGetSupportedSceneModes0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
      cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedSceneModes0200
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedSceneModes0200
     * @tc.desc   Test OH_CameraManager_GetSupportedSceneModes in abnormal condition, the first parameter is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedSceneModes0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.FIRST_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerGetSupportedSceneModes0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedSceneModes0300
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedSceneModes0300
     * @tc.desc   Test OH_CameraManager_GetSupportedSceneModes in abnormal condition, the second parameter is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedSceneModes0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.SECOND_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerGetSupportedSceneModes0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedSceneModes0400
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedSceneModes0400
     * @tc.desc   Test OH_CameraManager_GetSupportedSceneModes in abnormal condition, the third parameter is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedSceneModes0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.SECOND_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerGetSupportedSceneModes0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerDeleteSceneModes0100
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerDeleteSceneModes0100
     * @tc.desc   Test OH_CameraManager_DeleteSceneModes in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerDeleteSceneModes0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      let ret = cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerDeleteSceneModes0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHCameraManagerDeleteSceneModes0200
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerDeleteSceneModes0200
     * @tc.desc   Test OH_CameraManager_DeleteSceneModes in abnormal condition, the first parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerDeleteSceneModes0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      let ret = cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerDeleteSceneModes0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
    })
    /**
     * @tc.name   testOHCameraManagerDeleteSceneModes0300
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerDeleteSceneModes0300
     * @tc.desc   Test OH_CameraManager_DeleteSceneModes in abnormal condition, the second parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerDeleteSceneModes0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      let ret = cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerDeleteSceneModes0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0100
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0100
     * @tc.desc   Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0200
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0200
     * @tc.desc   Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0300
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0300
     * @tc.desc   Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG+"SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0300:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      }
      console.info(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0300 end");
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0400
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0400
     * @tc.desc   Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0500
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0500
     * @tc.desc   Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0500:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0600
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0600
     * @tc.desc   Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0600', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(Parameter_Setting.THIRD_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0600:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0700
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0700
     * @tc.desc   Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0700', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(Parameter_Setting.FOURTH_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0700:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0100
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0100
     * @tc.desc   Test OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode in photo scene condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode(
        Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG + "testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0100:" + ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0200
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0200
     * @tc.desc   Test OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode in video scene condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      let ret = cameraObj.oHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode(
        Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG + "testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0200:" + ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0300
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0300
     * @tc.desc   Test OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode in secure photo scene condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG + "getSupportedSceneModesSize is called. size is " + supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG + "SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        let ret = cameraObj.oHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode(
          Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG + "testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0300:" + ret);
        expect(ret).assertEqual(CAMERA_OK);
      }
      console.info(TAG + "testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0300 end");
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0400
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0400
     * @tc.desc   Test OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode in first parameter error condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode(
        Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG + "testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0400:" + ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0500
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0500
     * @tc.desc   Test OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode in second parameter error condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode(
        Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG + "testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0500:" + ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0600
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0600
     * @tc.desc   Test OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode in third parameter error condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0600', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode(
        Parameter_Setting.THIRD_PARAMETER_ERROR);
      console.info(TAG + "testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0600:" + ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0700
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0700
     * @tc.desc   Test OH_CameraManager_GetSupportedFullCameraOutputCapabilityWithSceneMode in forth parameter error condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0700', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode(
        Parameter_Setting.FOURTH_PARAMETER_ERROR);
      console.info(TAG + "testOHCameraManagerGetSupportedFullCameraOutputCapabilityWithSceneMode0700:" + ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupported0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupported0100
     * @tc.desc   Test OH_CameraManager_IsTorchSupported in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupported0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerIsTorchSupported(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
      console.info(TAG+"testOHCameraManagerIsTorchSupported0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupported0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupported0200
     * @tc.desc   Test OH_CameraManager_IsTorchSupported in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupported0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerIsTorchSupported(Parameter_Setting.FIRST_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerIsTorchSupported0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupported0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupported0300
     * @tc.desc   Test OH_CameraManager_IsTorchSupported in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupported0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerIsTorchSupported(Parameter_Setting.SECOND_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerIsTorchSupported0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0100
     * @tc.desc   Test OH_CameraManager_IsTorchSupportedByTorchMode in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if(isTorchSupported() == true){
        torchMode(Torch_Mode.OFF);
        let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode0100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"isTorchSupported Not Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0200
     * @tc.desc   Test OH_CameraManager_IsTorchSupportedByTorchMode in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if(isTorchSupported() == true){
        torchMode(Torch_Mode.ON);
        let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode0200:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"isTorchSupported Not Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0300
     * @tc.desc   Test OH_CameraManager_IsTorchSupportedByTorchMode in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if(isTorchSupported() == true){
        torchMode(Torch_Mode.AUTO);
        let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode0300:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"isTorchSupported Not Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode0400
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0400
     * @tc.desc   test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      isTorchSupported();
      torchMode(Torch_Mode.AUTO);
      let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.FIRST_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode0500
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0500
     * @tc.desc   test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      isTorchSupported();
      torchMode(Torch_Mode.AUTO);
      let ret =
        cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.SECOND_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode0500:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode0600
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0600
     * @tc.desc   test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0600', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      isTorchSupported();
      torchMode(Torch_Mode.AUTO);
      let ret =
        cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.THIRD_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode0600:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode0700
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0700
     * @tc.desc   Test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0700', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if(isTorchSupported() == false){
        torchMode(Torch_Mode.OFF);
        let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode0700.errorCode:"+ret.errorCode);
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode0700.isTorchSupportedByTorchMode:"+
            ret.isTorchSupportedByTorchMode);
        expect(ret.errorCode).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"isTorchSupported Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode0800
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0800
     * @tc.desc   Test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0800', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if(isTorchSupported() == false){
        torchMode(Torch_Mode.ON);
        let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode0800.errorCode:"+ret.errorCode);
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode0800.isTorchSupportedByTorchMode:"+
            ret.isTorchSupportedByTorchMode);
        expect(ret.errorCode).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"isTorchSupported Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode0900
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0900
     * @tc.desc   Test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0900', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if(isTorchSupported() == false){
        torchMode(Torch_Mode.AUTO);
        let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode0900.errorCode:"+ret.errorCode);
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode0900.isTorchSupportedByTorchMode:"+
            ret.isTorchSupportedByTorchMode);
        expect(ret.errorCode).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"isTorchSupported Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode1000
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode1000
     * @tc.desc   Test OH_CameraManager_IsTorchSupportedByTorchMode in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode1000', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if(isTorchSupported() == true){
        torchMode(Torch_Mode.TORCH_MODE_OFF);
        let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode1000:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"isTorchSupported Not Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode1100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode1100
     * @tc.desc   Test OH_CameraManager_IsTorchSupportedByTorchMode in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode1100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if(isTorchSupported() == true){
        torchMode(Torch_Mode.TORCH_MODE_ON);
        let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode1100:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"isTorchSupported Not Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode1200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode1200
     * @tc.desc   Test OH_CameraManager_IsTorchSupportedByTorchMode in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode1200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if(isTorchSupported() == true){
        torchMode(Torch_Mode.TORCH_MODE_AUTO);
        let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode1200:"+ret);
        expect(ret).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"isTorchSupported Not Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode1300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode1300
     * @tc.desc   test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode1300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      isTorchSupported();
      torchMode(Torch_Mode.TORCH_MODE_AUTO);
      let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.FIRST_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode1300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode1400
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode1400
     * @tc.desc   test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode1400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      isTorchSupported();
      torchMode(Torch_Mode.TORCH_MODE_AUTO);
      let ret =
        cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.SECOND_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode1400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode1500
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode1500
     * @tc.desc   test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode1500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      isTorchSupported();
      torchMode(Torch_Mode.TORCH_MODE_AUTO);
      let ret =
        cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.THIRD_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode1500:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode1600
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode1600
     * @tc.desc   Test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode1600', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if(isTorchSupported() == false){
        torchMode(Torch_Mode.TORCH_MODE_OFF);
        let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode1600.errorCode:"+ret.errorCode);
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode1600.isTorchSupportedByTorchMode:"+
            ret.isTorchSupportedByTorchMode);
        expect(ret.errorCode).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"isTorchSupported Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode1700
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode1700
     * @tc.desc   Test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode1700', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if(isTorchSupported() == false){
        torchMode(Torch_Mode.TORCH_MODE_ON);
        let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode1700.errorCode:"+ret.errorCode);
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode1700.isTorchSupportedByTorchMode:"+
            ret.isTorchSupportedByTorchMode);
        expect(ret.errorCode).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"isTorchSupported Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerIsTorchSupportedByTorchMode1800
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode1800
     * @tc.desc   Test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode1800', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if(isTorchSupported() == false){
        torchMode(Torch_Mode.TORCH_MODE_AUTO);
        let ret = cameraObj.oHCameraManagerIsTorchSupportedByTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode1800.errorCode:"+ret.errorCode);
        console.info(TAG+"testOHCameraManagerIsTorchSupportedByTorchMode1800.isTorchSupportedByTorchMode:"+
            ret.isTorchSupportedByTorchMode);
        expect(ret.errorCode).assertEqual(CAMERA_OK);
      } else {
        console.error(TAG+"isTorchSupported Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerSetTorchMode0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0100
     * @tc.desc   test OH_CameraManager_SetTorchMode in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetTorchMode0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if (isTorchSupported() == true) {
        torchMode(Torch_Mode.OFF);
        if (isTorchSupportedByTorchMode() == true) {
          let ret = cameraObj.oHCameraManagerSetTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
          console.info(TAG+"testOHCameraManagerSetTorchMode0100:"+ret);
          expect(ret).assertEqual(CAMERA_OK);
        }
      } else {
        console.error(TAG+"isTorchSupported Not Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerSetTorchMode0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0200
     * @tc.desc   test OH_CameraManager_SetTorchMode in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetTorchMode0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if (isTorchSupported() == true) {
        torchMode(Torch_Mode.ON);
        if (isTorchSupportedByTorchMode() == true) {
          let ret = cameraObj.oHCameraManagerSetTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
          console.info(TAG+"testOHCameraManagerSetTorchMode0200:"+ret);
          expect(ret).assertEqual(CAMERA_OK);
        }
      } else {
        console.error(TAG+"isTorchSupported Not Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerSetTorchMode0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0300
     * @tc.desc   Test OH_CameraManager_SetTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetTorchMode0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if (isTorchSupported() == true) {
        torchMode(Torch_Mode.AUTO);
        if (isTorchSupportedByTorchMode() == true) {
          let ret = cameraObj.oHCameraManagerSetTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
          console.info(TAG+"testOHCameraManagerSetTorchMode0300:"+ret);
          expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
        }
      } else {
        console.error(TAG+"isTorchSupported Not Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerSetTorchMode0400
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0400
     * @tc.desc   Test OH_CameraManager_SetTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetTorchMode0400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      isTorchSupported();
      torchMode(Torch_Mode.AUTO);
      isTorchSupportedByTorchMode();
      let ret = cameraObj.oHCameraManagerSetTorchMode(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerSetTorchMode0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerSetTorchMode0500
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0500
     * @tc.desc   Test OH_CameraManager_SetTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetTorchMode0500', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      isTorchSupported();
      torchMode(Torch_Mode.AUTO);
      isTorchSupportedByTorchMode();
      let ret = cameraObj.oHCameraManagerSetTorchMode(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerSetTorchMode0500:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerSetTorchMode0600
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0600
     * @tc.desc   Test OH_CameraManager_SetTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetTorchMode0600', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if (isTorchSupported() == false) {
        torchMode(Torch_Mode.AUTO);
        isTorchSupportedByTorchMode();
        let ret = cameraObj.oHCameraManagerSetTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCameraManagerSetTorchMode0600:"+ret);
        expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
      } else {
        console.error(TAG+"isTorchSupported Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerSetTorchMode0700
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0700
     * @tc.desc   Test OH_CameraManager_SetTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetTorchMode0700', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if (isTorchSupported() == true) {
        torchMode(Torch_Mode.AUTO);
        if (isTorchSupportedByTorchMode() == false) {
          let ret = cameraObj.oHCameraManagerSetTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
          console.info(TAG+"testOHCameraManagerSetTorchMode0700:"+ret);
          expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
        }
      }
    })
    /**
     * @tc.name   testOHCameraManagerSetTorchMode0800
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0800
     * @tc.desc   test OH_CameraManager_SetTorchMode in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetTorchMode0800', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if (isTorchSupported() == true) {
        torchMode(Torch_Mode.TORCH_MODE_OFF);
        if (isTorchSupportedByTorchMode() == true) {
          let ret = cameraObj.oHCameraManagerSetTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
          console.info(TAG+"testOHCameraManagerSetTorchMode0800:"+ret);
          expect(ret).assertEqual(CAMERA_OK);
        }
      } else {
        console.error(TAG+"isTorchSupported Not Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerSetTorchMode0900
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0900
     * @tc.desc   test OH_CameraManager_SetTorchMode in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetTorchMode0900', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if (isTorchSupported() == true) {
        torchMode(Torch_Mode.TORCH_MODE_ON);
        if (isTorchSupportedByTorchMode() == true) {
          let ret = cameraObj.oHCameraManagerSetTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
          console.info(TAG+"testOHCameraManagerSetTorchMode0900:"+ret);
          expect(ret).assertEqual(CAMERA_OK);
        }
      } else {
        console.error(TAG+"isTorchSupported Not Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerSetTorchMode1000
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode1000
     * @tc.desc   Test OH_CameraManager_SetTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetTorchMode1000', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if (isTorchSupported() == true) {
        torchMode(Torch_Mode.TORCH_MODE_AUTO);
        if (isTorchSupportedByTorchMode() == true) {
          let ret = cameraObj.oHCameraManagerSetTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
          console.info(TAG+"testOHCameraManagerSetTorchMode1000:"+ret);
          expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
        }
      } else {
        console.error(TAG+"isTorchSupported Not Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerSetTorchMode1100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode1100
     * @tc.desc   Test OH_CameraManager_SetTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetTorchMode1100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      isTorchSupported();
      torchMode(Torch_Mode.TORCH_MODE_AUTO);
      isTorchSupportedByTorchMode();
      let ret = cameraObj.oHCameraManagerSetTorchMode(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerSetTorchMode1100:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerSetTorchMode1200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode1200
     * @tc.desc   Test OH_CameraManager_SetTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetTorchMode1200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      isTorchSupported();
      torchMode(Torch_Mode.TORCH_MODE_AUTO);
      isTorchSupportedByTorchMode();
      let ret = cameraObj.oHCameraManagerSetTorchMode(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerSetTorchMode1200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerSetTorchMode1300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode1300
     * @tc.desc   Test OH_CameraManager_SetTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetTorchMode1300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if (isTorchSupported() == false) {
        torchMode(Torch_Mode.TORCH_MODE_AUTO);
        isTorchSupportedByTorchMode();
        let ret = cameraObj.oHCameraManagerSetTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
        console.info(TAG+"testOHCameraManagerSetTorchMode1300:"+ret);
        expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
      } else {
        console.error(TAG+"isTorchSupported Supported!");
      }
    })
    /**
     * @tc.name   testOHCameraManagerSetTorchMode1400
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode1400
     * @tc.desc   Test OH_CameraManager_SetTorchMode in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerSetTorchMode1400', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      if (isTorchSupported() == true) {
        torchMode(Torch_Mode.TORCH_MODE_AUTO);
        if (isTorchSupportedByTorchMode() == false) {
          let ret = cameraObj.oHCameraManagerSetTorchMode(Parameter_Setting.ALL_PARAMETER_OK);
          console.info(TAG+"testOHCameraManagerSetTorchMode1400:"+ret);
          expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
        }
      }
    })
    /**
     * @tc.name   testOHCameraManagerRegisterTorchStatusCallback0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterTorchStatusCallback0100
     * @tc.desc   test OH_CameraManager_RegisterTorchStatusCallback in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerRegisterTorchStatusCallback0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerRegisterTorchStatusCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerRegisterTorchStatusCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHCameraManagerRegisterTorchStatusCallback0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterTorchStatusCallback0200
     * @tc.desc   Test OH_CameraManager_RegisterTorchStatusCallback in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerRegisterTorchStatusCallback0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerRegisterTorchStatusCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerRegisterTorchStatusCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerRegisterTorchStatusCallback0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterTorchStatusCallback0300
     * @tc.desc   Test OH_CameraManager_RegisterTorchStatusCallback in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerRegisterTorchStatusCallback0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerRegisterTorchStatusCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerRegisterTorchStatusCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerUnregisterTorchStatusCallback0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnregisterTorchStatusCallback0100
     * @tc.desc   test OH_CameraManager_UnregisterTorchStatusCallback in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerUnregisterTorchStatusCallback0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerUnregisterTorchStatusCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerUnregisterTorchStatusCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHCameraManagerUnregisterTorchStatusCallback0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnregisterTorchStatusCallback0200
     * @tc.desc   Test OH_CameraManager_UnregisterTorchStatusCallback in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerUnregisterTorchStatusCallback0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerUnregisterTorchStatusCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerUnregisterTorchStatusCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerUnregisterTorchStatusCallback0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnregisterTorchStatusCallback0300
     * @tc.desc   Test OH_CameraManager_UnregisterTorchStatusCallback in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerUnregisterTorchStatusCallback0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerUnregisterTorchStatusCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerUnregisterTorchStatusCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.name   testOHCameraManagerRegisterFoldStatusCallback0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterFoldStatusCallback0100
     * @tc.desc   test OH_CameraManager_RegisterFoldStatusInfoCallback in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerRegisterFoldStatusCallback0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      let ret = cameraObj.cameraManagerRegisterFoldStatusChange(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerRegisterFoldStatusCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHCameraManagerRegisterFoldStatusCallback0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterFoldStatusCallback0200
     * @tc.desc   Test OH_CameraManager_RegisterFoldStatusInfoCallback in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerRegisterFoldStatusCallback0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      let ret = cameraObj.cameraManagerRegisterFoldStatusChange(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerRegisterFoldStatusCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerRegisterFoldStatusCallback0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterFoldStatusCallback0300
     * @tc.desc   Test OH_CameraManager_RegisterFoldStatusInfoCallback in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerRegisterFoldStatusCallback0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      let ret = cameraObj.cameraManagerRegisterFoldStatusChange(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerRegisterFoldStatusCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerUnregisterFoldStatusCallback0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnregisterFoldStatusCallback0100
     * @tc.desc   test OH_CameraManager_UnregisterFoldStatusInfoCallback in normal condition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerUnregisterFoldStatusCallback0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      let ret = cameraObj.cameraManagerUnregisterFoldStatusChange(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerUnregisterFoldStatusCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.name   testOHCameraManagerUnregisterFoldStatusCallback0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnregisterFoldStatusCallback0200
     * @tc.desc   Test OH_CameraManager_UnregisterFoldStatusInfoCallback in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerUnregisterFoldStatusCallback0200', Level.LEVEL0, () => {
      getCameraManagerInstance();
      let ret = cameraObj.cameraManagerUnregisterFoldStatusChange(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerUnregisterFoldStatusCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.name   testOHCameraManagerUnregisterFoldStatusCallback0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnregisterFoldStatusCallback0300
     * @tc.desc   Test OH_CameraManager_UnregisterFoldStatusInfoCallback in abnormal condition,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerUnregisterFoldStatusCallback0300', Level.LEVEL0, () => {
      getCameraManagerInstance();
      let ret = cameraObj.cameraManagerUnregisterFoldStatusChange(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerUnregisterFoldStatusCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
     /**
      * @tc.name   testOHCameraManagerGetCameraDevice0100
      * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerGetCameraDevice0100
      * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('testOHCameraManagerGetCameraDevice0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      let ret = cameraObj.oHCameraManagerGetCameraDevice(0)
      console.log(TAG+"testOHCameraManagerGetCameraDevice0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
 
    /**
     * @tc.name   testOHCameraManagerGetCameraConcurrentInfos0100
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerGetCameraConcurrentInfos0100
     * @tc.desc   The total duration of obtaining media files, accurate to milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraManagerGetCameraConcurrentInfos0100', Level.LEVEL0, () => {
      getCameraManagerInstance();
      let ret = cameraObj.oHCameraManagerGetCameraConcurrentInfos(0)
      console.log(TAG+"testOHCameraManagerGetCameraConcurrentInfos0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })

    /**
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerGetCameraDevices0100
     * @tc.name   testOHCameraManagerGetCameraDevices0100
     * @tc.size   MediumTest
     * @tc.desc   Test OH_CameraManager_GetCameraDevices in normal condition.
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testOHCameraManagerGetCameraDevices0100', Level.LEVEL3, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.setInvalidDeviceQueryInfo(false);
      let ret = cameraObj.oHCameraManagerGetCameraDevices(Parameter_Setting.ALL_PARAMETER_OK);
      console.log(TAG+"testOHCameraManagerGetCameraDevices0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    
    /**
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerGetCameraDevices0200
     * @tc.name   testOHCameraManagerGetCameraDevices0200
     * @tc.size   MediumTest
     * @tc.desc   Test OH_CameraManager_GetCameraDevices in abnormal condition, the first parameter is null.
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testOHCameraManagerGetCameraDevices0200', Level.LEVEL3, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.setInvalidDeviceQueryInfo(false);
      let ret = cameraObj.oHCameraManagerGetCameraDevices(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.log(TAG+"testOHCameraManagerGetCameraDevices0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerGetCameraDevices0300
     * @tc.name   testOHCameraManagerGetCameraDevices0300
     * @tc.size   MediumTest
     * @tc.desc   Test OH_CameraManager_GetCameraDevices in abnormal condition, the second parameter is null.
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testOHCameraManagerGetCameraDevices0300', Level.LEVEL3, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.setInvalidDeviceQueryInfo(false);
      let ret = cameraObj.oHCameraManagerGetCameraDevices(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.log(TAG+"testOHCameraManagerGetCameraDevices0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerGetCameraDevices0400
     * @tc.name   testOHCameraManagerGetCameraDevices0400
     * @tc.size   MediumTest
     * @tc.desc   Test OH_CameraManager_GetCameraDevices in abnormal condition, the third parameter is null.
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testOHCameraManagerGetCameraDevices0400', Level.LEVEL3, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.setInvalidDeviceQueryInfo(false);
      let ret = cameraObj.oHCameraManagerGetCameraDevices(Parameter_Setting.THIRD_PARAMETER_ERROR);
      console.log(TAG+"testOHCameraManagerGetCameraDevices0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerGetCameraDevices0500
     * @tc.name   testOHCameraManagerGetCameraDevices0500
     * @tc.size   MediumTest
     * @tc.desc   Test OH_CameraManager_GetCameraDevices in abnormal condition, the fourth parameter is null.
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testOHCameraManagerGetCameraDevices0500', Level.LEVEL3, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.setInvalidDeviceQueryInfo(false);
      let ret = cameraObj.oHCameraManagerGetCameraDevices(Parameter_Setting.THIRD_PARAMETER_ERROR);
      console.log(TAG+"testOHCameraManagerGetCameraDevices0500:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerGetCameraDevices0600
     * @tc.name   testOHCameraManagerGetCameraDevices0600
     * @tc.size   MediumTest
     * @tc.desc   Test OH_CameraManager_GetCameraDevices in abnormal condition, fatal error.
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testOHCameraManagerGetCameraDevices0600', Level.LEVEL3, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.setInvalidDeviceQueryInfo(true);
      let ret = cameraObj.oHCameraManagerGetCameraDevices(Parameter_Setting.ALL_PARAMETER_OK);
      console.log(TAG+"testOHCameraManagerGetCameraDevices0600:"+ret);
      expect(ret).assertEqual(CAMERA_SERVICE_FATAL_ERROR);
    })

    /**
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerDeleteCameraDevices0100
     * @tc.name   testOHCameraManagerDeleteCameraDevices0100
     * @tc.size   MediumTest
     * @tc.desc   Test OH_CameraManager_DeleteCameraDevices in normal condition.
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testOHCameraManagerDeleteCameraDevices0100', Level.LEVEL3, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.setInvalidDeviceQueryInfo(false);
      cameraObj.oHCameraManagerGetCameraDevices(Parameter_Setting.ALL_PARAMETER_OK);
      let ret = cameraObj.oHCameraManagerDeleteCameraDevices(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerDeleteCameraDevices0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })

    /**
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerDeleteCameraDevices0200
     * @tc.name   testOHCameraManagerDeleteCameraDevices0200
     * @tc.size   MediumTest
     * @tc.desc   Test OH_CameraManager_DeleteCameraDevices in abnormal condition, the first parameter is null.
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testOHCameraManagerDeleteCameraDevices0200', Level.LEVEL3, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.setInvalidDeviceQueryInfo(false);
      cameraObj.oHCameraManagerGetCameraDevices(Parameter_Setting.ALL_PARAMETER_OK);
      let ret = cameraObj.oHCameraManagerDeleteCameraDevices(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerDeleteCameraDevices0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      cameraObj.oHCameraManagerDeleteCameraDevices(Parameter_Setting.ALL_PARAMETER_OK);
    })

    /**
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerDeleteCameraDevices0300
     * @tc.name   testOHCameraManagerDeleteCameraDevices0300
     * @tc.size   MediumTest
     * @tc.desc   Test OH_CameraManager_DeleteCameraDevices in abnormal condition, the second parameter is null.
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testOHCameraManagerDeleteCameraDevices0300', Level.LEVEL3, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.setInvalidDeviceQueryInfo(false);
      cameraObj.oHCameraManagerGetCameraDevices(Parameter_Setting.ALL_PARAMETER_OK);
      let ret = cameraObj.oHCameraManagerDeleteCameraDevices(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerDeleteCameraDevices0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      cameraObj.oHCameraManagerDeleteCameraDevices(Parameter_Setting.ALL_PARAMETER_OK);
    })
  })
}
