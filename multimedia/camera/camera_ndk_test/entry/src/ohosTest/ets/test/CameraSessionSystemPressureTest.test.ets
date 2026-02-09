/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import cameraObj from 'libentry.so';
import image from '@ohos.multimedia.image';
import { Camera_SceneMode, Parameter_Setting } from './Constants';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import display from '@ohos.display';
import { abilityAccessCtrl, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';
import { GlobalThis } from './Constants';
 
const TAG = "CameraXts CameraSessionSystemPressureLevelTest: ";
const CAMERA_OK = 0;
const CAMERA_INVALID_ARGUMENT = 7400101;
 
let receiver: image.ImageReceiver;
 
function getCameraManagerInstance() {
    console.info(TAG + 'mSurfaceId : ' + GlobalThis.getInstance().getValue());
    let ret = cameraObj.initCamera(GlobalThis.getInstance().getValue());
    console.info(TAG + 'initCamera : ' + ret);
    if (ret != 0) {
      console.error(TAG + "getCameraManager FAILED");
      expect().assertFail();
    }
  }
  
  function createCaptureSession() {
    console.info(TAG + "createCaptureSession start.");
    let ret = cameraObj.createSession();
    if (ret != 0) {
      console.error(TAG + "createCaptureSession FAILED");
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
    cameraObj.cameraInputOpen();
  }
  
  function getSupportedCamerasInstance() {
    let cameraInfo = cameraObj.getSupportedCameras();
    if (isEmpty(cameraInfo)) {
      console.error(TAG + "getSupportedCamerasInstance FAILED");
      expect().assertFail();
    }
  }
  
  function getSupportedCameraOutputCapability() {
    let cameraOutputCapability = cameraObj.getSupportedOutputCapability();
    console.info(TAG + 'cameraOutputCapability[0] = ' + cameraOutputCapability.previewProfilesSize);
    console.info(TAG + 'cameraOutputCapability[1] = ' + cameraOutputCapability.photoProfilesSize);
    console.info(TAG + 'cameraOutputCapability[2] = ' + cameraOutputCapability.videoProfilesSize);
    console.info(TAG + 'cameraOutputCapability[3] = ' + cameraOutputCapability.metadataProfilesSize);
    return true;
  }
  
  function createPreviewOutput() {
    let ret = cameraObj.createPreviewOutput();
    if (ret != 0) {
      console.error(TAG + "createPreviewOutput FAILED");
      expect().assertFail();
    }
  }
  
  function sessionFlow() {
    let begin = cameraObj.sessionBegin();
    if (begin != 0) {
      console.error(TAG + "beginConfig FAILED");
      expect().assertFail();
    }
  
    let canAddInput = cameraObj.oHCaptureSessionCanAddInput(Parameter_Setting.ALL_PARAMETER_OK);
    if (canAddInput.errorCode != 0) {
      console.error(TAG + "CanAddInput FAILED");
      expect().assertFail();
    }
    console.info(TAG + "canAddInput: " + canAddInput.isAddInput);
  
    if (canAddInput.isAddInput) {
      let addInput = cameraObj.sessionAddInput();
      if (addInput != 0) {
      console.error(TAG + "addInput FAILED");
        expect().assertFail();
      }
    } else {
      expect().assertFail();
    }
  
    let canAddPreviewOutput = cameraObj.oHCaptureSessionCanAddPreviewOutput(Parameter_Setting.ALL_PARAMETER_OK);
    if (canAddPreviewOutput.errorCode != 0) {
      console.error(TAG + "CanAddPreviewOutput FAILED");
      expect().assertFail();
    }
    console.info(TAG + "canAddPreviewOutput: " + canAddPreviewOutput.isAddPreviewOutput);
  
    if (canAddPreviewOutput.isAddPreviewOutput) {
      let addPreviewOutput = cameraObj.sessionAddPreviewOutput();
      if (addPreviewOutput != 0) {
        console.error(TAG + "addPreviewOutput FAILED");
        expect().assertFail();
      }
    } else {
      expect().assertFail();
    }
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
  
  function sleep1(ms: number) {
    return new Promise<number>(resolve => setTimeout(resolve, ms));
  }
  
  let driveFn = async () => {
    let dr = Driver.create();
    await sleep1(500);
    let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
    await sleep1(500);
    await power?.click();
    await sleep1(500);
  }
  
  function sleep(ms: number): Promise<void> {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
  
  function isEmpty(data: cameraObj.cameraInfo | number) {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }
  
  function releaseCamera() {
    let ret = cameraObj.releaseCamera();
    if (ret != 0) {
      console.error(TAG + "releaseCamera FAILED");
      expect().assertFail();
    }
  }
  
  function setSessionMode() {
    let ret = cameraObj.oHCaptureSessionSetSessionMode(Parameter_Setting.ALL_PARAMETER_OK);
    if (ret != 0) {
      console.error(TAG + "setSessionMode FAILED");
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
 
  export default function CameraSessionSystemPressureLevelTest() {
    describe('CameraSessionSystemPressureLevelTest', () => {
        console.info(TAG + '----------CameraSessionSystemPressureLevelTest--------------');
    beforeAll(async (done: Function) => {
      await sleep(3000);
      await getPermissions1();
      await driveFn();
      await getPermissions2();
      await driveFn();
      getCameraManagerInstance();
      createCaptureSession();
      getSupportedCamerasInstance();
      getSupportedCameraOutputCapability();
      getSupportedSceneModes(Parameter_Setting.ALL_PARAMETER_OK);
      setSceneMode(Camera_SceneMode.NORMAL_PHOTO);
      setSessionMode();
      createPreviewOutput();
      createCameraInput();
      sessionFlow();
      await sleep(1000);
      done();
      console.info(TAG + 'beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      releaseCamera();
      console.info('afterAll case');
    });
 
    /**
     * @tc.name   testOHSessionRegisterSystempressureLevelTest100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OHSessionRegisterSystemPressureLevelTest100
     * @tc.desc   Checks if register systemPressureLevel successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionRegisterSystempressureLevelTest100', Level.LEVEL2, async () => {
        console.info("--------------testOHSessionRegisterSystempressureLevelTest100--------------");
        let ret = cameraObj.sessionRegisterSystemPressureLevel(Parameter_Setting.ALL_PARAMETER_OK);
        if (ret != 0) {
          expect().assertFail();
        }
    })
 
    /**
     * @tc.name   testOHSessionRegisterSystempressureLevelTest200
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OHSessionRegisterSystemPressureLevelTest200
     * @tc.desc   Checks if register systemPressureLevel successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionRegisterSystempressureLevelTest200', Level.LEVEL2, async () => {
        console.info("--------------testOHSessionRegisterSystempressureLevelTest200--------------");
        let ret = cameraObj.sessionRegisterSystemPressureLevel(Parameter_Setting.FIRST_PARAMETER_ERROR);
        if (ret != 0) {
            expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
        }
    })
 
    /**
     * @tc.name   testOHSessionRegisterSystempressureLevelTest300
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OHSessionRegisterSystemPressureLevelTest300
     * @tc.desc   Checks if register systemPressureLevel successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionRegisterSystempressureLevelTest300', Level.LEVEL2, async () => {
        console.info("--------------testOHSessionRegisterSystempressureLevelTest300--------------");
        let ret = cameraObj.sessionRegisterSystemPressureLevel(Parameter_Setting.SECOND_PARAMETER_ERROR);
        if (ret != 0) {
            expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
        }
    })
 
    /**
     * @tc.name   testOHSessionUnregisterSystempressureLevelTest100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OHSessionUnregisterSystemPressureLevelTest100
     * @tc.desc   Checks if unregister systemPressureLevel successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionUnregisterSystempressureLevelTest100', Level.LEVEL2, async () => {
        console.info("--------------testOHSessionUnregisterSystempressureLevelTest100--------------");
        let ret = cameraObj.sessionUnregisterSystemPressureLevel(Parameter_Setting.ALL_PARAMETER_OK);
        if (ret != 0) {
            expect().assertFail();
        }
    })
 
    /**
     * @tc.name   testOHSessionUnregisterSystempressureLevelTest200
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OHSessionUnregisterSystemPressureLevelTest200
     * @tc.desc   Checks if unregister systemPressureLevel successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionUnregisterSystempressureLevelTest200', Level.LEVEL2, async () => {
        console.info("--------------testOHSessionUnregisterSystempressureLevelTest300--------------");
        let ret = cameraObj.sessionUnregisterSystemPressureLevel(Parameter_Setting.FIRST_PARAMETER_ERROR);
        if (ret != 0) {
            expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
        }
    })
 
    /**
     * @tc.name   testOHSessionUnregisterSystempressureLevelTest300
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OHSessionUnregisterSystemPressureLevelTest300
     * @tc.desc   Checks if unregister systemPressureLevel successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionUnregisterSystempressureLevelTest300', Level.LEVEL2, async () => {
        console.info("--------------testOHSessionUnregisterSystempressureLevelTest300--------------");
        let ret = cameraObj.sessionUnregisterSystemPressureLevel(Parameter_Setting.SECOND_PARAMETER_ERROR);
        if (ret != 0) {
            expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
        }
    })
    })
  }