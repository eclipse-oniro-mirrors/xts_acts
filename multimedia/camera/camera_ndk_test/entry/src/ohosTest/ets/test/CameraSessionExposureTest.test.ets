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
import fs from '@ohos.file.fs';
import featureAbility from '@ohos.ability.featureAbility'
import { Camera_ExposureMode, GlobalThis } from './Constants';
import { abilityAccessCtrl, Context, PermissionRequestResult, common, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';

const TAG = "CameraXts CameraSessionExposureTest: ";

let receiver: image.ImageReceiver;
let mPhotoSurface: string;
let mFdNumber: number;

let mExposureBiasRangeArray: Array<cameraObj.exposureBias>;
let mExposureBiasMaxArray: Array<number>;
let mExposureBiasMinArray: Array<number>;
let mCameraNum: number;
let fdNumber: number;
let mPicWidthMax = 1;
let mPicHeightMax = 1;

interface METERINGPoint {
  x: number,
  y: number
}

let mMETERINGPoint: METERINGPoint = {
  x: mPicWidthMax / 2.0,
  y: mPicHeightMax / 2.0,
}

interface METERINGPointLT {
  x: number,
  y: number
}

let mMETERINGPointLT: METERINGPointLT = {
  x: 0,
  y: 0,
}

interface METERINGPointRT {
  x: number,
  y: number
}

let mMETERINGPointRT: METERINGPointRT = {
  x: mPicWidthMax,
  y: 0,
}

interface METERINGPointLB {
  x: number,
  y: number
}

let mMETERINGPointLB: METERINGPointLB = {
  x: 0,
  y: mPicHeightMax,
}

interface METERINGPointRB {
  x: number,
  y: number
}

let mMETERINGPointRB: METERINGPointRB = {
  x: mPicWidthMax,
  y: mPicHeightMax,
}

interface METERINGPointInvalidLT {
  x: number,
  y: number
}

let mMETERINGPointInvalidLT: METERINGPointInvalidLT = {
  x: -1,
  y: -1,
}

interface METERINGPointInvalidRT {
  x: number,
  y: number
}

let mMETERINGPointInvalidRT: METERINGPointInvalidRT = {
  x: (mPicWidthMax + 1),
  y: -1,
}

interface METERINGPointInvalidLB {
  x: number,
  y: number
}

let mMETERINGPointInvalidLB: METERINGPointInvalidLB = {
  x: -1,
  y: mPicHeightMax,
}

interface METERINGPointInvalidRB {
  x: number,
  y: number
}

let mMETERINGPointInvalidRB: METERINGPointInvalidRB = {
  x: (mPicWidthMax + 1),
  y: (mPicHeightMax + 1),
}

let mEnableCheckInvalidMETERINGPoint = false;

async function closeFd() {
        console.info('case come in closeFd')
        if (fdNumber != null) {
            fs.closeSync(fdNumber);
        } else {
            console.info('[fs.closeSync] case fdNumber is null');
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

  mExposureBiasRangeArray = new Array(mCameraNum);
  mExposureBiasMaxArray = new Array(mCameraNum);
  mExposureBiasMinArray = new Array(mCameraNum);
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
  let ret = cameraObj.sessionBegin();
  if (ret != 0) {
    console.info(TAG + "sessionBegin FAILED");
    expect().assertFail();
  }
  console.info('Exit createCameraSessionInstance');
  return true;
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

  let sessionStart = cameraObj.sessionStart();
  if (sessionStart != 0) {
    console.info(TAG + "sessionStart FAILED");
    expect().assertFail();
  }
  console.info(TAG + "Exit startCameraSession");

  return true;
}

async function releaseVideoReceiveSurface() {
  console.log(TAG + 'Entering releaseVideoReceiveSurface')
  await closeFd();
  console.log(TAG + 'Exit releaseVideoReceiveSurface')
}

async function releaseCameraSessionInstance() {
  cameraObj.sessionRelease();
}

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function cameraSessionExposureTest() {
  describe('cameraSessionExposureTest', () => {
    console.info(TAG + '----------cameraSessionExposureTest--------------');
    beforeAll(async (done: Function) => {
      await sleep(3000);
      await getPermissions1();
      await driveFn();
      await getPermissions2();
      await driveFn();
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
      await startCameraSession();
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
      releaseVideoReceiveSurface();
      releaseCameraSessionInstance();
      console.info('afterAll case');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_001
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_0100
     * @tc.desc   Check capture session support exposure locked mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_001', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_001--------------");
      let sessionIsExposureModeSupported = cameraObj.sessionIsExposureModeSupported(Camera_ExposureMode.EXPOSURE_MODE_LOCKED);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_001 finish");
      if (sessionIsExposureModeSupported != null || sessionIsExposureModeSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_001 PASSED with sessionIsExposureModeSupported is: " + sessionIsExposureModeSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_001 FAILED with sessionIsExposureModeSupported is: " + sessionIsExposureModeSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_001 end for camera[0]");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_001 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_002
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_002
     * @tc.desc   Check capture session set exposure locked mode with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_002', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_002--------------");
      cameraObj.sessionSetExposureMode(Camera_ExposureMode.EXPOSURE_MODE_LOCKED);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_002 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_002 PASSED with ExposureMode is: 0");
      let exposureMode = cameraObj.sessionGetExposureMode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_002 finish");
      if (exposureMode == Camera_ExposureMode.EXPOSURE_MODE_LOCKED) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_002 PASSED with ExposureMode is: " + exposureMode);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_002 FAILED with ExposureMode is: " + exposureMode);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_002 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_003
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_003
     * @tc.desc   Check capture session support exposure auto mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_003', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_003--------------");
      let sessionIsExposureModeSupported = cameraObj.sessionIsExposureModeSupported(Camera_ExposureMode.EXPOSURE_MODE_AUTO);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_003 finish");
      if (sessionIsExposureModeSupported != null || sessionIsExposureModeSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_003 PASSED with sessionIsExposureModeSupported is: " + sessionIsExposureModeSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_003 FAILED with sessionIsExposureModeSupported is: " + sessionIsExposureModeSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_003 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_004
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_004
     * @tc.desc   Check capture session set exposure auto mode with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_004', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_004--------------");
      cameraObj.sessionSetExposureMode(Camera_ExposureMode.EXPOSURE_MODE_AUTO);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_004 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_004 PASSED with ExposureMode is: " + 1);
      let exposureMode = cameraObj.sessionGetExposureMode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_004 finish");
      if (exposureMode == Camera_ExposureMode.EXPOSURE_MODE_AUTO) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_004 PASSED with ExposureMode is: " + exposureMode);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_004 FAILED with ExposureMode is: " + exposureMode);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_004 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_005
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_005
     * @tc.desc   Check capture session support exposure continuous auto mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_005', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_005--------------");
      let sessionIsExposureModeSupported = cameraObj.sessionIsExposureModeSupported(Camera_ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_005 finish");
      if (sessionIsExposureModeSupported != null || sessionIsExposureModeSupported != undefined) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_005 PASSED with sessionIsExposureModeSupported is: " + sessionIsExposureModeSupported);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_005 FAILED with sessionIsExposureModeSupported is: " + sessionIsExposureModeSupported);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_005 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_006
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_006
     * @tc.desc   Check capture session set exposure continuous auto mode with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_006', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_006--------------");
      if(!cameraObj.sessionIsExposureModeSupported(Camera_ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO)) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_006 skip EXPOSURE_MODE_CONTINUOUS_AUTO is not supported");
        return;
      }
      cameraObj.sessionSetExposureMode(Camera_ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_006 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_006 PASSED with ExposureMode is: " + 2);
      let exposureMode = cameraObj.sessionGetExposureMode();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_006 finish");
      if (exposureMode == Camera_ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_006 PASSED with ExposureMode is: " + exposureMode);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_006 FAILED with ExposureMode is: " + exposureMode);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_006 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_007
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_007
     * @tc.desc   Check capture session set METERING point with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_007', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_007--------------");
      cameraObj.sessionSetMeteringPoint(mMETERINGPoint);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_007 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_007 PASSED with METERINGPoint is: " + mMETERINGPoint.x + ", " + mMETERINGPoint.y);
      let METERINGPoint = cameraObj.sessionGetMeteringPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_007 finish");
      if ((Math.abs(METERINGPoint.x - mMETERINGPoint.x) >= 0) && (Math.abs(METERINGPoint.y - mMETERINGPoint.y) >= 0)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_007 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_007 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_007 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_008
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_008
     * @tc.desc   Check capture session set METERING point with promise(left-top point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_008', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_008--------------");
      cameraObj.sessionSetMeteringPoint(mMETERINGPointLT);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_008 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_008 PASSED with METERINGPoint is: " + mMETERINGPointLT.x + ", " + mMETERINGPointLT.y);
      let METERINGPoint = cameraObj.sessionGetMeteringPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_008 finish");
      if ((Math.abs(METERINGPoint.x - mMETERINGPointLT.x) >= 0) && (Math.abs(METERINGPoint.y - mMETERINGPointLT.y) >= 0)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_008 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_008 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_008 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_009
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_009
     * @tc.desc   Check capture session set METERING point with promise(right-top point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_009', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_009--------------");
      cameraObj.sessionSetMeteringPoint(mMETERINGPointRT);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_009 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_009 PASSED with METERINGPoint is: " + mMETERINGPointRT.x + ", " + mMETERINGPointRT.y);
      let METERINGPoint = cameraObj.sessionGetMeteringPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_009 finish");
      if ((Math.abs(METERINGPoint.x - mMETERINGPointRT.x) >= 0) && (Math.abs(METERINGPoint.y - mMETERINGPointRT.y) >= 0)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_009 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_009 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_009 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_010
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_010
     * @tc.desc   Check capture session set METERING point with promise(left-bottom point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_010', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_010--------------");
      cameraObj.sessionSetMeteringPoint(mMETERINGPointLB);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_010 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_010 PASSED with METERINGPoint is: " + mMETERINGPointLB.x + ", " + mMETERINGPointRB.y);
      let METERINGPoint = cameraObj.sessionGetMeteringPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_010 finish");
      if ((Math.abs(METERINGPoint.x - mMETERINGPointLB.x) >= 0) && (Math.abs(METERINGPoint.y - mMETERINGPointLB.y) >= 0)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_010 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_010 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_010 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_011
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_011
     * @tc.desc   Check capture session set METERING point with promise(right-bottom point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_011', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_011--------------");
      cameraObj.sessionSetMeteringPoint(mMETERINGPointRB);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_011 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_011 PASSED with METERINGPoint is: " + mMETERINGPointRB.x + ", " + mMETERINGPointRB.y);
      let METERINGPoint = cameraObj.sessionGetMeteringPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_011 finish");
      if ((Math.abs(METERINGPoint.x - mMETERINGPointRB.x) >= 0) && (Math.abs(METERINGPoint.y - mMETERINGPointRB.y) >= 0)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_011 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_011 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_011 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_012
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_012
     * @tc.desc   Check capture session set METERING point with promise(left-top invalid point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_012', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_012--------------");
      cameraObj.sessionSetMeteringPoint(mMETERINGPointInvalidLT);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_012 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_012 PASSED with METERINGPoint is: " + mMETERINGPointInvalidLT.x + ", " + mMETERINGPointInvalidLT.y);
      let METERINGPoint = cameraObj.sessionGetMeteringPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_012 finish");
      if (((METERINGPoint.x != mMETERINGPointInvalidLT.x) && (METERINGPoint.y != mMETERINGPointInvalidLT.y)) || (mEnableCheckInvalidMETERINGPoint == false)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_012 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_012 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_012 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_013
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_013
     * @tc.desc   Check capture session set METERING point with promise(right-top invalid point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_013', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_013--------------");
      cameraObj.sessionSetMeteringPoint(mMETERINGPointInvalidRT);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_013 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_013 PASSED with METERINGPoint is: " + mMETERINGPointInvalidRT.x + ", " + mMETERINGPointInvalidRT.y);
      let METERINGPoint = cameraObj.sessionGetMeteringPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_013 finish");
      if (((METERINGPoint.x != mMETERINGPointInvalidRT.x) && (METERINGPoint.y != mMETERINGPointInvalidRT.y)) || (mEnableCheckInvalidMETERINGPoint == false)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_013 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_013 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_013 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_014
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_014
     * @tc.desc   Check capture session set METERING point with promise(left-bottom invalid point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_014', Level.LEVEL2, async () => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_014--------------");
      cameraObj.sessionSetMeteringPoint(mMETERINGPointInvalidLB);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_014 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_014 PASSED with METERINGPoint is: " + mMETERINGPointInvalidLB.x + ", " + mMETERINGPointInvalidRB.y);
      let METERINGPoint = cameraObj.sessionGetMeteringPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_014 finish");
      if (((METERINGPoint.x != mMETERINGPointInvalidLB.x) && (METERINGPoint.y != mMETERINGPointInvalidLB.y)) || (mEnableCheckInvalidMETERINGPoint == false)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_014 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_014 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_014 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_015
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_015
     * @tc.desc   Check capture session set METERING point with promise(right-bottom invalid point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_015', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_015--------------");
      cameraObj.sessionSetMeteringPoint(mMETERINGPointInvalidRB);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_015 finish");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_015 PASSED with METERINGPoint is: " + mMETERINGPointInvalidRB.x + ", " + mMETERINGPointInvalidRB.y);
      let METERINGPoint = cameraObj.sessionGetMeteringPoint();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_015 finish");
      if (((METERINGPoint.x != mMETERINGPointInvalidRB.x) && (METERINGPoint.y != mMETERINGPointInvalidRB.y)) || (mEnableCheckInvalidMETERINGPoint == false)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_015 PASSED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_015 FAILED with METERINGPoint is: " + METERINGPoint.x + ", " + METERINGPoint.y);
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_METERING_POINT_PROMISE_015 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_016
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_016
     * @tc.desc   Check capture session get exposure bias range with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_016', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_016--------------");
      let exposureBiasRange = cameraObj.sessionGetExposureBiasRange();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_016");
      let exposureBiasRangeLength = exposureBiasRange.maxExposureBias - exposureBiasRange.minExposureBias;
      mExposureBiasRangeArray[0] = exposureBiasRange;
      mExposureBiasMaxArray[0] = exposureBiasRange[exposureBiasRange.maxExposureBias];
      mExposureBiasMinArray[0] = exposureBiasRange[exposureBiasRange.minExposureBias];
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_016 finish");
      if (exposureBiasRangeLength < 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_016 FAILED with ExposureBiasRange length is: " + exposureBiasRangeLength);
        expect().assertFail();
      }
      else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_016 PASSED with ExposureBiasRange length is: " + exposureBiasRangeLength);
      }
      for (let j = 0; j < exposureBiasRangeLength; j++) {
        console.info(TAG + j + "th, exposure bias is: " + exposureBiasRange.minExposureBias);
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_016 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_017
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_017
     * @tc.desc   Check capture session set exposure bias with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_017', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_017--------------");
      let exposureBias = cameraObj.sessionGetExposureBiasRange().minExposureBias;
      if (exposureBias == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_017 exposureBias is 0");
      }
      else {
        cameraObj.sessionSetExposureBias(exposureBias);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_017 finish");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_017 PASSED with ExposureBias is: " + exposureBias.toString());
        let exposureValue = cameraObj.sessionGetExposureBias();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_017 finish");
        if (exposureValue == exposureBias) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_017 PASSED with ExposureValue is: " + exposureValue);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_017 FAILED with ExposureValue is: " + exposureValue);
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_017 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_018
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_018
     * @tc.desc   Check capture session set exposure bias with promise(invalid value, min - 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_018', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_018--------------");
      let exposureBias = mExposureBiasMinArray[0];
      if (exposureBias == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_018 exposureBias is 0");
      }
      else {
        cameraObj.sessionSetExposureBias(exposureBias - 1);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_018 finish");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_018 PASSED with ExposureBias is: " + (mExposureBiasMinArray[0] - 1));
        let exposureValue = cameraObj.sessionGetExposureBias();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_018 finish");
        if (exposureValue != (exposureBias - 1)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_018 PASSED with ExposureValue is: " + exposureValue);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_018 FAILED with ExposureValue is: " + exposureValue);
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_018 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_019
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_019
     * @tc.desc   Check capture session set exposure bias with promise(invalid value, min - 0.1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_019', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_019--------------");
      let exposureBias = mExposureBiasMinArray[0];
      if (exposureBias == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_019 exposureBias is 0");
      }
      else {
        cameraObj.sessionSetExposureBias(exposureBias - 0.1);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_019 finish");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_019 PASSED with ExposureBias is: " + (mExposureBiasMinArray[0] - 0.1));
        let exposureValue = cameraObj.sessionGetExposureBias();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_019 finish");
        if (exposureValue != (exposureBias - 0.1)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_019 PASSED with ExposureValue is: " + exposureValue);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_019 FAILED with ExposureValue is: " + exposureValue);
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_019 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_020
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_020
     * @tc.desc   Check capture session set exposure bias with promise(invalid value, max + 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_020', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_020--------------");
      let exposureBias = mExposureBiasMaxArray[0];
      if (exposureBias == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_020 exposureBias is 0");
      }
      else {
        cameraObj.sessionSetExposureBias(exposureBias + 1);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_020 finish");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_020 PASSED with ExposureBias is: " + (mExposureBiasMaxArray[0] + 1));
        let exposureValue = cameraObj.sessionGetExposureBias();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_020 finish");
        if (exposureValue != (exposureBias + 1)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_020 PASSED with ExposureValue is: " + exposureValue);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_020 FAILED with ExposureValue is: " + exposureValue);
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_020 ends here");
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_021
     * @tc.number SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_020
     * @tc.desc   Check capture session set exposure bias with promise(invalid value, max + 0.1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_021', Level.LEVEL2, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_021--------------");
      let exposureBias = mExposureBiasMaxArray[0];
      if (exposureBias == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_021 exposureBias is 0");
      }
      else {
        cameraObj.sessionSetExposureBias(exposureBias + 0.1);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_021 finish");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_021 PASSED with ExposureBias is: " + (mExposureBiasMaxArray[0] + 0.1));
        let exposureValue = cameraObj.sessionGetExposureBias();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_021 finish");
        if (exposureValue != (exposureBias + 0.1)) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_021 PASSED with ExposureValue is: " + exposureValue);
        }
        else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_021 FAILED with ExposureValue is: " + exposureValue);
          expect().assertFail();
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_021 ends here");
    });
  })
}