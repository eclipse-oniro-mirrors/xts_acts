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
  cameraPreconfigRatio,
  cameraPreconfigType,
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

const TAG = "CameraXts.CameraSessionZoomTest";
const minIndex = 0;
const maxIndex = 1;
const abnormalIndex = -1;
const zoomRatio: number = 0.57;
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
  mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[0]);
  console.info(TAG, 'mSupportedModes: ' + JSON.stringify(mSupportedModes));
  return true;
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

async function getCreatePhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mPhotoSession = mCameraManager.createSession(mSupportedModes[0]);
  await mCameraInput.open();
  console.info(TAG, 'camera open passed.');
  mPhotoSession.beginConfig();
  console.info(TAG, 'beginConfig passed.');
  mPhotoSession.addInput(mCameraInput);
  console.info(TAG, 'addInput passed.');
  mPhotoSession.addOutput(previewOutput);
  console.info(TAG, 'addOutput previewOutput passed.');
  mPhotoSession.addOutput(photoOutput);
  console.info(TAG, 'addOutput photoOutput passed.');
  await mPhotoSession.commitConfig();
  console.info(TAG, 'session commitConfig successfully.');
  await mPhotoSession.start();
}

async function getPreConfigPhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getPreConfigPhotoSession.');
  mPhotoSession.beginConfig();
  console.info(TAG, 'beginConfig passed.');
  mPhotoSession.addInput(mCameraInput);
  console.info(TAG, 'addInput passed.');
  await mCameraInput.open();
  console.info(TAG, 'camera open passed.');
  mPhotoSession.addOutput(previewOutput);
  console.info(TAG, 'addOutput previewOutput passed.');
  mPhotoSession.addOutput(photoOutput);
  console.info(TAG, 'addOutput photoOutput passed.');
  await mPhotoSession.commitConfig();
  console.info(TAG, 'session commitConfig successfully.');
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
  await mVideoSession.start();
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

async function getZoomSupportedModeStatusError(done: Function, testName: string, sMode: camera.SceneMode) {
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
          let photoZoomRatioRange = testSession.getZoomRatioRange();
          expect(isEmpty(photoZoomRatioRange)).assertFalse();
          console.info(TAG, testName + 'photo mode, status: ' + photoZoomRatioRange);
          break;
        case sceneMode.NORMAL_VIDEO:
          testSession = mCameraManager.createSession(sceneMode.NORMAL_VIDEO) as camera.VideoSession;
          expect(isEmpty(testSession)).assertFalse();
          let videoZoomRatioRange = testSession.getZoomRatioRange();
          expect(isEmpty(videoZoomRatioRange)).assertFalse();
          console.info(TAG, testName + 'video mode, status: ' + videoZoomRatioRange);
          break;
        case sceneMode.SECURE_PHOTO:
          testSession = mCameraManager.createSession(sceneMode.SECURE_PHOTO) as camera.SecureSession;
          expect(isEmpty(testSession)).assertFalse();
          let secureZoomRatioRange = testSession.getZoomRatioRange();
          expect(isEmpty(secureZoomRatioRange)).assertFalse();
          console.info(TAG, testName + 'secure_photo mode, status: ' + secureZoomRatioRange);
          break;
        default:
          console.info(TAG, testName + 'sceneMode invalid, failed.');
          expect().assertFail();
      }
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session getZoomRatioRange failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await testSession?.release();
    done();
  }
}

async function setZoomRatioPhotoError(done: Function, testName: string, sMode: camera.SceneMode) {
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
          testSession.setZoomRatio(zoomRatio);
          break;
        case sceneMode.NORMAL_VIDEO:
          testSession = mCameraManager.createSession(sceneMode.NORMAL_VIDEO) as camera.VideoSession;
          expect(isEmpty(testSession)).assertFalse();
          testSession.setZoomRatio(zoomRatio);
          break;
        case sceneMode.SECURE_PHOTO:
          testSession = mCameraManager.createSession(sceneMode.SECURE_PHOTO) as camera.SecureSession;
          expect(isEmpty(testSession)).assertFalse();
          testSession.setZoomRatio(zoomRatio);
          break;
        default:
          console.info(TAG, testName + 'sceneMode invalid, failed.');
          expect().assertFail();
      }
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session getZoomRatioRange failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await testSession?.release();
    done();
  }
}

async function setZoomRatioPhoto(done: Function, testName: string, index: number) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      console.info(TAG, testName + ' session created successfully.');
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      let zoomRatioRange = mPhotoSession.getZoomRatioRange();
      if (isEmpty(zoomRatioRange) || (!isEmpty(zoomRatioRange) && zoomRatioRange[0] == zoomRatioRange[1])) {
        console.info(TAG, testName + ' no supported zoomRatioRange.');
        done();
      } else {
        let zoomRatio = mPhotoSession.getZoomRatio();
        console.info(TAG, testName + ' zoomRatio: ' + zoomRatio + ', zoomRatioRange: ' + zoomRatioRange);
        console.info(TAG, testName + zoomRatioRange[index]);
        mPhotoSession.setZoomRatio(zoomRatioRange[index]);
        console.info(TAG, testName + 'set ZoomRatio success');
        await sleep(3000);
        console.info(TAG, testName + 'start zoomRatio: ' + zoomRatio);
        zoomRatio = mPhotoSession.getZoomRatio();
        console.info(TAG, testName + 'get zoomRatio: ' + zoomRatio);
        if (index >= 0) {
          expect(Math.abs(zoomRatio - zoomRatioRange[index]) <= 0.1).assertTrue();
        } else {
          expect(Math.abs(zoomRatio - zoomRatioRange[0]) <= 0.1).assertTrue();
        }
      }
    }
    await releasePhotoSession();
    done();
  } catch (err) {
    console.error(TAG,
      testName + ' photo session setZoomRatio failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function setZoomRatioVideo(done: Function, testName: string, index: number) {
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
        console.info(TAG, testName + ' session created successfully.');
        await getVideoSurfaceId();
        mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
        mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
        await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
        let zoomRatioRange = mVideoSession.getZoomRatioRange();
        if (isEmpty(zoomRatioRange)) {
          console.info(TAG, testName + ' no supported zoomRatioRange.');
          done();
        } else {
          let zoomRatio = mVideoSession.getZoomRatio();
          console.info(TAG, testName + ' zoomRatio: ' + zoomRatio + ', zoomRatioRange: ' + zoomRatioRange);
          console.info(TAG, testName + zoomRatioRange[index]);
          mVideoSession.setZoomRatio(zoomRatioRange[index]);
          await sleep(3000);
          console.info(TAG, testName + 'start zoomRatio: ' + zoomRatio);
          zoomRatio = mVideoSession.getZoomRatio();
          console.info(TAG, testName + 'get zoomRatio: ' + zoomRatio);
          if (index >= 0) {
            expect(Math.abs(zoomRatio - zoomRatioRange[index]) <= 0.1).assertTrue();
          } else {
            expect(Math.abs(zoomRatio - zoomRatioRange[0]) <= 0.1).assertTrue();
          }
        }
        await releaseVideoSession();
      }
    }
    done();
  } catch (err) {
    console.error(TAG,
      testName + ' video session setZoomRatio failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
    await releaseVideoSession();
    done();
  }
}

async function getZoomRatioRangePhotoPreConfig(done: Function, testName: string, type: camera.PreconfigType,
  ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      console.info(TAG, testName + ' session created successfully.');
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
      let zoomRatioRange = mPhotoSession.getZoomRatioRange();
      if (isEmpty(zoomRatioRange)) {
        console.info(TAG, testName + ' no supported zoomRatioRange.');
        done();
      } else {
        console.info(TAG, testName + ' photo mode, status: ' + zoomRatioRange);
        expect(isEmpty(zoomRatioRange)).assertFalse();
      }
    }
    await releasePhotoSession();
    done();
  } catch (err) {
    console.error(TAG,
      testName + ' photo session getZoomRatioRange failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function getZoomRatioRangeVideoPreConfig(done: Function, testName: string, type: camera.PreconfigType,
  ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      console.info(TAG, testName + ' session created successfully.');
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
      let zoomRatioRange = mVideoSession.getZoomRatioRange();
      if (isEmpty(zoomRatioRange)) {
        console.info(TAG, testName + ' no supported zoomRatioRange.');
        done();
      } else {
        console.info(TAG, testName + ' video mode, status: ' + zoomRatioRange);
        expect(isEmpty(zoomRatioRange)).assertFalse();
      }
    }
    await releaseVideoSession();
    done();
  } catch (err) {
    console.error(TAG,
      testName + ' video session getZoomRatioRange failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
    await releaseVideoSession();
    done();
  }
}

async function setZoomRatioPhotoPreConfig(done: Function, testName: string, index: number, type: camera.PreconfigType,
  ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      console.info(TAG, testName + ' session created successfully.');
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
      let zoomRatioRange = mPhotoSession.getZoomRatioRange();
      if (isEmpty(zoomRatioRange) || (!isEmpty(zoomRatioRange) && zoomRatioRange[0] == zoomRatioRange[1])) {
        console.info(TAG, testName + ' no supported zoomRatioRange.');
        done();
      } else {
        let zoomRatio = mPhotoSession.getZoomRatio();
        console.info(TAG, testName + ' zoomRatio: ' + zoomRatio + ', zoomRatioRange: ' + zoomRatioRange);
        console.info(TAG, testName + zoomRatioRange[index]);
        mPhotoSession.setZoomRatio(zoomRatioRange[index]);
        await sleep(3000);
        console.info(TAG, testName + 'start zoomRatio: ' + zoomRatio);
        zoomRatio = mPhotoSession.getZoomRatio();
        console.info(TAG, testName + 'get zoomRatio: ' + zoomRatio);
        expect(Math.abs(zoomRatio - zoomRatioRange[index]) <= 0.1).assertTrue();
      }
    }
    await releasePhotoSession();
    done();
  } catch (err) {
    console.error(TAG,
      testName + ' photo session setZoomRatio failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function setZoomRatioVideoPreConfig(done: Function, testName: string, index: number, type: camera.PreconfigType,
  ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      console.info(TAG, testName + ' session created successfully.');
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
      let zoomRatioRange = mVideoSession.getZoomRatioRange();
      if (isEmpty(zoomRatioRange)) {
        console.info(TAG, testName + ' no supported zoomRatioRange.');
        done();
      } else {
        let zoomRatio = mVideoSession.getZoomRatio();
        console.info(TAG, testName + ' zoomRatio: ' + zoomRatio + ', zoomRatioRange: ' + zoomRatioRange);
        mVideoSession.setZoomRatio(zoomRatioRange[index]);
        await sleep(3000);
        console.info(TAG, testName + 'start zoomRatio: ' + zoomRatio);
        zoomRatio = mVideoSession.getZoomRatio();
        console.info(TAG, testName + 'get zoomRatio: ' + zoomRatio);
        expect(Math.abs(zoomRatio - zoomRatioRange[index]) <= 0.1).assertTrue();
      }
    }
    await releaseVideoSession();
    done();
  } catch (err) {
    console.error(TAG,
      testName + ' video session setZoomRatio failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
    await releaseVideoSession();
    done();
  }
}

async function setZoomRatioPhotoAbnormal(done: Function, testName: string) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      console.info(TAG, testName + ' session created successfully.');
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      let zoomRatioRange = mPhotoSession.getZoomRatioRange();
      if (isEmpty(zoomRatioRange)) {
        console.info(TAG, testName + ' no supported zoomRatioRange.');
        done();
      } else {
        let zoomRatio = mPhotoSession.getZoomRatio();
        console.info(TAG, testName + ' zoomRatio: ' + zoomRatio + ', zoomRatioRange: ' + zoomRatioRange);
        let exceedZoomRatio = zoomRatioRange[0] + 0.0011;
        console.info(testName + `exceedZoomRatio : ${exceedZoomRatio}`);
        mPhotoSession.setZoomRatio(exceedZoomRatio);
        await sleep(3000);
        let newZoomRatio = mPhotoSession.getZoomRatio();
        console.info(testName + `newZoomRatio : ${newZoomRatio}`);
        expect(Math.abs(newZoomRatio - exceedZoomRatio) <= 0.1).assertTrue();
      }
    }
    await releasePhotoSession();
    done();
  } catch (err) {
    console.error(TAG,
      testName + ' photo session setZoomRatio failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function setZoomRatioVideoAbnormal(done: Function, testName: string) {
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
        console.info(TAG, testName + ' session created successfully.');
        await getVideoSurfaceId();
        mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
        mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
        await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
        let zoomRatioRange = mVideoSession.getZoomRatioRange();
        if (isEmpty(zoomRatioRange)) {
          console.info(TAG, testName + ' no supported zoomRatioRange.');
          done();
        } else {
          let zoomRatio = mVideoSession.getZoomRatio();
          console.info(TAG, testName + ' zoomRatio: ' + zoomRatio + ', zoomRatioRange: ' + zoomRatioRange);
          let exceedZoomRatio = zoomRatioRange[0] + 0.0011;
          console.info(testName + `exceedZoomRatio : ${exceedZoomRatio}`);
          mVideoSession.setZoomRatio(exceedZoomRatio);
          await sleep(3000);
          let newZoomRatio = mVideoSession.getZoomRatio();
          console.info(testName + `newZoomRatio : ${newZoomRatio}`);
          expect(Math.abs(newZoomRatio - exceedZoomRatio) <= 0.1).assertTrue();
        }
        await releaseVideoSession();
      }
    }
    done();
  } catch (err) {
    console.error(TAG,
      testName + ' video session setZoomRatio failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
    await releaseVideoSession();
    done();
  }
}

export default function CameraSessionZoomTest() {
  describe('CameraSessionZoomTest', () => {
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
    });

    /**
     * @tc.name   getZoomRatioRange_photo_abnormal_001
     * @tc.number SESSION_ZOOM_001
     * @tc.desc   mode->NORMAL_PHOTO, no session, only getZoomRatioRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getZoomRatioRange_photo_abnormal_001', Level.LEVEL0, (done: Function) => {
      const testName = 'getZoomRatioRange_photo_abnormal_001';
      getZoomSupportedModeStatusError(done, testName, sceneMode.NORMAL_PHOTO);
    })

    /**
     * @tc.name   getZoomRatioRange_video_abnormal_001
     * @tc.number SESSION_ZOOM_002
     * @tc.desc   mode->NORMAL_VIDEO, no session, only getZoomRatioRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getZoomRatioRange_video_abnormal_001', Level.LEVEL0, (done: Function) => {
      const testName = 'getZoomRatioRange_video_abnormal_001';
      getZoomSupportedModeStatusError(done, testName, sceneMode.NORMAL_VIDEO);
    })

    /**
     * @tc.name   getZoomRatioRange_secure_photo_abnormal_001
     * @tc.number SESSION_ZOOM_003
     * @tc.desc   mode->SECURE_PHOTO, no session, only getZoomRatioRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getZoomRatioRange_secure_photo_abnormal_001', Level.LEVEL0, (done: Function) => {
      const testName = 'getZoomRatioRange_secure_photo_abnormal_001';
      getZoomSupportedModeStatusError(done, testName, sceneMode.SECURE_PHOTO);
    })

    /**
     * @tc.name   getZoomRatioRange_photo_001
     * @tc.number SESSION_ZOOM_004
     * @tc.desc   getZoomRatioRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getZoomRatioRange_photo_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getZoomRatioRange_photo_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          console.info(TAG, testName + ' session created successfully.');
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
          mPreviewOutput =
            mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          let zoomRatioRange = mPhotoSession.getZoomRatioRange();
          if (isEmpty(zoomRatioRange)) {
            console.info(TAG, testName + ' no supported zoomRatioRange.');
            done();
          } else {
            console.info(TAG, testName + ' photo mode, status: ' + zoomRatioRange);
            expect(isEmpty(zoomRatioRange)).assertFalse();
          }
        }
        await releasePhotoSession();
        done();
      } catch (err) {
        console.error(TAG,
          testName + ' photo session getZoomRatioRange failed. code: ' + err.code + ', msg: ' + err.message);
        expect(err.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   getZoomRatioRange_video_001
     * @tc.number SESSION_ZOOM_005
     * @tc.desc   getZoomRatioRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getZoomRatioRange_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getZoomRatioRange_video_001';
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
            console.info(TAG, testName + ' session created successfully.');
            await getVideoSurfaceId();
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
            await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
            let zoomRatioRange = mVideoSession.getZoomRatioRange();
            if (isEmpty(zoomRatioRange)) {
              console.info(TAG, testName + ' no supported zoomRatioRange.');
              done();
            } else {
              console.info(TAG, testName + ' video mode, status: ' + zoomRatioRange);
              expect(isEmpty(zoomRatioRange)).assertFalse();
            }
            await releaseVideoSession();
          }
        }
        done();
      } catch (err) {
        console.error(TAG,
          testName + ' video session getZoomRatioRange failed. code: ' + err.code + ', msg: ' + err.message);
        expect(err.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.name   setZoomRatio_photo_001
     * @tc.number SESSION_ZOOM_006
     * @tc.desc   setZoomRatio-min zoom ratio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setZoomRatio_photo_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setZoomRatio_photo_001';
      await setZoomRatioPhoto(done, testName, minIndex);
    })

    /**
     * @tc.name   setZoomRatio_photo_002
     * @tc.number SESSION_ZOOM_007
     * @tc.desc   setZoomRatio-max zoom ratio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setZoomRatio_photo_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setZoomRatio_photo_002';
      await setZoomRatioPhoto(done, testName, maxIndex);
    })

    /**
     * @tc.name   setZoomRatio_photo_003
     * @tc.number SESSION_ZOOM_008
     * @tc.desc   setZoomRatio-invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setZoomRatio_photo_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setZoomRatio_photo_003';
      await setZoomRatioPhoto(done, testName, abnormalIndex);
    })

    /**
     * @tc.name   setZoomRatio_video_001
     * @tc.number SESSION_ZOOM_009
     * @tc.desc   setZoomRatio-min zoom ratio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setZoomRatio_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setZoomRatio_video_001';
      await setZoomRatioVideo(done, testName, minIndex);
    })

    /**
     * @tc.name   setZoomRatio_video_002
     * @tc.number SESSION_ZOOM_010
     * @tc.desc   setZoomRatio-max zoom ratio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setZoomRatio_video_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setZoomRatio_video_002';
      await setZoomRatioVideo(done, testName, maxIndex);
    })

    /**
     * @tc.name   setZoomRatio_video_003
     * @tc.number SESSION_ZOOM_011
     * @tc.desc   setZoomRatio-invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setZoomRatio_video_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setZoomRatio_video_003';
      await setZoomRatioVideo(done, testName, abnormalIndex);
    })

    /**
     * @tc.name   getZoomRatioRange_photo_preconfig_001
     * @tc.number SESSION_ZOOM_012
     * @tc.desc   getZoomRatioRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getZoomRatioRange_photo_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getZoomRatioRange_photo_preconfig_001';
      await getZoomRatioRangePhotoPreConfig(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   getZoomRatioRange_video_preconfig_001
     * @tc.number SESSION_ZOOM_013
     * @tc.desc   getZoomRatioRange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getZoomRatioRange_video_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getZoomRatioRange_video_preconfig_001';
      await getZoomRatioRangeVideoPreConfig(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   setZoomRatio_photo_preconfig_001
     * @tc.number SESSION_ZOOM_014
     * @tc.desc   setZoomRatio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setZoomRatio_photo_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setZoomRatio_photo_preconfig_001';
      await setZoomRatioPhotoPreConfig(done, testName, minIndex, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   setZoomRatio_video_preconfig_001
     * @tc.number SESSION_ZOOM_015
     * @tc.desc   setZoomRatio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setZoomRatio_video_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setZoomRatio_video_preconfig_001';
      await setZoomRatioVideoPreConfig(done, testName, minIndex, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   setZoomRatio_photo_abnormal_001
     * @tc.number SESSION_ZOOM_016
     * @tc.desc   Set values beyond the supported precision range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setZoomRatio_photo_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setZoomRatio_photo_abnormal_001';
      await setZoomRatioPhotoAbnormal(done, testName);
    })

    /**
     * @tc.name   setZoomRatio_video_abnormal_001
     * @tc.number SESSION_ZOOM_017
     * @tc.desc   Set values beyond the supported precision range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setZoomRatio_video_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setZoomRatio_video_abnormal_001';
      await setZoomRatioVideoAbnormal(done, testName);
    })

    /**
     * @tc.name   setZoomRatio_photo_abnormal_002
     * @tc.number SESSION_ZOOM_018
     * @tc.desc   mode->NORMAL_PHOTO, no session, only setZoomRatio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setZoomRatio_photo_abnormal_002', Level.LEVEL0, (done: Function) => {
      const testName = 'setZoomRatio_photo_abnormal_002';
      setZoomRatioPhotoError(done, testName, sceneMode.NORMAL_PHOTO);
    })

    /**
     * @tc.name   setZoomRatio_video_abnormal_002
     * @tc.number SESSION_ZOOM_019
     * @tc.desc   mode->NORMAL_VIDEO, no session, only setZoomRatio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setZoomRatio_video_abnormal_002', Level.LEVEL0, (done: Function) => {
      const testName = 'setZoomRatio_video_abnormal_002';
      setZoomRatioPhotoError(done, testName, sceneMode.NORMAL_VIDEO);
    })

    /**
     * @tc.name   setZoomRatio_secure_photo_abnormal_001
     * @tc.number SESSION_ZOOM_020
     * @tc.desc   mode->SECURE_PHOTO, no session, only setZoomRatio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setZoomRatio_secure_photo_abnormal_001', Level.LEVEL0, (done: Function) => {
      const testName = 'setZoomRatio_secure_photo_abnormal_001';
      setZoomRatioPhotoError(done, testName, sceneMode.SECURE_PHOTO);
    })
  })
}