/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
  checkBackCamera,
  cameraErrorCode,
  cameraFocusMode,
  cameraPreconfigRatio,
  cameraPreconfigType,
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
import { media } from '@kit.MediaKit';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "CameraXts.CameraSessionFocusTest";
const abnormalValue = -1;
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mCameraOutputCapModePhoto: camera.CameraOutputCapability;
let mCameraOutputCapModeVideo: camera.CameraOutputCapability;
let mPreviewProfilesArray: Array<camera.Profile>;
let mPreviewProfile: camera.Profile | undefined;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let mVideoOutput: camera.VideoOutput;
let mPhotoSession: camera.PhotoSession;
let mVideoSession: camera.VideoSession;
let mVideoProfile: camera.VideoProfile;
let mAVRecorder: media.AVRecorder;
let fdNumber: number;
let fdPath: string;
let mVideoSurfaceId: string;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

let videoProfile: media.AVRecorderProfile = {
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
  profile: videoProfile,
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

function getSupportedModes() {
  console.info(TAG, 'getSupportedModes.');
  for (let i = 0; i < mCameraDeviceArray.length; i++) {
    mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);
    if (isEmpty(mSupportedModes)) {
      return false;
    }
    console.info(TAG, 'mSupportedModes: ' + JSON.stringify(mSupportedModes));
  }
  return true;
}

function getCameraInput() {
  console.info(TAG, 'getCameraInput.  ' + JSON.stringify(mCameraDeviceArray));
  mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[1]);
  if (isEmpty(mCameraInput)) {
    return false;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return true;
}

function getOutputCapability() {
  console.info(TAG, 'getOutputCapability.');
  mCameraOutputCapModePhoto = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[1], mSupportedModes[0]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCapModePhoto));
  mCameraOutputCapModeVideo = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[1], mSupportedModes[1]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCapModeVideo));
  mPreviewProfilesArray = mCameraOutputCapModeVideo.previewProfiles;
  mVideoProfile = mCameraOutputCapModeVideo.videoProfiles[0];
  expect(isEmpty(mVideoProfile)).assertFalse();
  videoProfile.videoFrameWidth = mVideoProfile.size.width;
  videoProfile.videoFrameHeight = mVideoProfile.size.height;
}

function getPreviewProfile() {
  mPreviewProfile = mPreviewProfilesArray.find((previewProfile: camera.Profile) => {
    return Math.abs((previewProfile.size.width / previewProfile.size.height) -
      (mVideoProfile.size.width / mVideoProfile.size.height)) < Number.EPSILON;
  });
}

async function getCreatePhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mPhotoSession = mCameraManager.createSession(mSupportedModes[0]);
  mPhotoSession.beginConfig();
  mPhotoSession.addInput(mCameraInput);
  await mCameraInput.open();
  mPhotoSession.addOutput(previewOutput);
  mPhotoSession.addOutput(photoOutput);
  await mPhotoSession.commitConfig();
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

async function getCreateVideoSession(testName: string, previewOutput: camera.PreviewOutput,
  videoOutput: camera.VideoOutput) {
  console.info(TAG, 'getCreateVideoSession.');
  mVideoSession = mCameraManager.createSession(mSupportedModes[1]);
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

async function getFocusSupportedModeStatusError(done: Function, testName: string, sMode: camera.SceneMode,
  focusMode: camera.FocusMode) {
  console.info(TAG, testName + ' begin.');
  let testSession: camera.PhotoSession | camera.VideoSession | camera.SecureSession | undefined = undefined;
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      switch (sMode) {
        case sceneMode.NORMAL_PHOTO:
          testSession = mCameraManager.createSession(sceneMode.NORMAL_PHOTO) as camera.PhotoSession;
          expect(isEmpty(testSession)).assertFalse();
          let photoStatus = testSession.isFocusModeSupported(focusMode);
          expect(isEmpty(photoStatus)).assertFalse();
          console.info(TAG, testName + 'photo mode, status: ' + photoStatus);
          break;
        case sceneMode.NORMAL_VIDEO:
          testSession = mCameraManager.createSession(sceneMode.NORMAL_VIDEO) as camera.VideoSession;
          expect(isEmpty(testSession)).assertFalse();
          let videoStatus = testSession.isFocusModeSupported(focusMode);
          expect(isEmpty(videoStatus)).assertFalse();
          console.info(TAG, testName + 'video mode, status: ' + videoStatus);
          break;
        case sceneMode.SECURE_PHOTO:
          testSession = mCameraManager.createSession(sceneMode.SECURE_PHOTO) as camera.SecureSession;
          expect(isEmpty(testSession)).assertFalse();
          let secureStatus = testSession.isFocusModeSupported(focusMode);
          expect(isEmpty(secureStatus)).assertFalse();
          console.info(TAG, testName + 'secure_photo mode, status: ' + secureStatus);
          break;
        default:
          console.info(TAG, testName + 'sceneMode invalid, failed.');
          expect().assertFail();
      }
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFocusModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await testSession?.release();
    done();
  }
}

async function checkControlCenterSupportedVideo(done: Function, testName: string) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      await getVideoSurfaceId();
      mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
      mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
      await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
      let isSupported = mVideoSession.isControlCenterSupported();
      let types = mVideoSession.getSupportedEffectTypes();
      if ((isSupported && types.length == 0) || (!isSupported && types.length > 0)) {
        expect().assertFail();
      }
      await releaseVideoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFocusModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releaseVideoSession();
    done();
  }
}

async function checkControlCenterSupportedError(done: Function, testName: string) {
  console.info(TAG, testName + ' begin.');
  let testSession: camera.PhotoSession | camera.VideoSession | camera.SecureSession | undefined = undefined;
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      testSession = mCameraManager.createSession(sceneMode.NORMAL_VIDEO) as camera.VideoSession;
      expect(isEmpty(testSession)).assertFalse();
      let isSupported = mVideoSession.isControlCenterSupported();
      let types = mVideoSession.getSupportedEffectTypes();
      expect(isSupported).assertFalse();
      expect(types.length).assertEqual(0);
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFocusModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await testSession?.release();
    done();
  }
}

async function enableControlCenter(done: Function, testName: string) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      await getVideoSurfaceId();
      mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
      mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
      await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
      mVideoSession.enableControlCenter(false)
      let isSupported = mVideoSession.isControlCenterSupported();
      let types = mVideoSession.getSupportedEffectTypes();
      if ((isSupported && types.length == 0) || (!isSupported && types.length > 0)) {
        expect().assertFail();
      }
      await releaseVideoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFocusModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releaseVideoSession();
    done();
  }
}

export default function CameraSessionControlCenterTest() {
  beforeAll(async () => {
    console.info('beforeAll case');
    if (!checkBackCamera()) {
      console.info(TAG, 'The current device does not have a rear camera.');
    } else {
      getCameraManager();
      getSupportedCameraDeviceArray();
      getSupportedModes();
      await getPermission();
      await driveFn();
      getCameraInput();
      getOutputCapability();
      getPreviewProfile();
    }
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
    if (!checkBackCamera()) {
      console.info(TAG, 'The current device does not have a rear camera.');
    } else {
      await closeFd(fdNumber);
    }
  });

  describe('CameraSessionControlCenterTest', () => {

    /**
     * @tc.number    : CONTROL_CENTER_001
     * @tc.name      : isControlCenterSupported_video_001
     * @tc.desc      : isControlCenterSupported_normal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isControlCenterSupported_video_001', Level.LEVEL0, (done: Function) => {
      const testName = 'isControlCenterSupported_video_001';
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        expect(checkBackCamera()).assertFalse();
        done();
        return;
      }
      checkControlCenterSupportedVideo(done, testName);
    })

    /**
     * @tc.number    : CONTROL_CENTER_002
     * @tc.name      : isControlCenterSupported_video_002
     * @tc.desc      : isControlCenterSupported_abnormal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isControlCenterSupported_video_002', Level.LEVEL0, (done: Function) => {
      const testName = 'isControlCenterSupported_video_002';
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        expect(checkBackCamera()).assertFalse();
        done();
        return;
      }
      checkControlCenterSupportedError(done, testName);
    })

    /**
     * @tc.number    : CONTROL_CENTER_003
     * @tc.name      : isControlCenterSupported_video_abnormal_003
     * @tc.desc      : enableControlCenter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isControlCenterSupported_video_abnormal_003', Level.LEVEL0, (done: Function) => {
      const testName = 'isControlCenterSupported_video_abnormal_003';
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        expect(checkBackCamera()).assertFalse();
        done();
        return;
      }
      enableControlCenter(done, testName);
    })
  })
}