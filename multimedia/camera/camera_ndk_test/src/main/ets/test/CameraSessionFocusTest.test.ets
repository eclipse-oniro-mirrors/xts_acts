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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import { Camera_FocusMode, GlobalThis } from './Constants';

const TAG = "CameraXts CameraSessionFocusTest: ";

let mPhotoSurface: string;
let mFileAsset: mediaLibrary.FileAsset;
let mFdNumber: number;

let mPicWidthMax = 1;
let mPicHeightMax = 1;

interface FocusPoint {
  x: number,
  y: number
}

let mFocusPoint: FocusPoint = {
  x: mPicWidthMax / 2.0,
  y: mPicHeightMax / 2.0,
}

interface FocusPointLT {
  x: number,
  y: number
}

let mFocusPointLT: FocusPointLT = {
  x: 0,
  y: 0,
}

interface FocusPointRT {
  x: number,
  y: number
}

let mFocusPointRT: FocusPointRT = {
  x: mPicWidthMax,
  y: 0,
}

interface FocusPointLB {
  x: number,
  y: number
}

let mFocusPointLB: FocusPointLB = {
  x: 0,
  y: mPicHeightMax,
}

interface FocusPointRB {
  x: number,
  y: number
}

let mFocusPointRB: FocusPointRB = {
  x: mPicWidthMax,
  y: mPicHeightMax,
}

interface FocusPointInvalidLT {
  x: number,
  y: number
}

let mFocusPointInvalidLT: FocusPointInvalidLT = {
  x: -1,
  y: -1,
}

interface FocusPointInvalidRT {
  x: number,
  y: number
}

let mFocusPointInvalidRT: FocusPointInvalidRT = {
  x: (mPicWidthMax + 1),
  y: -1,
}

interface FocusPointInvalidLB {
  x: number,
  y: number
}

let mFocusPointInvalidLB: FocusPointInvalidLB = {
  x: -1,
  y: (mPicHeightMax + 1),
}

interface FocusPointInvalidRB {
  x: number,
  y: number
}

let mFocusPointInvalidRB: FocusPointInvalidRB = {
  x: (mPicWidthMax + 1),
  y: (mPicHeightMax + 1),
}

let mEnableCheckInvalidFocusPoint = false;
let receiver: image.ImageReceiver;

function isEmpty(data: cameraInfo) {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

async function closeFd() {
  if (mFileAsset != null) {
    await mFileAsset[0].close(mFdNumber).then(() => {
      console.info('[mediaLibrary] case close fd success');
    }).catch(() => {
      console.info('[mediaLibrary] case close fd failed');
    });
  } else {
    console.info('[mediaLibrary] case fileAsset is null');
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

export default function cameraSessionFocusTest() {

  describe('cameraSessionFocusTest', () => {
    console.info(TAG + '----------cameraSessionFocusTest--------------');
    beforeAll(async () => {
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
      await startCameraSession();
      cameraObj.sessionCommitConfig();
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
      stopCameraSession();
      releaseVideoReceiveSurface();
      releaseCameraSessionInstance();
      console.info('afterAll case');
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_001
     * @tc.name      : Check capture session support focus manual mode with promise or not
     * @tc.desc      : Check capture session support focus manual mode with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_001', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_001--------------");
      let sessionIsFocusModeSupported = cameraObj.sessionIsFocusModeSupported(Camera_FocusMode.FOCUS_MODE_MANUAL);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_001 finish");
      if (sessionIsFocusModeSupported != null || sessionIsFocusModeSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_001 PASSED with sessionIsFocusModeSupported is: " + sessionIsFocusModeSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_001 FAILED with sessionIsFocusModeSupported is: " + sessionIsFocusModeSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_001 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_002
     * @tc.name      : Check capture session set focus manual mode with promise
     * @tc.desc      : Check capture session set focus manual mode with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_002', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_002--------------");
      cameraObj.sessionSetFocusMode(Camera_FocusMode.FOCUS_MODE_MANUAL);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_002 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_002 PASSED with FocusMode is: " + 0);
      let focusMode = cameraObj.sessionGetFocusMode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_002 finish");
      if (focusMode == Camera_FocusMode.FOCUS_MODE_MANUAL) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_002 PASSED with FocusMode is: " + focusMode);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_002 FAILED with FocusMode is: " + focusMode);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_002 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_003
     * @tc.name      : Check capture session support focus continuous auto mode with promise or not
     * @tc.desc      : Check capture session support focus continuous auto mode with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_003', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_003--------------");
      let sessionIsFocusModeSupported = cameraObj.sessionIsFocusModeSupported(Camera_FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_003 finish");
      if (sessionIsFocusModeSupported != null || sessionIsFocusModeSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_003 PASSED with sessionIsFocusModeSupported is: " + sessionIsFocusModeSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_003 FAILED with sessionIsFocusModeSupported is: " + sessionIsFocusModeSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_003 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_004
     * @tc.name      : Check capture session set focus continuous auto mode with promise
     * @tc.desc      : Check capture session set focus continuous auto mode with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_004', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_004--------------");
      cameraObj.sessionSetFocusMode(Camera_FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_004 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_004 PASSED with FocusMode is: " + 1);
      let focusMode = cameraObj.sessionGetFocusMode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_004 finish");
      if (focusMode == Camera_FocusMode.FOCUS_MODE_CONTINUOUS_AUTO) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_004 PASSED with FocusMode is: " + focusMode);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_004 FAILED with FocusMode is: " + focusMode);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_004 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_005
     * @tc.name      : Check capture session support focus auto mode with promise or not
     * @tc.desc      : Check capture session support focus auto mode with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_005', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_005--------------");
      let sessionIsFocusModeSupported = cameraObj.sessionIsFocusModeSupported(Camera_FocusMode.FOCUS_MODE_AUTO);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_005 finish");
      if (sessionIsFocusModeSupported != null || sessionIsFocusModeSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_005 PASSED with sessionIsFocusModeSupported is: " + sessionIsFocusModeSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_005 FAILED with sessionIsFocusModeSupported is: " + sessionIsFocusModeSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_005 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_006
     * @tc.name      : Check capture session set focus auto mode with promise
     * @tc.desc      : Check capture session set focus auto mode with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_006', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_006--------------");
      cameraObj.sessionSetFocusMode(Camera_FocusMode.FOCUS_MODE_AUTO);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_006 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_006 PASSED with FocusMode is: " + 2);
      let focusMode = cameraObj.sessionGetFocusMode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_006 finish");
      if (focusMode == Camera_FocusMode.FOCUS_MODE_AUTO) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_006 PASSED with FocusMode is: " + focusMode);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_006 FAILED with FocusMode is: " + focusMode);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_006 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_007
     * @tc.name      : Check capture session support focus locked mode with promise or not
     * @tc.desc      : Check capture session support focus locked mode with promise or not
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_007', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_007--------------");
      let sessionIsFocusModeSupported = cameraObj.sessionIsFocusModeSupported(Camera_FocusMode.FOCUS_MODE_LOCKED);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_007 finish");
      if (sessionIsFocusModeSupported != null || sessionIsFocusModeSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_007 PASSED with sessionIsFocusModeSupported is: " + sessionIsFocusModeSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_007 FAILED with sessionIsFocusModeSupported is: " + sessionIsFocusModeSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_007 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_008
     * @tc.name      : Check capture session set focus locked mode with promise
     * @tc.desc      : Check capture session set focus locked mode with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_008', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_008--------------");
      cameraObj.sessionSetFocusMode(Camera_FocusMode.FOCUS_MODE_LOCKED);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_008 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_008 PASSED with FocusMode is: " + 3);
      let focusMode = cameraObj.sessionGetFocusMode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_008 finish");
      if (focusMode == Camera_FocusMode.FOCUS_MODE_LOCKED) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_008 PASSED with FocusMode is: " + focusMode);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_008 FAILED with FocusMode is: " + focusMode);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_MODE_PROMISE_008 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009
     * @tc.name      : Check capture session set focus point with promise
     * @tc.desc      : Check capture session set focus point with promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009--------------");
      cameraObj.sessionSetFocusPoint(mFocusPoint);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009 PASSED with FocusPoint is: " + mFocusPoint.x + ", " + mFocusPoint.y);
      let focusPoint = cameraObj.sessionGetFocusPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009 finish");
      if ((Math.abs(focusPoint.x - mFocusPoint.x) >= 0) && (Math.abs(focusPoint.y - mFocusPoint.y) >= 0)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009
     * @tc.name      : Check capture session set focus point with promise(left-top point)
     * @tc.desc      : Check capture session set focus point with promise(left-top point)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009_1', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009_1--------------");
      cameraObj.sessionSetFocusPoint(mFocusPointLT);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009 PASSED with FocusPoint is: " + mFocusPointLT.x + ", " + mFocusPointLT.y);
      let focusPoint = cameraObj.sessionGetFocusPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009 finish");
      if ((Math.abs(focusPoint.x - mFocusPointLT.x) >= 0) && (Math.abs(focusPoint.y - mFocusPointLT.y) >= 0)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_009 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_010
     * @tc.name      : Check capture session set focus point with promise(right-top point)
     * @tc.desc      : Check capture session set focus point with promise(right-top point)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_010', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_010--------------");
      cameraObj.sessionSetFocusPoint(mFocusPointRT);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_010 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_010 PASSED with FocusPoint is: " + mFocusPointRT.x + ", " + mFocusPointRT.y);
      let focusPoint = cameraObj.sessionGetFocusPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_010 finish");
      if ((Math.abs(focusPoint.x - mFocusPointRT.x) >= 0) && (Math.abs(focusPoint.y - mFocusPointRT.y) >= 0)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_010 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_010 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_010 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_011
     * @tc.name      : Check capture session set focus point with promise(left-bottom point)
     * @tc.desc      : Check capture session set focus point with promise(left-bottom point)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_011', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_011--------------");
      cameraObj.sessionSetFocusPoint(mFocusPointLB);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_011 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_011 PASSED with FocusPoint is: " + mFocusPointLB.x + ", " + mFocusPointLB.y);
      let focusPoint = cameraObj.sessionGetFocusPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_011 finish");
      if ((Math.abs(focusPoint.x - mFocusPointLB.x) >= 0) && (Math.abs(focusPoint.y - mFocusPointLB.y) >= 0)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_011 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_011 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_011 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_012
     * @tc.name      : Check capture session set focus point with promise(right-bottom point)
     * @tc.desc      : Check capture session set focus point with promise(right-bottom point)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_012', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_012--------------");
      cameraObj.sessionSetFocusPoint(mFocusPointRB);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_012 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_012 PASSED with FocusPoint is: " + mFocusPointRB.x + ", " + mFocusPointRB.y);
      let focusPoint = cameraObj.sessionGetFocusPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_012 finish");
      214;
      if ((Math.abs(focusPoint.x - mFocusPointRB.x) >= 0) && (Math.abs(focusPoint.y - mFocusPointRB.y) >= 0)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_012 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_012 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_012 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_013
     * @tc.name      : Check capture session set focus point with promise(left-top invalid point)
     * @tc.desc      : Check capture session set focus point with promise(left-top invalid point)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_013', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_013--------------");
      cameraObj.sessionSetFocusPoint(mFocusPointInvalidLT);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_013 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_013 PASSED with FocusPoint is: " + mFocusPointInvalidLT.x + ", " + mFocusPointInvalidLT.y);
      let focusPoint = cameraObj.sessionGetFocusPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_013 finish");
      if (((focusPoint.x != mFocusPointInvalidLT.x) && (focusPoint.y != mFocusPointInvalidLT.y)) || (mEnableCheckInvalidFocusPoint == false)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_013 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_013 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_013 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_014
     * @tc.name      : Check capture session set focus point with promise(right-top invalid point)
     * @tc.desc      : Check capture session set focus point with promise(right-top invalid point)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_014', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_014--------------");
      cameraObj.sessionSetFocusPoint(mFocusPointInvalidRT);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_014 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_014 PASSED with FocusPoint is: " + mFocusPointInvalidRT.x + ", " + mFocusPointInvalidRT.y);
      let focusPoint = cameraObj.sessionGetFocusPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_014 finish");
      if (((focusPoint.x != mFocusPointInvalidRT.x) && (focusPoint.y != mFocusPointInvalidRT.y)) || (mEnableCheckInvalidFocusPoint == false)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_014 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_014 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_014 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_015
     * @tc.name      : Check capture session set focus point with promise(left-bottom invalid point)
     * @tc.desc      : Check capture session set focus point with promise(left-bottom invalid point)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_015', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_015--------------");
      cameraObj.sessionSetFocusPoint(mFocusPointInvalidLB);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_015 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_015 PASSED with FocusPoint is: " + mFocusPointInvalidLB.x + ", " + mFocusPointInvalidLB.y);
      let focusPoint = cameraObj.sessionGetFocusPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_015 finish");
      if (((focusPoint.x != mFocusPointInvalidLB.x) && (focusPoint.y != mFocusPointInvalidLB.y)) || (mEnableCheckInvalidFocusPoint == false)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_015 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_015 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_015 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_016
     * @tc.name      : Check capture session set focus point with promise(right-bottom invalid point)
     * @tc.desc      : Check capture session set focus point with promise(right-bottom invalid point)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_016', 2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_016--------------");
      cameraObj.sessionSetFocusPoint(mFocusPointInvalidRB);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_016 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_016 PASSED with FocusPoint is: " + mFocusPointInvalidRB.x + ", " + mFocusPointInvalidRB.y);
      let focusPoint = cameraObj.sessionGetFocusPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_016 finish");
      if (((focusPoint.x != mFocusPointInvalidRB.x) && (focusPoint.y != mFocusPointInvalidRB.y)) || (mEnableCheckInvalidFocusPoint == false)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_016 PASSED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_016 FAILED with FocusPoint is: " + focusPoint.x + ", " + focusPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_FOCUS_POINT_PROMISE_016 ends here");
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_ON_FOCUSSTATECHANGE_017
     * @tc.name      : camera session focusstatechange api
     * @tc.desc      : camera session focusstatechange api
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_ON_FOCUSSTATECHANGE_017', 1, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_ON_FOCUSSTATECHANGE_017--------------");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_ON_FOCUSSTATECHANGE_017 to operate");
      let status = await cameraObj.getCameraCallbackCode();
      console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_NDK_ON_FOCUSSTATECHANGE_017 status: " + status);
      if (status) {
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_ON_FOCUSSTATECHANGE_017 success");
      }
      else {
        expect().assertFail();
        console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_NDK_ON_FOCUSSTATECHANGE_017 FAILED: " + status);
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_SESSION_ON_ERROR_018
     * @tc.name      : camera session callback on error
     * @tc.desc      : camera session callback on error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_SESSION_ON_ERROR_018', 1, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_SESSION_ON_ERROR_018--------------");
      let status = await cameraObj.getCameraCallbackCode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_SESSION_ON_ERROR_018 to operate");
      if (status) {
        expect(true).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_SESSION_ON_ERROR_018 success");
      }
      else {
        expect().assertFail();
        console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_NDK_CAMERA_SESSION_ON_ERROR_018 FAILED: " + status);
      }
    });
  })
}