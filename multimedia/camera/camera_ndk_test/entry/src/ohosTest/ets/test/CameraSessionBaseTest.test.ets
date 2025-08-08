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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { GlobalThis } from './Constants';
import fs from '@ohos.file.fs';
import featureAbility from '@ohos.ability.featureAbility'

const TAG = "CameraXts CameraSessionBaseTest: ";

let receiver: image.ImageReceiver;
let mPhotoSurface: string;
let mFdNumber: number;
let mCameraInput: number;
let fdNumber: number;
function isEmpty(data: number) {
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
  let cameraInfo = cameraObj.getSupportedCameras();
  if (cameraInfo.cameraId == null) {
    console.info(TAG + "getSupportedCameras FAILED");
    expect().assertFail();
  }
  console.info(TAG + 'Exit getCameraSupportDevicesArray');
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
  console.info('Exit createCameraSessionInstance');
  return true;
}
async function createInput() {
  console.info('Enter createInput');
  let mCameraInput = cameraObj.createCameraInput();

  if (mCameraInput != 0) {
    console.info(TAG + "createCameraInput FAILED");
    expect().assertFail();
    return false;
  }

  await cameraObj.cameraInputOpen();
  console.info('Exit cameraInputOpen');
  return true;
}

function createOutput() {
  console.info(TAG + 'Enter createOutput');

  cameraObj.getSupportedOutputCapability();
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

async function startCameraSession() {
  console.info(TAG + "Enter startCameraSession");

  await createInput();
  createOutput();

  let ret = cameraObj.sessionBegin();
  if (ret != 0) {
    console.info(TAG + "sessionBegin FAILED");
    expect().assertFail();
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

async function releaseInput() {
  console.info('Enter releaseInput');
  if (!isEmpty(mCameraInput)) {
    await cameraObj.cameraInputClose();
  }

  console.info('Exit releaseInput');
  return true;
}

async function releaseOutput() {
  console.info('Enter releaseOutput');
  await cameraObj.previewOutputRelease();
  await cameraObj.photoOutputRelease();

  console.info('Exit releaseOutput');
  return true;
}

async function releaseVideoReceiveSurface() {
  console.log(TAG + 'Entering releaseVideoReceiveSurface')
  await closeFd();
  console.log(TAG + 'Exit releaseVideoReceiveSurface')
}

async function releaseCameraSessionInstance() {
  await cameraObj.sessionRelease();
}

export default function cameraSessionTest() {
  describe('CameraSessionBaseTest', () => {
    console.info(TAG + '----------CameraSessionTest--------------');
    beforeAll(async () => {
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
      console.info(TAG + 'Device type = ' + deviceInfo.deviceType);
      console.info(TAG + 'beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      releaseVideoReceiveSurface();
      console.info('afterAll case');
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_BEGIN_CONFIG_001
     * @tc.name      : Check capture session begin config
     * @tc.desc      : Check capture session begin config
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_BEGIN_CONFIG_001', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_BEGIN_CONFIG_001--------------");
      let ret = cameraObj.sessionBegin();
      if (ret != 0) {
        expect().assertFail();
      }
      cameraObj.sessionStop();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_BEGIN_CONFIG_001 PASSED");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ADD_REMOVE_INPUT_PROMISE_002
     * @tc.name      : Check capture session can add input with promise or not
     * @tc.desc      : Check capture session can add input with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ADD_REMOVE_INPUT_PROMISE_002', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ADD_REMOVE_INPUT_PROMISE_002--------------");
      await cameraObj.sessionBegin();
      await createInput();
      let addInput = cameraObj.sessionAddInput();
      if (addInput != 0) {
        console.info(TAG + "addInput FAILED");
        expect().assertFail();
      }
      cameraObj.sessionRemoveInput();
      await releaseInput();
      cameraObj.sessionStop();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ADD_REMOVE_INPUT_PROMISE_002 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ADD_REMOVE_OUTPUT_PROMISE_003
     * @tc.name      : Check capture session can add output with promise or not for preview
     * @tc.desc      : Check capture session can add output with promise or not for preview
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ADD_REMOVE_OUTPUT_PROMISE_003', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ADD_REMOVE_OUTPUT_PROMISE_003--------------");
      let ret = createOutput();
      if (ret != true) {
        expect().assertFail();
      }
      cameraObj.sessionAddPreviewOutput();
      cameraObj.sessionAddPhotoOutput();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ADD_REMOVE_OUTPUT_PROMISE_003 add PASSED");
      cameraObj.sessionRemovePreviewOutput();
      cameraObj.sessionRemovePhotoOutput();
      await releaseOutput();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ADD_REMOVE_OUTPUT_PROMISE_003 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_START_STOP_PROMISE_004
     * @tc.name      : Check capture session start/stop/release output with promise or not
     * @tc.desc      : Check capture session start/stop/release output with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_START_STOP_PROMISE_004', 0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_START_STOP_PROMISE_004--------------");
      releaseCameraSessionInstance();
      let ret = createCameraSessionInstance();
      if (ret != true) {
        expect().assertFail();
      }
      await cameraObj.cameraInputClose();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_START_STOP_PROMISE_004 start for camera[0]");
      await startCameraSession();
      await cameraObj.sessionStart();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_START_STOP_PROMISE_004 start PASSED");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_START_STOP_PROMISE_004 stop PASSED");
      await stopCameraSession();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_START_STOP_PROMISE_004 end for camera[0]");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_START_STOP_PROMISE_004 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_COMMIT_CONFIG_005
     * @tc.name      : Check capture session commit config
     * @tc.desc      : Check capture session commit config
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_COMMIT_CONFIG_005', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_COMMIT_CONFIG_005--------------");
      releaseCameraSessionInstance();
      let ret = createCameraSessionInstance();
      if (ret != true) {
        expect().assertFail();
      }
      await cameraObj.cameraInputClose();
      await createInput();
      createOutput();
      console.info(TAG + "Start to sessionAddInput");
      cameraObj.sessionBegin();
      cameraObj.sessionAddInput();
      console.info(TAG + "Start to addOutput mPreviewOutput");
      cameraObj.sessionAddPreviewOutput();
      console.info(TAG + "Start to addOutput mPhotoOutput");
      cameraObj.sessionAddPhotoOutput();
      await cameraObj.sessionCommitConfig();
      cameraObj.sessionStart();
      await stopCameraSession();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_COMMIT_CONFIG_005 PASSED");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_RELEASE_PROMISE_006
     * @tc.name      : Check capture session release with promise or not
     * @tc.desc      : Check capture session release with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_RELEASE_PROMISE_006', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_RELEASE_PROMISE_006--------------");
      let ret = cameraObj.sessionRelease();
      if (ret != 0) {
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_RELEASE_PROMISE_006 ends here");
    });
  })
}