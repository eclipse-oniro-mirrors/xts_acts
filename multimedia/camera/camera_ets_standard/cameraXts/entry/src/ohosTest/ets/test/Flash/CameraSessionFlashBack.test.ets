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
  cameraFlashMode,
  cameraPreconfigRatio,
  cameraPreconfigType,
  checkBackCamera,
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

const TAG = "CameraXts.CameraSessionFlashBackTest";
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
let mVideoSurfaceId: string;
let mVideoProfile: camera.VideoProfile;
let mPhotoSession: camera.PhotoSession;
let mVideoSession: camera.VideoSession;
let mAVRecorder: media.AVRecorder;
let fdNumber: number;
let fdPath: string;
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

function getOutputCapability() {
  console.info(TAG, 'getOutputCapability.');
  if (!checkBackCamera()) {
    console.info(TAG, 'The current device does not have a rear camera.');
    return;
  }
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
  console.info(TAG, 'getPreviewProfile.');
  if (!checkBackCamera()) {
    console.info(TAG, 'The current device does not have a rear camera.');
    return;
  }
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

async function getFlashSupportedStatusError(done: Function, testName: string, sMode: camera.SceneMode) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
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
          let photoStatus = testSession.hasFlash();
          expect(isEmpty(photoStatus)).assertFalse();
          console.info(TAG, testName + 'photo mode, status: ' + photoStatus);
          break;
        case sceneMode.NORMAL_VIDEO:
          testSession = mCameraManager.createSession(sceneMode.NORMAL_VIDEO) as camera.VideoSession;
          expect(isEmpty(testSession)).assertFalse();
          let videoStatus = testSession.hasFlash();
          expect(isEmpty(videoStatus)).assertFalse();
          console.info(TAG, testName + 'video mode, status: ' + videoStatus);
          break;
        case sceneMode.SECURE_PHOTO:
          testSession = mCameraManager.createSession(sceneMode.SECURE_PHOTO) as camera.SecureSession;
          expect(isEmpty(testSession)).assertFalse();
          let secureStatus = testSession.hasFlash();
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
    console.error(TAG, testName + ' session hasFlash failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await testSession?.release();
    done();
  }
}

async function getFlashSupportedModeStatusError(done: Function, testName: string, sMode: camera.SceneMode,
  flashMode: camera.FlashMode) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
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
          let photoStatus = testSession.isFlashModeSupported(flashMode);
          expect(isEmpty(photoStatus)).assertFalse();
          console.info(TAG, testName + 'photo mode, status: ' + photoStatus);
          break;
        case sceneMode.NORMAL_VIDEO:
          testSession = mCameraManager.createSession(sceneMode.NORMAL_VIDEO) as camera.VideoSession;
          expect(isEmpty(testSession)).assertFalse();
          let videoStatus = testSession.isFlashModeSupported(flashMode);
          expect(isEmpty(videoStatus)).assertFalse();
          console.info(TAG, testName + 'video mode, status: ' + videoStatus);
          break;
        case sceneMode.SECURE_PHOTO:
          testSession = mCameraManager.createSession(sceneMode.SECURE_PHOTO) as camera.SecureSession;
          expect(isEmpty(testSession)).assertFalse();
          let secureStatus = testSession.isFlashModeSupported(flashMode);
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
    console.error(TAG, testName + ' session isFlashModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await testSession?.release();
    done();
  }
}

async function getPhotoFlashSupportedModeStatus(done: Function, testName: string, flashMode: camera.FlashMode) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput =
        mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      let photoStatus = mPhotoSession.isFlashModeSupported(flashMode);
      console.info(TAG, testName + ' photo mode, status: ' + photoStatus);
      expect(typeof photoStatus).assertEqual('boolean');
      await releasePhotoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFlashModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function getPhotoFlashSupportedModeStatusAbnormal(done: Function, testName: string,
  flashMode: camera.FlashMode | null | undefined) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput =
        mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      let photoStatus = mPhotoSession.isFlashModeSupported(flashMode as camera.FlashMode);
      console.info(TAG, testName + ' photo mode, status: ' + photoStatus);
      if (isEmpty(flashMode)) {
        expect(photoStatus).assertTrue();
      } else {
        expect(photoStatus).assertFalse();
      }
      await releasePhotoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFlashModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function getVideoFlashSupportedModeStatus(done: Function, testName: string, flashMode: camera.FlashMode) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
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
        let videoStatus = mVideoSession.isFlashModeSupported(flashMode);
        console.info(TAG, testName + ' video mode, status: ' + videoStatus);
        expect(isEmpty(videoStatus)).assertFalse();
        await releaseVideoSession();
      }
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFlashModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releaseVideoSession();
    done();
  }
}

async function getVideoFlashSupportedModeStatusAbnormal(done: Function, testName: string,
  flashMode: camera.FlashMode | null | undefined) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
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
        let videoStatus = mVideoSession.isFlashModeSupported(flashMode as camera.FlashMode);
        console.info(TAG, testName + ' video mode, status: ' + videoStatus);
        if (isEmpty(flashMode)) {
          expect(videoStatus).assertTrue();
        } else {
          expect(videoStatus).assertFalse();
        }
        await releaseVideoSession();
      }
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFlashModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
    await releaseVideoSession();
    done();
  }
}

async function getFlashModeError(done: Function, testName: string, sMode: camera.SceneMode) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
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
          let photoStatus = testSession.getFlashMode();
          expect(isEmpty(photoStatus)).assertFalse();
          console.info(TAG, testName + 'photo mode, status: ' + photoStatus);
          break;
        case sceneMode.NORMAL_VIDEO:
          testSession = mCameraManager.createSession(sceneMode.NORMAL_VIDEO) as camera.VideoSession;
          expect(isEmpty(testSession)).assertFalse();
          let videoStatus = testSession.getFlashMode();
          expect(isEmpty(videoStatus)).assertFalse();
          console.info(TAG, testName + 'video mode, status: ' + videoStatus);
          break;
        case sceneMode.SECURE_PHOTO:
          testSession = mCameraManager.createSession(sceneMode.SECURE_PHOTO) as camera.SecureSession;
          expect(isEmpty(testSession)).assertFalse();
          let secureStatus = testSession.getFlashMode();
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
    console.error(TAG, testName + ' session hasFlash failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await testSession?.release();
    done();
  }
}

async function setFlashModePhoto(done: Function, testName: string, flashMode: camera.FlashMode | null | undefined) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput =
        mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      mPhotoSession.setFlashMode(flashMode as camera.FlashMode);
      console.info(TAG, testName + ' photo set flash mode, status: ' + flashMode);
      let mode = mPhotoSession.getFlashMode();
      expect(mode).assertEqual(isEmpty(flashMode) ? cameraFlashMode.FLASH_MODE_CLOSE : flashMode);
      await releasePhotoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' session setFlashMode failed. code: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function setFlashModeVideo(done: Function, testName: string, flashMode: camera.FlashMode | null | undefined) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
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
        mVideoSession.setFlashMode(flashMode as camera.FlashMode);
        console.info(TAG, testName + ' photo set flash mode, status: ' + flashMode);
        let mode = mVideoSession.getFlashMode();
        expect(mode).assertEqual(isEmpty(flashMode) ? cameraFlashMode.FLASH_MODE_CLOSE : flashMode);
        await releaseVideoSession();
      }
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' session setFlashMode failed. code: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
    await releaseVideoSession();
    done();
  }
}

async function hasFlashPreConfigPhoto(done: Function, testName: string, type: camera.PreconfigType,
  ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
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
      let photoStatus = mPhotoSession.hasFlash();
      expect(photoStatus).assertTrue();
      console.info(TAG, testName + ' photo mode, status: ' + photoStatus);
      await releasePhotoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' photo session hasFlash failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function hasFlashPreConfigVideo(done: Function, testName: string, type: camera.PreconfigType,
  ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mVideoSession = mCameraManager.createSession(mSupportedModes[1]);
      console.info(TAG, testName + ' session created successfully.');
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
      let videoStatus = mVideoSession.hasFlash();
      console.info(TAG, testName + ' video mode, status: ' + videoStatus);
      expect(isEmpty(videoStatus)).assertFalse();
      await releaseVideoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' video session hasFlash failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releaseVideoSession();
    done();
  }
}

async function getPhotoFlashSupportedModeStatusWithPreConfig(done: Function, testName: string,
  flashMode: camera.FlashMode, type: camera.PreconfigType, ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
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
      let photoStatus = mPhotoSession.isFlashModeSupported(flashMode);
      expect(photoStatus).assertTrue();
      console.info(TAG, testName + ' photo mode, status: ' + photoStatus);
      await releasePhotoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFlashModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function getVideoFlashSupportedModeStatusWithPreConfig(done: Function, testName: string,
  flashMode: camera.FlashMode, type: camera.PreconfigType, ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
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
      let videoStatus = mVideoSession.isFlashModeSupported(flashMode);
      console.info(TAG, testName + ' video mode, status: ' + videoStatus);
      expect(isEmpty(videoStatus)).assertFalse();
      await releaseVideoSession();
    }
    done();
  } catch (err) {
    console.error(TAG, testName + ' session isFlashModeSupported failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
    await releaseVideoSession();
    done();
  }
}

async function getFlashModePhotoPreConfig(done: Function, testName: string, type: camera.PreconfigType,
  ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
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
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      await getPreConfigPhotoSession(mPreviewOutput, mPhotoOutput);
      let flashMode = mPhotoSession.getFlashMode();
      expect(isEmpty(flashMode)).assertFalse();
      console.info(TAG, testName + ' photo flash mode, status: ' + flashMode);
      await releasePhotoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' session getFlashMode failed. code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    await releasePhotoSession();
    done();
  }
}

async function getFlashModeVideoPreConfig(done: Function, testName: string, type: camera.PreconfigType,
  ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
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
      let flashMode = mVideoSession.getFlashMode();
      expect(isEmpty(flashMode)).assertFalse();
      console.info(TAG, testName + ' photo flash mode, status: ' + flashMode);
      await releaseVideoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' session getFlashMode failed. code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    await releaseVideoSession();
    done();
  }
}

async function setFlashModePhotoPreConfig(done: Function, testName: string, flashMode: camera.FlashMode,
  type: camera.PreconfigType, ratio: camera.PreconfigRatio) {
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
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
      mPhotoSession.setFlashMode(flashMode as camera.FlashMode);
      console.info(TAG, testName + ' photo set flash mode, status: ' + flashMode);
      let mode = mPhotoSession.getFlashMode();
      expect(mode).assertEqual(isEmpty(flashMode) ? cameraFlashMode.FLASH_MODE_CLOSE : flashMode);
      await releasePhotoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' session setFlashMode failed. code: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function setFlashModeVideoPreConfig(done: Function, testName: string, flashMode: camera.FlashMode,
  type: camera.PreconfigType, ratio: camera.PreconfigRatio) {
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mVideoSession = mCameraManager.createSession(mSupportedModes[1]);
      let result = mVideoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        await mVideoSession.release();
        done();
        return;
      }
      await getVideoSurfaceId();
      mVideoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mVideoOutput = mCameraManager.createVideoOutput(mVideoSurfaceId);
      await getPreConfigVideoSession(testName, mPreviewOutput, mVideoOutput);
      mVideoSession.setFlashMode(flashMode as camera.FlashMode);
      console.info(TAG, testName + ' photo set flash mode, status: ' + flashMode);
      let mode = mVideoSession.getFlashMode();
      expect(mode).assertEqual(isEmpty(flashMode) ? cameraFlashMode.FLASH_MODE_CLOSE : flashMode);
      await releaseVideoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' session setFlashMode failed. code: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
    await releaseVideoSession();
    done();
  }
}

export default function CameraSessionFlashBackTest() {
  describe('CameraSessionFlashBackTest', () => {
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
     * @tc.number    : SESSION_FLASH_BACK_001
     * @tc.name      : hasFlash_photo_abnormal_back_001
     * @tc.desc      : sceneMode: NORMAL_PHOTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('hasFlash_photo_abnormal_back_001', Level.LEVEL0, (done: Function) => {
      const testName = 'hasFlash_photo_abnormal_back_001';
      getFlashSupportedStatusError(done, testName, sceneMode.NORMAL_PHOTO);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_002
     * @tc.name      : hasFlash_video_abnormal_back_001
     * @tc.desc      : sceneMode: NORMAL_VIDEO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('hasFlash_video_abnormal_back_001', Level.LEVEL0, (done: Function) => {
      const testName = 'hasFlash_video_abnormal_back_001';
      getFlashSupportedStatusError(done, testName, sceneMode.NORMAL_VIDEO);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_003
     * @tc.name      : hasFlash_secure_photo_abnormal_back_001
     * @tc.desc      : sceneMode: SECURE_PHOTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('hasFlash_secure_photo_abnormal_back_001', Level.LEVEL0, (done: Function) => {
      const testName = 'hasFlash_secure_photo_abnormal_back_001';
      getFlashSupportedStatusError(done, testName, sceneMode.SECURE_PHOTO);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_back_004
     * @tc.name      : isFlashModeSupported_photo_abnormal_back_001
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_CLOSE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_photo_abnormal_back_001', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_photo_abnormal_back_001';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_PHOTO, cameraFlashMode.FLASH_MODE_CLOSE);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_005
     * @tc.name      : isFlashModeSupported_photo_abnormal_back_002
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_OPEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_photo_abnormal_back_002', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_photo_abnormal_back_002';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_PHOTO, cameraFlashMode.FLASH_MODE_OPEN);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_006
     * @tc.name      : isFlashModeSupported_photo_abnormal_back_003
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_AUTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_photo_abnormal_back_003', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_photo_abnormal_back_003';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_PHOTO, cameraFlashMode.FLASH_MODE_AUTO);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_007
     * @tc.name      : isFlashModeSupported_photo_abnormal_back_004
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_ALWAYS_OPEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_photo_abnormal_back_004', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_photo_abnormal_back_004';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_PHOTO, cameraFlashMode.FLASH_MODE_ALWAYS_OPEN);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_008
     * @tc.name      : isFlashModeSupported_video_abnormal_back_001
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_CLOSE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_video_abnormal_back_001', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_video_abnormal_back_001';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_VIDEO, cameraFlashMode.FLASH_MODE_CLOSE);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_009
     * @tc.name      : isFlashModeSupported_video_abnormal_back_002
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_OPEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_video_abnormal_back_002', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_video_abnormal_back_002';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_VIDEO, cameraFlashMode.FLASH_MODE_OPEN);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_010
     * @tc.name      : isFlashModeSupported_video_abnormal_back_003
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_AUTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_video_abnormal_back_003', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_video_abnormal_back_003';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_VIDEO, cameraFlashMode.FLASH_MODE_AUTO);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_011
     * @tc.name      : isFlashModeSupported_video_abnormal_back_004
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_ALWAYS_OPEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_video_abnormal_back_004', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_video_abnormal_back_004';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_VIDEO, cameraFlashMode.FLASH_MODE_ALWAYS_OPEN);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_012
     * @tc.name      : isFlashModeSupported_secure_photo_abnormal_back_001
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_CLOSE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_secure_photo_abnormal_back_001', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_secure_photo_abnormal_back_001';
      getFlashSupportedModeStatusError(done, testName, sceneMode.SECURE_PHOTO, cameraFlashMode.FLASH_MODE_CLOSE);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_013
     * @tc.name      : isFlashModeSupported_secure_photo_abnormal_back_002
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_OPEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_secure_photo_abnormal_back_002', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_secure_photo_abnormal_back_002';
      getFlashSupportedModeStatusError(done, testName, sceneMode.SECURE_PHOTO, cameraFlashMode.FLASH_MODE_OPEN);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_014
     * @tc.name      : isFlashModeSupported_secure_photo_abnormal_back_003
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_AUTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_secure_photo_abnormal_back_003', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_secure_photo_abnormal_back_003';
      getFlashSupportedModeStatusError(done, testName, sceneMode.SECURE_PHOTO, cameraFlashMode.FLASH_MODE_AUTO);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_015
     * @tc.name      : isFlashModeSupported_secure_photo_abnormal_back_004
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_ALWAYS_OPEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_secure_photo_abnormal_back_004', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_secure_photo_abnormal_back_004';
      getFlashSupportedModeStatusError(done, testName, sceneMode.SECURE_PHOTO, cameraFlashMode.FLASH_MODE_ALWAYS_OPEN);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_016
     * @tc.name      : hasFlash_photo_back_001
     * @tc.desc      : No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('hasFlash_photo_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_photo_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
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
          let photoStatus = mPhotoSession.hasFlash();
          console.info(TAG, testName + ' photo mode, status: ' + photoStatus);
          expect(typeof photoStatus).assertEqual('boolean');
          await releasePhotoSession();
        }
        done();
      } catch (err) {
        console.error(TAG, testName + ' photo session hasFlash failed. code: ' + err.code + ', msg: ' + err.message);
        expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_017
     * @tc.name      : isFlashModeSupported_photo_back_001
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_CLOSE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_photo_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_photo_back_001';
      getPhotoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_CLOSE);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_018
     * @tc.name      : isFlashModeSupported_photo_back_002
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_OPEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_photo_back_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_photo_back_002';
      getPhotoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_OPEN);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_019
     * @tc.name      : isFlashModeSupported_photo_back_003
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_AUTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_photo_back_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_photo_back_003';
      getPhotoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_AUTO);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_020
     * @tc.name      : isFlashModeSupported_photo_back_004
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_ALWAYS_OPEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_photo_back_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_photo_back_004';
      getPhotoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_ALWAYS_OPEN);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_021
     * @tc.name      : hasFlash_video_back_001
     * @tc.desc      : No abnormal scenarios-sceneMode: NORMAL_VIDEO-hasFlash
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('hasFlash_video_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_video_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
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
            let videoStatus = mVideoSession.hasFlash();
            console.info(TAG, testName + ' video mode, status: ' + videoStatus);
            expect(typeof videoStatus).assertEqual('boolean');
            await releaseVideoSession();
          }
        }
        done();
      } catch (err) {
        console.error(TAG, testName + ' video session hasFlash failed. code: ' + err.code + ', msg: ' + err.message);
        expect(err.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_022
     * @tc.name      : isFlashModeSupported_video_back_001
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_CLOSE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_video_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_video_back_001';
      getVideoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_CLOSE);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_023
     * @tc.name      : isFlashModeSupported_video_back_002
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_OPEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_video_back_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_video_back_002';
      getVideoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_OPEN);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_024
     * @tc.name      : isFlashModeSupported_video_back_003
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_AUTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_video_back_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_video_back_003';
      getVideoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_AUTO);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_025
     * @tc.name      : isFlashModeSupported_video_back_004
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_ALWAYS_OPEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_video_back_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_video_back_004';
      getVideoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_ALWAYS_OPEN);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_026
     * @tc.name      : getFlashMode_photo_back_001
     * @tc.desc      : getFlashMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getFlashMode_photo_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFlashMode_photo_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
          mPreviewOutput =
            mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          let flashMode = mPhotoSession.getFlashMode();
          expect(isEmpty(flashMode)).assertFalse();
          console.info(TAG, testName + ' photo flash mode, status: ' + flashMode);
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' session getFlashMode failed. code: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_027
     * @tc.name      : getFlashMode_video_back_001
     * @tc.desc      : getFlashMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getFlashMode_video_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFlashMode_video_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
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
            let flashMode = mVideoSession.getFlashMode();
            expect(isEmpty(flashMode)).assertFalse();
            console.info(TAG, testName + ' video flash mode, status: ' + flashMode);
            await releaseVideoSession();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' session getFlashMode failed. code: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_028
     * @tc.name      : getFlashMode_photo_abnormal_back_001
     * @tc.desc      : getFlashMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getFlashMode_photo_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFlashMode_photo_abnormal_back_001';
      getFlashModeError(done, testName, sceneMode.NORMAL_PHOTO);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_029
     * @tc.name      : getFlashMode_video_abnormal_back_001
     * @tc.desc      : getFlashMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getFlashMode_video_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFlashMode_video_abnormal_back_001';
      getFlashModeError(done, testName, sceneMode.NORMAL_VIDEO);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_030
     * @tc.name      : getFlashMode_secure_photo_abnormal_back_001
     * @tc.desc      : getFlashMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getFlashMode_secure_photo_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFlashMode_secure_photo_abnormal_back_001';
      getFlashModeError(done, testName, sceneMode.SECURE_PHOTO);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_031
     * @tc.name      : setFlashMode_photo_back_001
     * @tc.desc      : setFlashMode-mode->FLASH_MODE_CLOSE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_photo_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_back_001';
      await setFlashModePhoto(done, testName, cameraFlashMode.FLASH_MODE_CLOSE);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_032
     * @tc.name      : setFlashMode_photo_back_002
     * @tc.desc      : setFlashMode-mode->FLASH_MODE_CLOSE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_photo_back_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_back_002';
      await setFlashModePhoto(done, testName, cameraFlashMode.FLASH_MODE_OPEN);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_033
     * @tc.name      : setFlashMode_photo_back_003
     * @tc.desc      : setFlashMode-mode->FLASH_MODE_CLOSE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_photo_back_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_back_003';
      await setFlashModePhoto(done, testName, cameraFlashMode.FLASH_MODE_AUTO);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_034
     * @tc.name      : setFlashMode_photo_back_004
     * @tc.desc      : setFlashMode-mode->FLASH_MODE_CLOSE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_photo_back_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_back_004';
      await setFlashModePhoto(done, testName, cameraFlashMode.FLASH_MODE_ALWAYS_OPEN);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_035
     * @tc.name      : setFlashMode_video_back_001
     * @tc.desc      : setFlashMode-mode->FLASH_MODE_CLOSE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_video_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_back_001';
      await setFlashModeVideo(done, testName, cameraFlashMode.FLASH_MODE_CLOSE);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_036
     * @tc.name      : setFlashMode_video_back_002
     * @tc.desc      : setFlashMode-mode->FLASH_MODE_OPEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_video_back_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_back_002';
      await setFlashModeVideo(done, testName, cameraFlashMode.FLASH_MODE_OPEN);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_037
     * @tc.name      : setFlashMode_video_back_003
     * @tc.desc      : setFlashMode-mode->FLASH_MODE_AUTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_video_back_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_back_003';
      await setFlashModeVideo(done, testName, cameraFlashMode.FLASH_MODE_AUTO);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_038
     * @tc.name      : setFlashMode_video_back_004
     * @tc.desc      : setFlashMode-mode->FLASH_MODE_ALWAYS_OPEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_video_back_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_back_004';
      await setFlashModeVideo(done, testName, cameraFlashMode.FLASH_MODE_ALWAYS_OPEN);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_039
     * @tc.name      : setFlashMode_photo_abnormal_back_001
     * @tc.desc      : setFlashMode-mode->invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_photo_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_abnormal_back_001';
      await setFlashModePhoto(done, testName, abnormalValue);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_040
     * @tc.name      : setFlashMode_photo_abnormal_back_002
     * @tc.desc      : setFlashMode-mode->null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_photo_abnormal_back_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_abnormal_back_002';
      await setFlashModePhoto(done, testName, null);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_041
     * @tc.name      : setFlashMode_photo_abnormal_back_003
     * @tc.desc      : setFlashMode-mode->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_photo_abnormal_back_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_abnormal_back_003';
      await setFlashModePhoto(done, testName, undefined);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_042
     * @tc.name      : setFlashMode_video_abnormal_back_001
     * @tc.desc      : setFlashMode-mode->invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_video_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_abnormal_back_001';
      await setFlashModeVideo(done, testName, abnormalValue);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_043
     * @tc.name      : setFlashMode_video_abnormal_back_002
     * @tc.desc      : setFlashMode-mode->null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_video_abnormal_back_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_abnormal_back_002';
      await setFlashModeVideo(done, testName, null);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_044
     * @tc.name      : setFlashMode_video_abnormal_back_003
     * @tc.desc      : setFlashMode-mode->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_video_abnormal_back_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_abnormal_back_003';
      await setFlashModeVideo(done, testName, undefined);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_045
     * @tc.name      : isFlashModeSupported_photo_abnormal_back_005
     * @tc.desc      : isFlashModeSupported-mode->invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_photo_abnormal_back_005', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_photo_abnormal_back_005';
      getPhotoFlashSupportedModeStatusAbnormal(done, testName, abnormalValue);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_back_046
     * @tc.name      : isFlashModeSupported_photo_abnormal_back_006
     * @tc.desc      : isFlashModeSupported-mode->null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_photo_abnormal_back_006', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_photo_abnormal_back_006';
      getPhotoFlashSupportedModeStatusAbnormal(done, testName, null);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_047
     * @tc.name      : isFlashModeSupported_photo_abnormal_back_007
     * @tc.desc      : isFlashModeSupported-mode->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_photo_abnormal_back_007', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_photo_abnormal_back_007';
      getPhotoFlashSupportedModeStatusAbnormal(done, testName, undefined);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_048
     * @tc.name      : isFlashModeSupported_video_abnormal_back_005
     * @tc.desc      : isFlashModeSupported-mode->invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_video_abnormal_back_005', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_video_abnormal_back_005';
      getVideoFlashSupportedModeStatusAbnormal(done, testName, abnormalValue);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_049
     * @tc.name      : isFlashModeSupported_video_abnormal_back_006
     * @tc.desc      : isFlashModeSupported-mode->null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_video_abnormal_back_006', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_video_abnormal_back_006';
      getVideoFlashSupportedModeStatusAbnormal(done, testName, null);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_050
     * @tc.name      : isFlashModeSupported_video_abnormal_back_007
     * @tc.desc      : isFlashModeSupported-mode->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_video_abnormal_back_007', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_video_abnormal_back_007';
      getVideoFlashSupportedModeStatusAbnormal(done, testName, undefined);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_051
     * @tc.name      : hasFlash_photo_preconfig_back_001
     * @tc.desc      : No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('hasFlash_photo_preconfig_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_photo_preconfig_back_001';
      await hasFlashPreConfigPhoto(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_052
     * @tc.name      : hasFlash_photo_preconfig_back_002
     * @tc.desc      : No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('hasFlash_photo_preconfig_back_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_photo_preconfig_back_002';
      await hasFlashPreConfigPhoto(done, testName, cameraPreconfigType.PRECONFIG_1080P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_053
     * @tc.name      : hasFlash_photo_preconfig_back_003
     * @tc.desc      : No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('hasFlash_photo_preconfig_back_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_photo_preconfig_back_003';
      await hasFlashPreConfigPhoto(done, testName, cameraPreconfigType.PRECONFIG_4K,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_054
     * @tc.name      : hasFlash_photo_preconfig_back_004
     * @tc.desc      : No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('hasFlash_photo_preconfig_back_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_photo_preconfig_back_004';
      await hasFlashPreConfigPhoto(done, testName, cameraPreconfigType.PRECONFIG_HIGH_QUALITY,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_055
     * @tc.name      : hasFlash_video_preconfig_back_001
     * @tc.desc      : No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('hasFlash_video_preconfig_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_video_preconfig_back_001';
      await hasFlashPreConfigVideo(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_056
     * @tc.name      : hasFlash_video_preconfig_back_002
     * @tc.desc      : No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('hasFlash_video_preconfig_back_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_video_preconfig_back_002';
      await hasFlashPreConfigVideo(done, testName, cameraPreconfigType.PRECONFIG_1080P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_057
     * @tc.name      : hasFlash_video_preconfig_back_003
     * @tc.desc      : No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('hasFlash_video_preconfig_back_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_video_preconfig_back_003';
      await hasFlashPreConfigVideo(done, testName, cameraPreconfigType.PRECONFIG_4K,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_058
     * @tc.name      : hasFlash_video_preconfig_back_004
     * @tc.desc      : No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('hasFlash_video_preconfig_back_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_video_preconfig_back_004';
      await hasFlashPreConfigVideo(done, testName, cameraPreconfigType.PRECONFIG_HIGH_QUALITY,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_059
     * @tc.name      : isFlashModeSupported_photo_preconfig_back_001
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_AUTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_photo_preconfig_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_photo_preconfig_back_001';
      await getPhotoFlashSupportedModeStatusWithPreConfig(done, testName, cameraFlashMode.FLASH_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_720P, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_060
     * @tc.name      : isFlashModeSupported_video_preconfig_back_001
     * @tc.desc      : isFlashModeSupported-mode->FLASH_MODE_AUTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isFlashModeSupported_video_preconfig_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_video_preconfig_back_001';
      await getVideoFlashSupportedModeStatusWithPreConfig(done, testName, cameraFlashMode.FLASH_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_720P, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_061
     * @tc.name      : getFlashMode_photo_preconfig_back_001
     * @tc.desc      : getFlashMode-preConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getFlashMode_photo_preconfig_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFlashMode_photo_preconfig_back_001';
      await getFlashModePhotoPreConfig(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_062
     * @tc.name      : getFlashMode_video_preconfig_back_001
     * @tc.desc      : getFlashMode-preConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getFlashMode_video_preconfig_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFlashMode_video_preconfig_back_001';
      await getFlashModeVideoPreConfig(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_063
     * @tc.name      : setFlashMode_photo_preconfig_back_001
     * @tc.desc      : setFlashMode-mode->FLASH_MODE_AUTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_photo_preconfig_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_preconfig_back_001';
      await setFlashModePhotoPreConfig(done, testName, cameraFlashMode.FLASH_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_720P, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : SESSION_FLASH_BACK_064
     * @tc.name      : setFlashMode_video_preconfig_back_001
     * @tc.desc      : setFlashMode-mode->FLASH_MODE_AUTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setFlashMode_video_preconfig_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_preconfig_back_001';
      await setFlashModeVideoPreConfig(done, testName, cameraFlashMode.FLASH_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_720P, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })
  })
}