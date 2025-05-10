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
import { Camera_FlashMode, GlobalThis } from './Constants';

const TAG = "CameraXts CameraSessionFlashTest: ";

let mPhotoSurface: string;
let mFdNumber: number;
let mCameraNum: number;
let mIsFlashModeSupportedArray: Array<boolean>;
let mHasFlashArray: Array<boolean>;
let receiver: image.ImageReceiver;
let fdNumber: number;
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
  console.info(TAG + 'Enter getCameraSupportDevicesArray');
  let camera = cameraObj.getSupportedCameras();
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraPosition);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.connectionType);
  console.info(TAG + 'Exit getCameraSupportDevicesArray  ' + camera.cameraId);
  if (isEmpty(camera)) {
    console.info(TAG + "getSupportedCameras FAILED");
    expect().assertFail();
  }
  mHasFlashArray = new Array(mCameraNum);
  mIsFlashModeSupportedArray = new Array(mCameraNum);
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
  }
  let addPreviewOutput = cameraObj.sessionAddPreviewOutput();
  if (addPreviewOutput != 0) {
    console.info(TAG + "addPreviewOutput FAILED");
  }
  let addPhotoOutput = cameraObj.sessionAddPhotoOutput();
  if (addPhotoOutput != 0) {
    console.info(TAG + "addPhotoOutput FAILED");
  }

  let commitConfig = cameraObj.sessionCommitConfig();
  if (commitConfig != 0) {
    console.info(TAG + "CommitConfig FAILED");
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

export default function cameraSessionFlashTest() {
  describe('cameraSessionFlashTest', () => {
    console.info(TAG + '----------cameraSessionFlashTest--------------');
    beforeAll(async () => {
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
      await startCameraSession();
      console.info(TAG + 'Device type = ' + deviceInfo.deviceType);
      console.info(TAG + 'beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      stopCameraSession();
      releaseVideoReceiveSurface();
      releaseCameraSessionInstance();
      console.info('afterAll case');
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_HAS_FLASH_PROMISE_001
     * @tc.name      : Check capture session has flash with promise or not
     * @tc.desc      : Check capture session has flash with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_HAS_FLASH_PROMISE_001', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_HAS_FLASH_PROMISE_001--------------");
      let hasFlashPromise = cameraObj.sessionHasFlash();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_HAS_FLASH_PROMISE_001 finish");
      if (hasFlashPromise != null || hasFlashPromise != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_HAS_FLASH_PROMISE_001 PASSED with sessionHasFlash is: " + hasFlashPromise);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_HAS_FLASH_PROMISE_001 FAILED with sessionHasFlash is: " + hasFlashPromise);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_HAS_FLASH_PROMISE_001 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_002
     * @tc.name      : Check capture session support flash close mode with promise or not
     * @tc.desc      : Check capture session support flash close mode with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_002', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_002--------------");
      let sessionIsFlashModeSupported = cameraObj.sessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_CLOSE);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_002 finish");
      if (sessionIsFlashModeSupported != null || sessionIsFlashModeSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_002 PASSED with sessionIsFlashModeSupported is: " + sessionIsFlashModeSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_002 FAILED with sessionIsFlashModeSupported is: " + sessionIsFlashModeSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_002 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_003
     * @tc.name      : Check capture session set flash close mode with promise
     * @tc.desc      : Check capture session set flash close mode with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_003', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_003--------------");
      let ret = cameraObj.sessionSetFlashMode(Camera_FlashMode.FLASH_MODE_CLOSE);
      if (ret != 0) {
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_003 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_003 PASSED with FlashMode is: " + 0);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_003 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_004
     * @tc.name      : Check capture session support flash open mode with promise or not
     * @tc.desc      : Check capture session support flash open mode with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_004', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_004--------------");
      let sessionIsFlashModeSupported = cameraObj.sessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_OPEN);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_004 finish");
      if (sessionIsFlashModeSupported != null || sessionIsFlashModeSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_004 PASSED with sessionIsFlashModeSupported is: " + sessionIsFlashModeSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_004 FAILED with sessionIsFlashModeSupported is: " + sessionIsFlashModeSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_004 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_005
     * @tc.name      : Check capture session set flash open mode with promise
     * @tc.desc      : Check capture session set flash open mode with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_005', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_005--------------");
      cameraObj.sessionSetFlashMode(Camera_FlashMode.FLASH_MODE_OPEN);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_005 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_005 PASSED with FlashMode is: " + 1);
      let flashMode = cameraObj.sessionGetFlashMode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_005 finish");
      if (flashMode == Camera_FlashMode.FLASH_MODE_OPEN) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_005 PASSED with FlaseMode is: " + flashMode);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_005 FAILED with FlaseMode is: " + flashMode);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_005 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006
     * @tc.name      : Check capture session support flash auto mode with promise or not
     * @tc.desc      : Check capture session support flash auto mode with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006--------------");
      if (mHasFlashArray[0] == true) {
        let sessionIsFlashModeSupported = cameraObj.sessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_AUTO);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006 finish");
        if (sessionIsFlashModeSupported != null || sessionIsFlashModeSupported != undefined) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006 PASSED with sessionIsFlashModeSupported is: " + sessionIsFlashModeSupported);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006 FAILED with sessionIsFlashModeSupported is: " + sessionIsFlashModeSupported);
          expect().assertFail();
        }
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006 not support");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_006 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_007
     * @tc.name      : Check capture session set flash auto mode with promise
     * @tc.desc      : Check capture session set flash auto mode with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_007', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_007--------------");
      if ((mHasFlashArray[0] == true) && (mIsFlashModeSupportedArray[0] == true)) {
        cameraObj.sessionSetFlashMode(Camera_FlashMode.FLASH_MODE_AUTO);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_007 finish");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_007 PASSED with FlashMode is: " + 2);
        let flashMode = cameraObj.sessionGetFlashMode();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_007 finish");
        if (flashMode == Camera_FlashMode.FLASH_MODE_AUTO) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_007 PASSED with FlaseMode is: " + flashMode);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_007 FAILED with FlaseMode is: " + flashMode);
          expect().assertFail();
        }
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_007 not support");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_007 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008
     * @tc.name      : Check capture session support flash always open mode with promise or not
     * @tc.desc      : Check capture session support flash always open mode with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008--------------");
      if (mHasFlashArray[0] == true) {
        let sessionIsFlashModeSupported = cameraObj.sessionIsFlashModeSupported(Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008 finish");
        if (sessionIsFlashModeSupported != null || sessionIsFlashModeSupported != undefined) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008 PASSED with sessionHasFlash is: " + sessionIsFlashModeSupported);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008 FAILED with sessionHasFlash is: " + sessionIsFlashModeSupported);
          expect().assertFail();
        }
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008 not support");
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_008 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_009
     * @tc.name      : Check capture session set flash always open mode with promise
     * @tc.desc      : Check capture session set flash always open mode with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_009', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_009--------------");
      cameraObj.sessionSetFlashMode(Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_009 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_009 PASSED with FlashMode is: " + 3);
      let flashMode = cameraObj.sessionGetFlashMode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_009 finish");
      if (flashMode == Camera_FlashMode.FLASH_MODE_ALWAYS_OPEN) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_009 PASSED with FlaseMode is: " + flashMode);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_009 FAILED with FlaseMode is: " + flashMode);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FLASH_MODE_PROMISE_009 ends here");
    });
  })
}