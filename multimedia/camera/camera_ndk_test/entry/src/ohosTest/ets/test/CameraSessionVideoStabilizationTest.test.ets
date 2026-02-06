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
import deviceInfo from '@ohos.deviceInfo';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Camera_VideoStabilizationMode, GlobalThis } from './Constants';
import fs from '@ohos.file.fs';
import featureAbility from '@ohos.ability.featureAbility'

const TAG = "CameraXts cameraSessionVideoStabilizationTest: ";

// Define global letiables
let mPhotoSurface: string;
let mFdNumber: number;
let mIsVideoStabilizationModeSupportedArray: Array<boolean>;
let receiver: image.ImageReceiver;
let fdNumber: number;

function isEmpty(data: cameraObj.cameraInfo) {
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
  mIsVideoStabilizationModeSupportedArray = new Array();
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

export default function cameraSessionVideoStabilizationTest() {
  describe('cameraSessionVideoStabilizationTest', () => {
    console.info(TAG + '----------cameraSessionVideoStabilizationTest--------------');
    beforeAll(async () => {
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
      await startCameraSession();
      await cameraObj.sessionStart();
      console.info('Device type = ' + deviceInfo.deviceType);
      console.info('beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      releaseVideoReceiveSurface();
      releaseCameraSessionInstance();
      console.info('afterAll case');
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_001
     * @tc.name      : Check capture session support video stabilization off mode with promise or not
     * @tc.desc      : Check capture session support video stabilization off mode with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_001', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_001--------------");
      let sessionIsVideoStabilizationModeSupported = cameraObj.sessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_OFF);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_001 finish");
      if (sessionIsVideoStabilizationModeSupported != null || sessionIsVideoStabilizationModeSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_001 PASSED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_001 FAILED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_001 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002
     * @tc.name      : Check capture session set video stabilization off mode with promise
     * @tc.desc      : Check capture session set video stabilization off mode with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002--------------");
      cameraObj.sessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_OFF); //STABILIZATION_MODE_OFF
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002 PASSED with VideoStabilizationMode is: " + 0);
      let videoStabilizationMode = cameraObj.sessionGetVideoStabilizationMode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002 finish");
      if (videoStabilizationMode == Camera_VideoStabilizationMode.STABILIZATION_MODE_OFF) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002 PASSED with VideoStabilizationMode is: " + videoStabilizationMode);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002 FAILED with VideoStabilizationMode is: " + videoStabilizationMode);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_002 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_003
     * @tc.name      : Check capture session support video stabilization low mode with promise or not
     * @tc.desc      : Check capture session support video stabilization low mode with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_003', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_003--------------");
      let sessionIsVideoStabilizationModeSupported = cameraObj.sessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_LOW); //STABILIZATION_MODE_LOW
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_003 finish");
      if (sessionIsVideoStabilizationModeSupported != null || sessionIsVideoStabilizationModeSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_003 PASSED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_003 FAILED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_003 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004
     * @tc.name      : Check capture session set video stabilization low mode with promise
     * @tc.desc      : Check capture session set video stabilization low mode with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004--------------");
      if (mIsVideoStabilizationModeSupportedArray[0] == true) {
        cameraObj.sessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_LOW);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004 finish");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004 PASSED with VideoStabilizationMode is: " + 1);
        let videoStabilizationMode = cameraObj.sessionGetVideoStabilizationMode();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004 finish");
        if (videoStabilizationMode == Camera_VideoStabilizationMode.STABILIZATION_MODE_LOW) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004 PASSED with VideoStabilizationMode is: " + videoStabilizationMode);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004 FAILED with VideoStabilizationMode is: " + videoStabilizationMode);
          expect().assertFail();
        }
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004 PASSED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_004 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_005
     * @tc.name      : Check capture session support video stabilization middle mode with promise or not
     * @tc.desc      : Check capture session support video stabilization middle mode with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_005', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_005--------------");
      let sessionIsVideoStabilizationModeSupported = cameraObj.sessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_MIDDLE);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_005 finish");
      if (sessionIsVideoStabilizationModeSupported != null || sessionIsVideoStabilizationModeSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_005 PASSED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_005 FAILED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_005 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006
     * @tc.name      : Check capture session set video stabilization middle mode with promise
     * @tc.desc      : Check capture session set video stabilization middle mode with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006--------------");
      if (mIsVideoStabilizationModeSupportedArray[0] == true) {
        cameraObj.sessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_MIDDLE);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006 finish");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006 PASSED with VideoStabilizationMode is: " + 2);
        let videoStabilizationMode = cameraObj.sessionGetVideoStabilizationMode();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006 finish");
        if (videoStabilizationMode == Camera_VideoStabilizationMode.STABILIZATION_MODE_MIDDLE) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006 PASSED with VideoStabilizationMode is: " + videoStabilizationMode);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006 FAILED with VideoStabilizationMode is: " + videoStabilizationMode);
          expect().assertFail();
        }
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006 PASSED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_006 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_007
     * @tc.name      : Check capture session support video stabilization high mode with promise or not
     * @tc.desc      : Check capture session support video stabilization high mode with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_007', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_007--------------");
      let sessionIsVideoStabilizationModeSupported = cameraObj.sessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_HIGH);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_007 finish");
      if (sessionIsVideoStabilizationModeSupported != null || sessionIsVideoStabilizationModeSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_007 PASSED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_007 FAILED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_007 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008
     * @tc.name      : Check capture session set video stabilization high mode with promise
     * @tc.desc      : Check capture session set video stabilization high mode with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008--------------");
      if (mIsVideoStabilizationModeSupportedArray[0] == true) {
        cameraObj.sessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_HIGH);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008 finish");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008 PASSED with VideoStabilizationMode is: " + 3);
        let videoStabilizationMode = cameraObj.sessionGetVideoStabilizationMode();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008 finish");
        if (videoStabilizationMode == Camera_VideoStabilizationMode.STABILIZATION_MODE_HIGH) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008 PASSED with VideoStabilizationMode is: " + videoStabilizationMode);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008 FAILED with VideoStabilizationMode is: " + videoStabilizationMode);
          expect().assertFail();
        }
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008 PASSED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_008 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_009
     * @tc.name      : Check capture session support video stabilization auto mode with promise or not
     * @tc.desc      : Check capture session support video stabilization auto mode with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_009', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_009--------------");
      let sessionIsVideoStabilizationModeSupported = cameraObj.sessionIsVideoStabilizationModeSupported(Camera_VideoStabilizationMode.STABILIZATION_MODE_AUTO);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_009 finish");
      if (sessionIsVideoStabilizationModeSupported != null || sessionIsVideoStabilizationModeSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_009 PASSED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_009 FAILED with sessionIsVideoStabilizationModeSupported is: " + sessionIsVideoStabilizationModeSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORT_PROMISE_009 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010
     * @tc.name      : Check capture session set video stabilization auto mode with promise
     * @tc.desc      : Check capture session set video stabilization auto mode with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010--------------");
      if (mIsVideoStabilizationModeSupportedArray[0] == true) {
        cameraObj.sessionSetVideoStabilizationMode(Camera_VideoStabilizationMode.STABILIZATION_MODE_AUTO);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010 finish");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010 PASSED with VideoStabilizationMode is: " + 4);
        let videoStabilizationMode = cameraObj.sessionGetVideoStabilizationMode();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010 finish");
        if (videoStabilizationMode == Camera_VideoStabilizationMode.STABILIZATION_MODE_AUTO) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010 PASSED with VideoStabilizationMode is: " + videoStabilizationMode);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010 FAILED with VideoStabilizationMode is: " + videoStabilizationMode);
          expect().assertFail();
        }
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010 PASSED");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_VIDEO_STABILIZATION_MODE_PROMISE_010 ends here");
    });
  })
}