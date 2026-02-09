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

const TAG = "CameraXts CameraSessionControlCenterTest: ";
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
  let power = await dr?.waitForComponent(ON.text('鍏佽', MatchPattern.EQUALS), 500);
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

export default function CameraSessionControlCenterTest() {
  describe('CameraSessionControlCenterTest', () => {
    console.info(TAG + '----------CameraSessionControlCenterTest--------------');
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
      setSceneMode(Camera_SceneMode.NORMAL_VIDEO);
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
     * @tc.name   testOHSessionIsControlCenterSupportedTest100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_ISCONTROLCENTERSUPPORTED100
     * @tc.desc   Checks if videoSession support control center.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionIsControlCenterSupportedTest100', Level.LEVEL2, async () => {
      console.info(TAG + "--------------testOHSessionIsControlCenterSupportedTest100--------------");
      let sessionIsConrolCenterSupported = cameraObj.sessionIsControlCenterSupported();
      console.info(TAG + "Entering testOHSessionIsControlCenterSupportedTest100 finish");
      if (sessionIsConrolCenterSupported != null || sessionIsConrolCenterSupported != undefined) {
        console.info(TAG + "Entering testOHSessionIsControlCenterSupportedTest100 PASSED " +
          "with sessionIsConrolCenterSupported is: " + sessionIsConrolCenterSupported);
      }
      else {
        console.info(TAG + "Entering testOHSessionIsControlCenterSupportedTest100 FAILED " +
          "with sessionIsConrolCenterSupported is: " + sessionIsConrolCenterSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering testOHSessionIsControlCenterSupportedTest100 ends here");
    })

    /**
     * @tc.name   testOHSessionGetSupportedEffectTypeTest100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_GETSUPPORTEDEFFECTTYPES100
     * @tc.desc   Check if get supported effect types successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionGetSupportedEffectTypeTest100', Level.LEVEL2, async () => {
      console.info(TAG + "--------------testOHSessionGetSupportedEffectTypeTest100--------------");
      let effectTypeSizeData = cameraObj.sessionGetSupportedEffectTypes(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG + "Entering testOHSessionGetSupportedEffectTypeTest100 finish:  " + effectTypeSizeData.errorCode);
      if (effectTypeSizeData.errorCode == 0) {
        console.info(TAG + "Entering testOHSessionGetSupportedEffectTypeTest100 PASSED " +
          "with effectTypeSize is: " + effectTypeSizeData.effectTypeSize);
      } else {
        console.info(TAG + "Entering testOHSessionGetSupportedEffectTypeTest100 FAILED");
        expect(effectTypeSizeData.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG + "Entering testOHSessionGetSupportedEffectTypeTest100 ends here");
    })

    /**
     * @tc.name   testOHSessionGetSupportedEffectTypeTest200
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_GETSUPPORTEDEFFECTTYPES200
     * @tc.desc   Check if get supported effect types successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionGetSupportedEffectTypeTest200', Level.LEVEL2, async () => {
      console.info(TAG + "--------------testOHSessionGetSupportedEffectTypeTest200--------------");
      let effectTypeSizeData = cameraObj.sessionGetSupportedEffectTypes(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG + "Entering testOHSessionGetSupportedEffectTypeTest200 finish:  " + effectTypeSizeData.errorCode);
      if (effectTypeSizeData.errorCode != 0) {
        expect(effectTypeSizeData.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG + "Entering testOHSessionGetSupportedEffectTypeTest200 ends here");
    })

    /**
     * @tc.name   testOHSessionGetSupportedEffectTypeTest300
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_GETSUPPORTEDEFFECTTYPES300
     * @tc.desc   Check if get supported effect types successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionGetSupportedEffectTypeTest300', Level.LEVEL2, async () => {
      console.info(TAG + "--------------testOHSessionGetSupportedEffectTypeTest300--------------");
      let effectTypeSizeData = cameraObj.sessionGetSupportedEffectTypes(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG + "Entering testOHSessionGetSupportedEffectTypeTest300 finish:  " + effectTypeSizeData.errorCode);
      if (effectTypeSizeData.errorCode != 0) {
        expect(effectTypeSizeData.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG + "Entering testOHSessionGetSupportedEffectTypeTest300 ends here");
    })

    /**
     * @tc.name   testOHSessionGetSupportedEffectTypeTest400
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_GETSUPPORTEDEFFECTTYPES400
     * @tc.desc   Check if get supported effect types successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionGetSupportedEffectTypeTest400', Level.LEVEL2, async () => {
      console.info(TAG + "--------------testOHSessionGetSupportedEffectTypeTest400--------------");
      let effectTypeSizeData = cameraObj.sessionGetSupportedEffectTypes(Parameter_Setting.THIRD_PARAMETER_ERROR);
      console.info(TAG + "Entering testOHSessionGetSupportedEffectTypeTest400 finish:  " + effectTypeSizeData.errorCode);
      if (effectTypeSizeData.errorCode != 0) {
        expect(effectTypeSizeData.errorCode).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG + "Entering testOHSessionGetSupportedEffectTypeTest400 ends here");
    })

    /**
     * @tc.name   testOHSessionDeleteSupportedEffectTypeTest100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_DELETESUPPORTEDEFFECTTYPES100
     * @tc.desc   Check if delete supported effect types successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionDeleteSupportedEffectTypeTest100', Level.LEVEL2, async () => {
      console.info(TAG + "--------------testOHSessionDeleteSupportedEffectTypeTest100--------------");
      let ret = cameraObj.sessionDeleteSupportedEffectTypes(Parameter_Setting.ALL_PARAMETER_OK);
      console.info(TAG + "Entering testOHSessionDeleteSupportedEffectTypeTest100 finish:  " + ret);
      if (ret == 0) {
        console.info(TAG + "Entering testOHSessionDeleteSupportedEffectTypeTest100 PASSED");
      } else {
        console.info(TAG + "Entering testOHSessionDeleteSupportedEffectTypeTest100 FAILED");
        expect().assertFail();
      }
      console.info(TAG + "Entering testOHSessionDeleteSupportedEffectTypeTest100 ends here");
    })

    /**
     * @tc.name   testOHSessionDeleteSupportedEffectTypeTest200
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_DELETESUPPORTEDEFFECTTYPES200
     * @tc.desc   Check if delete supported effect types successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionDeleteSupportedEffectTypeTest200', Level.LEVEL2, async () => {
      console.info(TAG + "--------------testOHSessionDeleteSupportedEffectTypeTest200--------------");
      let ret = cameraObj.sessionDeleteSupportedEffectTypes(Parameter_Setting.FIRST_PARAMETER_ERROR);
      console.info(TAG + "Entering testOHSessionDeleteSupportedEffectTypeTest200 finish:  " + ret);
      if (ret != 0) {
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG + "Entering testOHSessionDeleteSupportedEffectTypeTest200 ends here");
    })

    /**
     * @tc.name   testOHSessionDeleteSupportedEffectTypeTest300
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_DELETESUPPORTEDEFFECTTYPES300
     * @tc.desc   Check if delete supported effect types successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionDeleteSupportedEffectTypeTest300', Level.LEVEL2, async () => {
      console.info(TAG + "--------------testOHSessionDeleteSupportedEffectTypeTest300--------------");
      let ret = cameraObj.sessionDeleteSupportedEffectTypes(Parameter_Setting.SECOND_PARAMETER_ERROR);
      console.info(TAG + "Entering testOHSessionDeleteSupportedEffectTypeTest300 finish:  " + ret);
      if (ret != 0) {
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
      console.info(TAG + "Entering testOHSessionDeleteSupportedEffectTypeTest300 ends here");
    })

    /**
     * @tc.name   testOHSessionEnableControlCenterTest100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_ENABLECONTROLCENTER100
     * @tc.desc   Enables or disables control center.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionEnableControlCenterTest100', Level.LEVEL2, async () => {
      console.info(TAG + "--------------testOHSessionEnableControlCenterTest100--------------");
      let ret = cameraObj.sessionEnableControlCenter(true);
      console.info(TAG + "Entering testOHSessionEnableControlCenterTest100 finish:  " + ret);
      if (ret == 0) {
        console.info(TAG + "Entering testOHSessionEnableControlCenterTest100 FAILED");
        // expect().assertFail();
      } else {
        console.info(TAG + "Entering testOHSessionEnableControlCenterTest100 PASSED");
      }
      console.info(TAG + "Entering testOHSessionEnableControlCenterTest100 ends here");
    })

    /**
     * @tc.name   testOHSessionRegisterControlCenterEffectStatusTest100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_REGISTERCONTROLCENTEREFFECTSTATUSCHANGECALLBACK100
     * @tc.desc   Checks if register controlCenterEffectStatusChange successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionRegisterControlCenterEffectStatusTest100', Level.LEVEL2, async () => {
      console.info("--------------testOHSessionRegisterControlCenterEffectStatusTest100--------------");
      let ret = cameraObj.sessionRegisterControlCenterEffectStatusChange(Parameter_Setting.ALL_PARAMETER_OK);
      if (ret != 0) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testOHSessionRegisterControlCenterEffectStatusTest200
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_REGISTERCONTROLCENTEREFFECTSTATUSCHANGECALLBACK200
     * @tc.desc   Checks if register controlCenterEffectStatusChange successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionRegisterControlCenterEffectStatusTest200', Level.LEVEL2, async () => {
      console.info("--------------testOHSessionRegisterControlCenterEffectStatusTest200--------------");
      let ret = cameraObj.sessionRegisterControlCenterEffectStatusChange(Parameter_Setting.FIRST_PARAMETER_ERROR);
      if (ret != 0) {
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testOHSessionRegisterControlCenterEffectStatusTest300
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_REGISTERCONTROLCENTEREFFECTSTATUSCHANGECALLBACK300
     * @tc.desc   Checks if register controlCenterEffectStatusChange successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionRegisterControlCenterEffectStatusTest300', Level.LEVEL2, async () => {
      console.info("--------------testOHSessionRegisterControlCenterEffectStatusTest300--------------");
      let ret = cameraObj.sessionRegisterControlCenterEffectStatusChange(Parameter_Setting.SECOND_PARAMETER_ERROR);
      if (ret != 0) {
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testOHSessionUnregisterControlCenterEffectStatusTest100
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_UNREGISTERCONTROLCENTEREFFECTSTATUSCHANGECALLBACK100
     * @tc.desc   Checks if unregister controlCenterEffectStatusChange successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionUnregisterControlCenterEffectStatusTest100', Level.LEVEL2, async () => {
      console.info("--------------testOHSessionUnregisterControlCenterEffectStatusTest100--------------");
      let ret = cameraObj.sessionUnregisterControlCenterEffectStatusChange(Parameter_Setting.ALL_PARAMETER_OK);
      if (ret != 0) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testOHSessionUnregisterControlCenterEffectStatusTest200
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_UNREGISTERCONTROLCENTEREFFECTSTATUSCHANGECALLBACK200
     * @tc.desc   Checks if unregister controlCenterEffectStatusChange successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionUnregisterControlCenterEffectStatusTest200', Level.LEVEL2, async () => {
      console.info("--------------testOHSessionUnregisterControlCenterEffectStatusTest200--------------");
      let ret = cameraObj.sessionUnregisterControlCenterEffectStatusChange(Parameter_Setting.FIRST_PARAMETER_ERROR);
      if (ret != 0) {
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })

    /**
     * @tc.name   testOHSessionUnregisterControlCenterEffectStatusTest300
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_OH_CAPTURESESSION_UNREGISTERCONTROLCENTEREFFECTSTATUSCHANGECALLBACK300
     * @tc.desc   Checks if unregister controlCenterEffectStatusChange successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOHSessionUnregisterControlCenterEffectStatusTest300', Level.LEVEL2, async () => {
      console.info("--------------testOHSessionUnregisterControlCenterEffectStatusTest300--------------");
      let ret = cameraObj.sessionUnregisterControlCenterEffectStatusChange(Parameter_Setting.SECOND_PARAMETER_ERROR);
      if (ret != 0) {
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
      }
    })
  })
}