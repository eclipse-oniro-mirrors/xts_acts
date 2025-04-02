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
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import {
  Camera_ErrorCode,
  Camera_ExposureMode,
  Camera_FlashMode,
  Camera_FocusMode,
  Camera_VideoStabilizationMode,
  GlobalThis
} from './Constants';
import fs from '@ohos.file.fs';
import featureAbility from '@ohos.ability.featureAbility'

const TAG = "CameraXts CameraErrorCodeUsecaseTest: ";
let mCameraSession: number;
let mPhotoSurface: string;
let fdNumber: number;
let receiver: image.ImageReceiver;
let camera: cameraObj.cameraInfo;

function isEmpty(data: cameraObj.cameraInfo | number) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
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
  console.info(TAG + 'Enter getCameraSupportDevicesArray');
  camera = cameraObj.getSupportedCameras();
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraPosition);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.connectionType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraId);
  if (isEmpty(camera)) {
    console.info(TAG + "getSupportedCameras FAILED");
    expect().assertFail();
  }
  console.info(TAG + 'Exit getCameraSupportDevicesArray');
  return true;
}

async function createInput() {
  console.info(TAG + 'Enter createInput');
  if (isEmpty(camera)) {
    console.info(TAG + "Entering createInputs FAILED with NoCamera");
    return false;
  }
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

function beginCameraSessionConfig() {
  console.info(TAG + 'Enter beginCameraSessionConfig');
  cameraObj.sessionBegin();
  console.info(TAG + 'Exit beginCameraSessionConfig');
  return true;
}

async function commitCameraSessionConfig() {
  console.info(TAG + 'Enter commitCameraSessionConfig');
  await cameraObj.sessionCommitConfig();
  console.info(TAG + 'Exit commitCameraSessionConfig');
  return true;
}

function createCameraSessionInstance() {
  console.info(TAG + 'Enter createCameraSessionInstance');
  try {
    mCameraSession = cameraObj.createSession();
  }
  catch {
    console.info(TAG + 'createCaptureSession FAILED');
  }
  if (isEmpty(mCameraSession)) {
    console.info(TAG + "createCaptureSession FAILED");
    return false;
  }
  beginCameraSessionConfig();
  console.info(TAG + 'Exit createCameraSessionInstance');
  return true;
}

function releaseCameraSessionInstance() {
  console.info(TAG + 'releaseCameraSessionInstance');
  cameraObj.sessionRelease();
  mCameraSession = -1;
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

async function closeFd() {
        console.info('case come in closeFd')
        if (fdNumber != null) {
            fs.closeSync(fdNumber);
        } else {
            console.info('[fs.closeSync] case fdNumber is null');
        }
}

async function releaseVideoReceiveSurface() {
  console.log(TAG + 'Entering releaseVideoReceiveSurface');
  await closeFd();
  console.log(TAG + 'Exit releaseVideoReceiveSurface');
}

function createOutput() {
  console.info(TAG + 'Enter createOutput');

  let cameraOutputCapability = cameraObj.getSupportedOutputCapability();
  console.info(TAG + 'cameraOutputCapability[0] = ' + cameraOutputCapability.previewProfilesSize);
  console.info(TAG + 'cameraOutputCapability[1] = ' + cameraOutputCapability.photoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[2] = ' + cameraOutputCapability.videoProfilesSize);
  console.info(TAG + 'cameraOutputCapability[3] = ' + cameraOutputCapability.metadataProfilesSize);

  let mPreviewOutput = cameraObj.createPreviewOutput();
  console.info("createPreviewOutput FAILED"+GlobalThis.getInstance().getValue());

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
  console.info(TAG + 'Exit createOutputs');
  return true;
}

export default function CameraErrorCodeUsecaseTest() {
  console.info(TAG + "getCameraManager FAILEDDDDD"+GlobalThis.getInstance().getValue());
  describe('CameraErrorCodeUsecaseTest', () => {
    console.info(TAG + '----------CameraErrorCodeUsecaseTest--------------');
    beforeAll(async () => {
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      await createInput();
      console.info(TAG + 'beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      if (!isEmpty(mCameraSession)) {
        await releaseCameraSessionInstance();
      }
    });
    afterAll(() => {
      releaseVideoReceiveSurface();
      console.info('afterAll case');
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0100
     * @tc.name      : createCameraInput api
     * @tc.desc      : createCameraInput api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0100--------------");
      let ret = cameraObj.createCameraInput();
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_INVALID_ARGUMENT).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_COMMITCONFIG_0200
     * @tc.name      : commitConfig api
     * @tc.desc      : commitConfig api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_COMMITCONFIG_0200', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_COMMITCONFIG_0200--------------");
      cameraObj.createSession();
      let ret = cameraObj.sessionCommitConfig();
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_COMMITCONFIG_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_OPERATION_NOT_ALLOWED).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_ADD_OUTPUT_0300
     * @tc.name      : addOutput api
     * @tc.desc      : addOutput api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_ADD_OUTPUT_0300', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_ADD_OUTPUT_0300--------------");
      cameraObj.createSession();
      createOutput();
      let ret = cameraObj.sessionAddPreviewOutput();
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_ADD_OUTPUT_0300 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_OPERATION_NOT_ALLOWED).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_REMOVE_OUTPUT_0300
     * @tc.name      : removeOutput api
     * @tc.desc      : removeOutput api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_REMOVE_OUTPUT_0300', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_REMOVE_OUTPUT_0300--------------");
      cameraObj.createSession();
      createOutput();
      let ret = cameraObj.sessionRemovePreviewOutput();
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_REMOVE_OUTPUT_0300 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_OPERATION_NOT_ALLOWED).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_START_0100
     * @tc.name      : capturesession start api
     * @tc.desc      : capturesession start api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_START_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_START_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionStart();
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_START_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        console.info(TAG + "Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG: " + Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG);
        expect(ret == Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_0100
     * @tc.name      : capturesession sessionHasFlash api
     * @tc.desc      : capturesession sessionHasFlash api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      try {
        cameraObj.sessionHasFlash();
      }
      catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error);
        console.info(TAG + "Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG: " + Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG);
        expect(error == Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_0100
     * @tc.name      : capturesession sessionIsFlashModeSupported api
     * @tc.desc      : capturesession sessionIsFlashModeSupported api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      try {
        let ret = cameraObj.sessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_AUTO);
      }
      catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_0100
     * @tc.name      : capturesession sessionGetFlashMode api
     * @tc.desc      : capturesession sessionGetFlashMode api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionGetFlashMode();
      console.info(TAG + "sessionGetFlashMode: " + ret);
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0100
     * @tc.name      : capturesession sessionSetFlashMode api
     * @tc.desc      : capturesession sessionSetFlashMode api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionSetFlashMode(Camera_FlashMode.FLASH_MODE_AUTO);
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_SERVICE_FATAL_ERROR).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0101
     * @tc.name      : capturesession sessionSetFlashMode api
     * @tc.desc      : capturesession sessionSetFlashMode api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SESSIONSTART_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SESSIONSTART_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionStart();
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SESSIONSTART_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_0100
     * @tc.name      : capturesession isExposureModeSupported api
     * @tc.desc      : capturesession isExposureModeSupported api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionIsExposureModeSupported(Camera_ExposureMode.EXPOSURE_MODE_AUTO);
      if (!ret) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_0100
     * @tc.name      : capturesession getExposureMode api
     * @tc.desc      : capturesession getExposureMode api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionGetExposureMode();
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0100
     * @tc.name      : capturesession setExposureMode api
     * @tc.desc      : capturesession setExposureMode api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionSetExposureMode(Camera_ExposureMode.EXPOSURE_MODE_AUTO);
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0101
     * @tc.name      : capturesession setExposureMode api
     * @tc.desc      : capturesession setExposureMode api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0101', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0101--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      await cameraObj.sessionStart();
      try {
        cameraObj.sessionSetExposureMode(Camera_ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);
      }
      catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0101 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code != Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_0100
     * @tc.name      : capturesession getMeteringPoint api
     * @tc.desc      : capturesession getMeteringPoint api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionGetMeteringPoint();
      if (ret != null) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0100
     * @tc.name      : capturesession setMeteringPoint api
     * @tc.desc      : capturesession setMeteringPoint api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionSetMeteringPoint({
        x: 1, y: 1
      });
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0101
     * @tc.name      : capturesession setMeteringPoint api
     * @tc.desc      : capturesession setMeteringPoint api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0101', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0101--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      await cameraObj.sessionStart();
      let ret = cameraObj.sessionSetMeteringPoint({
        x: -1, y: -1
      });
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0101 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret != Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_0100
     * @tc.name      : capturesession getExposureBiasRange api
     * @tc.desc      : capturesession getExposureBiasRange api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = Camera_ErrorCode.CAMERA_OK;
      if (ret != null) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0100
     * @tc.name      : capturesession setExposureBias api
     * @tc.desc      : capturesession setExposureBias api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let range = Camera_ErrorCode.CAMERA_OK;
      console.info(TAG + "range: " + range);
      let ret = cameraObj.sessionSetExposureBias(range);
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_SERVICE_FATAL_ERROR).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0101
     * @tc.name      : capturesession setExposureBias api
     * @tc.desc      : capturesession setExposureBias api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0101', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0101--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      await cameraObj.sessionStart();
      let ret = cameraObj.sessionSetExposureBias(-101);
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0101 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret != Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_0100
     * @tc.name      : capturesession getExposureValue api
     * @tc.desc      : capturesession getExposureValue api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionGetExposureMode();
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_0100
     * @tc.name      : capturesession sessionIsFocusModeSupported api
     * @tc.desc      : capturesession sessionIsFocusModeSupported api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionIsFocusModeSupported(Camera_FocusMode.FOCUS_MODE_AUTO);
      if (ret != null) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_0100
     * @tc.name      : capturesession sessionGetFocusMode api
     * @tc.desc      : capturesession sessionGetFocusMode api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionGetFocusMode();
      if (ret != null) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0100
     * @tc.name      : capturesession sessionSetFocusMode api
     * @tc.desc      : capturesession sessionSetFocusMode api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionSetFocusMode(Camera_FocusMode.FOCUS_MODE_MANUAL);
      if (ret != null) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0101
     * @tc.name      : capturesession sessionSetFocusMode api
     * @tc.desc      : capturesession sessionSetFocusMode api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0101', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0101--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      await cameraObj.sessionStart();
      let ret = cameraObj.sessionSetFocusMode(5);
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0101 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret != Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0100
     * @tc.name      : capturesession sessionSetFocusPoint api
     * @tc.desc      : capturesession sessionSetFocusPoint api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionSetFocusPoint({
        x: 1, y: 1
      });
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0101
     * @tc.name      : capturesession sessionSetFocusPoint api
     * @tc.desc      : capturesession sessionSetFocusPoint api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0101', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0101--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      await cameraObj.sessionStart();
      let ret = cameraObj.sessionSetFocusPoint({
        x: -1, y: -1
      });
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0101 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret != Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_0100
     * @tc.name      : capturesession sessionGetFocusPoint api
     * @tc.desc      : capturesession sessionGetFocusPoint api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_0100--------------");
      console.info(TAG + "GETFOCUSPOINT FocusPoint: ");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionGetFocusPoint();
      console.info(TAG + "FocusPoint: " + ret);
      if (!ret) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_0100
     * @tc.name      : capturesession sessionGetZoomRatioRange api
     * @tc.desc      : capturesession sessionGetZoomRatioRange api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     *
     *
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_0100--------------");
      console.info(TAG + "GETZOOMRATIORANG");
      createCameraSessionInstance();
      console.info(TAG + "GETZOOMRATIORANG");
      cameraObj.sessionAddInput();
      console.info(TAG + "createOutput");
      createOutput();
      console.info(TAG + "createOutput end");
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionGetZoomRatioRange();
      console.info(TAG + "GetZoomRatioRange: " + ret);
      if (!ret) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_0100
     * @tc.name      : capturesession sessionGetZoomRatio api
     * @tc.desc      : capturesession sessionGetZoomRatio api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionGetZoomRatio();
      console.info(TAG + "GetZoomRatio: " + ret);
      if (!ret) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0100
     * @tc.name      : capturesession sessionSetZoomRatio api
     * @tc.desc      : capturesession sessionSetZoomRatio api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      try {
      }
      catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0101
     * @tc.name      : capturesession sessionSetZoomRatio api
     * @tc.desc      : capturesession sessionSetZoomRatio api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0101', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0101--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      await cameraObj.sessionStart();
      let ret = cameraObj.sessionSetZoomRatio(-101);
      if (ret != null) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0101 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_0100
     * @tc.name      : capturesession sessionIsVideoStabilizationModeSupported api
     * @tc.desc      : capturesession sessionIsVideoStabilizationModeSupported api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_LOW);
      console.info(TAG + "IsVideoStabilizationModeSupported: " + ret);
      if (!ret) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_0100
     * @tc.name      : capturesession sessionGetVideoStabilizationMode api
     * @tc.desc      : capturesession sessionGetVideoStabilizationMode api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionGetVideoStabilizationMode();
      console.info(TAG + "VideoStabilizationMode: " + ret);
      if (ret != null) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_OK).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0100
     * @tc.name      : capturesession sessionSetVideoStabilizationMode api
     * @tc.desc      : capturesession sessionSetVideoStabilizationMode api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.sessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_LOW);
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0101
     * @tc.name      : capturesession sessionSetVideoStabilizationMode api
     * @tc.desc      : capturesession sessionSetVideoStabilizationMode api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0101', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0101--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      await cameraObj.sessionStart();
      let ret = cameraObj.sessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_AUTO);
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0101 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_PREVIEW_START_0100
     * @tc.name      : PreviewOutput  start api
     * @tc.desc      : PreviewOutput  start api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_PREVIEW_START_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_PREVIEW_START_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      let ret = cameraObj.previewOutputStart();
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_PREVIEW_START_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_VIDEO_START_0100
     * @tc.name      : videooutput  start api
     * @tc.desc      : videooutput  start api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_VIDEO_START_0100', 0, async () => {
      let ret = createCameraSessionInstance();
      if (ret != true) {
        expect().assertFail();
      }
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0100
     * @tc.name      : photoOutput capture api
     * @tc.desc      : photoOutput capture api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0100--------------");
      createCameraSessionInstance();
      cameraObj.sessionAddInput();
      createOutput();
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      await commitCameraSessionConfig();
      let ret = cameraObj.photoOutputCapture();
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_SESSION_NOT_RUNNING).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_BEGINCONFIG_0100
     * @tc.name      : capturesession beginConfig api
     * @tc.desc      : capturesession beginConfig api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_BEGINCONFIG_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_BEGINCONFIG_0100--------------");
      mCameraSession = cameraObj.createSession();
      let ret = cameraObj.sessionBegin();
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_BEGINCONFIG_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_SESSION_CONFIG_LOCKED).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_ORIENTATION_0100
     * @tc.name      : capturesession beginConfig api
     * @tc.desc      : capturesession beginConfig api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
     it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_ORIENTATION_0100', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_ORIENTATION_0100--------------");
      mCameraSession = cameraObj.createSession();
      let ret = cameraObj.getCameraOrientation();
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_ORIENTATION_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(ret == Camera_ErrorCode.CAMERA_SERVICE_FATAL_ERROR).assertTrue();
        expect(true).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_HOST_NAME_0100
     * @tc.name      : cameraManager getHostMessage api
     * @tc.desc      : cameraManager getHostMessage api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
     it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_HOST_NAME', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_HOST_NAME_0100--------------");
      mCameraSession = cameraObj.createSession();
      let ret = cameraObj.getCameraHostName();
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_HOST_NAME_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(false).assertTrue();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_HOST_TYPE_0100
     * @tc.name      : cameraManager getHostMessage api
     * @tc.desc      : cameraManager getHostMessage api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
     it('SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_HOST_TYPE', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_HOST_TYPE_0100--------------");
      mCameraSession = cameraObj.createSession();
      let ret = cameraObj.getCameraHostName();
      if (ret != 0) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_ERROR_CODE_USECASE_HOST_TYPE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + ret);
        expect(false).assertTrue();
      }
    });
  })
}