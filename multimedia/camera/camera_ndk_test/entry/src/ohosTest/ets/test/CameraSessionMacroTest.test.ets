/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import cameraObj from 'libentry.so';
import { cameraInfo } from 'libentry.so';
import image from '@ohos.multimedia.image';
import deviceInfo from '@ohos.deviceInfo';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import fs from '@ohos.file.fs';
import featureAbility from '@ohos.ability.featureAbility'
import { Camera_PreconfigType, Camera_SceneMode, Parameter_Setting, GlobalThis } from './Constants';

const TAG = "CameraXts CameraSessionMacroTest: ";

let mPhotoSurface: string;
let fdNumber: number;
const CAMERA_OK = 0;
const CAMERA_INVALID_ARGUMENT = 7400101;
const CAMERA_OPERATION_NOT_ALLOWED = 7400102;
const CAMERA_SESSION_NOT_CONFIG = 7400103;
let mEnableCheckInvalidFocusPoint = false;
let receiver: image.ImageReceiver;

function isEmpty(data: cameraInfo) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

async function closeFd() {
  console.info('case come in closeFd')
  if (fdNumber != null) {
    fs.closeSync(fdNumber);
  } else {
    console.info('[fs.closeSync] case fdNumber is null');
  }
}

async function getPhotoReceiverSurface() {
  console.log(TAG + 'Entering getPhotoReceiverSurface');
  receiver = image.createImageReceiver(640, 480, 4, 8);
  console.log(TAG + 'before receiver check');
  if (receiver !== undefined) {
    console.log(TAG + 'Photo receiver is created successfully');
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.log(TAG + 'Photo receiver is created failed');
  }
  console.log(TAG + 'Exit getPhotoReceiverSurface');
}

async function releaseVideoReceiveSurface() {
  console.log(TAG + 'Entering releaseVideoReceiveSurface');
  await closeFd();

  console.log(TAG + 'Exit releaseVideoReceiveSurface');
}

function getCameraManagerInstance() {
  console.info(TAG + 'Enter getCameraManagerInstance');
  console.info(TAG + 'mSurfaceId : ' + GlobalThis.getInstance().getValue());
  let ret = cameraObj.initCamera(GlobalThis.getInstance().getValue());
  if (ret != 0) {
    console.info(TAG + "getCameraManager FAILED");
    expect().assertFail();
  }
  console.info(TAG + 'Exit getCameraManagerInstance');
  return true;
}

function getCameraSupportDevicesArray() {
  console.info('Enter getCameraSupportDevicesArray');

  let camera = cameraObj.getSupportedCameras();
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraPosition);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.connectionType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraId);
  if (isEmpty(camera)) {
    console.info(TAG + "getSupportedCameras FAILED");
    expect().assertFail();
  }

  console.info('Exit getCameraSupportDevicesArray');
  return true;
}

function createCameraSessionInstance() {
  console.info('Enter createCameraSessionInstance');
  try {
    cameraObj.createSession();
  }
  catch {
    console.info('createCaptureSession FAILED');
    expect().assertFail();
  }
  let ret = cameraObj.sessionBegin();
  if (ret != 0) {
    console.info(TAG + "sessionBegin FAILED");
    expect().assertFail();
  }
  console.info('Exit createCameraSessionInstance');
  return true;
}

async function releaseCameraSessionInstance() {
  await cameraObj.sessionRelease();
}

async function createInput() {
  console.info('Enter createInput');
  let ret = cameraObj.createCameraInput();

  if (ret != 0) {
    console.info(TAG + "createCameraInput FAILED");
    expect().assertFail();
    return false;
  }

  await cameraObj.cameraInputOpen();
  console.info('Exit createInput');
  return true;
}

async function releaseInput() {
  console.info('Enter releaseInput');
  await cameraObj.cameraInputClose();
  console.info('Exit releaseInput');
  return true;
}

function createOutput() {
  console.info(TAG + 'Enter createOutput');

  let cameraOutputCapability = cameraObj.getSupportedOutputCapability();
  console.info(TAG + 'cameraOutputCapability[0] = ' + cameraOutputCapability.previewProfilesSize);
  console.info(TAG + 'cameraOutputCapability[1] = ' + cameraOutputCapability.photoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[2] = ' + cameraOutputCapability.videoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[3] = ' + cameraOutputCapability.metadataProfilesSize);
  let mPreviewOutput = cameraObj.createPreviewOutput();
  if (mPreviewOutput != 0) {
    console.info(TAG + "createPreviewOutput FAILED");
    expect().assertFail();
  }
  console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
  let mPhotoOutput = cameraObj.createPhotoOutput(mPhotoSurface);
  if (mPhotoOutput != 0) {
    console.info(TAG + "mPhotoOutput FAILED");
    expect().assertFail();
  }
  console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
  console.info('Exit createOutputs');
  return true;
}

async function releaseOutput() {
  console.info('Enter releaseOutput');

  await cameraObj.previewOutputRelease();
  await cameraObj.photoOutputRelease();
  console.info('Exit releaseOutput');

  return true;
}

async function startCameraSession() {
  console.info(TAG + "Enter startCameraSession");

  await createInput();
  createOutput();

  let ret = cameraObj.sessionBegin();
  if (ret != 0) {
    console.info(TAG + "sessionBegin had been execute, please check your operation");
  }
  let addInput = cameraObj.sessionAddInput();
  if (addInput != 0) {
    console.info(TAG + "addInput FAILED");
    expect().assertFail();
  }
  let addPreviewOutput = cameraObj.sessionAddPreviewOutput();
  if (addPreviewOutput != 0) {
    console.info(TAG + "addPreviewOutput FAILED");
    expect().assertFail();
  }
  let addPhotoOutput = cameraObj.sessionAddPhotoOutput();
  if (addPhotoOutput != 0) {
    console.info(TAG + "addPhotoOutput FAILED");
    expect().assertFail();
  }

  let commitConfig = cameraObj.sessionCommitConfig();
  if (commitConfig != 0) {
    console.info(TAG + "CommitConfig FAILED");
    expect().assertFail();
  }
  console.info(TAG + "Exit startCameraSession");

  return true;
}

async function stopCameraSession() {
  console.info(TAG + "Enter stopCameraSession");

  let ret = cameraObj.sessionStop();
  if (ret != 0) {
    console.info(TAG + "sessionStop FAILED");
    expect().assertFail();
  }
  cameraObj.sessionRemovePreviewOutput();
  cameraObj.sessionRemovePhotoOutput();
  await releaseInput();
  await releaseOutput();

  console.info(TAG + "Exit stopCameraSession");

  return true;
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

function createPreviewOutput() {
  let ret = cameraObj.createPreviewOutput();
  if (ret != 0) {
    console.error(TAG + "createPreviewOutput FAILED");
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

function getSupportedCameraOutputCapability() {
  let cameraOutputCapability = cameraObj.getSupportedOutputCapability();
  console.info(TAG + 'cameraOutputCapability[0] = ' + cameraOutputCapability.previewProfilesSize);
  console.info(TAG + 'cameraOutputCapability[1] = ' + cameraOutputCapability.photoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[2] = ' + cameraOutputCapability.videoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[3] = ' + cameraOutputCapability.metadataProfilesSize);
  return true;
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

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function CameraSessionMacroTest() {

  describe('CameraSessionMacroTest', () => {
    console.info(TAG + '----------CameraSessionMacroTest--------------');
    beforeAll(async (done: Function) => {
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.sessionCommitConfig();
      await sleep(10000);
      done();
      console.info('Device type = ' + deviceInfo.deviceType);
      console.info('beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async (done: Function) => {
      await sleep(1000);
      done();
      console.info('afterEach case');
    });
    afterAll(() => {
      stopCameraSession();
      releaseVideoReceiveSurface();
      releaseCameraSessionInstance();
      console.info('afterAll case');
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_MACRO_SUPPORT_PROMISE_001
     * @tc.name      : Check capture session support macro  with promise 
     * @tc.desc      : Check capture session support macro  with promise 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_MACRO_SUPPORT_PROMISE_001', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_MACRO_SUPPORT_PROMISE_001--------------");
      let sessionIsMacroSupported = cameraObj.sessionIsMacroSupported(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_MACRO_SUPPORT_PROMISE_001 finish");
      if (sessionIsMacroSupported.errorCode == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_MACRO_SUPPORT_PROMISE_001 PASSED with sessionIsMacroSupported.isMacroSupported is: " + sessionIsMacroSupported.isMacroSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_MACRO_SUPPORT_PROMISE_001 FAILED with sessionIsMacroSupported.errorCode is: " + sessionIsMacroSupported.errorCode);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_MACRO_SUPPORT_PROMISE_001 ends here");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_001
     * @tc.name      : Check capture session enable macro  with promise enable true
     * @tc.desc      : Check capture session enable macro  with promise enable true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_001', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_001--------------");
      let sessionIsMacroSupported = cameraObj.sessionIsMacroSupported(0);
      if (sessionIsMacroSupported.isMacroSupported) {
        let ret = cameraObj.sessionEnableMacro(0,true);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_001 ret is "+ ret);
        expect(ret).assertEqual(CAMERA_OK);
    }
    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_001 ends here");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_002
     * @tc.name      : Check capture session enable macro  with promise enable false
     * @tc.desc      : Check capture session enable macro  with promise enable false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_002', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_002--------------");
      let sessionIsMacroSupported = cameraObj.sessionIsMacroSupported(0);
      if (sessionIsMacroSupported.isMacroSupported) {
        let ret = cameraObj.sessionEnableMacro(0,false);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_002 ret is "+ ret);
        expect(ret).assertEqual(CAMERA_OK);
    }
    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_002 ends here");
    });
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_003
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_003 
     * @tc.desc      : Check capture session enable macro  with promise 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_003', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_003--------------");
      let sessionIsMacroSupported = cameraObj.sessionIsMacroSupported(0);
      if (!sessionIsMacroSupported.isMacroSupported) {
        let ret = cameraObj.sessionEnableMacro(0,false);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_003 ret is "+ ret);
        expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
      }
    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_003 ends here");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_004
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_004 
     * @tc.desc      : Check capture session enable macro  with promise 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_004', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_004--------------");
      let sessionIsMacroSupported = cameraObj.sessionIsMacroSupported(0);
      if (!sessionIsMacroSupported.isMacroSupported) {
        let ret = cameraObj.sessionEnableMacro(0,true);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_004 ret is "+ ret);
        expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
    }
    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_004 ends here");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_005
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_005 
     * @tc.desc      : Check capture session enable macro  with promise 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_005', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_005--------------");
      let sessionIsMacroSupported = cameraObj.sessionIsMacroSupported(0);
      if (sessionIsMacroSupported.isMacroSupported) {
        let ret = cameraObj.sessionEnableMacro(1,true);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_005 ret is "+ ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    }
    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_MACRO_PROMISE_005 ends here");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_MACRO_STATUS_PROMISE_001
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_SESSION_MACRO_STATUS_PROMISE_001
     * @tc.desc      : Check capture session enable macro  with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_MACRO_STATUS_PROMISE_001', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_SESSION_MACRO_STATUS_PROMISE_001--------------");
      let ret = cameraObj.getMacroStatusChangeTest();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_MACRO_STATUS_PROMISE_001 ret is "+ ret);
      expect(ret).assertEqual(CAMERA_OK);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_MACRO_STATUS_PROMISE_001 ends here");
    });
  })
}