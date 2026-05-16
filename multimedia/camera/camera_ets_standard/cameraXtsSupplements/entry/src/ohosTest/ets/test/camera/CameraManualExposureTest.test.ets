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
import { common, ErrorCode } from '@kit.AbilityKit';
import { camera, cameraPicker } from '@kit.CameraKit';
import {
  closeFd,
  COMMON_WAIT_DURATION,
  driveFn,
  getFd,
  getPermission,
  isEmpty,
  resourceName,
  sceneMode,
  sleep
} from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import { BusinessError } from '@kit.BasicServicesKit';
import { media } from '@kit.MediaKit';
import { fileUri } from '@kit.CoreFileKit';

const TAG = "CameraXtsCameraManualExposureTest";
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let mVideoSurfaceId: string;
let mVideoSession: camera.VideoSession;
let mAVRecorder: media.AVRecorder;
let mVideoOutput: camera.VideoOutput;
let mPhotoSession: camera.PhotoSession;
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


async function getCreatePhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
  console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
  mPhotoSession.beginConfig();
  mPhotoSession.addInput(mCameraInput);
  await mCameraInput.open();
  mPhotoSession.addOutput(previewOutput);
  mPhotoSession.addOutput(photoOutput);
  await mPhotoSession.commitConfig();
  console.info(TAG, 'getCreatePhotoSession.success',);
}


async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mPhotoSession?.release();
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

async function createVideoOutput() {
  await getVideoSurfaceId();
  let useDevice: camera.CameraDevice = mCameraDeviceArray[0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray) {
    mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[0]);
    if (mSupportedModes.includes(camera.SceneMode.NORMAL_VIDEO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let videoProfile = cameraOutputCap.videoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles) {
    let foundProfile = cameraOutputCap.videoProfiles.find((indexVideoProfile: camera.Profile) => {
      console.log(TAG, 'find videoProfile: w: ' + indexVideoProfile.size.width + 'h: ' + indexVideoProfile.size.height);
      console.log(TAG,
        'find previewProfile: w: ' + indexPreviewProfiles.size.width + 'h: ' + indexPreviewProfiles.size.height);
      return Math.abs((indexVideoProfile.size.width * indexPreviewProfiles.size.height) -
        (indexPreviewProfiles.size.width * indexVideoProfile.size.height)) < Number.EPSILON;
    })
    if (foundProfile) {
      videoProfile = foundProfile;
      previewProfile = indexPreviewProfiles;
      break;
    }
  }
  console.log(TAG, 'videoProfile: w: ' + videoProfile.size.width + 'h: ' + videoProfile.size.height);
  console.log(TAG, 'previewProfile: w: ' + previewProfile.size.width + 'h: ' + previewProfile.size.height);
  CameraVideoProfile.videoFrameWidth = videoProfile.size.width;
  CameraVideoProfile.videoFrameHeight = videoProfile.size.height;
  mPreviewOutput = mCameraManager.createPreviewOutput(previewProfile, indexSurfaceId);
  console.log(TAG, 'createVideoOutput' + videoProfile, 'surfaceID', mVideoSurfaceId);
  mVideoOutput = mCameraManager.createVideoOutput(videoProfile, mVideoSurfaceId);
  console.log(TAG, 'create preview output' + mPreviewOutput, 'createVideoOutput', mVideoOutput);
}

async function getCreateVideoSession(testName: string, previewOutput: camera.PreviewOutput,
  videoOutput: camera.VideoOutput) {
  console.info(TAG, 'getCreateVideoSession.');
  mVideoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_VIDEO);
  mVideoSession.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mVideoSession.addInput(mCameraInput);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput.open();
  console.info(TAG, testName + ' camera open passed.');
  mVideoSession.addOutput(previewOutput);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mVideoSession.addOutput(videoOutput);
  console.info(TAG, testName + ' addOutput videoOutput passed.');
  await mVideoSession.commitConfig();
  console.info(TAG, testName + ' session commitConfig successfully.');
}


async function releaseVideoSession() {
  console.info(TAG, 'releaseVideoSession.');
  await mAVRecorder?.release();
  await mPreviewOutput?.release();
  await mVideoOutput?.release();
  await mVideoSession?.release();
}

export default function CameraManualExposureTest() {
  describe('CameraManualExposureTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
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
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_0100
     * @tc.desc   getRAWCaptureZoomRatioRange normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_0100';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        console.info(TAG, testName,"photoSesion",mPhotoSession);
        let rawCaptureZoomRatioRange = mPhotoSession.getRAWCaptureZoomRatioRange();
        console.info(TAG, testName + ' rawCaptureZoomRatioRange: ' + JSON.stringify(rawCaptureZoomRatioRange));
        expect(isEmpty(rawCaptureZoomRatioRange)).assertTrue();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_0200
     * @tc.desc   getRAWCaptureZoomRatioRange abnormal test 7400103.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_0200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_0200';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
        let rawCaptureZoomRatioRange = mPhotoSession.getRAWCaptureZoomRatioRange();
        console.info(TAG, testName + ' rawCaptureZoomRatioRange: ' + JSON.stringify(rawCaptureZoomRatioRange));
        expect().assertFail();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(Number(err.code)).assertEqual(7400103);
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_0300
     * @tc.desc   getRAWCaptureZoomRatioRange normal test 7400102.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_0300', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_GET_RAW_CAPTURE_ZOOM_RATIO_RANGE_NORMAL_0300';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
        await mPhotoSession.commitConfig();
        mPhotoSession.beginConfig();
        mPhotoSession.addInput(mCameraInput);
        await mCameraInput.open();
        let rawCaptureZoomRatioRange = mPhotoSession.getRAWCaptureZoomRatioRange();
        console.info(TAG, testName + ' rawCaptureZoomRatioRange: ' + JSON.stringify(rawCaptureZoomRatioRange));
        expect().assertFail();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(Number(err.code)).assertEqual(7400102);
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0100
     * @tc.desc   getSupportedExposureDurationRange normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0100';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        let durationRange: Array<number> = mPhotoSession!.getSupportedExposureDurationRange();
        console.info(TAG, testName + ' durationRange: ' + JSON.stringify(durationRange));
        expect(isEmpty(durationRange)).assertFalse();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail()
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0200
     * @tc.desc   getSupportedExposureDurationRange normal test 7400102.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0200';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
        await mPhotoSession.commitConfig();
        mPhotoSession.beginConfig();
        mPhotoSession.addInput(mCameraInput);
        await mCameraInput.open();
        let durationRange: Array<number> = mPhotoSession!.getSupportedExposureDurationRange();
        console.info(TAG, testName + ' durationRange: ' + JSON.stringify(durationRange));
        expect().assertFail();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(Number(err.code)).assertEqual(7400102);
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0300
     * @tc.desc   getSupportedExposureDurationRange normal test 7400103.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0300', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_MANUAL_EXPOSURE_QUERY_GET_SUPPORTED_EXPOSURE_DURATION_RANGE_0300';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
        let durationRange: Array<number> = mPhotoSession!.getSupportedExposureDurationRange();
        console.info(TAG, testName + ' durationRange: ' + JSON.stringify(durationRange));
        expect(isEmpty(durationRange)).assertTrue();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(Number(err.code)).assertEqual(7400103);
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_0100
     * @tc.desc   getExposureBiasStep abnormal test 7400103.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_0100';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
        let biasStep: number = mPhotoSession!.getExposureBiasStep();
        console.info(TAG, testName + ' getExposureBiasStep success: ' + biasStep);
        expect().assertFail();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(Number(err.code)).assertEqual(7400103);
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_0200
     * @tc.desc   getExposureBiasStep abnormal test 7400102.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_0200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_EXPOSURE_QUERY_GET_EXPOSURE_BIAS_STEP_0200';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
        await mPhotoSession.commitConfig();
        mPhotoSession.beginConfig();
        mPhotoSession.addInput(mCameraInput);
        await mCameraInput.open();
        let biasStep: number = mPhotoSession!.getExposureBiasStep();
        console.info(TAG, testName + ' getExposureBiasStep success: ' + biasStep);
        expect().assertFail();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(Number(err.code)).assertEqual(7400102);
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0100
     * @tc.desc   getExposureDuration abnormal test 7400103.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0100';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
        let exposureDuration: number = mPhotoSession!.getExposureDuration();
        console.info(TAG, testName + ' getExposureBiasStep success: ' + exposureDuration);
        expect().assertFail();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(Number(err.code)).assertEqual(7400103);
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0200
     * @tc.desc   getExposureDuration abnormal test .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0200';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
        await mPhotoSession.commitConfig();
        mPhotoSession.beginConfig();
        mPhotoSession.addInput(mCameraInput);
        await mCameraInput.open();
        let exposureDuration: number = mPhotoSession!.getExposureDuration();
        console.info(TAG, testName + ' getExposureBiasStep success: ' + exposureDuration);
        expect().assertFail();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(Number(err.code)).assertEqual(7400102);
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0300
     * @tc.desc   getExposureDuration abnormal test .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0300', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0300';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        let exValue = mPhotoSession.getExposureDuration();
        console.info(TAG, testName + ' setExposureDuration success: ',exValue);
        mPhotoSession.setExposureDuration(null);
        console.info(TAG, testName + ' setExposureDuration success: ');
        let newExValue = mPhotoSession.getExposureDuration();
        console.info(TAG, testName + ' setExposureDuration success: ',newExValue);
        expect(newExValue == exValue).assertTrue();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0400
     * @tc.desc   getExposureDuration abnormal test .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0400', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0400';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        let exValue = mPhotoSession.getExposureDuration();
        console.info(TAG, testName + ' setExposureDuration success: ',exValue);
        mPhotoSession.setExposureDuration(undefined);
        console.info(TAG, testName + ' setExposureDuration success: ');
        let newExValue = mPhotoSession.getExposureDuration();
        console.info(TAG, testName + ' setExposureDuration success: ',newExValue);
        expect(newExValue == exValue).assertTrue()
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0500
     * @tc.desc   getExposureDuration abnormal test 7400103 .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0500', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_DURATION_0500';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
        console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
        let exposureDuration = 10 ;
        await mPhotoSession!.setExposureDuration(exposureDuration);
        console.info(TAG, testName + ' getExposureBiasStep success: ' + exposureDuration);
        expect().assertFail();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(Number(err.code)).assertEqual(7400103);
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_0100
     * @tc.desc   addDeferredSurface abnormal test 7400101.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_0100';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPreviewOutput.addDeferredSurface("");
        console.info(TAG, testName + ' addDeferredSurface success: ');
        expect().assertFail();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(Number(err.code)).assertEqual(7400101);
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_0200
     * @tc.desc   addDeferredSurface abnormal test 7400101.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_0200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_0200';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPreviewOutput.addDeferredSurface(null);
        console.info(TAG, testName + ' addDeferredSurface success: ');
        expect().assertFail();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(Number(err.code)).assertEqual(7400101);
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_0300
     * @tc.desc   addDeferredSurface abnormal test 7400101.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_0300', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_ADD_DEFERRED_SURFACE_0300';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPreviewOutput.addDeferredSurface(undefined);
        console.info(TAG, testName + ' addDeferredSurface success: ');
        expect().assertFail();
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(Number(err.code)).assertEqual(7400101);
        await releasePhotoSession();
        done();
      }
    })

  })
}