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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Hypium } from '../../../../hypium';
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import {
  COMMON_WAIT_DURATION, getFd, getPermission, resourceName, sleep
} from '../Common.test';
import { BusinessError } from '@kit.BasicServicesKit';
import media from '@ohos.multimedia.media';
import { Context } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import Utils from '../Util.test';

const TAG = "CameraXtsPhotoOutputStaticTest";
let mCameraManager: camera.CameraManager | undefined;
let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
let mSupportedModes: Array<camera.SceneMode> | undefined;
let mCameraInput: camera.CameraInput | undefined;
let mFullCameraOutputCap: camera.CameraOutputCapability | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mPreviewProfile: camera.Profile | undefined;
let mPhotoOutput: camera.PhotoOutput | undefined;
let mVideoOutput: camera.VideoOutput | undefined;
let photoAsset: photoAccessHelper.PhotoAsset | undefined;
let mVideoSurfaceId: string | undefined;
let mPhotoSession: camera.PhotoSession | undefined;
let mVideoSession: camera.VideoSession | undefined;
let mAVRecorder: media.AVRecorder | undefined;
let mPhoto: camera.Photo | undefined;
let mCaptureStartInfo: camera.CaptureStartInfo | undefined;
let mFrameShutterInfo: camera.FrameShutterInfo | undefined;
let mFrameShutterEndInfo: camera.FrameShutterEndInfo | undefined;
let mCaptureEndInfo: camera.CaptureEndInfo | undefined;
let EstimatedCaptureDuratio: number | undefined;
let fdNumber: number | undefined;
let fdPath: string | undefined;
let mCameraOutputCap: camera.CameraOutputCapability | undefined;
let testContext:  Context;
let indexSurfaceId : string = "";
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
const InvalidParam = -1;
const captureLocation: camera.Location = {
  latitude: 0,
  longitude: 0,
  altitude: 0
};
const InvalidLocation: camera.Location = {
  latitude: InvalidParam,
  longitude: InvalidParam,
  altitude: InvalidParam
};
const NewCaptureLocation: camera.Location = {
  latitude: 99999,
  longitude: 99999,
  altitude: 99999
};
let videoConfig: media.AVRecorderConfig = {
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: CameraVideoProfile,
  url: 'file://',
};

let isEmptyCameraManager = (data: camera.CameraManager | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}
let isEmptyCameraDevice = (data: camera.CameraDevice[] | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}
let isEmptyCameraInput = (data: camera.CameraInput | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}
let isEmptyAVRecorder = (data: media.AVRecorder | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

function getOutputCapability(): void {
  console.info(TAG, 'getOutputCapability.');
  mCameraOutputCap = mCameraManager!.getSupportedOutputCapability(mCameraDeviceArray![0], mSupportedModes![0]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCap));
}

let getCameraManagerInstance = () => {
  console.info('Enter getCameraManagerInstance');
  testContext = Hypium.get("Context") as Context;
  indexSurfaceId = Hypium.get('SurfaceId') as string;
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmptyCameraManager(mCameraManager!)) {
    console.info(TAG + "getCameraManager FAILED");
    return false;
  }
  console.info(TAG + 'Exit getCameraManagerInstance');

  return true;
}


function getCameraInput(): boolean {
  console.info(TAG, 'getCameraInput.');
  if (mCameraDeviceArray!.length) {
    mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![0]);
    mCameraInput!.open();
    if (isEmptyCameraInput(mCameraInput!)) {
      return false;
    }
    return true;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return false;
}

function getSupportedCameraDeviceArray(): boolean {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager!.getSupportedCameras();
  if (isEmptyCameraDevice(mCameraDeviceArray!)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray!.length);
  return true;
}
let startCameraSession = async (idx: int): Promise<boolean> => {
  console.info(TAG + "Enter startCameraSession");

  getCameraInput();
  createPhotoOutput();

  await Utils.msSleep(1000);

  mPhotoSession!.beginConfig();

  if (mCameraInput != undefined) {
    console.info(TAG + "Start to addInput");
    mPhotoSession!.addInput(mCameraInput!);
  }

  if (mPreviewOutput != undefined) {
    console.info(TAG + "Start to addOutput mPreviewOutput");
    mPhotoSession!.addOutput(mPreviewOutput!);
  }

  if (mPhotoOutput != undefined) {
    console.info(TAG + "Start to addOutput mPhotoOutput");
    mPhotoSession!.addOutput(mPhotoOutput!);
  }

  await Utils.msSleep(300);

  await mPhotoSession!.commitConfig();
  console.info(TAG + "commitConfig end");
  await Utils.msSleep(50);

  await mPhotoSession!.start();

  await Utils.msSleep(100);
  console.info(TAG + "Exit startCameraSession");

  return true;
}

let stopCameraSession = async (): Promise<boolean> => {
  console.info(TAG + "Enter stopCameraSession");
  await mPhotoSession!.stop();
  await Utils.msSleep(100);
  mPhotoSession!.beginConfig();

  if (mCameraInput != undefined) {
    console.info(TAG + "Start to removeInput input");
    mPhotoSession!.removeInput(mCameraInput!);
  }

  if (mPreviewOutput != undefined) {
    console.info(TAG + "Start to removeOutput mPreviewOutput");
    mPhotoSession!.removeOutput(mPreviewOutput!);
  }

  if (mPhotoOutput != undefined) {
    console.info(TAG + "Start to removeOutput mPhotoOutput");
    mPhotoSession!.removeOutput(mPhotoOutput!);
  }
  await releasePhotoSession();

  console.info(TAG + "Exit stopCameraSession");

  return true;
}


async function getVideoSurfaceId() {
  console.info(TAG, 'getVideoSurfaceId begin.');
  let fileName: string = resourceName();
  fdNumber = await getFd(fileName);
  fdPath = "fd://" + fdNumber;
  console.info(TAG, 'case fdPath is: ' + fdPath);
  videoConfig.url = fdPath!;
  console.info(TAG, 'get videoConfig url.');
  mAVRecorder = await media.createAVRecorder();
  expect(isEmptyAVRecorder(mAVRecorder)).assertFalse();
  console.info(TAG, 'createAVRecorder passed. state: ' + mAVRecorder!.state);
  mAVRecorder!.prepare(videoConfig).then(() => {
    console.info('prepare success');
  })
  console.info(TAG, 'AVRecorder state: ' + mAVRecorder!.state);
  mVideoSurfaceId = await mAVRecorder!.getInputSurface();
  console.info(TAG, 'mVideoSurfaceId: ' + mVideoSurfaceId);
}

function createPhotoOutput() {
  let useDevice: camera.CameraDevice = mCameraDeviceArray![0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray!) {
    mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
    if (mSupportedModes!.includes(camera.SceneMode.NORMAL_PHOTO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let photoProfile = cameraOutputCap.photoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles!) {
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
  mPreviewOutput = mCameraManager!.createPreviewOutput(previewProfile, indexSurfaceId!);
  mPhotoOutput = mCameraManager!.createPhotoOutput(photoProfile);
}

async function createVideoOutput() {
  await getVideoSurfaceId();
  let useDevice: camera.CameraDevice = mCameraDeviceArray![0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray!) {
    mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
    if (mSupportedModes!.includes(camera.SceneMode.NORMAL_VIDEO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let videoProfile = cameraOutputCap.videoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles!) {
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
  mPreviewOutput = mCameraManager!.createPreviewOutput(previewProfile, indexSurfaceId!);
  console.log(TAG, 'createVideoOutput' + videoProfile, 'surfaceID', mVideoSurfaceId);
  mVideoOutput = mCameraManager!.createVideoOutput(videoProfile, mVideoSurfaceId!);
  console.log(TAG, 'create preview output' + mPreviewOutput, 'createVideoOutput', mVideoOutput);
}

async function getCreatePhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
  mPhotoSession!.beginConfig();
  mPhotoSession!.addInput(mCameraInput!);
  await mCameraInput!.open();
  mPhotoSession!.addOutput(previewOutput);
  mPhotoSession!.addOutput(photoOutput);
  await mPhotoSession!.commitConfig();
  await mPhotoSession!.start();
}



async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput!.release();
  await mPhotoOutput!.release();
  await mPhotoSession!.release();
}


async function previewOutputSetFrameRate(done: () => void, testName: string,
  callback: (supportedFrameRatesArray: Array<camera.FrameRateRange>) => void) {
  console.info(TAG, testName);
  if (isEmptyCameraDevice(mCameraDeviceArray)) {
    console.info(TAG, testName + ' mCameraDeviceArray is null.');
    return;
  } else {
    createPhotoOutput();
    await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
    let supportedFrameRatesArray: Array<camera.FrameRateRange> = mPreviewOutput!.getSupportedFrameRates();
    console.info(TAG, testName, `The Device is supportedFrameRates: ${JSON.stringify(supportedFrameRatesArray)}`)
    if (supportedFrameRatesArray!.length > 0) {
      callback(supportedFrameRatesArray);
    } else {
      done();
    }
    await releasePhotoSession();
  }
}

async function captureWithSettingsCallback(done: () => void, testName: string,
  settings: camera.PhotoCaptureSetting | undefined | null) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting, (error) => {
        if (error !== undefined && error!.code !== 0) {
          console.error(TAG, testName + ' failed to capture, err: ' + error!.code + ', msg: ' + error!.message);
          expect().assertFail();
        } else {
          console.info(TAG, testName + ' capture passed.');
          expect(mPhotoOutput).assertTrue();
        }
      });
      console.info(TAG, testName + ' capture end.');
      await releasePhotoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
    await releasePhotoSession();
    done();
  }
}

function getFullOutputCapability(): void {
  console.info(TAG, 'getFullOutputCapability.');
  mFullCameraOutputCap = mCameraManager!.getSupportedFullOutputCapability(mCameraDeviceArray![0],
    camera.SceneMode.NORMAL_PHOTO);
  console.info(TAG, 'camera, full output cap: ' + JSON.stringify(mFullCameraOutputCap));
}

async function captureWithSettingsPromise(done: () => void, testName: string,
  settings: camera.PhotoCaptureSetting | undefined | null) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
      await mPhotoOutput!.capture(settings as camera.PhotoCaptureSetting).then(() => {
        console.info(TAG, testName + ' capture passed.');
        expect(mPhotoOutput).assertTrue();
      }).catch((error) => {
        console.error(TAG, testName + ' failed to capture, err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == camera.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
        done();
      });
      console.info(TAG, testName + ' capture end.');
      await releasePhotoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
    await releasePhotoSession();
    done();
  }
}

export default function PhotoOutputToStaticTest():void {
  describe('PhotoOutputToStaticTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      getCameraManagerInstance();
      getSupportedCameraDeviceArray();
      getCameraInput();
    });

    beforeEach(() => {
      console.info('afterEach case');
    });

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(500);
    });

    afterAll(async () => {
      console.info('afterAll case');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0100
     * @tc.desc   capture settings quality QUALITY_LEVEL_MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0100';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          console.info(TAG,testName,"start");
          let captureLocation: camera.Location = {
            latitude: 0,
            longitude: 0,
            altitude: 0
          }
          let settings: camera.PhotoCaptureSetting = {
            quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
            rotation: camera.ImageRotation.ROTATION_0,
            location: captureLocation,
            mirror: false
          }
          console.info(TAG,testName,"start222");
          mPhotoOutput!.capture(settings, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to capture the photo, error code: ${err.code}.`);
              expect().assertFail();
            }
            console.info(TAG, testName, 'Callback invoked to indicate the photo capture request success.');
            expect(err).assertFalse();
          })
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0200
     * @tc.desc   capture settings rotation ROTATION_90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0200';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let captureLocation: camera.Location = {
            latitude: 0,
            longitude: 0,
            altitude: 0
          }
          let settings: camera.PhotoCaptureSetting = {
            quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
            rotation: camera.ImageRotation.ROTATION_90,
            location: captureLocation,
            mirror: false
          }
          mPhotoOutput!.capture(settings, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to capture the photo, error code: ${err.code}.`);
              expect().assertFail();
            }
            console.info(TAG, testName, 'Callback invoked to indicate the photo capture request success.');
            expect(err).assertFalse();
          })
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0300
     * @tc.desc   capture settings rotation ROTATION_180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0300';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let captureLocation: camera.Location = {
            latitude: 0,
            longitude: 0,
            altitude: 0
          }
          let settings: camera.PhotoCaptureSetting = {
            quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
            rotation: camera.ImageRotation.ROTATION_180,
            location: captureLocation,
            mirror: false
          }
          mPhotoOutput!.capture(settings, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to capture the photo, error code: ${err.code}.`);
              expect().assertFail();
            }
            console.info(TAG, testName, 'Callback invoked to indicate the photo capture request success.');
            expect(err).assertFalse();
          })
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0400
     * @tc.desc   capture settings rotation ROTATION_270
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0400';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let captureLocation: camera.Location = {
            latitude: 0,
            longitude: 0,
            altitude: 0
          }
          let settings: camera.PhotoCaptureSetting = {
            quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
            rotation: camera.ImageRotation.ROTATION_270,
            location: captureLocation,
            mirror: false
          }
          mPhotoOutput!.capture(settings, (err) => {
            if (err) {
              console.error(TAG, testName, `Failed to capture the photo, error code: ${err.code}.`);
              expect().assertFail();
            }
            console.info(TAG, testName, 'Callback invoked to indicate the photo capture request success.');
            expect(err).assertFalse();
          })
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0500
     * @tc.desc   capture settings mirror true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0500';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          if (mPhotoOutput!.isMirrorSupported() && mPhotoOutput!.isMovingPhotoSupported()) {
            let captureLocation: camera.Location = {
              latitude: 0,
              longitude: 0,
              altitude: 0
            }
            let settings: camera.PhotoCaptureSetting = {
              quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
              rotation: camera.ImageRotation.ROTATION_0,
              location: captureLocation,
              mirror: true
            }
            console.info(TAG, testName, 'start');
            mPhotoOutput!.capture(settings, (err) => {
              if (err) {
                console.error(TAG, testName, `Failed to capture the photo, error code: ${err.code}.`);
                expect().assertFail();
              }
              console.info(TAG, testName, 'Callback invoked to indicate the photo capture request success.');
              expect(err).assertFalse();
            })
          } else {
            console.info(TAG, testName, '该设备不支持');
          }
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0600
     * @tc.desc   capture promise settings mirror true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0600';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          if (mPhotoOutput!.isMirrorSupported() && mPhotoOutput!.isMovingPhotoSupported()) {
            let captureLocation: camera.Location = {
              latitude: 0,
              longitude: 0,
              altitude: 0
            }
            let settings: camera.PhotoCaptureSetting = {
              quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
              rotation: camera.ImageRotation.ROTATION_0,
              location: captureLocation,
              mirror: true
            }
            await mPhotoOutput!.capture(settings);
            console.info(TAG, testName, ' capture is ok.');
            expect().assertTrue();
          } else {
            console.info(TAG, testName, '该设备不支持');
          }
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0700
     * @tc.desc   capture promise settings rotation ROTATION_90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0700';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let captureLocation: camera.Location = {
            latitude: 0,
            longitude: 0,
            altitude: 0
          }
          let settings: camera.PhotoCaptureSetting = {
            quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
            rotation: camera.ImageRotation.ROTATION_90,
            location: captureLocation,
            mirror: false
          }
          await mPhotoOutput!.capture(settings);
          console.info(TAG, testName, ' capture is ok.');
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0800
     * @tc.desc   capture promise settings rotation ROTATION_180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0800';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let captureLocation: camera.Location = {
            latitude: 0,
            longitude: 0,
            altitude: 0
          }
          let settings: camera.PhotoCaptureSetting = {
            quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
            rotation: camera.ImageRotation.ROTATION_180,
            location: captureLocation,
            mirror: false
          }
          await mPhotoOutput!.capture(settings);
          console.info(TAG, testName, ' capture is ok.');
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0900
     * @tc.desc   capture promise settings rotation ROTATION_270
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_0900';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let captureLocation: camera.Location = {
            latitude: 0,
            longitude: 0,
            altitude: 0
          }
          let settings: camera.PhotoCaptureSetting = {
            quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
            rotation: camera.ImageRotation.ROTATION_270,
            location: captureLocation,
            mirror: false
          }
          await mPhotoOutput!.capture(settings);
          console.info(TAG, testName, ' capture is ok.');
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_1000
     * @tc.desc   capture promise settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_STATIC_1000';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          let captureLocation: camera.Location = {
            latitude: 0,
            longitude: 0,
            altitude: 0
          }
          let settings: camera.PhotoCaptureSetting = {
            quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
            rotation: camera.ImageRotation.ROTATION_270,
            location: captureLocation,
            mirror: false
          }
          await mPhotoOutput!.capture(settings);
          console.info(TAG, testName, ' capture is ok.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(Number(error.code)).assertEqual(7400104);
      } finally {
        releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_STATIC_0100
     * @tc.desc   capture promise 7400104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_CAMERA_CAPTURE_PHOTO_CAPTURE_STATIC_0100';
      try {
        if (isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await mPhotoOutput!.capture();
          console.info(TAG, testName, ' capture is ok.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code).assertEqual(7400104);
      } finally {
        releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_getActiveProfile_static_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_getActiveProfile_static_0100
     * @tc.desc   createPreviewOutput profile format CAMERA_FORMAT_RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_getActiveProfile_static_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_getActiveProfile_static_0100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let newProfile = mPhotoOutput!.getActiveProfile();
            expect(newProfile.size.height > 0).assertTrue();
            expect(newProfile.size.width > 0).assertTrue();
            expect(newProfile.format != null).assertTrue();
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
        }
        await releasePhotoSession();
        done();
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_getPhotoRotation_static_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_getPhotoRotation_static_0100
     * @tc.desc   createPreviewOutput profile format CAMERA_FORMAT_RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_getPhotoRotation_static_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_getPhotoRotation_static_0100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let mImageRotation = mPhotoOutput!.getPhotoRotation();
            expect(mImageRotation != null).assertTrue();
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
        }
        await releasePhotoSession();
        done();
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_enableMovingPhoto_static_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_enableMovingPhoto_static_0100
     * @tc.desc   createPreviewOutput profile format CAMERA_FORMAT_RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_enableMovingPhoto_static_0100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_enableMovingPhoto_static_0100';
        try {
          console.info(TAG, testName, "start :");
          if (mCameraDeviceArray!.length > 0) {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let isSupported = mPhotoOutput!.isMovingPhotoSupported();
            if (isSupported) {
              mPhotoOutput!.enableMovingPhoto(false);
              console.info(TAG, testName, "success")
            } else {
              console.info(TAG, testName, "该设备不支持");
            }
          }
        } catch (error) {
          console.error(TAG, testName, "fail,errorCode :", error.code);
          expect().assertFail();
        }
        await releasePhotoSession();
        done();
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_offError_static_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_offError_static_0100
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTESTs
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_offError_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_offError_static_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let count = 0;
          mPhotoOutput!.onError((err: BusinessError) => {
            console.error(`Camera input error code: `,err);
            count = 1;
          })
          console.info(TAG, testName, "Entering start");
          if (mPhotoOutput!.isMirrorSupported() && mPhotoOutput!.isMovingPhotoSupported()) {
            mPhotoOutput!.offError();
            mPhotoOutput!.enableMirror(true);
            await Utils.msSleep(500);
            expect(count).assertEqual(0);
            console.info(TAG, testName, "Entering start PASSED");
          } else {
            console.info(TAG, testName, "当前设备不支持此功能");
            mPhotoOutput!.offError();
          }
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally {
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_on_Frame_Shutter_static_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_on_Frame_Shutter_static_0100
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_on_Frame_Shutter_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_on_Frame_Shutter_static_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput?.onFrameShutter((error, mFrameShutterInfo) => {
            if (error !== undefined && error!.code !== 0) {
              expect().assertFail();
            } else {
              console.info(TAG,
                testName + ' succeed to listen onFrameShutter on, photoAsset: ' +
                JSON.stringify(mFrameShutterInfo));
              expect(mFrameShutterInfo == null).assertFalse();
            }
          });
          await mPhotoOutput!.capture();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUToff_Frame_Shutter_static_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUToff_Frame_Shutter_static_0100
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTESTs
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUToff_Frame_Shutter_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUToff_Frame_Shutter_static_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput?.onFrameShutter((error, mFrameShutterInfo) => {
            if (error !== undefined && error!.code !== 0) {
              expect().assertFail();
            } else {
              console.info(TAG,
                testName + ' succeed to listen onFrameShutter on, photoAsset: ' +
                JSON.stringify(mFrameShutterInfo));
              expect(mFrameShutterInfo == null).assertFalse();
            }
          });
          mPhotoOutput?.offFrameShutter((error) => {
            if (error !== undefined && error!.code !== 0) {
              console.error(TAG,
                testName + ' failed to listen offFrameShutter off, err: ' + error!.code + ', msg: ' +
                error!.message);
              expect().assertFail();
              done();
            } else {
              console.info(TAG,
                testName + ' succeed to listen offFrameShutter off.');
              expect(mPhotoOutput).assertTrue();
              done();
            }
          });
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_on_EstimatedCaptureDuration_static_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_on_EstimatedCaptureDuration_static_0100
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_on_EstimatedCaptureDuration_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_on_EstimatedCaptureDuration_static_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput?.onEstimatedCaptureDuration((error, EstimatedCaptureDuratio) => {
            if (error !== undefined && error!.code !== 0) {
              expect().assertFail();
            } else {
              console.info(TAG,
                testName + ' succeed to listen onCaptureEnd on, : ' +
                JSON.stringify(EstimatedCaptureDuratio));
              mPhotoOutput?.offEstimatedCaptureDuration();
              expect(EstimatedCaptureDuratio == null).assertFalse();
            }
          });
          await mPhotoOutput!.capture();
          await Utils.msSleep(2000);
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_off_Capture_Ready_static_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_off_Capture_Ready_static_0100
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTESTs
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_off_Capture_Ready_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_off_Capture_Ready_static_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let count = 0;
          mPhotoOutput?.onCaptureReady((error) => {
            if (error !== undefined && error!.code !== 0) {
              expect().assertFail();
            } else {
              count = 1;
              console.info(TAG,
                testName + ' succeed to listen onCaptureReady on, photoAsset: ');
            }
          });
          mPhotoOutput?.offCaptureReady();
          mPhotoOutput?.capture();
          expect(count).assertEqual(0);
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_on_Capture_End_static_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_on_Capture_End_static_0100
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_on_Capture_End_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_on_Capture_End_static_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput?.onCaptureEnd((error, mCaptureEndInfo) => {
            if (error !== undefined && error!.code !== 0) {
              expect().assertFail();
            } else {
              console.info(TAG,
                testName + ' succeed to listen onCaptureEnd on, photoAsset: ' + JSON.stringify(mCaptureEndInfo));
              mPhotoOutput?.offCaptureEnd();
              expect(mCaptureEndInfo == null).assertFalse();
            }
          });
          await mPhotoOutput!.capture();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_on_Frame_Shutter_End_static_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_on_Frame_Shutter_End_static_0100
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_on_Frame_Shutter_End_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_on_Frame_Shutter_End_static_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput?.onFrameShutterEnd((error, mFrameShutterEndInfo) => {
            if (error !== undefined && error!.code !== 0) {
              expect().assertFail();
            } else {
              console.info(TAG,
                testName + ' succeed to listen onFrameShutterEnd on, photoAsset: ' +
                JSON.stringify(mFrameShutterEndInfo));
              mPhotoOutput?.offFrameShutterEnd();
              expect(mFrameShutterEndInfo == null).assertFalse();
            }
          });
          await mPhotoOutput!.capture();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_on_Capture_Start_With_Info_static_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_on_Capture_Start_With_Info_static_0100
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_on_Capture_Start_With_Info_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_on_Capture_Start_With_Info_static_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput?.onCaptureStartWithInfo((error, mCaptureStartInfo) => {
            if (error !== undefined && error!.code !== 0) {
              expect().assertFail();
            } else {
              console.info(TAG,
                testName + ' succeed to listen onCaptureStartWithInfo on, photoAsset: ' +
                JSON.stringify(mCaptureStartInfo));
              mPhotoOutput?.offCaptureStartWithInfo();
              expect(mCaptureStartInfo == null).assertFalse();
            }
          });
          await mPhotoOutput!.capture();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_on_photoAssetAvailable_listen_static_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_on_photoAssetAvailable_listen_static_0100
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_on_photoAssetAvailable_listen_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_on_photoAssetAvailable_listen_static_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput?.onPhotoAssetAvailable((error, photoAsset) => {
            if (error !== undefined && error!.code !== 0) {
              expect().assertFail();
            } else {
              console.info(TAG,
                testName + ' succeed to listen photoAssetAvailable on, photoAsset: ' + JSON.stringify(photoAsset));
              mPhotoOutput?.offPhotoAssetAvailable();
              expect(photoAsset == null).assertFalse();
            }
          });
          await mPhotoOutput!.capture();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_on_photoAvailable_listen_static_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_on_photoAvailable_listen_static_0100
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_on_photoAvailable_listen_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_on_photoAvailable_listen_static_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput?.onPhotoAvailable((error, mPhoto) => {
            if (error !== undefined && error!.code !== 0) {
              expect().assertFail();
            } else {
              console.info(TAG,
                testName + ' succeed to listen photoAssetAvailable on, photoAsset: ' + JSON.stringify(photoAsset));
              mPhotoOutput?.offPhotoAvailable();
              expect(photoAsset == null).assertFalse();
            }
          });
          await mPhotoOutput!.capture();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTOOUTPUT_ON_CAPTUREPHOTOAVAILABLE_LISTEN_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_PHOTOOUTPUT_ON_CAPTUREPHOTOAVAILABLE_LISTEN_STATIC_0100
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTOOUTPUT_ON_CAPTUREPHOTOAVAILABLE_LISTEN_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_PHOTOOUTPUT_ON_CAPTUREPHOTOAVAILABLE_LISTEN_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          mPhotoOutput!.onCapturePhotoAvailable((CapturePhoto: camera.CapturePhoto) => {
            if (!CapturePhoto || !CapturePhoto.main) {
              console.error(TAG, testName + ' received invalid CapturePhoto or missing main image');
              expect().assertFail();
              return;
            }
            let mainImage: image.Image | image.Picture = CapturePhoto.main;
            console.info(TAG, testName + ' succeed to listen photoAvailable on.');
            mPhotoOutput?.offCapturePhotoAvailable();
            expect(mainImage == null).assertFalse();
            CapturePhoto.release();
          });
          await mPhotoOutput!.capture();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })


  })
}