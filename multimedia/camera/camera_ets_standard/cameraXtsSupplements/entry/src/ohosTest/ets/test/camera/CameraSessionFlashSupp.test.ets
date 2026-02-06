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
  closeFd,
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
import json from '@ohos.util.json';
import { colorSpaceManager } from '@kit.ArkGraphics2D';

const TAG = "CameraXts.CameraSessionFlashSuppTest";
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
  console.log(TAG, 'createVideoOutput' + videoProfile,'surfaceID', mVideoSurfaceId);
  mVideoOutput = mCameraManager.createVideoOutput(videoProfile, mVideoSurfaceId);
  console.log(TAG, 'create preview output' + mPreviewOutput,'createVideoOutput', mVideoOutput);
}

async function getCreatePhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
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

function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info(TAG,'getEnumMaxValue : ' + maxValue);
  return maxValue;
}

async function photoSessionSetMeteringPoint(testName: string, point: camera.Point | undefined | null, callback: (res?: camera.Point, errCode?: number) => void) {
  console.info(TAG, testName);
  if (isEmpty(mCameraDeviceArray)) {
    console.info(TAG, testName, ' mCameraDeviceArray is null.');
  } else {
    createPhotoOutput();
    await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
    try {
      mPhotoSession.setMeteringPoint(point);
      let meteringPoint = mPhotoSession.getMeteringPoint()
      console.info(TAG, testName, JSON.stringify(meteringPoint));
      callback(meteringPoint, undefined)
      await releasePhotoSession();
    } catch (err) {
      console.info(TAG, testName, err.message, err.code);
      callback(undefined, err.code)
      await releasePhotoSession();
    }
  }
}
async function videoSessionSetMeteringPoint(testName: string, point: camera.Point | undefined | null, callback: (res?: camera.Point, errCode?: number) => void) {
  console.info(TAG, testName);
  if (isEmpty(mCameraDeviceArray)) {
    console.info(TAG, testName, ' mCameraDeviceArray is null.');
  } else {
    await createVideoOutput();
    await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
    try {
      mVideoSession.setMeteringPoint(point);
      let meteringPoint = mVideoSession.getMeteringPoint()
      console.info(TAG,testName, 'Success MeteringPoint:', meteringPoint);
      callback(meteringPoint, undefined)
      await releaseVideoSession();
    } catch (err) {
      console.info(TAG, testName, err.message, err.code);
      callback(undefined, err.code)
      await releaseVideoSession();
    }
  }
}
async function photoSessionIsFlashModeSupported(testName: string, flashMode: camera.FlashMode | undefined | null, callback: (res?: boolean, errCode?: number) => void) {
  console.info(TAG,testName);
  if (isEmpty(mCameraDeviceArray)) {
    console.info(TAG, testName, ' mCameraDeviceArray is null.');
  } else {
    createPhotoOutput();
    await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
    try {
      let isFlashModeSupported: boolean = mPhotoSession.isFlashModeSupported(flashMode);
      console.info(TAG, testName,'isFlashModeSupported', isFlashModeSupported);
      callback(isFlashModeSupported,undefined);
      await releasePhotoSession();
    } catch(err) {
      console.info(TAG ,testName,err.message, err.code);
      callback(undefined,err.code);
      await releasePhotoSession();
    }
  }
}

async function videoSessionIsFlashModeSupported(testName: string, flashMode: camera.FlashMode | undefined | null, callback: (res?: boolean, errCode?: number) => void) {
  console.info(TAG, testName);
  if (isEmpty(mCameraDeviceArray)) {
    console.info(TAG, testName, ' mCameraDeviceArray is null.');
  } else {
    await createVideoOutput();
    await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
    try {
      let isFlashModeSupported: boolean = mVideoSession.isFlashModeSupported(flashMode);
      console.info(TAG, testName,'isFlashModeSupported', isFlashModeSupported);
      callback(isFlashModeSupported, undefined);
      await releaseVideoSession();
    } catch (err) {
      console.info(TAG ,testName,err.message, err.code);
      callback(undefined, err.code);
      await releaseVideoSession();
    }
  }
}


async function photoSessionsetExposureMode(testName: string, exposureMode: camera.ExposureMode | undefined | null, callback: (res?: number, errCode?: number) => void) {
  console.info(TAG,testName);
  if (isEmpty(mCameraDeviceArray)) {
    console.info(TAG, testName, ' mCameraDeviceArray is null.');
  } else {
    createPhotoOutput();
    await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
    try {
      mPhotoSession.setExposureMode(exposureMode);
      let ExposureMode = mPhotoSession.getExposureMode();
      console.info(TAG, testName,'getExposureMode', ExposureMode);
      callback(ExposureMode,undefined)
      await releasePhotoSession();
    } catch(err) {
      console.info(TAG ,testName, err.message, err.code);
      callback(undefined,err.code)
      await releasePhotoSession();
    }
  }
}

async function videoSessionsetExposureMode(testName: string, exposureMode: camera.ExposureMode | undefined | null, callback: (res?: number, errCode?: number) => void) {
  console.info(TAG, testName);
  if (isEmpty(mCameraDeviceArray)) {
    console.info(TAG, testName, ' mCameraDeviceArray is null.');
  } else {
    await createVideoOutput();
    await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
    try {
      mVideoSession.setExposureMode(exposureMode)
      let ExposureMode = mVideoSession.getExposureMode();
      console.info(TAG, testName,'getExposureMode', ExposureMode);
      callback(ExposureMode, undefined)
      await releaseVideoSession();
    } catch (err) {
      console.info(TAG ,testName, err.message, err.code);
      callback(undefined, err.code);
      await releaseVideoSession();
    }
  }
}

async function setFlashModePhoto(done: Function, testName: string, flashMode: camera.FlashMode | null | undefined, callback: (mode?: camera.FlashMode,errcode?: number) => void) {
  try {
    if (isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName, ' mCameraDeviceArray is null.');
    } else {
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      mPhotoSession.setFlashMode(flashMode as camera.FlashMode);
      console.info(TAG, testName, ' photo set flash mode, status: ', flashMode);
      let mode = mPhotoSession.getFlashMode();
      callback(mode, undefined);
      await releasePhotoSession();
    }
    done();
  } catch (error) {
    console.info(TAG ,testName, error.message, error.code);
    callback(undefined,error.code);
    await releasePhotoSession();
    done();
  }
}

async function setFlashModeVideo(done: Function, testName: string, flashMode: camera.FlashMode | null | undefined, callback: (mode?: camera.FlashMode,errcode?: number) => void) {
  try {
    if (isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName, ' mCameraDeviceArray is null.');
    } else {
      await createVideoOutput();
      await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
      mVideoSession.setFlashMode(flashMode as camera.FlashMode);
      console.info(TAG, testName, ' photo set flash mode, status: ', flashMode);
      let mode = mVideoSession.getFlashMode();
      callback(mode, undefined);
      await releaseVideoSession();
    }
    done();
  } catch (error) {
    console.info(TAG ,testName, error.message, error.code);
    callback(undefined,error.code);
    await releaseVideoSession();
    done();
  }
}

async function setColorSpacePHOTO(done: Function, testName: string, colorSpace: colorSpaceManager.ColorSpace,
  callback: (error: number) => void) {
  try {
    if (isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName, ' mCameraDeviceArray is null.');
    } else {
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      console.info(TAG, testName, 'setColorSpace Start');
      mPhotoSession.setColorSpace(colorSpace);
      console.info(TAG, testName, 'setColorSpace Success');
      await releasePhotoSession();
    }
    done();
  } catch (error) {
    console.info(TAG, testName, 'setColorSpace Failed', error.code, JSON.stringify(error));
    callback(error.code);
    await releasePhotoSession();
    done();
  }
}

export default function CameraSessionFlashSuppTest() {
  describe('CameraSessionFlashSuppTest', () => {
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
      await sleep(2000);
    });

    afterAll(async () => {
      console.info('afterAll case');
      await closeFd(fdNumber);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0100
     * @tc.desc   test camera session isExposureModeSupported PhotoSession maxLegal+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0100--------------");
      const testName = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0100';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          let maxEnum = getEnumMaxValue(camera.ExposureMode);
          let isExposureModeSupported = mPhotoSession.isExposureModeSupported(maxEnum + 1);
          console.info(TAG, "Success isExposureModeSupported ", isExposureModeSupported );
          expect(isExposureModeSupported).assertFalse()
          await releasePhotoSession();
        } catch(err) {
          console.info(TAG ,testName, err.message, err.code);
          expect().assertFail();
          await releasePhotoSession();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0200
     * @tc.desc   test camera session isExposureModeSupported VideoSession maxLegal+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0200--------------");
      const testName = 'SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0200';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        await createVideoOutput();
        await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
        try {
          let maxEnum = getEnumMaxValue(camera.ExposureMode);
          let isExposureModeSupported = mVideoSession.isExposureModeSupported(maxEnum + 1);
          console.info(TAG, testName, " Success isExposureModeSupported ", isExposureModeSupported);
          await releaseVideoSession();
          expect(isExposureModeSupported).assertFalse()
        } catch (err) {
          console.info(TAG ,testName, err.message, err.code);
          expect().assertFail();
          await releaseVideoSession();
        }
      }
      done()
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0300
     * @tc.desc   test camera session isExposureModeSupported PhotoOutput negative code -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0300', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0300--------------");
      const testName = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0300';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          let isExposureModeSupported = mPhotoSession.isExposureModeSupported(-1);
          console.info(TAG,testName,"  Success isExposureModeSupported ", isExposureModeSupported );
          expect(isExposureModeSupported).assertFalse()
          await releasePhotoSession();
        } catch(err) {
          console.info(TAG ,testName, err.message, err.code);
          expect().assertFail();
          await releasePhotoSession();
        }
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0400
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0400
     * @tc.desc   test camera session isExposureModeSupported VideoSession maxLegal -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0400', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0400--------------");
      const testName = 'SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0400';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        try {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
          let isExposureModeSupported = mVideoSession.isExposureModeSupported(-1);
          console.info(TAG, "Success isExposureModeSupported ", isExposureModeSupported);
          expect(isExposureModeSupported).assertFalse();
          await releaseVideoSession();
        } catch (err) {
          console.info(TAG, testName, err.message, err.code);
          expect().assertFail();
          await releaseVideoSession();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0500
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0500
     * @tc.desc   test camera session isExposureModeSupported PhotoSession negative code -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0500', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0500--------------");
      const testName = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0500';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          let isExposureModeSupported = mPhotoSession.isExposureModeSupported(-100);
          console.info(TAG ,testName,"  Success isExposureModeSupported ", isExposureModeSupported);
          expect(isExposureModeSupported).assertFalse()
          await releasePhotoSession();
        } catch(err) {
          console.info(TAG ,testName, err.message, err.code);
          expect().assertFail();
          await releasePhotoSession();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0600
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0600
     * @tc.desc   test camera session isExposureModeSupported VideoSession -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0600', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0600--------------");
      const testName = 'SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_ISEXPOSUREMODESUPPORTED_ERROR_0600';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
          let isExposureModeSupported = mVideoSession.isExposureModeSupported(-100);
          console.info(TAG,"  Success isExposureModeSupported ", isExposureModeSupported);
          expect(isExposureModeSupported).assertFalse()
          await releaseVideoSession();
        }
      } catch(err) {
        console.info(TAG ,testName, err.message, err.code);
        expect().assertFail();
        await releaseVideoSession();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_PHOTO_ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_PHOTO_ERRORCODE_0100
     * @tc.desc   capturesession setFlashModePhoto api errorcode -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_PHOTO_ERRORCODE_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_PHOTO_ERRORCODE_0100';
      setFlashModePhoto(done,testName,-1,(mode,errorCode) =>{
        if (mode) {
          expect(mode).assertEqual(-1);
        }
        if (errorCode) {
          expect(errorCode == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_VIDEO_ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_VIDEO_ERRORCODE_0100
     * @tc.desc   capturesession setFlashModeVideo api errorcode -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_VIDEO_ERRORCODE_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_VIDEO_ERRORCODE_0100';
      setFlashModeVideo(done,testName,-1, (mode,errorCode) => {
        if (mode) {
          expect(mode).assertEqual(-1);
        }
        if (errorCode) {
          expect(errorCode == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_PHOTO_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_PHOTO_ERRORCODE_0200
     * @tc.desc   capturesession setFlashModePhoto api errorcode 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_PHOTO_ERRORCODE_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_PHOTO_ERRORCODE_0200';
      setFlashModePhoto(done,testName,4, (mode,errorCode) => {
        if (mode) {
          expect(mode).assertEqual(4);
        }
        if (errorCode) {
          expect(errorCode == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_VIDEO_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_VIDEO_ERRORCODE_0200
     * @tc.desc   capturesession setFlashModeVideo api errorcode 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_VIDEO_ERRORCODE_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_VIDEO_ERRORCODE_0200';
      setFlashModeVideo(done,testName,4, (mode,errorCode) => {
        if (mode) {
          expect(mode).assertEqual(4);
        }
        if (errorCode) {
          expect(errorCode == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_ERRORCODE_PHOTO_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_ERRORCODE_PHOTO_0300
     * @tc.desc   capturesession setFlashModePhoto api errorcode -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_ERRORCODE_PHOTO_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_ERRORCODE_PHOTO_0300';
      setFlashModePhoto(done,testName,-100, (mode,errorCode) => {
        if (mode) {
          expect(mode).assertEqual(-100);
        }
        if (errorCode) {
          expect(errorCode == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_VIDEO_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_VIDEO_ERRORCODE_0300
     * @tc.desc   capturesession setFlashModeVideo api errorcode -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_VIDEO_ERRORCODE_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SETFLASHMODE_VIDEO_ERRORCODE_0300';
      setFlashModeVideo(done,testName,-100, (mode,errorCode) => {
        if (mode) {
          expect(mode).assertEqual(-100);
        }
        if (errorCode) {
          expect(errorCode == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        }
      })
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0100
     * @tc.desc   test PhotoSession setExposureMode maxLegal+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
      let maxEnum = getEnumMaxValue(camera.ExposureMode);
      photoSessionsetExposureMode('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0100', maxEnum + 1, (res?: number, errCode?: number) => {
        if (res != undefined) {
          expect().assertFail();
        }
        if (errCode != undefined) {
          expect(errCode == camera.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0100
     * @tc.desc   test VideoSession setExposureMode maxLegal+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
      let maxEnum = getEnumMaxValue(camera.ExposureMode);
      videoSessionsetExposureMode('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0100', maxEnum + 1, (res?: number, errCode?: number) => {
        if (res != undefined) {
          expect().assertFail();
        }
        if (errCode != undefined) {
          expect(errCode == camera.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0200
     * @tc.desc   test  PhotoSession setExposureMode -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0200', Level.LEVEL2, async (done: Function) => {
      photoSessionsetExposureMode('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0200', -1, (res?: number, errCode?: number) => {
        if (res != undefined) {
          expect().assertFail();
        }
        if (errCode != undefined) {
          expect(errCode == camera.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0200
     * @tc.desc   test VideoSession setExposureMode -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0200', Level.LEVEL2, async (done: Function) => {
      videoSessionsetExposureMode('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0200', -1, (res?: number, errCode?: number) => {
        if (res != undefined) {
          expect().assertFail();
        }
        if (errCode != undefined) {
          expect(errCode == camera.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        }
      })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0300
     * @tc.desc   test PhotoSession setExposureMode -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0300', Level.LEVEL2, async (done: Function) => {
      photoSessionsetExposureMode('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0300', -100, (res?: number, errCode?: number) => {
        if (res != undefined) {
          expect().assertFail();
        }
        if (errCode != undefined) {
          expect(errCode == camera.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        }
      })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0300
     * @tc.desc   test VideoSession setExposureMode -100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0300', Level.LEVEL2, async (done: Function) => {
      videoSessionsetExposureMode('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0200', -100, (res?: number, errCode?: number) => {
        if (res != undefined) {
          expect().assertFail();
        }
        if (errCode != undefined) {
          expect(errCode == camera.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0400
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0400
     * @tc.desc   test PhotoSession setExposureMode null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0400', Level.LEVEL2, async (done: Function) => {
      photoSessionsetExposureMode('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0400', null, (res?: number, errCode?: number) => {
        if (res != undefined) {
          expect(res == camera.ExposureMode.EXPOSURE_MODE_LOCKED).assertTrue();
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0400
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0400
     * @tc.desc   test VideoSession setExposureMode null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0400', Level.LEVEL2, async (done: Function) => {
      videoSessionsetExposureMode('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0400', null, (res?: number, errCode?: number) => {
        if (res != undefined) {
          expect(res == camera.ExposureMode.EXPOSURE_MODE_LOCKED).assertTrue()
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0500
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0500
     * @tc.desc   test PhotoSession setExposureMode undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0500', Level.LEVEL2, async (done: Function) => {
      photoSessionsetExposureMode('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETEXPOSUREMODE_ERRORCODE_0500', undefined, (res?: number, errCode?: number) => {
        if (res != undefined) {
          expect(res == camera.ExposureMode.EXPOSURE_MODE_LOCKED).assertTrue()
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0500
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0500
     * @tc.desc   test VideoSession setExposureMode undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0500', Level.LEVEL2, async (done: Function) => {
      videoSessionsetExposureMode('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETEXPOSUREMODE_ERRORCODE_0500', undefined, (res?: number, errCode?: number) => {
        if (res != undefined) {
          expect(res == camera.ExposureMode.EXPOSURE_MODE_LOCKED).assertTrue()
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_ERRORCODE_NULL_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_ERRORCODE_NULL_0100
     * @tc.desc   test camera  photoSession setMeteringPoint null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_ERRORCODE_NULL_0100', Level.LEVEL2, async (done: Function) => {
      const point = null;
      photoSessionSetMeteringPoint('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_ERRORCODE_NULL_0100',
        point, (res?: camera.Point, errCode?: number) => {
          if (res != undefined) {
            expect(res.x).assertEqual(0)
            expect(res.y).assertEqual(0)
          }
          if (errCode != undefined) {
            expect().assertFail();
          }
        })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_ERRORCODE_UNDEFINED_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_ERRORCODE_UNDEFINED_0100
     * @tc.desc   test camera  photoSession setMeteringPoint undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_ERRORCODE_UNDEFINED_0100', Level.LEVEL2, async (done: Function) => {
      const point = undefined;
      photoSessionSetMeteringPoint('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_ERRORCODE_UNDEFINED_0100',
        point, (res?: camera.Point, errCode?: number) => {
          if (res != undefined) {
            expect(res.x).assertEqual(0)
            expect(res.y).assertEqual(0)
          }
          if (errCode != undefined) {
            expect().assertFail();
          }
        })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_ERRORCODE_UNDEFINED_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_ERRORCODE_UNDEFINED_0100
     * @tc.desc   test camera VideoSession setMeteringPoint undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_ERRORCODE_UNDEFINED_0100', Level.LEVEL2, async (done: Function) => {
      const point = undefined;
      videoSessionSetMeteringPoint('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_ERRORCODE_UNDEFINED_0100',
        point, (res?: camera.Point, errCode?: number) => {
          if (res != undefined) {
            expect(res.x).assertEqual(0)
            expect(res.y).assertEqual(0)
          }
          if (errCode != undefined) {
            expect().assertFail();
          }
        })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_ERRORCODE_NULL_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_ERRORCODE_NULL_0100
     * @tc.desc   test camera VideoSession setMeteringPoint null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_ERRORCODE_NULL_0100', Level.LEVEL2, async (done: Function) => {
      const point = null;
      videoSessionSetMeteringPoint('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_ERRORCODE_NULL_0100',
        point, (res?: camera.Point, errCode?: number) => {
          if (res != undefined) {
            expect(res.x).assertEqual(0)
            expect(res.y).assertEqual(0)
          }
          if (errCode != undefined) {
            expect().assertFail();
          }
        })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0100
     * @tc.desc   test camera PhotoSession setMeteringPoint negative -1 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
      const point: camera.Point = { x: -1, y: 0 };
      photoSessionSetMeteringPoint('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0100',
        point, (res?: camera.Point, errCode?: number) => {
          if (res != undefined) {
            expect(res.x).assertEqual(0)
            expect(res.y).assertEqual(0)
          }
          if (errCode != undefined) {
            expect().assertFail();
          }
        })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0100
     * @tc.desc   test camera VideoSession setMeteringPoint negative -1 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
      const point: camera.Point = { x: -1, y: 0 };
      videoSessionSetMeteringPoint('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0100',
        point, (res?: camera.Point, errCode?: number) => {
          if (res != undefined) {
            expect(res.x).assertEqual(0)
            expect(res.y).assertEqual(0)
          }
          if (errCode != undefined) {
            expect().assertFail();
          }
        })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0200
     * @tc.desc   test camera PhotoSession setMeteringPoint negative 0 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0200', Level.LEVEL2, async (done: Function) => {
      const point: camera.Point = { x: 0, y: -1 };
      photoSessionSetMeteringPoint('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0200',
        point, (res?: camera.Point, errCode?: number) => {
          if (res != undefined) {
            expect(res.x).assertEqual(0)
            expect(res.y).assertEqual(0)
          }
          if (errCode != undefined) {
            expect().assertFail();
          }
        })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0200
     * @tc.desc   test camera VideoSession setMeteringPoint negative 0 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0200', Level.LEVEL2, async (done: Function) => {
      const point: camera.Point = { x: 0, y: -1 };
      videoSessionSetMeteringPoint('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0100',
        point, (res?: camera.Point, errCode?: number) => {
          if (res != undefined) {
            expect(res.x).assertEqual(0)
            expect(res.y).assertEqual(0)
          }
          if (errCode != undefined) {
            expect().assertFail();
          }
        })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0100
     * @tc.desc   test camera PhotoSession setMeteringPoint 1 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
      const point: camera.Point = {x:1, y:2};
      photoSessionSetMeteringPoint('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0100',point,(res?: camera.Point, errCode?: number) => {
        if (res != undefined) {
          expect(res.x).assertEqual(1)
          expect(res.y).assertEqual(1)
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0100
     * @tc.desc   test camera VideoSession setMeteringPoint 1 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
      const point: camera.Point = { x: 1, y: 2};
      videoSessionSetMeteringPoint('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_NEGATIVE_ERRORCODE_0100',
        point, (res?: camera.Point, errCode?: number) => {
          if (res != undefined) {
            expect(res.x).assertEqual(1)
            expect(res.y).assertEqual(1)
          }
          if (errCode != undefined) {
            expect().assertFail();
          }
        })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0200
     * @tc.desc   test camera PhotoSession setMeteringPoint 2 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0200', Level.LEVEL2, async (done: Function) => {
      const point: camera.Point = {x:2, y:0};
      photoSessionSetMeteringPoint('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0100',point,(res?: camera.Point, errCode?: number) => {
        if (res != undefined) {
          expect(res.x).assertEqual(1)
          expect(res.y).assertEqual(0)
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0200
     * @tc.desc   test camera VideoSession setMeteringPoint 2 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0200', Level.LEVEL2, async (done: Function) => {
      const point: camera.Point = { x: 2, y: 0};
      videoSessionSetMeteringPoint('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_SETMETERINGPOINT_MAXLEGAL_ERRORCODE_0200',
        point, (res?: camera.Point, errCode?: number) => {
          if (res != undefined) {
            expect(res.x).assertEqual(1)
            expect(res.y).assertEqual(0)
          }
          if (errCode != undefined) {
            expect().assertFail();
          }
        })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0100
     * @tc.desc   PhotoSession isFlashModeSupported api errorcode undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
      photoSessionIsFlashModeSupported('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0100',undefined,(res?: boolean, errCode?: number) => {
        if (res != undefined) {
          expect(res).assertTrue()
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0200
     * @tc.desc   VideoSession isFlashModeSupported api errorcode undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0200', Level.LEVEL2, async (done: Function) => {
      videoSessionIsFlashModeSupported('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0200',undefined,(res?: boolean, errCode?: number) => {
        if (res != undefined) {
          expect(res).assertTrue()
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0300
     * @tc.desc   PhotoSession isFlashModeSupported api errorcode null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0300', Level.LEVEL2, async (done: Function) => {
      photoSessionIsFlashModeSupported('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0300',null,(res?: boolean, errCode?: number) => {
        if (res != undefined) {
          expect(res).assertTrue()
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0400
     * @tc.desc   VideoSession isFlashModeSupported api errorcode null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0400', Level.LEVEL2, async (done: Function) => {
      videoSessionIsFlashModeSupported('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0400',null,(res?: boolean, errCode?: number) => {
        if (res != undefined) {
          expect(res).assertTrue()
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0500
     * @tc.desc   PhotoSession isFlashModeSupported api errorcode 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0500', Level.LEVEL2, async (done: Function) => {
      let maxEnum = getEnumMaxValue(camera.FlashMode);
      photoSessionIsFlashModeSupported('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0500',maxEnum + 1,(res?: boolean, errCode?: number) => {
        if (res != undefined) {
          expect(res).assertFalse()
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0600
     * @tc.desc   VideoSession isFlashModeSupported api errorcode 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0600', Level.LEVEL2, async (done: Function) => {
      let maxEnum = getEnumMaxValue(camera.FlashMode);
      videoSessionIsFlashModeSupported('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0600',maxEnum + 1,(res?: boolean, errCode?: number) => {
        if (res != undefined) {
          expect(res).assertFalse()
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0700
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0700
     * @tc.desc   PhotoSession isFlashModeSupported api errorcode -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0700', Level.LEVEL2, async (done: Function) => {
      photoSessionIsFlashModeSupported('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0700',-1,(res?: boolean, errCode?: number) => {
        if (res != undefined) {
          expect(res).assertFalse()
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0800
     * @tc.desc   PhotoSession isFlashModeSupported api errorcode -10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0800', Level.LEVEL2, async (done: Function) => {
      photoSessionIsFlashModeSupported('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0700',-10000,(res?: boolean, errCode?: number) => {
        if (res != undefined) {
          expect(res).assertFalse()
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0900
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0900
     * @tc.desc   VideoSession isFlashModeSupported api errorcode -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0900', Level.LEVEL2, async (done: Function) => {
      videoSessionIsFlashModeSupported('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0600',-1,(res?: boolean, errCode?: number) => {
        if (res != undefined) {
          expect(res).assertFalse()
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_01000
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_01000
     * @tc.desc   VideoSession isFlashModeSupported api errorcode -10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_01000', Level.LEVEL2, async (done: Function) => {
      videoSessionIsFlashModeSupported('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_ISFLASHMODESUPPORTED_ERRORCODE_0600',-10000,(res?: boolean, errCode?: number) => {
        if (res != undefined) {
          expect(res).assertFalse()
        }
        if (errCode != undefined) {
          expect().assertFail();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0100
     * @tc.desc   ColorManagement_setColorSpace 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0100', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0100';
        const space = 1000;
        await setColorSpacePHOTO(done, testName, space, (error) => {
          expect(error == 7400101).assertTrue();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0200
     * @tc.desc   ColorManagement_setColorSpace max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0200', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0200';
        let maxEnum = getEnumMaxValue(colorSpaceManager.ColorSpace) + 1;
        await setColorSpacePHOTO(done, testName, maxEnum, (error) => {
          expect(error == 7400101).assertTrue();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0300
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0300
     * @tc.desc   ColorManagement_setColorSpace -1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0300', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0300';
        const space = -1000;
        await setColorSpacePHOTO(done, testName, space, (error) => {
          expect(error == 7400101).assertTrue();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0400
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0400
     * @tc.desc   ColorManagement_setColorSpace -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0400', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_COLOR_MANAGEMENT_SET_COLORS_APACE_0400';
        const space = -1;
        await setColorSpacePHOTO(done, testName, space, (error) => {
          expect(error == 7400101).assertTrue();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0100
     * @tc.desc   PhotoSession_canPreconfig error 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0100', Level.LEVEL2, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0100';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          console.info(TAG, testName, "Start canPreconfig");
          let result = mPhotoSession.canPreconfig(1000);
          console.info(TAG, testName, "Success canPreconfig", result);
          expect(result).assertFalse();
        } catch (error) {
          console.error(TAG, testName, 'Failed canPreconfig', JSON.stringify(error), error.code);
          expect().assertFail();
        }
        await releasePhotoSession();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0200
     * @tc.desc   PhotoSession_canPreconfig error max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0200', Level.LEVEL2, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0200';
      let maxEnum = getEnumMaxValue(camera.PreconfigType) + 1;
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          console.info(TAG, testName, "Start canPreconfig");
          let result = mPhotoSession.canPreconfig(maxEnum);
          console.info(TAG, testName, "Success canPreconfig", result);
          expect(result).assertFalse();
        } catch (error) {
          console.error(TAG, testName, 'Failed canPreconfig', JSON.stringify(error), error.code);
          expect().assertFail();
        }
        await releasePhotoSession();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0300
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0300
     * @tc.desc   PhotoSession_canPreconfig error -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0300', Level.LEVEL2, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0300';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          console.info(TAG, testName, "Start canPreconfig");
          let result = mPhotoSession.canPreconfig(-1);
          console.info(TAG, testName, "Success canPreconfig", result);
          expect(result).assertFalse();
        } catch (error) {
          console.error(TAG, testName, 'Failed canPreconfig', JSON.stringify(error), error.code);
          expect().assertFail();
        }
        await releasePhotoSession();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0400
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0400
     * @tc.desc   PhotoSession_canPreconfig error -1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0400', Level.LEVEL2, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_CAN_PRECONFIG_0400';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          console.info(TAG, testName, "Start canPreconfig");
          let result = mPhotoSession.canPreconfig(-1000);
          console.info(TAG, testName, "Success canPreconfig", result);
          expect(result).assertFalse();
        } catch (error) {
          console.error(TAG, testName, 'Failed canPreconfig', JSON.stringify(error), error.code);
          expect().assertFail();
        }
        await releasePhotoSession();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0100
     * @tc.desc   PhotoSession_Preconfig error max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0100', Level.LEVEL2, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0100';
      let maxEnum = getEnumMaxValue(camera.PreconfigType) + 1;
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          console.info(TAG, testName, "Start preconfig");
          let result = mPhotoSession.preconfig(maxEnum);
          console.info(TAG, testName, "Success preconfig", result);
          expect().assertFail();
        } catch (error) {
          console.error(TAG, testName, 'Failed preconfig', JSON.stringify(error), error.code);
          expect(error.code).assertEqual('7400201');
        }
        await releasePhotoSession();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0200
     * @tc.desc   PhotoSession_Preconfig error 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0200', Level.LEVEL2, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0200';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          console.info(TAG, testName, "Start preconfig");
          let result = mPhotoSession.preconfig(1000);
          console.info(TAG, testName, "Success preconfig", result);
          expect().assertFail();
        } catch (error) {
          console.error(TAG, testName, 'Failed preconfig', JSON.stringify(error), error.code);
          expect(error.code).assertEqual('7400201');
        }
        await releasePhotoSession();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0300
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0300
     * @tc.desc   PhotoSession_Preconfig error -1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0300', Level.LEVEL2, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0300';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          console.info(TAG, testName, "Start preconfig");
          let result = mPhotoSession.preconfig(-1000);
          console.info(TAG, testName, "Success preconfig", result);
          expect().assertFail();
        } catch (error) {
          console.error(TAG, testName, 'Failed preconfig', JSON.stringify(error), error.code);
          expect(error.code).assertEqual('7400201');
        }
        await releasePhotoSession();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0400
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0400
     * @tc.desc   PhotoSession_Preconfig error -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0400', Level.LEVEL2, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0400';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          console.info(TAG, testName, "Start preconfig");
          let result = mPhotoSession.preconfig(-1);
          console.info(TAG, testName, "Success preconfig", result);
          expect().assertFail();
        } catch (error) {
          console.error(TAG, testName, 'Failed preconfig', JSON.stringify(error), error.code);
          expect(error.code).assertEqual('7400201');
        }
        await releasePhotoSession();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0500
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0500
     * @tc.desc   PhotoSession_Preconfig error 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0500', Level.LEVEL2, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0500';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          console.info(TAG, testName, "Start preconfig");
          let result = mPhotoSession.preconfig(0, 1000);
          console.info(TAG, testName, "Success preconfig", result);
          expect().assertFail();
        } catch (error) {
          console.error(TAG, testName, 'Failed preconfig', JSON.stringify(error), error.code);
          expect(error.code).assertEqual('7400201');
        }
        await releasePhotoSession();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0600
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0600
     * @tc.desc   PhotoSession_Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0600', Level.LEVEL2, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0600';
      let maxEnum = getEnumMaxValue(camera.PreconfigRatio) + 1;
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          console.info(TAG, testName, "Start preconfig");
          let result = mPhotoSession.preconfig(0, maxEnum);
          console.info(TAG, testName, "Success preconfig", result);
          expect().assertFail();
        } catch (error) {
          console.error(TAG, testName, 'Failed preconfig', JSON.stringify(error), error.code);
          expect(error.code).assertEqual('7400201');
        }
        await releasePhotoSession();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0800
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0800
     * @tc.desc   PhotoSession_Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0800', Level.LEVEL2, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PHOTO_SESSION_PRECONFIG_0800';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          console.info(TAG, testName, "Start preconfig");
          let result = mPhotoSession.preconfig(0, -1000);
          console.info(TAG, testName, "Success preconfig", result);
          expect().assertFail();
        } catch (error) {
          console.error(TAG, testName, 'Failed preconfig', JSON.stringify(error), error.code);
          expect(error.code).assertEqual('7400201');
        }
        await releasePhotoSession();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_SET_FRAMERATE_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_SET_FRAMERATE_0100
     * @tc.desc   test mPreviewOutput setFrameRate min > max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_SET_FRAMERATE_0100', Level.LEVEL2, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_SET_FRAMERATE_0100';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          console.info(TAG, testName, "Start setFrameRate", JSON.stringify(mPreviewOutput));
          let supportedFrameRatesArray: Array<camera.FrameRateRange> = mPreviewOutput.getSupportedFrameRates();
          if (supportedFrameRatesArray.length > 0) {
            console.info(TAG, testName, "supportedFrameRatesArray", JSON.stringify(supportedFrameRatesArray));
            let min: number = supportedFrameRatesArray[0]['min'];
            let max: number = supportedFrameRatesArray[0]['max'];
            if (min > 0 && max > 0) {
              mPreviewOutput.setFrameRate(min, max);
              let res = mPreviewOutput.getActiveFrameRate();
              expect(res.min).assertEqual(min);
              expect(res.max).assertEqual(max);
              console.info(TAG, testName, "Success getActiveFrameRate Min:",res.min , 'Max:',res.max);
              mPreviewOutput.setFrameRate(max, min);
              res = mPreviewOutput.getActiveFrameRate();
              console.info(TAG, testName, "Success getActiveFrameRate Min:",res.min , 'Max:',res.max);
              expect(res.min).assertEqual(min);
              expect(res.max).assertEqual(max);
            }
          }
        } catch (error) {
          console.error(TAG, testName, 'Failed setFrameRate', JSON.stringify(error), error.code);
          expect().assertFail();
        }
        await releasePhotoSession();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_GET_ACTIVE_FRAMERATE_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_GET_ACTIVE_FRAMERATE_0100
     * @tc.desc   PreviewOutput_getActiveFrameRate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_GET_ACTIVE_FRAMERATE_0100', Level.LEVEL2, async (done: Function) => {
      const testName: string = 'SUB_MULTIMEDIA_CREATE_PREVIEW_OUTPUT_GET_ACTIVE_FRAMERATE_0100';
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        try {
          console.info(TAG, testName, "Start getActiveFrameRate");
          let result = mPreviewOutput.getActiveFrameRate();
          console.info(TAG, testName, "Success getActiveFrameRate", result);
          expect(result).not().assertUndefined();
        } catch (error) {
          console.error(TAG, testName, 'Failed getActiveFrameRate', JSON.stringify(error), error.code);
          expect().assertFail();
        }
        await releasePhotoSession();
      }
      done();
    })


  })
}