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

const TAG = "CameraXts CameraSessionAutoDeviceSwitchTest: ";
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

export default function CameraSessionAutoDeviceSwitchTest() {
  describe('CameraSessionAutoDeviceSwitchTest', () => {
    console.info(TAG + '----------CameraSessionAutoDeviceSwitchTest--------------');
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionIsAutoDeviceSwitchSupportedTest100
     * @tc.name      : testOHSessionIsAutoDeviceSwitchSupportedTest100
     * @tc.desc      : Checks if the automatic switchover device is supported.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionIsAutoDeviceSwitchSupportedTest100', 2, async () => {
      console.info("--------------testOHSessionIsAutoDeviceSwitchSupportedTest100--------------");
      let isFoldable = display.isFoldable();
      console.info(TAG + "testOHSessionIsAutoDeviceSwitchSupportedTest100 isFoldable:" + isFoldable);
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.isSupported != isFoldable || autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      console.info(TAG + "Entering testOHSessionIsAutoDeviceSwitchSupportedTest100 ends here");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionEnableAutoDeviceSwitchTest100
     * @tc.name      : testOHSessionEnableAutoDeviceSwitchTest100
     * @tc.desc      : Enables or disables the automatic switchover device.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionEnableAutoDeviceSwitchTest100', 2, async () => {
      console.info("--------------testOHSessionEnableAutoDeviceSwitchTest100--------------");
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      if (autoSwitchSupportInfo.isSupported) {
        let ret = cameraObj.sessionEnableAutoDeviceSwitch(true);
        if (ret != 0) {
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering testOHSessionEnableAutoDeviceSwitchTest100 ends here");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionRegisterAutoDeviceSwitchCallbackTest100
     * @tc.name      : testOHSessionRegisterAutoDeviceSwitchCallbackTest100
     * @tc.desc      : Check whether the interception switchover is successful.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionRegisterAutoDeviceSwitchCallbackTest100', 2, async () => {
      console.info("--------------testOHSessionRegisterAutoDeviceSwitchCallbackTest100--------------");
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      if (autoSwitchSupportInfo.isSupported) {
        let ret = cameraObj.sessionEnableAutoDeviceSwitch(true);
        if (ret != 0) {
          expect().assertFail();
        }
        ret = cameraObj.sessionRegisterAutoDeviceSwitchStatusChange(Parameter_Setting.ALL_PARAMETER_OK);
        if (ret != 0) {
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering testOHSessionRegisterAutoDeviceSwitchCallbackTest100 ends here");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionRegisterAutoDeviceSwitchCallbackTest200
     * @tc.name      : testOHSessionRegisterAutoDeviceSwitchCallbackTest200
     * @tc.desc      : Check whether the interception switchover is successful.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionRegisterAutoDeviceSwitchCallbackTest200', 2, async () => {
      console.info("--------------testOHSessionRegisterAutoDeviceSwitchCallbackTest200--------------");
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      if (autoSwitchSupportInfo.isSupported) {
        let ret = cameraObj.sessionEnableAutoDeviceSwitch(true);
        if (ret != 0) {
          expect().assertFail();
        }
        ret = cameraObj.sessionRegisterAutoDeviceSwitchStatusChange(Parameter_Setting.FIRST_PARAMETER_ERROR);
        if (ret != 0) {
          expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
        }
      }
      console.info(TAG + "Entering testOHSessionRegisterAutoDeviceSwitchCallbackTest200 ends here");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionRegisterAutoDeviceSwitchCallbackTest300
     * @tc.name      : testOHSessionRegisterAutoDeviceSwitchCallbackTest300
     * @tc.desc      : Check whether the interception switchover is successful.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionRegisterAutoDeviceSwitchCallbackTest300', 2, async () => {
      console.info("--------------testOHSessionRegisterAutoDeviceSwitchCallbackTest300--------------");
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      if (autoSwitchSupportInfo.isSupported) {
        let ret = cameraObj.sessionEnableAutoDeviceSwitch(true);
        if (ret != 0) {
          expect().assertFail();
        }
        ret = cameraObj.sessionRegisterAutoDeviceSwitchStatusChange(Parameter_Setting.SECOND_PARAMETER_ERROR);
        if (ret != 0) {
          expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
        }
      }
      console.info(TAG + "Entering testOHSessionRegisterAutoDeviceSwitchCallbackTest300 ends here");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionUnregisterAutoDeviceSwitchCallbackTest100
     * @tc.name      : testOHSessionUnregisterAutoDeviceSwitchCallbackTest100
     * @tc.desc      : Check whether the interception switchover is successful.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionUnregisterAutoDeviceSwitchCallbackTest100', 2, async () => {
      console.info("--------------testOHSessionUnregisterAutoDeviceSwitchCallbackTest100--------------");
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      if (autoSwitchSupportInfo.isSupported) {
        let ret = cameraObj.sessionEnableAutoDeviceSwitch(true);
        if (ret != 0) {
          expect().assertFail();
        }
        ret = cameraObj.sessionUnregisterAutoDeviceSwitchStatusChange(Parameter_Setting.ALL_PARAMETER_OK);
        if (ret != 0) {
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering testOHSessionUnregisterAutoDeviceSwitchCallbackTest100 ends here");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionUnregisterAutoDeviceSwitchCallbackTest200
     * @tc.name      : testOHSessionUnregisterAutoDeviceSwitchCallbackTest200
     * @tc.desc      : Check whether the interception switchover is successful.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionUnregisterAutoDeviceSwitchCallbackTest200', 2, async () => {
      console.info("--------------testOHSessionUnregisterAutoDeviceSwitchCallbackTest200--------------");
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      if (autoSwitchSupportInfo.isSupported) {
        let ret = cameraObj.sessionEnableAutoDeviceSwitch(true);
        if (ret != 0) {
          expect().assertFail();
        }
        ret = cameraObj.sessionRegisterAutoDeviceSwitchStatusChange(Parameter_Setting.FIRST_PARAMETER_ERROR);
        if (ret != 0) {
          expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
        }
      }
      console.info(TAG + "Entering testOHSessionUnregisterAutoDeviceSwitchCallbackTest200 ends here");
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_OHSessionUnregisterAutoDeviceSwitchCallbackTest300
     * @tc.name      : testOHSessionUnregisterAutoDeviceSwitchCallbackTest300
     * @tc.desc      : Check whether the interception switchover is successful.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testOHSessionUnregisterAutoDeviceSwitchCallbackTest300', 2, async () => {
      console.info("--------------testOHSessionUnregisterAutoDeviceSwitchCallbackTest300--------------");
      let autoSwitchSupportInfo = cameraObj.sessionIsAutoDeviceSwitchSupported();
      if (autoSwitchSupportInfo.errorCode != 0) {
        expect().assertFail();
      }
      if (autoSwitchSupportInfo.isSupported) {
        let ret = cameraObj.sessionEnableAutoDeviceSwitch(true);
        if (ret != 0) {
          expect().assertFail();
        }
        ret = cameraObj.sessionRegisterAutoDeviceSwitchStatusChange(Parameter_Setting.SECOND_PARAMETER_ERROR);
        if (ret != 0) {
          expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
        }
      }
      console.info(TAG + "Entering testOHSessionUnregisterAutoDeviceSwitchCallbackTest300 ends here");
    })
  })
}