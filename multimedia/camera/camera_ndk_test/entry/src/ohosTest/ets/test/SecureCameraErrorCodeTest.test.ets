/*	testOHCaptureSessionAddSecu
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
import { Camera_PreconfigType, Camera_SceneMode, Parameter_Setting } from './Constants';
import { abilityAccessCtrl, Context, PermissionRequestResult, common, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';

const TAG = "CAMERA_LOGTAG_JS ";
const CAMERA_OK = 0;
const CAMERA_INVALID_ARGUMENT = 7400101;
const CAMERA_OPERATION_NOT_ALLOWED = 7400102;
let receiver: image.ImageReceiver;
let mPhotoSurface: string;

let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
let context: Context = getContext(this) as common.UIAbilityContext;

function getCameraManagerInstance() {
  console.info(TAG + 'mSurfaceId : ' + mPhotoSurface);
  let ret = cameraObj.initCamera(mPhotoSurface);
  console.info(TAG + 'initCamera : ' + ret);
  if (ret != 0) {
    console.error(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }
}

async function getPhotoReceiverSurface() {
  console.info(TAG + 'createImageReceiver start.');
  receiver = image.createImageReceiver({ width: 640, height: 480 }, 4, 8);
  if (receiver !== undefined) {
    console.error(TAG + 'createImageReceiver successfully');
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.error(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.error(TAG + 'createImageReceiver failed');
  }
}

function getSupportedCamerasInstance() {
  let cameraInfo = cameraObj.getSupportedCameras();
  if (isEmpty(cameraInfo)) {
    console.error(TAG + "getSupportedCamerasInstance FAILED");
    expect().assertFail();
  }
}

function createCameraInput() {
  console.info(TAG + "createCameraInput start.");
  let ret = cameraObj.createCameraInput();
  if (ret != 0) {
    console.error(TAG + "createCameraInput FAILED");
    expect().assertFail();
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

let getPermissions3 = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.READ_MEDIA'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info('data:' + JSON.stringify(data))
    console.info('data permissions:' + data.permissions)
  }).catch((err: BusinessError) => {
    console.info('data:' + JSON.stringify(err))
  })
}

let getPermissions4 = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.WRITE_MEDIA'];
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

function createCaptureSession() {
  console.info(TAG + "createCaptureSession start.");
  let ret = cameraObj.createSession();
  if (ret != 0) {
    console.error(TAG + "createCaptureSession FAILED");
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

function getSupportedCameraOutputCapabilityWithSceneMode() {
  let ret =
    cameraObj.oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret != 0) {
    console.error(TAG + "getSupportedCameraOutputCapabilityWithSceneMode FAILED");
    expect().assertFail();
  }
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

function setSessionMode() {
  let ret = cameraObj.oHCaptureSessionSetSessionMode(Parameter_Setting.ALL_PARAMETER_OK);
  if (ret != 0) {
    console.error(TAG + "setSessionMode FAILED");
    expect().assertFail();
  }
}

function createPreviewOutput() {
  let ret = cameraObj.createPreviewOutput();
  if (ret != 0) {
    console.error(TAG + "createPreviewOutput FAILED");
    expect().assertFail();
  }
}

function sessionBeginConfig() {
  let ret = cameraObj.sessionBegin();
  if (ret != 0) {
    console.error(TAG + "sessionBeginConfig FAILED:" + ret);
    expect().assertFail();
  }
}

function addInput() {
  let canAddInput = cameraObj.oHCaptureSessionCanAddInput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddInput.errorCode != 0) {
    console.error(TAG + "canAddInput FAILED" + canAddInput.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
  if (canAddInput.isAddInput) {
    let ret = cameraObj.sessionAddInput();
    if (ret != 0) {
      console.error(TAG + "addInput FAILED" + ret);
      expect().assertFail();
    }
  } else {
    expect().assertFail();
  }
}

function addPreviewOutput() {
  let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.ALL_PARAMETER_OK);
  if (canAddPreviewOutput.errorCode != 0) {
    console.error(TAG + "canAddPreviewOutput FAILED" + canAddPreviewOutput.errorCode);
    expect().assertFail();
  }
  console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
  if (canAddPreviewOutput.isAddPreviewOutput) {
    let ret = cameraObj.sessionAddPreviewOutput();
    if (ret != 0) {
      console.error(TAG + "addPreviewOutput FAILED" + ret);
      expect().assertFail();
    }
  } else {
    expect().assertFail();
  }
}

function openSecureCamera() {
  let ret = cameraObj.oHCameraInputOpenSecureCamera(Parameter_Setting.ALL_PARAMETER_OK);
  console.info(TAG+"openSecureCamera:"+ret.errorCode);
  console.info(TAG+"openSecureCamera secureSeqId:"+ret.secureSeqId);
  if (ret.secureSeqId == BigInt(0)) {
    console.error(TAG + "openSecureCamera: get secureSeqId failed.");
  }
  if (ret.errorCode != 0) {
    console.error(TAG + "openSecureCamera FAILED " + ret.errorCode);
    expect().assertFail();
  }
}

function createPreviewOutputUsedInPreconfig() {
  let canPreconfig = cameraObj.oHCaptureSessionCanPreconfig(Camera_PreconfigType.PRECONFIG_720P,
    Parameter_Setting.ALL_PARAMETER_OK);
  if (canPreconfig.errorCode != 0) {
    expect().assertFail();
  }
  console.info(TAG+"CanPreconfig: "+canPreconfig.canPreconfig);
  if (canPreconfig.canPreconfig) {
    cameraObj.oHCaptureSessionPreconfig(Camera_PreconfigType.PRECONFIG_720P, Parameter_Setting.ALL_PARAMETER_OK);
    cameraObj.oHCameraManagerCreatePreviewOutputUsedInPreconfig(Parameter_Setting.ALL_PARAMETER_OK);
  } else {
    createPreviewOutput();
  }
}

function releaseCamera() {
  let ret = cameraObj.releaseCamera();
  if (ret != 0) {
    console.error(TAG + "releaseCamera FAILED");
    expect().assertFail();
  }
}

export default function SecureCameraErrorCodeTest() {
  describe('SecureCameraErrorCodeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      await getPermissions1();
      await driveFn();
      await getPermissions2();
      await driveFn();
      await getPhotoReceiverSurface();
      await sleep(10000);
      done();
    })
    beforeEach(() => {
      getCameraManagerInstance();
      getSupportedCamerasInstance();
      createCaptureSession();
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (done: Function) => {
        releaseCamera();
        await sleep(300);
        done();
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    
    /**
     * @tc.name   testOHCaptureSessionAddSecureOutput0200
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionAddSecureOutput0200
     * @tc.desc   Test OH_CaptureSession_AddSecureOutput in abnormal condition, the first parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCaptureSessionAddSecureOutput0200', Level.LEVEL0, () => {
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.SET_CAMERA_FRONT_FOR_SECURE_PHOTO);
      console.info(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG+"SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        setSessionMode();
        getSupportedCameraOutputCapabilityWithSceneMode();
        createPreviewOutput();
        createCameraInput();
        openSecureCamera();
        sessionBeginConfig();
        addInput();
        addPreviewOutput();
        let ret = cameraObj.oHCaptureSessionAddSecureOutput(Parameter_Setting.FIRST_PARAMETER_ERROR);
        console.info(TAG+"testOHCaptureSessionAddSecureOutput0200:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG+"testOHCaptureSessionAddSecureOutput0200 end");
    })
    /**
     * @tc.name   testOHCaptureSessionAddSecureOutput0300
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionAddSecureOutput0300
     * @tc.desc   Test OH_CaptureSession_AddSecureOutput in abnormal condition, the second parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCaptureSessionAddSecureOutput0300', Level.LEVEL0, () => {
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.SET_CAMERA_FRONT_FOR_SECURE_PHOTO);
      console.info(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG+"SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        setSessionMode();
        getSupportedCameraOutputCapabilityWithSceneMode();
        createPreviewOutput();
        createCameraInput();
        openSecureCamera();
        sessionBeginConfig();
        addInput();
        addPreviewOutput();
        let ret = cameraObj.oHCaptureSessionAddSecureOutput(Parameter_Setting.SECOND_PARAMETER_ERROR);
        console.info(TAG+"testOHCaptureSessionAddSecureOutput0300:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG+"testOHCaptureSessionAddSecureOutput0300 end");
    })
    /**
     * @tc.name   testOHCaptureSessionAddSecureOutput0500
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionAddSecureOutput0500
     * @tc.desc   Test OH_CaptureSession_AddSecureOutput in abnormal condition, the first parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCaptureSessionAddSecureOutput0500', Level.LEVEL0, () => {
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.SET_CAMERA_FRONT_FOR_SECURE_PHOTO);
      console.info(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG+"SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        setSessionMode();
        getSupportedCameraOutputCapabilityWithSceneMode();
        createPreviewOutputUsedInPreconfig();
        createCameraInput();
        openSecureCamera();
        sessionBeginConfig();
        addInput();
        addPreviewOutput();
        let ret = cameraObj.oHCaptureSessionAddSecureOutput(Parameter_Setting.FIRST_PARAMETER_ERROR);
        console.info(TAG+"testOHCaptureSessionAddSecureOutput0500:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG+"testOHCaptureSessionAddSecureOutput0500 end");
    })
    /**
     * @tc.name   testOHCaptureSessionAddSecureOutput0600
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionAddSecureOutput0600
     * @tc.desc   Test OH_CaptureSession_AddSecureOutput in abnormal condition, the second parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCaptureSessionAddSecureOutput0600', Level.LEVEL0, () => {
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.SET_CAMERA_FRONT_FOR_SECURE_PHOTO);
      console.info(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG+"SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        setSessionMode();
        getSupportedCameraOutputCapabilityWithSceneMode();
        createPreviewOutputUsedInPreconfig();
        createCameraInput();
        openSecureCamera();
        sessionBeginConfig();
        addInput();
        addPreviewOutput();
        let ret = cameraObj.oHCaptureSessionAddSecureOutput(Parameter_Setting.SECOND_PARAMETER_ERROR);
        console.info(TAG+"testOHCaptureSessionAddSecureOutput0600:"+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG+"testOHCaptureSessionAddSecureOutput0600 end");
    })
    /**
     * @tc.name   testOHCaptureSessionAddSecureOutput0700
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionAddSecureOutput0700
     * @tc.desc   Test OH_CaptureSession_AddSecureOutput in abnormal condition, scene mode is NORMAL_PHOTO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCaptureSessionAddSecureOutput0700', Level.LEVEL0, () => {
      getSupportedCameraOutputCapability();
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      console.log(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (supportedSceneModes.isNormalPhoto) {
        setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
        setSessionMode();
        createPreviewOutputUsedInPreconfig();
        createCameraInput();
        openSecureCamera();
        sessionBeginConfig();
        addInput();
        addPreviewOutput();
        let ret = cameraObj.oHCaptureSessionAddSecureOutput(0);
        console.log(TAG+"testOHCaptureSessionAddSecureOutput0700:"+ret);
        expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
      }
      console.log(TAG+"testOHCaptureSessionAddSecureOutput0700 end");
    })
    /**
     * @tc.name   testOHCaptureSessionAddSecureOutput0800
     * @tc.number SUB_MULTIMEIDA_OHCAMERANDK_OHCaptureSessionAddSecureOutput0800
     * @tc.desc   Test OH_CaptureSession_AddSecureOutput in abnormal condition, scene mode is NORMAL_VIDEO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCaptureSessionAddSecureOutput0800', Level.LEVEL0, () => {
      getSupportedCameraOutputCapability();
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      console.log(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (supportedSceneModes.isNormalVideo) {
        setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
        setSessionMode();
        createPreviewOutputUsedInPreconfig();
        createCameraInput();
        openSecureCamera();
        sessionBeginConfig();
        addInput();
        addPreviewOutput();
        let ret = cameraObj.oHCaptureSessionAddSecureOutput(0);
        console.log(TAG+"testOHCaptureSessionAddSecureOutput0800:"+ret);
        expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
      }
      console.log(TAG+"testOHCaptureSessionAddSecureOutput0800 end");
    })
    /**
     * @tc.name   testOHCameraInputOpenSecureCamera0200
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraInputOpenSecureCamera0200
     * @tc.desc   Test OH_CameraInput_OpenSecureCamera in abnormal condition, the first parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraInputOpenSecureCamera0200', Level.LEVEL0, () => {
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.SET_CAMERA_FRONT_FOR_SECURE_PHOTO);
      console.info(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG+"SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        setSessionMode();
        getSupportedCameraOutputCapabilityWithSceneMode();
        createPreviewOutput();
        createCameraInput();
        let ret = cameraObj.oHCameraInputOpenSecureCamera(Parameter_Setting.FIRST_PARAMETER_ERROR);
        console.info(TAG+"testOHCameraInputOpenSecureCamera0200:"+ret.errorCode);
        expect(ret.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG+"testOHCameraInputOpenSecureCamera0200 end");
    })
    /**
     * @tc.name   testOHCameraInputOpenSecureCamera0300
     * @tc.number SUB_MULTIMEIDA_OHCAMWEANDK_OHCameraInputOpenSecureCamera0300
     * @tc.desc   Test OH_CameraInput_OpenSecureCamera in abnormal condition, the second parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHCameraInputOpenSecureCamera0300', Level.LEVEL0, () => {
      let supportedSceneModes = getSupportedSceneModes(Parameter_Setting.SET_CAMERA_FRONT_FOR_SECURE_PHOTO);
      console.info(TAG+"getSupportedSceneModesSize is called. sceneModesSize is "+supportedSceneModes.sceneModesSize);
      if (!supportedSceneModes.isSecurePhoto) {
        console.error(TAG+"SECURE_PHOTO is not supported");
        expect(supportedSceneModes.isSecurePhoto).assertEqual(false);
      } else {
        setSceneMode(Camera_SceneMode.SECURE_PHOTO);
        setSessionMode();
        getSupportedCameraOutputCapabilityWithSceneMode();
        createPreviewOutput();
        createCameraInput();
        let ret = cameraObj.oHCameraInputOpenSecureCamera(Parameter_Setting.SECOND_PARAMETER_ERROR);
        console.info(TAG+"testOHCameraInputOpenSecureCamera0300:"+ret.errorCode);
        expect(ret.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG+"testOHCameraInputOpenSecureCamera0300 end");
    })
  })
}