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

function getCameraInput() {
  console.info(TAG, 'getCameraInput.');
  mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
  if (isEmpty(mCameraInput)) {
    return false;
  }
  console.info(TAG, 'cameraInput created successfully.');
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

function getOutputCapability() {
  console.info(TAG, 'getOutputCapability.');
  mCameraOutputCapModePhoto = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], mSupportedModes[0]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCapModePhoto));
  mCameraOutputCapModeVideo = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], mSupportedModes[1]);
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

async function getPreConfigPhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getPreConfigPhotoSession.');
  mPhotoSession.beginConfig();
  mPhotoSession.addInput(mCameraInput);
  await mCameraInput.open();
  mPhotoSession.addOutput(previewOutput);
  mPhotoSession.addOutput(photoOutput);
  await mPhotoSession.commitConfig();
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

async function getPreConfigVideoSession(testName: string, previewOutput: camera.PreviewOutput,
  videoOutput: camera.VideoOutput) {
  console.info(TAG, 'getPreConfigVideoSession.');
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

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mPhotoSession?.release();
}

async function releaseVideoSession() {
  console.info(TAG, 'releaseVideoSession.');
  await mAVRecorder?.release();
  await mPreviewOutput?.release();
  await mVideoOutput?.release();
  await mVideoSession?.release();
}

async function getFocusSupportedModeStatus(done: Function, testName: string, focusMode: camera.FocusMode) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoOutput =
        mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput =
        mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      let photoStatus = mPhotoSession.isFocusModeSupported(focusMode);
      expect(isEmpty(photoStatus)).assertFalse();
      console.info(TAG, testName + ' focus mode, status: ' + photoStatus);
      await releasePhotoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFocusModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releasePhotoSession();
    done();
  }
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

async function getFocusSupportedModeStatusVideo(done: Function, testName: string, focusMode: camera.FocusMode) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      if (isEmpty(mPreviewProfile)) {
        console.info(TAG, testName + ' no same resolution preview.');
        expect(isEmpty(mPreviewProfile)).assertTrue();
      } else {
        await getVideoSurfaceId();
        mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
        mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
        await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
        let videoStatus = mVideoSession.isFocusModeSupported(focusMode as camera.FocusMode);
        expect(isEmpty(videoStatus)).assertFalse();
        console.info(TAG, testName + ' focus mode, status: ' + videoStatus);
        await releaseVideoSession();
      }
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFocusModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releaseVideoSession();
    done();
  }
}

async function getFocusSupportedModeStatusAbnormal(done: Function, testName: string,
  focusMode: camera.FocusMode | null | undefined) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoOutput =
        mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput =
        mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      let photoStatus = mPhotoSession.isFocusModeSupported(focusMode as camera.FocusMode);
      if (isEmpty(focusMode)) {
        expect(photoStatus).assertTrue();
      } else {
        expect(photoStatus).assertFalse();
      }
      console.info(TAG, testName + ' focus mode, status: ' + photoStatus);
      await releasePhotoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFocusModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function getFocusSupportedModeStatusVideoAbnormal(done: Function, testName: string,
  focusMode: camera.FocusMode | null | undefined) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      if (isEmpty(mPreviewProfile)) {
        console.info(TAG, testName + ' no same resolution preview.');
        expect(isEmpty(mPreviewProfile)).assertTrue();
      } else {
        await getVideoSurfaceId();
        mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
        mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
        await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
        let videoStatus = mVideoSession.isFocusModeSupported(focusMode);
        if (isEmpty(focusMode)) {
          expect(videoStatus).assertTrue();
        } else {
          expect(videoStatus).assertFalse();
        }
        console.info(TAG, testName + ' video focus mode, status: ' + videoStatus);
        await releaseVideoSession();
      }
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFocusModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releaseVideoSession();
    done();
  }
}

async function setFocusModePhotoSession(done: Function, testName: string, focusMode: camera.FocusMode) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput =
        mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      console.info(TAG, testName + ' getPhotoSession pass.');
      let photoStatus = mPhotoSession.isFocusModeSupported(focusMode);
      console.info(TAG, testName + ' isFocusModeSupported pass. status: ' + photoStatus);
      if (photoStatus) {
        mPhotoSession.setFocusMode(focusMode);
        console.info(TAG, testName + ' setFocusMode pass.');
        let fMode = mPhotoSession.getFocusMode();
        expect(fMode === focusMode).assertTrue();
      } else {
        console.info(TAG, testName + ' not supported focusMode: ' + focusMode);
        expect(photoStatus).assertFalse();
      }
      await releasePhotoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session setFocusMode failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function setFocusModePhotoSessionError(done: Function, testName: string, focusMode: camera.FocusMode) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      let photoSession = mCameraManager.createSession(sceneMode.NORMAL_PHOTO) as camera.PhotoSession;
      expect(isEmpty(photoSession)).assertFalse();
      let photoStatus = photoSession.isFocusModeSupported(focusMode);
      expect(isEmpty(photoStatus)).assertFalse();
      console.info(TAG, testName + ' photo mode, status: ' + photoStatus);
      if (photoStatus) {
        photoSession.setFocusMode(focusMode);
        console.info(TAG, testName + ' setFocusMode pass.');
        expect(true).assertTrue();
      } else {
        console.info(TAG, testName + ' not supported focusMode.');
        expect().assertFail();
      }
    }
  } catch (err) {
    console.error(TAG, testName + ' session setFocusMode failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    done();
  }
}

async function setFocusModeVideoSession(done: Function, testName: string, focusMode: camera.FocusMode) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      if (isEmpty(mPreviewProfile)) {
        console.info(TAG, testName + ' no same resolution preview.');
        expect(isEmpty(mPreviewProfile)).assertTrue();
      } else {
        await getVideoSurfaceId();
        mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
        mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
        await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
        console.info(TAG, testName + ' getVideoSession pass.');
        let videoStatus = mVideoSession.isFocusModeSupported(focusMode);
        console.info(TAG, testName + ' isFocusModeSupported pass. status: ' + videoStatus);
        if (videoStatus) {
          mVideoSession.setFocusMode(focusMode);
          console.info(TAG, testName + ' setFocusMode pass.');
          let fMode = mVideoSession.getFocusMode();
          expect(fMode === focusMode).assertTrue();
        } else {
          console.info(TAG, testName + ' not supported focusMode: ' + focusMode);
          expect(videoStatus).assertFalse();
        }
        await releaseVideoSession();
      }
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session setFocusMode failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releaseVideoSession();
    done();
  }
}

async function setFocusModeVideoSessionError(done: Function, testName: string, focusMode: camera.FocusMode) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      let videoSession = mCameraManager.createSession(sceneMode.NORMAL_VIDEO) as camera.VideoSession;
      expect(isEmpty(videoSession)).assertFalse();
      let videoStatus = videoSession.isFocusModeSupported(focusMode);
      expect(isEmpty(videoStatus)).assertFalse();
      console.info(TAG, testName + ' photo mode, status: ' + videoStatus);
      if (videoStatus) {
        videoSession.setFocusMode(focusMode);
        console.info(TAG, testName + ' setFocusMode pass.');
        expect(true).assertTrue();
      } else {
        console.info(TAG, testName + ' not supported focusMode.');
        expect().assertFail();
      }
    }
  } catch (err) {
    console.error(TAG, testName + ' session setFocusMode failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    done();
  }
}

async function setFocusModePhotoSessionAbnormal(done: Function, testName: string,
  focusMode: camera.FocusMode | null | undefined) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput =
        mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      console.info(TAG, testName + ' getPhotoSession pass.');
      mPhotoSession.setFocusMode(focusMode as camera.FocusMode);
      console.info(TAG, testName + ' setFocusMode pass.');
      let fMode = mPhotoSession.getFocusMode();
      expect(fMode).assertEqual(isEmpty(focusMode) ? cameraFocusMode.FOCUS_MODE_MANUAL : focusMode);
      await releasePhotoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session setFocusMode failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function setFocusModeVideoSessionAbnormal(done: Function, testName: string,
  focusMode: camera.FocusMode | null | undefined) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      if (isEmpty(mPreviewProfile)) {
        console.info(TAG, testName + ' no same resolution preview.');
        expect(isEmpty(mPreviewProfile)).assertTrue();
      } else {
        await getVideoSurfaceId();
        mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
        mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
        await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
        console.info(TAG, testName + ' getVideoSession pass.');
        mVideoSession.setFocusMode(focusMode as camera.FocusMode);
        console.info(TAG, testName + ' setFocusMode pass.');
        let fMode = mVideoSession.getFocusMode();
        expect(fMode).assertEqual(isEmpty(focusMode) ? cameraFocusMode.FOCUS_MODE_MANUAL : focusMode);
        await releaseVideoSession();
      }
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session setFocusMode failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
    await releaseVideoSession();
    done();
  }
}

async function getFocusModeError(done: Function, testName: string, sMode: camera.SceneMode) {
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
          let photoStatus = testSession.getFocusMode();
          expect(isEmpty(photoStatus)).assertFalse();
          console.info(TAG, testName + 'photo mode, status: ' + photoStatus);
          break;
        case sceneMode.NORMAL_VIDEO:
          testSession = mCameraManager.createSession(sceneMode.NORMAL_VIDEO) as camera.VideoSession;
          expect(isEmpty(testSession)).assertFalse();
          let videoStatus = testSession.getFocusMode();
          expect(isEmpty(videoStatus)).assertFalse();
          console.info(TAG, testName + 'video mode, status: ' + videoStatus);
          break;
        case sceneMode.SECURE_PHOTO:
          testSession = mCameraManager.createSession(sceneMode.SECURE_PHOTO) as camera.SecureSession;
          expect(isEmpty(testSession)).assertFalse();
          let secureStatus = testSession.getFocusMode();
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
    console.error(TAG, testName + ' session getFocusMode failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await testSession?.release();
    done();
  }
}

async function getFocusSupportedModeStatusPreConfig(done: Function, testName: string, focusMode: camera.FocusMode,
  type: camera.PreconfigType, ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoSession = mCameraManager.createSession(mSupportedModes[0]);
      let result = mPhotoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        done();
        return;
      }
      mPhotoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      await getPreConfigPhotoSession(mPreviewOutput, mPhotoOutput);
      let photoStatus = mPhotoSession.isFocusModeSupported(focusMode);
      expect(isEmpty(photoStatus)).assertFalse();
      console.info(TAG, testName + ' focus mode, status: ' + photoStatus);
      await releasePhotoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFocusModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function getFocusSupportedModeStatusVideoPreConfig(done: Function, testName: string,
  focusMode: camera.FocusMode, type: camera.PreconfigType, ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mVideoSession = mCameraManager.createSession(mSupportedModes[1]);
      let result = mVideoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        done();
        return;
      }
      await getVideoSurfaceId();
      mVideoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mVideoOutput = mCameraManager.createVideoOutput(mVideoSurfaceId);
      await getPreConfigVideoSession(testName, mPreviewOutput, mVideoOutput);
      let videoStatus = mVideoSession.isFocusModeSupported(focusMode as camera.FocusMode);
      expect(isEmpty(videoStatus)).assertFalse();
      console.info(TAG, testName + ' focus mode, status: ' + videoStatus);
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

async function getFocusModePhotoPreConfig(done: Function, testName: string, type: camera.PreconfigType,
  ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoSession = mCameraManager.createSession(mSupportedModes[0]);
      let result = mPhotoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        done();
        return;
      }
      mPhotoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      await getPreConfigPhotoSession(mPreviewOutput, mPhotoOutput);
      let focusMode = mPhotoSession.getFocusMode();
      expect(isEmpty(focusMode)).assertFalse();
      console.info(TAG, testName + ' photo focus mode, status: ' + focusMode);
      await releasePhotoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' session getFocusMode failed. code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    await releasePhotoSession();
    done();
  }
}

async function getFocusModeVideoPreConfig(done: Function, testName: string, type: camera.PreconfigType,
  ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mVideoSession = mCameraManager.createSession(mSupportedModes[1]);
      let result = mVideoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        done();
        return;
      }
      await getVideoSurfaceId();
      mVideoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mVideoOutput = mCameraManager.createVideoOutput(mVideoSurfaceId);
      await getPreConfigVideoSession(testName, mPreviewOutput, mVideoOutput);
      let focusMode = mVideoSession.getFocusMode();
      expect(isEmpty(focusMode)).assertFalse();
      console.info(TAG, testName + ' video focus mode, status: ' + focusMode);
      await releaseVideoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' session getFocusMode failed. code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    await releaseVideoSession();
    done();
  }
}

async function setFocusModePhotoPreConfig(done: Function, testName: string, focusMode: camera.FocusMode,
  type: camera.PreconfigType, ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoSession = mCameraManager.createSession(mSupportedModes[0]);
      let result = mPhotoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        done();
        return;
      }
      mPhotoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      await getPreConfigPhotoSession(mPreviewOutput, mPhotoOutput);
      console.info(TAG, testName + ' getPhotoSession pass.');
      let photoStatus = mPhotoSession.isFocusModeSupported(focusMode);
      console.info(TAG, testName + ' isFocusModeSupported pass. status: ' + photoStatus);
      if (photoStatus) {
        mPhotoSession.setFocusMode(focusMode);
        console.info(TAG, testName + ' setFocusMode pass.');
        let fMode = mPhotoSession.getFocusMode();
        expect(fMode === focusMode).assertTrue();
      } else {
        console.info(TAG, testName + ' not supported focusMode: ' + focusMode);
        expect(photoStatus).assertFalse();
      }
      await releasePhotoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session setFocusMode failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function setFocusModeVideoPreConfig(done: Function, testName: string, focusMode: camera.FocusMode,
  type: camera.PreconfigType, ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mVideoSession = mCameraManager.createSession(mSupportedModes[1]);
      let result = mVideoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        done();
        return;
      }
      await getVideoSurfaceId();
      mVideoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mVideoOutput = mCameraManager.createVideoOutput(mVideoSurfaceId);
      await getPreConfigVideoSession(testName, mPreviewOutput, mVideoOutput);
      console.info(TAG, testName + ' getVideoSession pass.');
      let videoStatus = mVideoSession.isFocusModeSupported(focusMode);
      console.info(TAG, testName + ' isFocusModeSupported pass. status: ' + videoStatus);
      if (videoStatus) {
        mVideoSession.setFocusMode(focusMode);
        console.info(TAG, testName + ' setFocusMode pass.');
        let fMode = mVideoSession.getFocusMode();
        expect(fMode === focusMode).assertTrue();
      } else {
        console.info(TAG, testName + ' not supported focusMode: ' + focusMode);
        expect(videoStatus).assertFalse();
      }
      await releaseVideoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session setFocusMode failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releaseVideoSession();
    done();
  }
}

export default function CameraSessionFocusTest() {
  describe('CameraSessionFocusTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      getCameraManager();
      getSupportedCameraDeviceArray();
      getSupportedModes();
      await getPermission();
      await driveFn();
      getCameraInput();
      getOutputCapability();
      getPreviewProfile();
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
    });

    /**
     * @tc.name   isFocusModeSupported_photo_abnormal_001
     * @tc.number SESSION_FOCUS_001
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_MANUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_abnormal_001', Level.LEVEL0, (done: Function) => {
      const testName = 'isFocusModeSupported_photo_abnormal_001';
      getFocusSupportedModeStatusError(done, testName, sceneMode.NORMAL_PHOTO, cameraFocusMode.FOCUS_MODE_MANUAL);
    })

    /**
     * @tc.name   isFocusModeSupported_photo_abnormal_002
     * @tc.number SESSION_FOCUS_002
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_CONTINUOUS_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_abnormal_002', Level.LEVEL0, (done: Function) => {
      const testName = 'isFocusModeSupported_photo_abnormal_002';
      getFocusSupportedModeStatusError(done, testName, sceneMode.NORMAL_PHOTO,
        cameraFocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
    })

    /**
     * @tc.name   isFocusModeSupported_photo_abnormal_003
     * @tc.number SESSION_FOCUS_003
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_abnormal_003', Level.LEVEL0, (done: Function) => {
      const testName = 'isFocusModeSupported_photo_abnormal_003';
      getFocusSupportedModeStatusError(done, testName, sceneMode.NORMAL_PHOTO, cameraFocusMode.FOCUS_MODE_AUTO);
    })

    /**
     * @tc.name   isFocusModeSupported_photo_abnormal_004
     * @tc.number SESSION_FOCUS_004
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_abnormal_004', Level.LEVEL0, (done: Function) => {
      const testName = 'isFocusModeSupported_photo_abnormal_004';
      getFocusSupportedModeStatusError(done, testName, sceneMode.NORMAL_PHOTO, cameraFocusMode.FOCUS_MODE_LOCKED);
    })

    /**
     * @tc.name   isFocusModeSupported_video_abnormal_001
     * @tc.number SESSION_FOCUS_005
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_MANUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_abnormal_001', Level.LEVEL0, (done: Function) => {
      const testName = 'isFocusModeSupported_video_abnormal_001';
      getFocusSupportedModeStatusError(done, testName, sceneMode.NORMAL_VIDEO, cameraFocusMode.FOCUS_MODE_MANUAL);
    })

    /**
     * @tc.name   isFocusModeSupported_video_abnormal_002
     * @tc.number SESSION_FOCUS_006
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_CONTINUOUS_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_abnormal_002', Level.LEVEL0, (done: Function) => {
      const testName = 'isFocusModeSupported_video_abnormal_002';
      getFocusSupportedModeStatusError(done, testName, sceneMode.NORMAL_VIDEO,
        cameraFocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
    })

    /**
     * @tc.name   isFocusModeSupported_video_abnormal_003
     * @tc.number SESSION_FOCUS_007
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_abnormal_003', Level.LEVEL0, (done: Function) => {
      const testName = 'isFocusModeSupported_video_abnormal_003';
      getFocusSupportedModeStatusError(done, testName, sceneMode.NORMAL_VIDEO, cameraFocusMode.FOCUS_MODE_AUTO);
    })

    /**
     * @tc.name   isFocusModeSupported_video_abnormal_004
     * @tc.number SESSION_FOCUS_008
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_abnormal_004', Level.LEVEL0, (done: Function) => {
      const testName = 'isFocusModeSupported_video_abnormal_004';
      getFocusSupportedModeStatusError(done, testName, sceneMode.NORMAL_VIDEO, cameraFocusMode.FOCUS_MODE_LOCKED);
    })

    /**
     * @tc.name   isFocusModeSupported_secure_photo_abnormal_001
     * @tc.number SESSION_FOCUS_009
     * @tc.desc   No config, only isFocusModeSupported()-mode->FOCUS_MODE_MANUAL -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_secure_photo_abnormal_001', Level.LEVEL0, (done: Function) => {
      const testName = 'isFocusModeSupported_secure_photo_abnormal_001';
      getFocusSupportedModeStatusError(done, testName, sceneMode.SECURE_PHOTO, cameraFocusMode.FOCUS_MODE_MANUAL);
    })

    /**
     * @tc.name   isFocusModeSupported_secure_photo_abnormal_002
     * @tc.number SESSION_FOCUS_010
     * @tc.desc   No config, only isFocusModeSupported()-mode->FOCUS_MODE_CONTINUOUS_AUTO -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_secure_photo_abnormal_002', Level.LEVEL0, (done: Function) => {
      const testName = 'isFocusModeSupported_secure_photo_abnormal_002';
      getFocusSupportedModeStatusError(done, testName, sceneMode.SECURE_PHOTO,
        cameraFocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
    })

    /**
     * @tc.name   isFocusModeSupported_secure_photo_abnormal_003
     * @tc.number SESSION_FOCUS_011
     * @tc.desc   No config, only isFocusModeSupported()-mode->FOCUS_MODE_AUTO -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_secure_photo_abnormal_003', Level.LEVEL0, (done: Function) => {
      const testName = 'isFocusModeSupported_secure_photo_abnormal_003';
      getFocusSupportedModeStatusError(done, testName, sceneMode.SECURE_PHOTO, cameraFocusMode.FOCUS_MODE_AUTO);
    })

    /**
     * @tc.name   isFocusModeSupported_secure_photo_abnormal_004
     * @tc.number SESSION_FOCUS_012
     * @tc.desc   No config, only isFocusModeSupported()-mode->FOCUS_MODE_LOCKED -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_secure_photo_abnormal_004', Level.LEVEL0, (done: Function) => {
      const testName = 'isFocusModeSupported_secure_photo_abnormal_004';
      getFocusSupportedModeStatusError(done, testName, sceneMode.SECURE_PHOTO, cameraFocusMode.FOCUS_MODE_LOCKED);
    })

    /**
     * @tc.name   setFocusMode_photo_001
     * @tc.number SESSION_FOCUS_013
     * @tc.desc   setFocusMode-mode->FOCUS_MODE_MANUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_photo_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_photo_001';
      await setFocusModePhotoSession(done, testName, cameraFocusMode.FOCUS_MODE_MANUAL);
    })

    /**
     * @tc.name   setFocusMode_photo_002
     * @tc.number SESSION_FOCUS_014
     * @tc.desc   setFocusMode-mode->FOCUS_MODE_CONTINUOUS_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_photo_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_photo_002';
      await setFocusModePhotoSession(done, testName, cameraFocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
    })

    /**
     * @tc.name   setFocusMode_photo_003
     * @tc.number SESSION_FOCUS_015
     * @tc.desc   setFocusMode-mode->FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_photo_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_photo_003';
      await setFocusModePhotoSession(done, testName, cameraFocusMode.FOCUS_MODE_AUTO);
    })

    /**
     * @tc.name   setFocusMode_photo_004
     * @tc.number SESSION_FOCUS_016
     * @tc.desc   setFocusMode-mode->FOCUS_MODE_LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_photo_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_photo_004';
      await setFocusModePhotoSession(done, testName, cameraFocusMode.FOCUS_MODE_LOCKED);
    })

    /**
     * @tc.name   setFocusMode_video_001
     * @tc.number SESSION_FOCUS_017
     * @tc.desc   setFocusMode-mode->FOCUS_MODE_MANUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_video_001';
      await setFocusModeVideoSession(done, testName, cameraFocusMode.FOCUS_MODE_MANUAL);
    })

    /**
     * @tc.name   setFocusMode_video_002
     * @tc.number SESSION_FOCUS_018
     * @tc.desc   setFocusMode-mode->FOCUS_MODE_CONTINUOUS_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_video_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_video_002';
      await setFocusModeVideoSession(done, testName, cameraFocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
    })

    /**
     * @tc.name   setFocusMode_video_003
     * @tc.number SESSION_FOCUS_019
     * @tc.desc   setFocusMode-mode->FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_video_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_video_003';
      await setFocusModeVideoSession(done, testName, cameraFocusMode.FOCUS_MODE_AUTO);
    })

    /**
     * @tc.name   setFocusMode_video_004
     * @tc.number SESSION_FOCUS_020
     * @tc.desc   setFocusMode-mode->FOCUS_MODE_LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_video_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_video_004';
      await setFocusModeVideoSession(done, testName, cameraFocusMode.FOCUS_MODE_LOCKED);
    })

    /**
     * @tc.name   setFocusMode_photo_abnormal_001
     * @tc.number SESSION_FOCUS_021
     * @tc.desc   No config, only setFocusMode() -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_photo_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_photo_abnormal_001';
      await setFocusModePhotoSessionError(done, testName, cameraFocusMode.FOCUS_MODE_MANUAL);
    })

    /**
     * @tc.name   setFocusMode_photo_abnormal_002
     * @tc.number SESSION_FOCUS_022
     * @tc.desc   No config, only setFocusMode() -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_photo_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_photo_abnormal_002';
      await setFocusModePhotoSessionError(done, testName, cameraFocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
    })

    /**
     * @tc.name   setFocusMode_photo_abnormal_003
     * @tc.number SESSION_FOCUS_023
     * @tc.desc   No config, only setFocusMode() -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_photo_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_photo_abnormal_003';
      await setFocusModePhotoSessionError(done, testName, cameraFocusMode.FOCUS_MODE_AUTO);
    })

    /**
     * @tc.name   setFocusMode_photo_abnormal_004
     * @tc.number SESSION_FOCUS_024
     * @tc.desc   No config, only setFocusMode() -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_photo_abnormal_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_photo_abnormal_004';
      await setFocusModePhotoSessionError(done, testName, cameraFocusMode.FOCUS_MODE_LOCKED);
    })

    /**
     * @tc.name   setFocusMode_video_abnormal_001
     * @tc.number SESSION_FOCUS_025
     * @tc.desc   No config, only setFocusMode() -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_video_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_video_abnormal_001';
      await setFocusModeVideoSessionError(done, testName, cameraFocusMode.FOCUS_MODE_MANUAL);
    })

    /**
     * @tc.name   setFocusMode_video_abnormal_002
     * @tc.number SESSION_FOCUS_026
     * @tc.desc   No config, only setFocusMode() -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_video_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_video_abnormal_002';
      await setFocusModeVideoSessionError(done, testName, cameraFocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
    })

    /**
     * @tc.name   setFocusMode_video_abnormal_003
     * @tc.number SESSION_FOCUS_027
     * @tc.desc   No config, only setFocusMode() -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_video_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_video_abnormal_003';
      await setFocusModeVideoSessionError(done, testName, cameraFocusMode.FOCUS_MODE_AUTO);
    })

    /**
     * @tc.name   setFocusMode_video_abnormal_004
     * @tc.number SESSION_FOCUS_028
     * @tc.desc   No config, only setFocusMode() -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_video_abnormal_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_video_abnormal_004';
      await setFocusModeVideoSessionError(done, testName, cameraFocusMode.FOCUS_MODE_LOCKED);
    })

    /**
     * @tc.name   isFocusModeSupported_photo_001
     * @tc.number SESSION_FOCUS_029
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_MANUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_photo_001';
      await getFocusSupportedModeStatus(done, testName, cameraFocusMode.FOCUS_MODE_MANUAL);
    })

    /**
     * @tc.name   isFocusModeSupported_photo_002
     * @tc.number SESSION_FOCUS_030
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_CONTINUOUS_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_photo_002';
      await getFocusSupportedModeStatus(done, testName, cameraFocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
    })

    /**
     * @tc.name   isFocusModeSupported_photo_003
     * @tc.number SESSION_FOCUS_031
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_photo_003';
      await getFocusSupportedModeStatus(done, testName, cameraFocusMode.FOCUS_MODE_AUTO);
    })

    /**
     * @tc.name   isFocusModeSupported_photo_004
     * @tc.number SESSION_FOCUS_032
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_photo_004';
      await getFocusSupportedModeStatus(done, testName, cameraFocusMode.FOCUS_MODE_LOCKED);
    })

    /**
     * @tc.name   isFocusModeSupported_video_001
     * @tc.number SESSION_FOCUS_033
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_MANUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_video_001';
      await getFocusSupportedModeStatusVideo(done, testName, cameraFocusMode.FOCUS_MODE_MANUAL);
    })

    /**
     * @tc.name   isFocusModeSupported_video_002
     * @tc.number SESSION_FOCUS_034
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_CONTINUOUS_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_video_002';
      await getFocusSupportedModeStatusVideo(done, testName, cameraFocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
    })

    /**
     * @tc.name   isFocusModeSupported_video_003
     * @tc.number SESSION_FOCUS_035
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_video_003';
      await getFocusSupportedModeStatusVideo(done, testName, cameraFocusMode.FOCUS_MODE_AUTO);
    })

    /**
     * @tc.name   isFocusModeSupported_video_004
     * @tc.number SESSION_FOCUS_036
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_video_004';
      await getFocusSupportedModeStatusVideo(done, testName, cameraFocusMode.FOCUS_MODE_LOCKED);
    })

    /**
     * @tc.name   setFocusMode_photo_abnormal_005
     * @tc.number SESSION_FOCUS_037
     * @tc.desc   setFocusMode-mode->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_photo_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_photo_abnormal_005';
      await setFocusModePhotoSessionAbnormal(done, testName, abnormalValue);
    })

    /**
     * @tc.name   setFocusMode_photo_abnormal_006
     * @tc.number SESSION_FOCUS_038
     * @tc.desc   setFocusMode-mode->null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_photo_abnormal_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_photo_abnormal_006';
      await setFocusModePhotoSessionAbnormal(done, testName, null);
    })

    /**
     * @tc.name   setFocusMode_photo_abnormal_007
     * @tc.number SESSION_FOCUS_039
     * @tc.desc   setFocusMode-mode->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_photo_abnormal_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_photo_abnormal_007';
      await setFocusModePhotoSessionAbnormal(done, testName, undefined);
    })

    /**
     * @tc.name   setFocusMode_video_abnormal_005
     * @tc.number SESSION_FOCUS_040
     * @tc.desc   setFocusMode-mode->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_video_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_video_abnormal_005';
      await setFocusModeVideoSessionAbnormal(done, testName, abnormalValue);
    })

    /**
     * @tc.name   setFocusMode_video_abnormal_006
     * @tc.number SESSION_FOCUS_041
     * @tc.desc   setFocusMode-mode->null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_video_abnormal_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_video_abnormal_006';
      await setFocusModeVideoSessionAbnormal(done, testName, null);
    })

    /**
     * @tc.name   setFocusMode_video_abnormal_007
     * @tc.number SESSION_FOCUS_042
     * @tc.desc   setFocusMode-mode->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_video_abnormal_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_video_abnormal_007';
      await setFocusModeVideoSessionAbnormal(done, testName, undefined);
    })

    /**
     * @tc.name   isFocusModeSupported_photo_abnormal_005
     * @tc.number SESSION_FOCUS_043
     * @tc.desc   isFocusModeSupported-mode->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_photo_abnormal_005';
      await getFocusSupportedModeStatusAbnormal(done, testName, abnormalValue);
    })

    /**
     * @tc.name   isFocusModeSupported_photo_abnormal_006
     * @tc.number SESSION_FOCUS_044
     * @tc.desc   isFocusModeSupported-mode->null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_abnormal_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_photo_abnormal_006';
      await getFocusSupportedModeStatusAbnormal(done, testName, null);
    })

    /**
     * @tc.name   isFocusModeSupported_photo_abnormal_007
     * @tc.number SESSION_FOCUS_045
     * @tc.desc   isFocusModeSupported-mode->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_abnormal_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_photo_abnormal_007';
      await getFocusSupportedModeStatusAbnormal(done, testName, undefined);
    })

    /**
     * @tc.name   isFocusModeSupported_video_abnormal_005
     * @tc.number SESSION_FOCUS_046
     * @tc.desc   isFocusModeSupported-mode->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_video_abnormal_005';
      await getFocusSupportedModeStatusVideoAbnormal(done, testName, abnormalValue);
    })

    /**
     * @tc.name   isFocusModeSupported_video_abnormal_006
     * @tc.number SESSION_FOCUS_047
     * @tc.desc   isFocusModeSupported-mode->null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_abnormal_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_video_abnormal_006';
      await getFocusSupportedModeStatusVideoAbnormal(done, testName, null);
    })

    /**
     * @tc.name   isFocusModeSupported_video_abnormal_007
     * @tc.number SESSION_FOCUS_048
     * @tc.desc   isFocusModeSupported-mode->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_abnormal_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_video_abnormal_007';
      await getFocusSupportedModeStatusVideoAbnormal(done, testName, undefined);
    })

    /**
     * @tc.name   getFocusMode_photo_001
     * @tc.number SESSION_FOCUS_049
     * @tc.desc   getFocusMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFocusMode_photo_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFocusMode_photo_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
          mPreviewOutput =
            mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          let focusMode = mPhotoSession.getFocusMode();
          expect(isEmpty(focusMode)).assertFalse();
          console.info(TAG, testName + ' photo focus mode, status: ' + focusMode);
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' session getFocusMode failed. code: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   getFocusMode_video_001
     * @tc.number SESSION_FOCUS_050
     * @tc.desc   getFocusMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFocusMode_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFocusMode_video_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' no same resolution preview.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            await getVideoSurfaceId();
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
            await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
            let focusMode = mVideoSession.getFocusMode();
            expect(isEmpty(focusMode)).assertFalse();
            console.info(TAG, testName + ' video focus mode, status: ' + focusMode);
            await releaseVideoSession();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' session getFocusMode failed. code: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.name   getFocusMode_photo_abnormal_001
     * @tc.number SESSION_FOCUS_051
     * @tc.desc   getFocusMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFocusMode_photo_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFocusMode_photo_abnormal_001';
      getFocusModeError(done, testName, sceneMode.NORMAL_PHOTO);
    })

    /**
     * @tc.name   getFocusMode_video_abnormal_001
     * @tc.number SESSION_FOCUS_052
     * @tc.desc   getFocusMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFocusMode_video_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFocusMode_video_abnormal_001';
      getFocusModeError(done, testName, sceneMode.NORMAL_VIDEO);
    })

    /**
     * @tc.name   getFocusMode_secure_photo_abnormal_001
     * @tc.number SESSION_FOCUS_053
     * @tc.desc   getFocusMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFocusMode_secure_photo_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFocusMode_secure_photo_abnormal_001';
      getFocusModeError(done, testName, sceneMode.SECURE_PHOTO);
    })

    /**
     * @tc.name   isFocusModeSupported_photo_preconfig_001
     * @tc.number SESSION_FOCUS_054
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_photo_preconfig_001';
      await getFocusSupportedModeStatusPreConfig(done, testName, cameraFocusMode.FOCUS_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_720P, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   isFocusModeSupported_photo_preconfig_002
     * @tc.number SESSION_FOCUS_055
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_preconfig_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_photo_preconfig_002';
      await getFocusSupportedModeStatusPreConfig(done, testName, cameraFocusMode.FOCUS_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_1080P, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   isFocusModeSupported_photo_preconfig_003
     * @tc.number SESSION_FOCUS_056
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_preconfig_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_photo_preconfig_003';
      await getFocusSupportedModeStatusPreConfig(done, testName, cameraFocusMode.FOCUS_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_4K, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   isFocusModeSupported_photo_preconfig_004
     * @tc.number SESSION_FOCUS_057
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_photo_preconfig_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_photo_preconfig_004';
      await getFocusSupportedModeStatusPreConfig(done, testName, cameraFocusMode.FOCUS_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_HIGH_QUALITY, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   isFocusModeSupported_video_preconfig_001
     * @tc.number SESSION_FOCUS_058
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_video_preconfig_001';
      await getFocusSupportedModeStatusVideoPreConfig(done, testName, cameraFocusMode.FOCUS_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_720P, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   isFocusModeSupported_video_preconfig_002
     * @tc.number SESSION_FOCUS_059
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_preconfig_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_video_preconfig_002';
      await getFocusSupportedModeStatusVideoPreConfig(done, testName, cameraFocusMode.FOCUS_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_1080P, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   isFocusModeSupported_video_preconfig_003
     * @tc.number SESSION_FOCUS_060
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_preconfig_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_video_preconfig_003';
      await getFocusSupportedModeStatusVideoPreConfig(done, testName, cameraFocusMode.FOCUS_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_4K, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   isFocusModeSupported_video_preconfig_004
     * @tc.number SESSION_FOCUS_061
     * @tc.desc   isFocusModeSupported-mode->FOCUS_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFocusModeSupported_video_preconfig_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFocusModeSupported_video_preconfig_004';
      await getFocusSupportedModeStatusVideoPreConfig(done, testName, cameraFocusMode.FOCUS_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_HIGH_QUALITY, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   getFocusMode_photo_preconfig_001
     * @tc.number SESSION_FOCUS_062
     * @tc.desc   getFocusMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFocusMode_photo_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFocusMode_photo_preconfig_001';
      await getFocusModePhotoPreConfig(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   getFocusMode_video_preconfig_001
     * @tc.number SESSION_FOCUS_063
     * @tc.desc   getFocusMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFocusMode_video_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFocusMode_video_preconfig_001';
      await getFocusModeVideoPreConfig(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   setFocusMode_photo_preconfig_001
     * @tc.number SESSION_FOCUS_064
     * @tc.desc   setFocusMode-mode->FOCUS_MODE_MANUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_photo_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_photo_preconfig_001';
      await setFocusModePhotoPreConfig(done, testName, cameraFocusMode.FOCUS_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_720P, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   setFocusMode_video_preconfig_001
     * @tc.number SESSION_FOCUS_065
     * @tc.desc   setFocusMode-mode->FOCUS_MODE_MANUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFocusMode_video_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFocusMode_video_preconfig_001';
      await setFocusModeVideoPreConfig(done, testName, cameraFocusMode.FOCUS_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_720P, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })
  })
}