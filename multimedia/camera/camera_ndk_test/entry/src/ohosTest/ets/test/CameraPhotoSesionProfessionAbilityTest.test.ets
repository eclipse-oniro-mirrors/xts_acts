/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

const TAG = "CameraXts CameraPhotoSesionProfessionAbilityTest: ";

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
  cameraObj.oHCameraManagerSetSceneMode(0)
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
  ret = cameraObj.sessionStart();
  if (ret != 0) {
    console.info(TAG + "sessionStart FAILED");
    expect().assertFail();
  }
  console.info(TAG + "Exit startCameraSession");
  return true;
}


async function beginCameraSession() {
    console.info(TAG + "Enter beginCameraSession");
  
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
    return true;
}

async function CommitCameraSession() {
    console.info(TAG + "Enter CommitCameraSession");
    let commitConfig = cameraObj.sessionCommitConfig();
    if (commitConfig != 0) {
      console.info(TAG + "CommitConfig FAILED");
      expect().assertFail();
    }
    let ret = cameraObj.sessionStart();
    if (ret != 0) {
      console.info(TAG + "sessionStart FAILED");
      expect().assertFail();
    }
    console.info(TAG + "Exit CommitCameraSession");
    return true;
}



async function releaseOutputAndInput() {
    console.info(TAG + "Enter releaseOutputAndInput");
    await releaseInput();
    await releaseOutput();
    console.info(TAG + "Exit releaseOutputAndInput");
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

function getSupportedCameraOutputCapability() {
  let cameraOutputCapability = cameraObj.getSupportedOutputCapability();
  console.info(TAG + 'cameraOutputCapability[0] = ' + cameraOutputCapability.previewProfilesSize);
  console.info(TAG + 'cameraOutputCapability[1] = ' + cameraOutputCapability.photoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[2] = ' + cameraOutputCapability.videoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[3] = ' + cameraOutputCapability.metadataProfilesSize);
  return true;
}

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function CameraPhotoSesionProfessionAbilityTest() {

  describe('CameraPhotoSesionProfessionAbilityTest', () => {
    console.info(TAG + '----------CameraPhotoSesionProfessionAbilityTest--------------');
    beforeAll(async (done: Function) => {
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
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
      console.info('afterAll case');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_REGISTER_FLASH_STATE_CHANGE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_REGISTER_FLASH_STATE_CHANGE_CALLBACK_0100
     * @tc.desc   Check capture session Register Flash State Change Callback Errcode CAMERA_INVALID_ARGUMENT, capturesession is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_REGISTER_FLASH_STATE_CHANGE_CALLBACK_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_REGISTER_FLASH_STATE_CHANGE_CALLBACK_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHTestRegisterFlashStateChangeCallback(1);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_REGISTER_FLASH_STATE_CHANGE_CALLBACK_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_REGISTER_FLASH_STATE_CHANGE_CALLBACK_0100 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_REGISTER_FLASH_STATE_CHANGE_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_REGISTER_FLASH_STATE_CHANGE_CALLBACK_0200
     * @tc.desc   Check capture session Register Flash State Change Callback Errcode CAMERA_INVALID_ARGUMENT, CALLBACK is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_REGISTER_FLASH_STATE_CHANGE_CALLBACK_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_REGISTER_FLASH_STATE_CHANGE_CALLBACK_0200--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHTestRegisterFlashStateChangeCallback(2);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_REGISTER_FLASH_STATE_CHANGE_CALLBACK_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_REGISTER_FLASH_STATE_CHANGE_CALLBACK_0200 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_UNREGISTER_FLASH_STATE_CHANGE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_UNREGISTER_FLASH_STATE_CHANGE_CALLBACK_0100
     * @tc.desc   Check capture session UNRegister Flash State Change Callback Errcode CAMERA_INVALID_ARGUMENT, capturesession is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_UNREGISTER_FLASH_STATE_CHANGE_CALLBACK_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_UNREGISTER_FLASH_STATE_CHANGE_CALLBACK_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHTestRegisterFlashStateChangeCallback(1);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_UNREGISTER_FLASH_STATE_CHANGE_CALLBACK_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_UNREGISTER_FLASH_STATE_CHANGE_CALLBACK_0100 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_UNREGISTER_FLASH_STATE_CHANGE_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_UNREGISTER_FLASH_STATE_CHANGE_CALLBACK_0200
     * @tc.desc   Check capture session UNRegister Flash State Change Callback Errcode CAMERA_INVALID_ARGUMENT, CALLBACK is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_UNREGISTER_FLASH_STATE_CHANGE_CALLBACK_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_UNREGISTER_FLASH_STATE_CHANGE_CALLBACK_0200--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHTestRegisterFlashStateChangeCallback(2);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_UNREGISTER_FLASH_STATE_CHANGE_CALLBACK_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_UNREGISTER_FLASH_STATE_CHANGE_CALLBACK_0200 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0100
     * @tc.desc   Check capture session Is Exposure Metering Mode Supported CAMERA_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHIsExposureMeteringModeSupported(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0100 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0200
     * @tc.desc   Check capture session Is Exposure Metering Mode Supported Errcode CAMERA_INVALID_ARGUMENT, capturesession is null 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0200--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHIsExposureMeteringModeSupported(1);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0200 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0500
     * @tc.desc   Check capture session Is Exposure Metering Mode Supported Errcode CAMERA_SESSION_NOT_CONFIG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0500', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0500--------------");
      createCameraSessionInstance();
      await beginCameraSession();
      let ret = cameraObj.oHIsExposureMeteringModeSupported(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0500 ret is "+ret);
      expect(ret).assertEqual(CAMERA_SESSION_NOT_CONFIG)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_IS_EXPOSURE_METER_MODE_SUPPORTED_0500 ends here");
      await releaseOutputAndInput();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0100
     * @tc.desc   Check capture session Get Exposure Metering Mode CAMERA_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHGetExposureMeteringMode(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0100 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0200
     * @tc.desc   Check capture session Get Exposure Metering Mode Errcode CAMERA_INVALID_ARGUMENT, capturesession is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0200--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHGetExposureMeteringMode(1);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0200 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0300
     * @tc.desc   Check capture session Get Exposure Metering Mode Errcode CAMERA_INVALID_ARGUMENT, getExposureMeteringMode is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0300', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0300--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHGetExposureMeteringMode(2);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0300 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0300 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0400
     * @tc.desc   Check capture session Get Exposure Metering Mode Errcode CAMERA_SESSION_NOT_CONFIG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0400', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0400--------------");
      createCameraSessionInstance();
      await beginCameraSession();
      let ret = cameraObj.oHGetExposureMeteringMode(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0400 ret is "+ret);
      expect(ret).assertEqual(CAMERA_SESSION_NOT_CONFIG)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0400 ends here");
      await releaseOutputAndInput();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0500
     * @tc.desc   Check capture session Get Exposure Metering Mode Errcode CAMERA_OPERATION_NOT_ALLOWED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0500', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0500--------------");
      createCameraSessionInstance();
      let ret = cameraObj.oHGetExposureMeteringMode(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0500 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_EXPOSURE_METERING_MODE_0500 ends here");
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0100
     * @tc.desc   Check capture session Set Exposure Metering Mode CAMERA_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHSetExposureMeteringMode(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0100 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0200
     * @tc.desc   Check capture session Get Exposure Metering Mode Errcode CAMERA_INVALID_ARGUMENT, capturesession is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0200', Level.LEVEL0, async () => {
        console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0200--------------");
        createCameraSessionInstance();
        await startCameraSession();
        let ret = cameraObj.oHSetExposureMeteringMode(1);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0200 ret is "+ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0200 ends here");
        await stopCameraSession();
        await releaseCameraSessionInstance();
    });
   
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0300
     * @tc.desc   Check capture session Set Exposure Metering Mode Errcode CAMERA_SESSION_NOT_CONFIG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0300', Level.LEVEL0, async () => {
    console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0300--------------");
    createCameraSessionInstance();
    await beginCameraSession()
    let ret = cameraObj.oHSetExposureMeteringMode(0);
    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0300 ret is "+ret);
    expect(ret).assertEqual(CAMERA_SESSION_NOT_CONFIG)
    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_EXPOSURE_METERING_MODE_0300 ends here");
    await releaseOutputAndInput();
    await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0100
     * @tc.desc   Check capture session Get Supported ISO Range CAMERA_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHGetSupportedISORange(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0100 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0200
     * @tc.desc   Check capture session Get Supported ISO Range Errcode CAMERA_INVALID_ARGUMENT, capturesession is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0200--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHGetSupportedISORange(1);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0200 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0300
     * @tc.desc   Check capture session Get Supported ISO Range Errcode CAMERA_INVALID_ARGUMENT, minIsoValue is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0300', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0300--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHGetSupportedISORange(2);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0300 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0300 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0400
     * @tc.desc   Check capture session Get Supported ISO Range Errcode CAMERA_INVALID_ARGUMENT, maxIsoValue is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0400', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0400--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHGetSupportedISORange(3);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0400 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_SUPPORTED_ISO_RANGE_0400 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0100
     * @tc.desc   Check capture session Get ISO  CAMERA_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHgetIso(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0100 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0200
     * @tc.desc   Check capture session Get ISO Errcode CAMERA_INVALID_ARGUMENT, capturesession is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0200--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHgetIso(1);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0200 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0300
     * @tc.desc   Check capture session Get ISO Errcode CAMERA_SESSION_NOT_CONFIG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0300', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0300--------------");
      createCameraSessionInstance();
      await beginCameraSession();
      let ret = cameraObj.oHgetIso(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0300 ret is "+ret);
      expect(ret).assertEqual(CAMERA_SESSION_NOT_CONFIG)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0300 ends here");
      await releaseOutputAndInput();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0400
     * @tc.desc   Check capture session Get ISO Errcode CAMERA_OPERATION_NOT_ALLOWED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0400', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0400--------------");
      createCameraSessionInstance();
      let ret = cameraObj.oHgetIso(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0400 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_ISO_0400 ends here");
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0100
     * @tc.desc   Check capture session Set ISO  CAMERA_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0100--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHsetIso(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0100 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0200
     * @tc.desc   Check capture session Get ISO Errcode CAMERA_INVALID_ARGUMENT, capturesession is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0200--------------");
      createCameraSessionInstance();
      await startCameraSession();
      let ret = cameraObj.oHsetIso(1);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0200 ends here");
      await stopCameraSession();
      await releaseCameraSessionInstance();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0300
     * @tc.desc   Check capture session set ISO Errcode CAMERA_SESSION_NOT_CONFIG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0300', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0300--------------");
      createCameraSessionInstance();
      let ret = cameraObj.oHsetIso(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0300 ret is "+ret);
      expect(ret).assertEqual(CAMERA_SESSION_NOT_CONFIG)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_SET_ISO_0300 ends here");
      await releaseCameraSessionInstance();
    });
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0100
     * @tc.desc   Check capture session Delete Constituent CameraDevices CAMERA_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0100--------------");
      let ret = cameraObj.oHDeleteConstituentCameraDevices(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0100 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0200
     * @tc.desc   Check capture session Delete Constituent CameraDevices  Errcode CAMERA_INVALID_ARGUMENT ,logicalCamera is null 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0200--------------");
      let ret = cameraObj.oHDeleteConstituentCameraDevices(1);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0200 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0300
     * @tc.desc   Check capture session Delete Constituent CameraDevices  Errcode CAMERA_INVALID_ARGUMENT ,constituentCameras is null 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0300', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0300--------------");
      let ret = cameraObj.oHDeleteConstituentCameraDevices(2);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0300 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_DELETE_CONSTIUENT_CAMERADEVICES_0300 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0100
     * @tc.desc   Check capture session get lensfocal length CAMERA_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0100--------------");
      let ret = cameraObj.oHGetLensFocalLength(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0100 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0200
     * @tc.desc   Check capture session get lensfocal length  Errcode CAMERA_INVALID_ARGUMENT ,camera is null 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0200--------------");
      let ret = cameraObj.oHGetLensFocalLength(1);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0200 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0300
     * @tc.desc   Check capture session get lensfocal length  Errcode CAMERA_INVALID_ARGUMENT ,lensFocalLength is null 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0300', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0300--------------");
      let ret = cameraObj.oHGetLensFocalLength(2);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0300 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_LENSFOCAL_LENGTH_0300 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0100
     * @tc.desc   Check capture session get minimum focus distance CAMERA_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0100', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0100--------------");
      let ret = cameraObj.oHGetMinimumFocusDistance(0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0100 ret is "+ret);
      expect(ret).assertEqual(CAMERA_OK)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0100 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0200
     * @tc.desc   Check capture session get minimum focus distance  Errcode CAMERA_INVALID_ARGUMENT ,camera is null 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0200', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0200--------------");
      let ret = cameraObj.oHGetMinimumFocusDistance(1);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0200 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0200 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0300
     * @tc.desc   Check capture session get minimum focus distance  Errcode CAMERA_INVALID_ARGUMENT ,minimumFocusDistance is null 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0300', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0300--------------");
      let ret = cameraObj.oHGetMinimumFocusDistance(2);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0300 ret is "+ret);
      expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_GET_MINIMUM_FOCUS_DISTANCE_0300 ends here");
    });

  })
}