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

const TAG = "CameraXts.CameraSessionFlashTest";
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
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCapModePhoto.previewProfiles[0], indexSurfaceId);
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
        await mPhotoSession.release();
        done();
        return;
      }
      mPhotoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      await getPreConfigPhotoSession(mPreviewOutput, mPhotoOutput);
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
}

async function hasFlashPreConfigVideo(done: Function, testName: string, type: camera.PreconfigType,
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
        await mVideoSession.release();
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
      expect(typeof videoStatus).assertEqual('boolean');
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
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoSession = mCameraManager.createSession(mSupportedModes[0]);
      let result = mPhotoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        await mPhotoSession.release();
        done();
        return;
      }
      mPhotoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCapModePhoto.photoProfiles[0]);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      await getPreConfigPhotoSession(mPreviewOutput, mPhotoOutput);
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

async function getVideoFlashSupportedModeStatusWithPreConfig(done: Function, testName: string,
  flashMode: camera.FlashMode, type: camera.PreconfigType, ratio: camera.PreconfigRatio) {
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
        await mVideoSession.release();
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
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoSession = mCameraManager.createSession(mSupportedModes[0]);
      let result = mPhotoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        await mPhotoSession.release();
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
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoSession = mCameraManager.createSession(mSupportedModes[0]);
      let result = mPhotoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        await mPhotoSession.release();
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
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      if (isEmpty(mPreviewProfile)) {
        console.info(TAG, testName + ' no same resolution preview.');
        expect(isEmpty(mPreviewProfile)).assertTrue();
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
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' session setFlashMode failed. code: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
    await releaseVideoSession();
    done();
  }
}

export default function CameraSessionFlashTest() {
  describe('CameraSessionFlashTest', () => {
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
     * @tc.name   hasFlash_photo_abnormal_001
     * @tc.number SESSION_FLASH_001
     * @tc.desc   sceneMode: NORMAL_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hasFlash_photo_abnormal_001', Level.LEVEL0, (done: Function) => {
      const testName = 'hasFlash_photo_abnormal_001';
      getFlashSupportedStatusError(done, testName, sceneMode.NORMAL_PHOTO);
    })

    /**
     * @tc.name   hasFlash_video_abnormal_001
     * @tc.number SESSION_FLASH_002
     * @tc.desc   sceneMode: NORMAL_VIDEO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hasFlash_video_abnormal_001', Level.LEVEL0, (done: Function) => {
      const testName = 'hasFlash_video_abnormal_001';
      getFlashSupportedStatusError(done, testName, sceneMode.NORMAL_VIDEO);
    })

    /**
     * @tc.name   hasFlash_secure_photo_abnormal_001
     * @tc.number SESSION_FLASH_003
     * @tc.desc   sceneMode: SECURE_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hasFlash_secure_photo_abnormal_001', Level.LEVEL0, (done: Function) => {
      const testName = 'hasFlash_secure_photo_abnormal_001';
      getFlashSupportedStatusError(done, testName, sceneMode.SECURE_PHOTO);
    })

    /**
     * @tc.name   isFlashModeSupported_photo_abnormal_001
     * @tc.number SESSION_FLASH_004
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_CLOSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_photo_abnormal_001', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_photo_abnormal_001';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_PHOTO, cameraFlashMode.FLASH_MODE_CLOSE);
    })

    /**
     * @tc.name   isFlashModeSupported_photo_abnormal_002
     * @tc.number SESSION_FLASH_005
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_photo_abnormal_002', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_photo_abnormal_002';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_PHOTO, cameraFlashMode.FLASH_MODE_OPEN);
    })

    /**
     * @tc.name   isFlashModeSupported_photo_abnormal_003
     * @tc.number SESSION_FLASH_006
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_photo_abnormal_003', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_photo_abnormal_003';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_PHOTO, cameraFlashMode.FLASH_MODE_AUTO);
    })

    /**
     * @tc.name   isFlashModeSupported_photo_abnormal_004
     * @tc.number SESSION_FLASH_007
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_ALWAYS_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_photo_abnormal_004', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_photo_abnormal_004';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_PHOTO, cameraFlashMode.FLASH_MODE_ALWAYS_OPEN);
    })

    /**
     * @tc.name   isFlashModeSupported_video_abnormal_001
     * @tc.number SESSION_FLASH_008
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_CLOSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_video_abnormal_001', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_video_abnormal_001';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_VIDEO, cameraFlashMode.FLASH_MODE_CLOSE);
    })

    /**
     * @tc.name   isFlashModeSupported_video_abnormal_002
     * @tc.number SESSION_FLASH_009
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_video_abnormal_002', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_video_abnormal_002';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_VIDEO, cameraFlashMode.FLASH_MODE_OPEN);
    })

    /**
     * @tc.name   isFlashModeSupported_video_abnormal_003
     * @tc.number SESSION_FLASH_010
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_video_abnormal_003', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_video_abnormal_003';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_VIDEO, cameraFlashMode.FLASH_MODE_AUTO);
    })

    /**
     * @tc.name   isFlashModeSupported_video_abnormal_004
     * @tc.number SESSION_FLASH_011
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_ALWAYS_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_video_abnormal_004', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_video_abnormal_004';
      getFlashSupportedModeStatusError(done, testName, sceneMode.NORMAL_VIDEO, cameraFlashMode.FLASH_MODE_ALWAYS_OPEN);
    })

    /**
     * @tc.name   isFlashModeSupported_secure_photo_abnormal_001
     * @tc.number SESSION_FLASH_012
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_CLOSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_secure_photo_abnormal_001', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_secure_photo_abnormal_001';
      getFlashSupportedModeStatusError(done, testName, sceneMode.SECURE_PHOTO, cameraFlashMode.FLASH_MODE_CLOSE);
    })

    /**
     * @tc.name   isFlashModeSupported_secure_photo_abnormal_002
     * @tc.number SESSION_FLASH_013
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_secure_photo_abnormal_002', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_secure_photo_abnormal_002';
      getFlashSupportedModeStatusError(done, testName, sceneMode.SECURE_PHOTO, cameraFlashMode.FLASH_MODE_OPEN);
    })

    /**
     * @tc.name   isFlashModeSupported_secure_photo_abnormal_003
     * @tc.number SESSION_FLASH_014
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_secure_photo_abnormal_003', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_secure_photo_abnormal_003';
      getFlashSupportedModeStatusError(done, testName, sceneMode.SECURE_PHOTO, cameraFlashMode.FLASH_MODE_AUTO);
    })

    /**
     * @tc.name   isFlashModeSupported_secure_photo_abnormal_004
     * @tc.number SESSION_FLASH_015
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_ALWAYS_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_secure_photo_abnormal_004', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_secure_photo_abnormal_004';
      getFlashSupportedModeStatusError(done, testName, sceneMode.SECURE_PHOTO, cameraFlashMode.FLASH_MODE_ALWAYS_OPEN);
    })

    /**
     * @tc.name   hasFlash_photo_001
     * @tc.number SESSION_FLASH_016
     * @tc.desc   No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hasFlash_photo_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_photo_001';
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
     * @tc.name   isFlashModeSupported_photo_001
     * @tc.number SESSION_FLASH_017
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_CLOSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_photo_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_photo_001';
      getPhotoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_CLOSE);
    })

    /**
     * @tc.name   isFlashModeSupported_photo_002
     * @tc.number SESSION_FLASH_018
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_photo_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_photo_002';
      getPhotoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_OPEN);
    })

    /**
     * @tc.name   isFlashModeSupported_photo_003
     * @tc.number SESSION_FLASH_019
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_photo_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_photo_003';
      getPhotoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_AUTO);
    })

    /**
     * @tc.name   isFlashModeSupported_photo_004
     * @tc.number SESSION_FLASH_020
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_ALWAYS_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_photo_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_photo_004';
      getPhotoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_ALWAYS_OPEN);
    })

    /**
     * @tc.name   hasFlash_video_001
     * @tc.number SESSION_FLASH_021
     * @tc.desc   No abnormal scenarios-sceneMode: NORMAL_VIDEO-hasFlash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hasFlash_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_video_001';
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
     * @tc.name   isFlashModeSupported_video_001
     * @tc.number SESSION_FLASH_022
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_CLOSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_video_001';
      getVideoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_CLOSE);
    })

    /**
     * @tc.name   isFlashModeSupported_video_002
     * @tc.number SESSION_FLASH_023
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_video_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_video_002';
      getVideoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_OPEN);
    })

    /**
     * @tc.name   isFlashModeSupported_video_003
     * @tc.number SESSION_FLASH_024
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_video_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_video_003';
      getVideoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_AUTO);
    })

    /**
     * @tc.name   isFlashModeSupported_video_004
     * @tc.number SESSION_FLASH_025
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_ALWAYS_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_video_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_video_004';
      getVideoFlashSupportedModeStatus(done, testName, cameraFlashMode.FLASH_MODE_ALWAYS_OPEN);
    })

    /**
     * @tc.name   getFlashMode_photo_001
     * @tc.number SESSION_FLASH_026
     * @tc.desc   getFlashMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFlashMode_photo_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFlashMode_photo_001';
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
     * @tc.name   getFlashMode_video_001
     * @tc.number SESSION_FLASH_027
     * @tc.desc   getFlashMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFlashMode_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFlashMode_video_001';
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
     * @tc.name   getFlashMode_photo_abnormal_001
     * @tc.number SESSION_FLASH_028
     * @tc.desc   getFlashMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFlashMode_photo_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFlashMode_photo_abnormal_001';
      getFlashModeError(done, testName, sceneMode.NORMAL_PHOTO);
    })

    /**
     * @tc.name   getFlashMode_video_abnormal_001
     * @tc.number SESSION_FLASH_029
     * @tc.desc   getFlashMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFlashMode_video_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFlashMode_video_abnormal_001';
      getFlashModeError(done, testName, sceneMode.NORMAL_VIDEO);
    })

    /**
     * @tc.name   getFlashMode_secure_photo_abnormal_001
     * @tc.number SESSION_FLASH_030
     * @tc.desc   getFlashMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFlashMode_secure_photo_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFlashMode_secure_photo_abnormal_001';
      getFlashModeError(done, testName, sceneMode.SECURE_PHOTO);
    })

    /**
     * @tc.name   setFlashMode_photo_001
     * @tc.number SESSION_FLASH_031
     * @tc.desc   setFlashMode-mode->FLASH_MODE_CLOSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_photo_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_001';
      await setFlashModePhoto(done, testName, cameraFlashMode.FLASH_MODE_CLOSE);
    })

    /**
     * @tc.name   setFlashMode_photo_002
     * @tc.number SESSION_FLASH_032
     * @tc.desc   setFlashMode-mode->FLASH_MODE_CLOSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_photo_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_002';
      await setFlashModePhoto(done, testName, cameraFlashMode.FLASH_MODE_OPEN);
    })

    /**
     * @tc.name   setFlashMode_photo_003
     * @tc.number SESSION_FLASH_033
     * @tc.desc   setFlashMode-mode->FLASH_MODE_CLOSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_photo_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_003';
      await setFlashModePhoto(done, testName, cameraFlashMode.FLASH_MODE_AUTO);
    })

    /**
     * @tc.name   setFlashMode_photo_004
     * @tc.number SESSION_FLASH_034
     * @tc.desc   setFlashMode-mode->FLASH_MODE_CLOSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_photo_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_004';
      await setFlashModePhoto(done, testName, cameraFlashMode.FLASH_MODE_ALWAYS_OPEN);
    })

    /**
     * @tc.name   setFlashMode_video_001
     * @tc.number SESSION_FLASH_035
     * @tc.desc   setFlashMode-mode->FLASH_MODE_CLOSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_001';
      await setFlashModeVideo(done, testName, cameraFlashMode.FLASH_MODE_CLOSE);
    })

    /**
     * @tc.name   setFlashMode_video_002
     * @tc.number SESSION_FLASH_036
     * @tc.desc   setFlashMode-mode->FLASH_MODE_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_video_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_002';
      await setFlashModeVideo(done, testName, cameraFlashMode.FLASH_MODE_OPEN);
    })

    /**
     * @tc.name   setFlashMode_video_003
     * @tc.number SESSION_FLASH_037
     * @tc.desc   setFlashMode-mode->FLASH_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_video_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_003';
      await setFlashModeVideo(done, testName, cameraFlashMode.FLASH_MODE_AUTO);
    })

    /**
     * @tc.name   setFlashMode_video_004
     * @tc.number SESSION_FLASH_038
     * @tc.desc   setFlashMode-mode->FLASH_MODE_ALWAYS_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_video_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_004';
      await setFlashModeVideo(done, testName, cameraFlashMode.FLASH_MODE_ALWAYS_OPEN);
    })

    /**
     * @tc.name   setFlashMode_photo_abnormal_001
     * @tc.number SESSION_FLASH_039
     * @tc.desc   setFlashMode-mode->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_photo_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_abnormal_001';
      await setFlashModePhoto(done, testName, abnormalValue);
    })

    /**
     * @tc.name   setFlashMode_photo_abnormal_002
     * @tc.number SESSION_FLASH_040
     * @tc.desc   setFlashMode-mode->null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_photo_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_abnormal_002';
      await setFlashModePhoto(done, testName, null);
    })

    /**
     * @tc.name   setFlashMode_photo_abnormal_003
     * @tc.number SESSION_FLASH_041
     * @tc.desc   setFlashMode-mode->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_photo_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_abnormal_003';
      await setFlashModePhoto(done, testName, undefined);
    })

    /**
     * @tc.name   setFlashMode_video_abnormal_001
     * @tc.number SESSION_FLASH_042
     * @tc.desc   setFlashMode-mode->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_video_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_abnormal_001';
      await setFlashModeVideo(done, testName, abnormalValue);
    })

    /**
     * @tc.name   setFlashMode_video_abnormal_002
     * @tc.number SESSION_FLASH_043
     * @tc.desc   setFlashMode-mode->null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_video_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_abnormal_002';
      await setFlashModeVideo(done, testName, null);
    })

    /**
     * @tc.name   setFlashMode_video_abnormal_003
     * @tc.number SESSION_FLASH_044
     * @tc.desc   setFlashMode-mode->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_video_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_abnormal_003';
      await setFlashModeVideo(done, testName, undefined);
    })

    /**
     * @tc.name   isFlashModeSupported_photo_abnormal_005
     * @tc.number SESSION_FLASH_045
     * @tc.desc   isFlashModeSupported-mode->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_photo_abnormal_005', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_photo_abnormal_005';
      getPhotoFlashSupportedModeStatusAbnormal(done, testName, abnormalValue);
    })

    /**
     * @tc.name   isFlashModeSupported_photo_abnormal_006
     * @tc.number SESSION_FLASH_046
     * @tc.desc   isFlashModeSupported-mode->null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_photo_abnormal_006', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_photo_abnormal_006';
      getPhotoFlashSupportedModeStatusAbnormal(done, testName, null);
    })

    /**
     * @tc.name   isFlashModeSupported_photo_abnormal_007
     * @tc.number SESSION_FLASH_047
     * @tc.desc   isFlashModeSupported-mode->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_photo_abnormal_007', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_photo_abnormal_007';
      getPhotoFlashSupportedModeStatusAbnormal(done, testName, undefined);
    })

    /**
     * @tc.name   isFlashModeSupported_video_abnormal_005
     * @tc.number SESSION_FLASH_048
     * @tc.desc   isFlashModeSupported-mode->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_video_abnormal_005', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_video_abnormal_005';
      getVideoFlashSupportedModeStatusAbnormal(done, testName, abnormalValue);
    })

    /**
     * @tc.name   isFlashModeSupported_video_abnormal_006
     * @tc.number SESSION_FLASH_049
     * @tc.desc   isFlashModeSupported-mode->null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_video_abnormal_006', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_video_abnormal_006';
      getVideoFlashSupportedModeStatusAbnormal(done, testName, null);
    })

    /**
     * @tc.name   isFlashModeSupported_video_abnormal_007
     * @tc.number SESSION_FLASH_050
     * @tc.desc   isFlashModeSupported-mode->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_video_abnormal_007', Level.LEVEL0, (done: Function) => {
      const testName = 'isFlashModeSupported_video_abnormal_007';
      getVideoFlashSupportedModeStatusAbnormal(done, testName, undefined);
    })

    /**
     * @tc.name   hasFlash_photo_preconfig_001
     * @tc.number SESSION_FLASH_051
     * @tc.desc   No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hasFlash_photo_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_photo_preconfig_001';
      await hasFlashPreConfigPhoto(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   hasFlash_photo_preconfig_002
     * @tc.number SESSION_FLASH_052
     * @tc.desc   No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hasFlash_photo_preconfig_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_photo_preconfig_002';
      await hasFlashPreConfigPhoto(done, testName, cameraPreconfigType.PRECONFIG_1080P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   hasFlash_photo_preconfig_003
     * @tc.number SESSION_FLASH_053
     * @tc.desc   No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hasFlash_photo_preconfig_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_photo_preconfig_003';
      await hasFlashPreConfigPhoto(done, testName, cameraPreconfigType.PRECONFIG_4K,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   hasFlash_photo_preconfig_004
     * @tc.number SESSION_FLASH_054
     * @tc.desc   No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hasFlash_photo_preconfig_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_photo_preconfig_004';
      await hasFlashPreConfigPhoto(done, testName, cameraPreconfigType.PRECONFIG_HIGH_QUALITY,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   hasFlash_video_preconfig_001
     * @tc.number SESSION_FLASH_055
     * @tc.desc   No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hasFlash_video_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_video_preconfig_001';
      await hasFlashPreConfigVideo(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   hasFlash_video_preconfig_002
     * @tc.number SESSION_FLASH_056
     * @tc.desc   No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hasFlash_video_preconfig_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_video_preconfig_002';
      await hasFlashPreConfigVideo(done, testName, cameraPreconfigType.PRECONFIG_1080P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   hasFlash_video_preconfig_003
     * @tc.number SESSION_FLASH_057
     * @tc.desc   No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hasFlash_video_preconfig_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_video_preconfig_003';
      await hasFlashPreConfigVideo(done, testName, cameraPreconfigType.PRECONFIG_4K,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   hasFlash_video_preconfig_004
     * @tc.number SESSION_FLASH_058
     * @tc.desc   No abnormal scenarios-sceneMode: NORMAL_PHOTO-hasFlash-preConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hasFlash_video_preconfig_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'hasFlash_video_preconfig_004';
      await hasFlashPreConfigVideo(done, testName, cameraPreconfigType.PRECONFIG_HIGH_QUALITY,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   isFlashModeSupported_photo_preconfig_001
     * @tc.number SESSION_FLASH_059
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_photo_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_photo_preconfig_001';
      await getPhotoFlashSupportedModeStatusWithPreConfig(done, testName, cameraFlashMode.FLASH_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_720P, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   isFlashModeSupported_video_preconfig_001
     * @tc.number SESSION_FLASH_060
     * @tc.desc   isFlashModeSupported-mode->FLASH_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isFlashModeSupported_video_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'isFlashModeSupported_video_preconfig_001';
      await getVideoFlashSupportedModeStatusWithPreConfig(done, testName, cameraFlashMode.FLASH_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_720P, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   getFlashMode_photo_preconfig_001
     * @tc.number SESSION_FLASH_061
     * @tc.desc   getFlashMode-preConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFlashMode_photo_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFlashMode_photo_preconfig_001';
      await getFlashModePhotoPreConfig(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   getFlashMode_video_preconfig_001
     * @tc.number SESSION_FLASH_062
     * @tc.desc   getFlashMode-preConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFlashMode_video_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFlashMode_video_preconfig_001';
      await getFlashModeVideoPreConfig(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   setFlashMode_photo_preconfig_001
     * @tc.number SESSION_FLASH_063
     * @tc.desc   setFlashMode-mode->FLASH_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_photo_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_photo_preconfig_001';
      await setFlashModePhotoPreConfig(done, testName, cameraFlashMode.FLASH_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_720P, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   setFlashMode_video_preconfig_001
     * @tc.number SESSION_FLASH_064
     * @tc.desc   setFlashMode-mode->FLASH_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setFlashMode_video_preconfig_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setFlashMode_video_preconfig_001';
      await setFlashModeVideoPreConfig(done, testName, cameraFlashMode.FLASH_MODE_AUTO,
        cameraPreconfigType.PRECONFIG_720P, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })
  })
}