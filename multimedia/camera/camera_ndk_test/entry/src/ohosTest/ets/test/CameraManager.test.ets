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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedSceneModes0100
     * @tc.name       : testOHCameraManagerGetSupportedSceneModes0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_GetSupportedSceneModes in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedSceneModes0100', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
      console.info(TAG+"testOHCameraManagerGetSupportedSceneModes0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
      cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedSceneModes0200
     * @tc.name       : testOHCameraManagerGetSupportedSceneModes0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_GetSupportedSceneModes in abnormal condition, the first parameter is
     *                  null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedSceneModes0200', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.FIRST_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerGetSupportedSceneModes0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedSceneModes0300
     * @tc.name       : testOHCameraManagerGetSupportedSceneModes0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_GetSupportedSceneModes in abnormal condition, the second parameter is
     *                  null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedSceneModes0300', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.SECOND_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerGetSupportedSceneModes0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedSceneModes0400
     * @tc.name       : testOHCameraManagerGetSupportedSceneModes0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_GetSupportedSceneModes in abnormal condition, the third parameter is
     *                  null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedSceneModes0400', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      let ret = cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.SECOND_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerGetSupportedSceneModes0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerDeleteSceneModes0100
     * @tc.name       : testOHCameraManagerDeleteSceneModes0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_DeleteSceneModes in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerDeleteSceneModes0100', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      let ret = cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerDeleteSceneModes0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerDeleteSceneModes0200
     * @tc.name       : testOHCameraManagerDeleteSceneModes0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_DeleteSceneModes in abnormal condition, the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerDeleteSceneModes0200', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      let ret = cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerDeleteSceneModes0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerDeleteSceneModes0300
     * @tc.name       : testOHCameraManagerDeleteSceneModes0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_DeleteSceneModes in abnormal condition, the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerDeleteSceneModes0300', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      cameraObj.oHCameraManagerGetSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      let ret = cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerDeleteSceneModes0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      cameraObj.oHCameraManagerDeleteSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0100
     * @tc.name       : testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0100', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0200
     * @tc.name       : testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0200', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0200:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0300
     * @tc.name       : testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0300', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0400
     * @tc.name       : testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0400', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0400:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0500
     * @tc.name       : testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0500', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0500:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0600
     * @tc.name       : testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0600
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode in abnormal condition,
     *                  the third parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0600', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(Parameter_Setting.THIRD_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0600:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMERANDK_OHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0700
     * @tc.name       : testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0700
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_GetSupportedCameraOutputCapabilityWithSceneMode in abnormal condition,
     *                  the fourth parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0700', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      let ret = cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(Parameter_Setting.FOURTH_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode0700:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupported0100
     * @tc.name       : testOHCameraManagerIsTorchSupported0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_IsTorchSupported in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerIsTorchSupported0100', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerIsTorchSupported(Parameter_Setting.ALL_PARAMETER_OK).errorCode;
      console.info(TAG+"testOHCameraManagerIsTorchSupported0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupported0200
     * @tc.name       : testOHCameraManagerIsTorchSupported0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_IsTorchSupported in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerIsTorchSupported0200', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerIsTorchSupported(Parameter_Setting.FIRST_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerIsTorchSupported0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupported0300
     * @tc.name       : testOHCameraManagerIsTorchSupported0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_IsTorchSupported in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerIsTorchSupported0300', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerIsTorchSupported(Parameter_Setting.SECOND_PARAMETER_ERROR).errorCode;
      console.info(TAG+"testOHCameraManagerIsTorchSupported0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0100
     * @tc.name       : testOHCameraManagerIsTorchSupportedByTorchMode0100
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_IsTorchSupportedByTorchMode in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0100', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0200
     * @tc.name       : testOHCameraManagerIsTorchSupportedByTorchMode0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_IsTorchSupportedByTorchMode in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0200', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0300
     * @tc.name       : testOHCameraManagerIsTorchSupportedByTorchMode0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_IsTorchSupportedByTorchMode in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0300', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0400
     * @tc.name       : testOHCameraManagerIsTorchSupportedByTorchMode0400
     * @tc.size       : MediumTest
     * @tc.desc       : test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0400', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0500
     * @tc.name       : testOHCameraManagerIsTorchSupportedByTorchMode0500
     * @tc.size       : MediumTest
     * @tc.desc       : test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     *                  the second parameter is an exceptional value.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0500', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0600
     * @tc.name       : testOHCameraManagerIsTorchSupportedByTorchMode0600
     * @tc.size       : MediumTest
     * @tc.desc       : test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     *                  the third parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0600', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0700
     * @tc.name       : testOHCameraManagerIsTorchSupportedByTorchMode0700
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     *                  torch is not supported.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0700', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0800
     * @tc.name       : testOHCameraManagerIsTorchSupportedByTorchMode0700
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     *                  torch is not supported.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0800', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerIsTorchSupportedByTorchMode0900
     * @tc.name       : testOHCameraManagerIsTorchSupportedByTorchMode0900
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_IsTorchSupportedByTorchMode in abnormal condition,
     *                  torch is not supported.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerIsTorchSupportedByTorchMode0900', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0100
     * @tc.name       : testOHCameraManagerSetTorchMode0100
     * @tc.size       : MediumTest
     * @tc.desc       : test OH_CameraManager_SetTorchMode in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerSetTorchMode0100', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0200
     * @tc.name       : testOHCameraManagerSetTorchMode0200
     * @tc.size       : MediumTest
     * @tc.desc       : test OH_CameraManager_SetTorchMode in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerSetTorchMode0200', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0300
     * @tc.name       : testOHCameraManagerSetTorchMode0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_SetTorchMode in abnormal condition,
     *                  the first parameter torchMode is AUTO.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerSetTorchMode0300', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0400
     * @tc.name       : testOHCameraManagerSetTorchMode0400
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_SetTorchMode in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerSetTorchMode0400', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0500
     * @tc.name       : testOHCameraManagerSetTorchMode0500
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_SetTorchMode in abnormal condition,
     *                  the second parameter is an exceptional value.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerSetTorchMode0500', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0600
     * @tc.name       : testOHCameraManagerSetTorchMode0600
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_SetTorchMode in abnormal condition,
     *                  torch is not supported.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerSetTorchMode0600', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerSetTorchMode0700
     * @tc.name       : testOHCameraManagerSetTorchMode0700
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_SetTorchMode in abnormal condition,
     *                  torchmode ON is not supported.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerSetTorchMode0700', 0, () => {
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
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterTorchStatusCallback0100
     * @tc.name       : testOHCameraManagerRegisterTorchStatusCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : test OH_CameraManager_RegisterTorchStatusCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerRegisterTorchStatusCallback0100', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerRegisterTorchStatusCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerRegisterTorchStatusCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterTorchStatusCallback0200
     * @tc.name       : testOHCameraManagerRegisterTorchStatusCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_RegisterTorchStatusCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerRegisterTorchStatusCallback0200', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerRegisterTorchStatusCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerRegisterTorchStatusCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterTorchStatusCallback0300
     * @tc.name       : testOHCameraManagerRegisterTorchStatusCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_RegisterTorchStatusCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerRegisterTorchStatusCallback0300', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerRegisterTorchStatusCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerRegisterTorchStatusCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnregisterTorchStatusCallback0100
     * @tc.name       : testOHCameraManagerUnregisterTorchStatusCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : test OH_CameraManager_UnregisterTorchStatusCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerUnregisterTorchStatusCallback0100', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerUnregisterTorchStatusCallback(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerUnregisterTorchStatusCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnregisterTorchStatusCallback0200
     * @tc.name       : testOHCameraManagerUnregisterTorchStatusCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_UnregisterTorchStatusCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerUnregisterTorchStatusCallback0200', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerUnregisterTorchStatusCallback(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerUnregisterTorchStatusCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnregisterTorchStatusCallback0300
     * @tc.name       : testOHCameraManagerUnregisterTorchStatusCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_UnregisterTorchStatusCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerUnregisterTorchStatusCallback0300', 0, () => {
      getCameraManagerInstance();
      getSupportedCamerasInstance()
      getSupportedCameraOutputCapability();
      let ret = cameraObj.oHCameraManagerUnregisterTorchStatusCallback(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerUnregisterTorchStatusCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterFoldStatusCallback0100
     * @tc.name       : testOHCameraManagerRegisterFoldStatusCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : test OH_CameraManager_RegisterFoldStatusInfoCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerRegisterFoldStatusCallback0100', 0, () => {
      getCameraManagerInstance();
      let ret = cameraObj.cameraManagerRegisterFoldStatusChange(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerRegisterFoldStatusCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterFoldStatusCallback0200
     * @tc.name       : testOHCameraManagerRegisterFoldStatusCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_RegisterFoldStatusInfoCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerRegisterFoldStatusCallback0200', 0, () => {
      getCameraManagerInstance();
      let ret = cameraObj.cameraManagerRegisterFoldStatusChange(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerRegisterFoldStatusCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerRegisterFoldStatusCallback0300
     * @tc.name       : testOHCameraManagerRegisterFoldStatusCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_RegisterFoldStatusInfoCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerRegisterFoldStatusCallback0300', 0, () => {
      getCameraManagerInstance();
      let ret = cameraObj.cameraManagerRegisterFoldStatusChange(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerRegisterFoldStatusCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnregisterFoldStatusCallback0100
     * @tc.name       : testOHCameraManagerUnregisterFoldStatusCallback0100
     * @tc.size       : MediumTest
     * @tc.desc       : test OH_CameraManager_UnregisterFoldStatusInfoCallback in normal condition.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerUnregisterFoldStatusCallback0100', 0, () => {
      getCameraManagerInstance();
      let ret = cameraObj.cameraManagerUnregisterFoldStatusChange(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG+"testOHCameraManagerUnregisterFoldStatusCallback0100:"+ret);
      expect(ret).assertEqual(CAMERA_OK);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnregisterFoldStatusCallback0200
     * @tc.name       : testOHCameraManagerUnregisterFoldStatusCallback0200
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_UnregisterFoldStatusInfoCallback in abnormal condition,
     *                  the first parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerUnregisterFoldStatusCallback0200', 0, () => {
      getCameraManagerInstance();
      let ret = cameraObj.cameraManagerUnregisterFoldStatusChange(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerUnregisterFoldStatusCallback0200:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraManagerUnregisterFoldStatusCallback0300
     * @tc.name       : testOHCameraManagerUnregisterFoldStatusCallback0300
     * @tc.size       : MediumTest
     * @tc.desc       : Test OH_CameraManager_UnregisterFoldStatusInfoCallback in abnormal condition,
     *                  the second parameter is null.
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHCameraManagerUnregisterFoldStatusCallback0300', 0, () => {
      getCameraManagerInstance();
      let ret = cameraObj.cameraManagerUnregisterFoldStatusChange(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG+"testOHCameraManagerUnregisterFoldStatusCallback0300:"+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    })
  })
}
