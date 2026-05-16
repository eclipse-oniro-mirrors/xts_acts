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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import {
  closeFd,
  COMMON_WAIT_DURATION,
  driveFn,
  getFd,
  getPermission,
  isEmpty,
  resourceName,
  sleep
} from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import { BusinessError } from '@kit.BasicServicesKit';
import { media } from '@kit.MediaKit';

const TAG = "CameraCaptureSessionTestSupp";
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let mVideoOutput: camera.VideoOutput;
let mVideoSurfaceId: string;
let mPhotoSession: camera.PhotoSession;
let mVideoSession: camera.VideoSession;
let mCaptureSession: camera.CaptureSession;
let mAVRecorder: media.AVRecorder;
let fdNumber: number;
let fdPath: string;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

let CameraVideoProfile: media.AVRecorderProfile = {
  audioBitrate: 48000,
  audioChannels: 2,
  audioCodec: media.CodecMimeType.AUDIO_AAC,
  audioSampleRate: 48000,
  fileFormat: media.ContainerFormatType.CFT_MPEG_4,
  videoBitrate: 2000000,
  videoCodec: media.CodecMimeType.VIDEO_AVC,
  videoFrameWidth: 640,
  videoFrameHeight: 480,
  videoFrameRate: 30
};

let videoConfig: media.AVRecorderConfig = {
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: CameraVideoProfile,
  url: 'file://',
  location: { latitude: 30, longitude: 130 } as camera.Location,
  rotation: 0
};

function getCameraManager() {
  console.info(TAG, 'getCameraManager.');
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmpty(mCameraManager)) {
    return false;
  }
  console.info(TAG, 'mCameraManager created successfully.');
  return true;
}

function getSupportedCameraDeviceArray() {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager.getSupportedCameras();
  if (isEmpty(mCameraDeviceArray)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray.length);
  return true;
}

function getCameraInput() {
  console.info(TAG, 'getCameraInput.');
  if (mCameraDeviceArray.length) {
    mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
    if (isEmpty(mCameraInput)) {
      return false;
    }
    return true;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return false;
}


async function getVideoSurfaceId() {
  console.info(TAG, 'getVideoSurfaceId begin.');
  let fileName: string = resourceName();
  fdNumber = await getFd(fileName);
  fdPath = "fd://" + fdNumber;
  console.info(TAG, 'case fdPath is: ' + fdPath);
  videoConfig.url = fdPath;
  console.info(TAG, 'get videoConfig url.');
  mAVRecorder = await media.createAVRecorder();
  expect(isEmpty(mAVRecorder)).assertFalse();
  console.info(TAG, 'createAVRecorder passed. state: ' + mAVRecorder.state);
  await mAVRecorder.prepare(videoConfig).then(() => {
    console.info('prepare success');
  }).catch((error: BusinessError) => {
    console.error(TAG, 'failed to prepare, err: ' + error.code + ', msg: ' + error.message);
  });
  console.info(TAG, 'AVRecorder state: ' + mAVRecorder.state);
  mVideoSurfaceId = await mAVRecorder.getInputSurface();
  console.info(TAG, 'mVideoSurfaceId: ' + mVideoSurfaceId);
}

function createPhotoOutput() {
  let useDevice: camera.CameraDevice = mCameraDeviceArray[0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray) {
    mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[0]);
    if (mSupportedModes.includes(camera.SceneMode.NORMAL_PHOTO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let photoProfile = cameraOutputCap.photoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles) {
    let foundProfile = cameraOutputCap.photoProfiles.find((indexPhotoProfile: camera.Profile) => {
      console.log(TAG, 'find photoProfile: w: ' + indexPhotoProfile.size.width + 'h: ' + indexPhotoProfile.size.height);
      console.log(TAG,
        'find previewProfile: w: ' + indexPreviewProfiles.size.width + 'h: ' + indexPreviewProfiles.size.height);
      return Math.abs((indexPhotoProfile.size.width * indexPreviewProfiles.size.height) -
        (indexPreviewProfiles.size.width * indexPhotoProfile.size.height)) < Number.EPSILON;
    })
    if (foundProfile) {
      photoProfile = foundProfile;
      previewProfile = indexPreviewProfiles;
      break;
    }
  }
  console.log(TAG, 'photoProfile: w: ' + photoProfile.size.width + 'h: ' + photoProfile.size.height);
  console.log(TAG, 'previewProfile: w: ' + previewProfile.size.width + 'h: ' + previewProfile.size.height);
  mPreviewOutput = mCameraManager.createPreviewOutput(previewProfile, indexSurfaceId);
  mPhotoOutput = mCameraManager.createPhotoOutput(photoProfile);
}

async function getCreateCaptureSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreateCaptureSession.');
  mCaptureSession = mCameraManager.createCaptureSession();
  console.info(TAG, 'getCreateCaptureSession.', mCaptureSession);
  mCaptureSession.beginConfig();
  mCaptureSession.addInput(mCameraInput);
  await mCameraInput.open();
  mCaptureSession.addOutput(previewOutput);
  mCaptureSession.addOutput(photoOutput);
  await mCaptureSession.commitConfig();
  mCaptureSession.start();
}

async function releaseCaptureSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mCaptureSession?.release();
}


export default function CameraCaptureSessionTest() {
  describe('CameraCaptureSessionTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      AppStorage.setOrCreate('emptyString', '')
      getCameraManager();
      getSupportedCameraDeviceArray();
      getCameraInput();
    });

    beforeEach(() => {
      console.info('afterEach case');
    });

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(COMMON_WAIT_DURATION);
    });

    afterAll(async () => {
      console.info('afterAll case');
      await closeFd(fdNumber);
      AppStorage.delete('emptyString')
    });
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_MODE_001
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_MODE_001
     * @tc.desc   setExposureMode ExposureMode EXPOSURE_MODE_LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_MODE_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_MODE_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        let aeMode = camera.ExposureMode.EXPOSURE_MODE_LOCKED;
        console.info(TAG, 'aeMode')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'mCaptureSession');
        let support = mCaptureSession.isExposureModeSupported(aeMode);
        console.info(TAG, 'support')
        if (support) {
          mCaptureSession.setExposureMode(aeMode);
          console.info(TAG, 'success setExposureMode')
          let res: camera.ExposureMode = mCaptureSession.getExposureMode();
          console.info(TAG, testName, 'getExposureMode', res);
          expect(res == camera.ExposureMode.EXPOSURE_MODE_LOCKED).assertTrue()
        }
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_MODE_002
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_MODE_002
     * @tc.desc   setExposureMode ExposureMode EXPOSURE_MODE_CONTINUOUS_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_MODE_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_MODE_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        let aeMode = camera.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO;
        console.info(TAG, 'aeMode')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'mCaptureSession');
        let support = mCaptureSession.isExposureModeSupported(aeMode);
        console.info(TAG, 'support')
        if (support) {
          mCaptureSession.setExposureMode(aeMode);
          console.info(TAG, 'success setExposureMode')
          let res: camera.ExposureMode = mCaptureSession.getExposureMode();
          console.info(TAG, testName, 'getExposureMode', res);
          expect(res == camera.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO).assertTrue()
        }
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_FLASH_MODE_001
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_FLASH_MODE_001
     * @tc.desc   setFlashMode FlashMode FLASH_MODE_CLOSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_FLASH_MODE_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_FLASH_MODE_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        let flashMode = camera.FlashMode.FLASH_MODE_CLOSE;
        console.info(TAG, 'flashMode')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        let support = mCaptureSession.isFlashModeSupported(flashMode);
        console.info(TAG, 'support')
        if (support) {
          mCaptureSession.setFlashMode(flashMode);
          console.info(TAG, 'success setFlashMode')
          let res: camera.FlashMode = mCaptureSession.getFlashMode();
          console.info(TAG, testName, 'getFlashMode', res);
          expect(res == camera.FlashMode.FLASH_MODE_CLOSE).assertTrue()
        }
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_FLASH_MODE_002
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_FLASH_MODE_002
     * @tc.desc   setFlashMode FlashMode FLASH_MODE_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_FLASH_MODE_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_FLASH_MODE_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        let flashMode = camera.FlashMode.FLASH_MODE_OPEN;
        console.info(TAG, 'flashMode')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        let support = mCaptureSession.isFlashModeSupported(flashMode);
        console.info(TAG, 'support')
        if (support) {
          mCaptureSession.setFlashMode(flashMode);
          console.info(TAG, 'success setFlashMode')
          let res: camera.FlashMode = mCaptureSession.getFlashMode();
          console.info(TAG, testName, 'getFlashMode', res);
          expect(res == camera.FlashMode.FLASH_MODE_OPEN).assertTrue()
        }
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_FLASH_MODE_003
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_FLASH_MODE_003
     * @tc.desc   setFlashMode FlashMode FLASH_MODE_ALWAYS_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_FLASH_MODE_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_FLASH_MODE_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        let flashMode = camera.FlashMode.FLASH_MODE_ALWAYS_OPEN;
        console.info(TAG, 'flashMode')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        let support = mCaptureSession.isFlashModeSupported(flashMode);
        console.info(TAG, 'support')
        if (support) {
          mCaptureSession.setFlashMode(flashMode);
          console.info(TAG, 'success setFlashMode')
          let res: camera.FlashMode = mCaptureSession.getFlashMode();
          console.info(TAG, testName, 'getFlashMode', res);
          expect(res == camera.FlashMode.FLASH_MODE_ALWAYS_OPEN).assertTrue()
        }
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_METERING_POINT_001
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_METERING_POINT_001
     * @tc.desc   setMeteringPoint null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_METERING_POINT_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_METERING_POINT_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, testName, 'getCreateCaptureSession');
        let point: camera.Point = { x: 1, y: 1 }
        console.info(TAG, 'point')
        mCaptureSession.setMeteringPoint(point);
        console.info(TAG, testName, 'success');
        mCaptureSession.setMeteringPoint(null);
        console.info(TAG, testName, 'success setMeteringPoint');
        let result = mCaptureSession.getMeteringPoint();
        console.info(TAG, testName, 'success getMeteringPoint', JSON.stringify(result));
        expect(result.x).assertEqual(point.x)
        expect(result.y).assertEqual(point.y)
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_METERING_POINT_002
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_METERING_POINT_002
     * @tc.desc   setMeteringPoint undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_METERING_POINT_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_METERING_POINT_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, testName, 'getCreateCaptureSession');
        let point: camera.Point = { x: 1, y: 1 }
        console.info(TAG, 'point')
        mCaptureSession.setMeteringPoint(point);
        console.info(TAG, testName, 'success');
        mCaptureSession.setMeteringPoint(undefined);
        console.info(TAG, testName, 'success setMeteringPoint');
        let result = mCaptureSession.getMeteringPoint();
        console.info(TAG, testName, 'success getMeteringPoint', JSON.stringify(result));
        expect(result.x).assertEqual(point.x)
        expect(result.y).assertEqual(point.y)
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_METERING_POINT_003
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_METERING_POINT_003
     * @tc.desc   setMeteringPoint 空值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_METERING_POINT_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_METERING_POINT_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, testName, 'getCreateCaptureSession');
        let point: camera.Point = { x: 1, y: 1 }
        console.info(TAG, 'point')
        mCaptureSession.setMeteringPoint(point);
        console.info(TAG, testName, 'success');
        mCaptureSession.setMeteringPoint(AppStorage.get('emptyString'));
        console.info(TAG, testName, 'success setMeteringPoint');
        let result = mCaptureSession.getMeteringPoint();
        console.info(TAG, testName, 'success getMeteringPoint', JSON.stringify(result));
        expect(result.x).assertEqual(point.x)
        expect(result.y).assertEqual(point.y)
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_GET_METERING_POINT_001
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_GET_METERING_POINT_001
     * @tc.desc   getMeteringPoint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_GET_METERING_POINT_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_GET_METERING_POINT_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, testName, 'getCreateCaptureSession');
        let point: camera.Point = { x: 1, y: 1 }
        console.info(TAG, 'point')
        mCaptureSession.setMeteringPoint(point);
        let result = mCaptureSession.getMeteringPoint();
        console.info(TAG, testName, 'success getMeteringPoint', JSON.stringify(result));
        expect(result.x).assertEqual(point.x)
        expect(result.y).assertEqual(point.y)
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_REMOVE_INPUT_001
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_REMOVE_INPUT_001
     * @tc.desc   removeInput null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_REMOVE_INPUT_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_REMOVE_INPUT_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        console.info(TAG, 'start')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, testName, 'getCreateCaptureSession');
        mCaptureSession.beginConfig();
        console.info(TAG, testName + 'beginConfig passed.')
        mCaptureSession.removeInput(null);
        console.info(TAG, testName, 'success removeInput');
        expect().assertFail()
        await releaseCaptureSession();
        done();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(Number(error.code)).assertEqual(7400101)
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_REMOVE_INPUT_002
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_REMOVE_INPUT_002
     * @tc.desc   removeInput undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_REMOVE_INPUT_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_REMOVE_INPUT_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        console.info(TAG, 'start')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, testName, 'getCreateCaptureSession');
        mCaptureSession.beginConfig();
        console.info(TAG, testName + 'beginConfig passed.')
        mCaptureSession.removeInput(undefined);
        console.info(TAG, testName, 'success removeInput');
        expect().assertFail()
        await releaseCaptureSession();
        done();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(Number(error.code)).assertEqual(7400101)
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_REMOVE_INPUT_003
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_REMOVE_INPUT_003
     * @tc.desc   removeInput 空值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_REMOVE_INPUT_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_REMOVE_INPUT_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        console.info(TAG, 'start')
        mCaptureSession = mCameraManager.createCaptureSession();
        console.info(TAG, 'getCreateCaptureSession.', mCaptureSession);
        mCaptureSession.beginConfig();
        console.info(TAG, testName + 'beginConfig passed.')
        mCaptureSession.removeInput(AppStorage.get('emptyString'));
        console.info(TAG, testName, 'success removeInput');
        expect().assertFail()
        await releaseCaptureSession();
        done();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(Number(error.code)).assertEqual(7400101)
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_MODE_001
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_MODE_001
     * @tc.desc   setFocusMode FocusMode FOCUS_MODE_CONTINUOUS_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_MODE_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_MODE_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        let afMode = camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO;
        console.info(TAG, 'focusMode')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        let support = mCaptureSession.isFocusModeSupported(afMode);
        console.info(TAG, 'support')
        if (support) {
          mCaptureSession.setFocusMode(afMode);
          console.info(TAG, 'success setFocusMode')
          let res: camera.FocusMode = mCaptureSession.getFocusMode();
          console.info(TAG, testName, 'getExposureMode', res);
          expect(res == camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO).assertTrue()
        }
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_MODE_002
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_MODE_002
     * @tc.desc   setFocusMode FocusMode FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_MODE_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_MODE_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        let afMode = camera.FocusMode.FOCUS_MODE_AUTO;
        console.info(TAG, 'focusMode')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        let support = mCaptureSession.isFocusModeSupported(afMode);
        console.info(TAG, 'support')
        if (support) {
          mCaptureSession.setFocusMode(afMode);
          console.info(TAG, 'success setFocusMode')
          let res: camera.FocusMode = mCaptureSession.getFocusMode();
          console.info(TAG, testName, 'getExposureMode', res);
          expect(res == camera.FocusMode.FOCUS_MODE_AUTO).assertTrue()
        }
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_MODE_003
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_MODE_003
     * @tc.desc   setFocusMode FocusMode FOCUS_MODE_LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_MODE_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_MODE_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        let afMode = camera.FocusMode.FOCUS_MODE_LOCKED;
        console.info(TAG, 'focusMode')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        let support = mCaptureSession.isFocusModeSupported(afMode);
        console.info(TAG, 'support')
        if (support) {
          mCaptureSession.setFocusMode(afMode);
          console.info(TAG, 'success setFocusMode')
          let res: camera.FocusMode = mCaptureSession.getFocusMode();
          console.info(TAG, testName, 'getExposureMode', res);
          expect(res == camera.FocusMode.FOCUS_MODE_LOCKED).assertTrue()
        }
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_POINT_001
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_POINT_001
     * @tc.desc   setFocusPoint null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_POINT_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_POINT_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        console.info(TAG, 'start')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        const point: camera.Point = { x: 0, y: 1 };
        mCaptureSession.setFocusPoint(point);
        console.info(TAG, 'success setFocusPoint')
        mCaptureSession.setFocusPoint(null);
        console.info(TAG, 'success')
        let res = mCaptureSession.getFocusPoint();
        console.info(TAG, 'success getFocusPoint', JSON.stringify(res))
        expect(res.x).assertEqual(point.x);
        expect(res.y).assertEqual(point.y);
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_POINT_002
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_POINT_002
     * @tc.desc   setFocusPoint undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_POINT_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_POINT_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        console.info(TAG, 'start')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        const point: camera.Point = { x: 0, y: 1 };
        mCaptureSession.setFocusPoint(point);
        console.info(TAG, 'success setFocusPoint')
        mCaptureSession.setFocusPoint(undefined);
        console.info(TAG, 'success')
        let res = mCaptureSession.getFocusPoint();
        console.info(TAG, 'success getFocusPoint', JSON.stringify(res))
        expect(res.x).assertEqual(point.x);
        expect(res.y).assertEqual(point.y);
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_POINT_003
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_POINT_003
     * @tc.desc   setFocusPoint 空值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_POINT_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_FOCUS_POINT_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        console.info(TAG, 'start')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        const point: camera.Point = { x: 0, y: 1 };
        mCaptureSession.setFocusPoint(point);
        console.info(TAG, 'success setFocusPoint')
        mCaptureSession.setFocusPoint(AppStorage.get('emptyString'));
        console.info(TAG, 'success')
        let res = mCaptureSession.getFocusPoint();
        console.info(TAG, 'success getFocusPoint', JSON.stringify(res))
        expect(res.x).assertEqual(point.x);
        expect(res.y).assertEqual(point.y);
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_ZOOM_RATIO_001
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_ZOOM_RATIO_001
     * @tc.desc   setZoomRatio null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_ZOOM_RATIO_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_ZOOM_RATIO_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        console.info(TAG, 'start')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');

        if (mCaptureSession.getZoomRatioRange()) {
          let res: Array<number> = mCaptureSession.getZoomRatioRange();
          console.info(TAG, testName, 'video FocusModeSupported, expected: ', JSON.stringify(res));
          mCaptureSession.setZoomRatio(null);
          console.info(TAG, 'success setZoomRatio')
          let result = mCaptureSession.getZoomRatio()
          console.info(TAG, 'getZoomRatioRange', JSON.stringify(result))
        } else {
          console.error(TAG, testName, "该设备不支持变焦");
        }
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_ZOOM_RATIO_002
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_ZOOM_RATIO_002
     * @tc.desc   setZoomRatio undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_ZOOM_RATIO_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_ZOOM_RATIO_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        console.info(TAG, 'start')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        if (mCaptureSession.getZoomRatioRange()) {
          let res: Array<number> = mCaptureSession.getZoomRatioRange();
          console.info(TAG, testName, 'video FocusModeSupported, expected: ', JSON.stringify(res));
          mCaptureSession.setZoomRatio(undefined);
          console.info(TAG, 'success setZoomRatio')
          let result = mCaptureSession.getZoomRatio()
          console.info(TAG, 'getZoomRatioRange', JSON.stringify(result))
        } else {
          console.error(TAG, testName, "该设备不支持变焦");
        }
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_ZOOM_RATIO_003
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_ZOOM_RATIO_003
     * @tc.desc   setZoomRatio 空值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_ZOOM_RATIO_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_ZOOM_RATIO_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        console.info(TAG, 'start')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        if (mCaptureSession.getZoomRatioRange()) {
          let res: Array<number> = mCaptureSession.getZoomRatioRange();
          console.info(TAG, testName, 'video FocusModeSupported, expected: ', JSON.stringify(res));
          mCaptureSession.setZoomRatio(AppStorage.get('emptyString'));
          console.info(TAG, 'success setZoomRatio')
          let result = mCaptureSession.getZoomRatio()
          console.info(TAG, 'getZoomRatioRange', JSON.stringify(result))
        } else {
          console.error(TAG, testName, "该设备不支持变焦");
        }
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_001
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_001
     * @tc.desc   setVideoStabilizationMode VideoStabilizationMode OFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        let mode = camera.VideoStabilizationMode.OFF;
        console.info(TAG, 'mode')
        let vsMode = camera.VideoStabilizationMode.OFF;
        console.info(TAG, 'vsMode')
        if (mCaptureSession.isVideoStabilizationModeSupported(vsMode)) {
          mCaptureSession.setVideoStabilizationMode(mode);
          console.info(TAG, 'success setVideoStabilizationMode')
          let res: camera.VideoStabilizationMode = mCaptureSession.getActiveVideoStabilizationMode();
          console.info(TAG, 'success getActiveVideoStabilizationMode', JSON.stringify(res))
          expect(res == camera.VideoStabilizationMode.OFF).assertTrue()
        } else {
          console.error(TAG, testName + '当前设备不支持此配置');
        }
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_002
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_002
     * @tc.desc   setVideoStabilizationMode VideoStabilizationMode MIDDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        let mode = camera.VideoStabilizationMode.MIDDLE;
        console.info(TAG, 'mode', mode)
        let vsMode = camera.VideoStabilizationMode.MIDDLE;
        console.info(TAG, 'vsMode')
        if (mCaptureSession.isVideoStabilizationModeSupported(vsMode)) {
          mCaptureSession.setVideoStabilizationMode(mode);
          console.info(TAG, 'success setVideoStabilizationMode')
          let res: camera.VideoStabilizationMode = mCaptureSession.getActiveVideoStabilizationMode();
          console.info(TAG, 'success getActiveVideoStabilizationMode', JSON.stringify(res))
          expect(res == camera.VideoStabilizationMode.MIDDLE).assertTrue()
        } else {
          console.error(TAG, testName + '当前设备不支持此配置');
        }
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_003
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_003
     * @tc.desc   setVideoStabilizationMode VideoStabilizationMode AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_VIDEO_STABILIZATION_MODE_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        let mode = camera.VideoStabilizationMode.AUTO;
        console.info(TAG, 'mode', mode)
        let vsMode = camera.VideoStabilizationMode.AUTO;
        console.info(TAG, 'vsMode')
        if (mCaptureSession.isVideoStabilizationModeSupported(vsMode)) {
          mCaptureSession.setVideoStabilizationMode(mode);
          console.info(TAG, 'success setVideoStabilizationMode')
          let res: camera.VideoStabilizationMode = mCaptureSession.getActiveVideoStabilizationMode();
          console.info(TAG, 'success getActiveVideoStabilizationMode', JSON.stringify(res))
          expect(res == camera.VideoStabilizationMode.AUTO).assertTrue()
        } else {
          console.error(TAG, testName + '当前设备不支持此配置');
        }
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_BIAS_001
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_BIAS_001
     * @tc.desc   setExposureBias null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_BIAS_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_BIAS_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        console.info(TAG, 'start')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        let biasRangeArray: Array<number> = [];
        biasRangeArray = mCaptureSession.getExposureBiasRange();
        console.info(TAG, 'getExposureBiasRange', JSON.stringify(biasRangeArray))
        mCaptureSession.setExposureBias(null);
        console.info(TAG, 'success setExposureBias')
        let res = mCaptureSession.getExposureValue();
        console.info(TAG, 'success getExposureValue', JSON.stringify(res))
        expect(res == 0).assertTrue();
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_BIAS_002
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_BIAS_002
     * @tc.desc   setExposureBias undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_BIAS_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_BIAS_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        console.info(TAG, 'start')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        let biasRangeArray: Array<number> = [];
        biasRangeArray = mCaptureSession.getExposureBiasRange();
        console.info(TAG, 'getExposureBiasRange', JSON.stringify(biasRangeArray))
        mCaptureSession.setExposureBias(undefined);
        console.info(TAG, 'success setExposureBias')
        let res = mCaptureSession.getExposureValue();
        console.info(TAG, 'success getExposureValue', JSON.stringify(res))
        expect(res == 0).assertTrue();
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_BIAS_003
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_BIAS_003
     * @tc.desc   setExposureBias 空值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_BIAS_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_SET_EXPOSURE_BIAS_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        console.info(TAG, 'start')
        await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, 'getCreateCaptureSession');
        let biasRangeArray: Array<number> = [];
        biasRangeArray = mCaptureSession.getExposureBiasRange();
        console.info(TAG, 'getExposureBiasRange', JSON.stringify(biasRangeArray))
        mCaptureSession.setExposureBias(AppStorage.get('emptyString'));
        console.info(TAG, 'success setExposureBias')
        let res = mCaptureSession.getExposureValue();
        console.info(TAG, 'success getExposureValue', JSON.stringify(res))
        expect(res == 0).assertTrue();
        await releaseCaptureSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releaseCaptureSession();
        done();
      }
    })
  })
}