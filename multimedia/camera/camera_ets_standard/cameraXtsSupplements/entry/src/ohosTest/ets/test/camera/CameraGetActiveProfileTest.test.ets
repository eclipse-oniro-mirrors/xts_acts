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
import { image, sendableImage } from '@kit.ImageKit';
import { camera } from '@kit.CameraKit';
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
import { colorSpaceManager } from '@kit.ArkGraphics2D';

const TAG = "CameraXtsGetActiveProfileSuppTest";
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mReceiverSurfaceId: string;
let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let mVideoOutput: camera.VideoOutput;
let mVideoSurfaceId: string;
let mPhotoSession: camera.PhotoSession;
let mVideoSession: camera.VideoSession;
let mAVRecorder: media.AVRecorder;
let receiver : image.ImageReceiver;
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

export default function CameraGetActiveProfileTest() {
  describe('CameraGetActiveProfileTest', () => {
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
      await closeFd(fdNumber);
    });

    /**
     * @tc.name   CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_001
     * @tc.number CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_001
     * @tc.desc   capture settings quality QUALITY_LEVEL_MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_001';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
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
          mPhotoOutput.capture(settings, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to capture the photo, error code: ${err.code}.`);
              expect().assertFail();
            }
            console.info(TAG, testName,'Callback invoked to indicate the photo capture request success.');

          })
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_002
     * @tc.number CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_002
     * @tc.desc   capture settings rotation ROTATION_90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_002';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
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
          mPhotoOutput.capture(settings, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to capture the photo, error code: ${err.code}.`);
              expect().assertFail();
            }
            console.info(TAG, testName,'Callback invoked to indicate the photo capture request success.');
          })
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_003
     * @tc.number CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_003
     * @tc.desc   capture settings rotation ROTATION_180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_003';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
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
          mPhotoOutput.capture(settings, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to capture the photo, error code: ${err.code}.`);
              expect().assertFail();
            }
            console.info(TAG, testName,'Callback invoked to indicate the photo capture request success.');
          })
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_004
     * @tc.number CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_004
     * @tc.desc   capture settings rotation ROTATION_270
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_004';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
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
          mPhotoOutput.capture(settings, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to capture the photo, error code: ${err.code}.`);
              expect().assertFail();
            }
            console.info(TAG, testName,'Callback invoked to indicate the photo capture request success.');
          })
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_005
     * @tc.number CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_005
     * @tc.desc   capture settings mirror true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_005';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          let isSupported: boolean = mPhotoOutput.isMirrorSupported();
          if(isSupported) {
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
            mPhotoOutput.capture(settings, (err: BusinessError) => {
              if (err) {
                console.error(TAG, testName, `Failed to capture the photo, error code: ${err.code}.`);
                expect().assertFail();
              }
              console.info(TAG, testName, 'Callback invoked to indicate the photo capture request success.');
            })
          }else{
            console.info(TAG, testName, '该设备不支持');
          }
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_006
     * @tc.number CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_006
     * @tc.desc   capture settings null Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_006';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          mPhotoOutput.capture(null, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to capture the photo, error code: ${err.code}.`);
              expect().assertFail();
            }
            expect().assertFail();
          })
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(Number(error.code)).assertEqual(7400101)
      }finally{
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_007
     * @tc.number CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_007
     * @tc.desc   capture settings undefined Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_007';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          mPhotoOutput.capture(undefined, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to capture the photo, error code: ${err.code}.`);
              expect().assertFail();
            }
            expect().assertFail();
          })
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(Number(error.code)).assertEqual(7400101);
      }finally{
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_008
     * @tc.number CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_008
     * @tc.desc   capture promise settings mirror true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_008';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          let isSupported: boolean = mPhotoOutput.isMirrorSupported();
          if(isSupported) {
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
            await mPhotoOutput.capture(settings);
            console.info(TAG, testName, ' capture is ok.');
          }else{
            console.info(TAG, testName, '该设备不支持');
          }
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_009
     * @tc.number CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_009
     * @tc.desc   capture promise settings rotation ROTATION_90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_009';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
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
          await mPhotoOutput.capture(settings);
          console.info(TAG, testName, ' capture is ok.');
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_010
     * @tc.number CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_010
     * @tc.desc   capture promise settings rotation ROTATION_180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_010';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
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
          await mPhotoOutput.capture(settings);
          console.info(TAG, testName, ' capture is ok.');
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_011
     * @tc.number CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_011
     * @tc.desc   capture promise settings rotation ROTATION_270
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_011';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
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
          await mPhotoOutput.capture(settings);
          console.info(TAG, testName, ' capture is ok.');
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_012
     * @tc.number CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_012
     * @tc.desc   capture promise settings null Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_012';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          await mPhotoOutput.capture(null);
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(Number(error.code)).assertEqual(7400101);
      }finally{
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_013
     * @tc.number CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_013
     * @tc.desc   capture promise settings undefined Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_CAPTURE_PHOTO_CAPTURE_SETTING_013';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          await mPhotoOutput.capture(undefined);
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(Number(error.code)).assertEqual(7400101);
      }finally{
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   CAMERA_GET_ACTIVE_PROFILE_001
     * @tc.number CAMERA_GET_ACTIVE_PROFILE_001
     * @tc.desc   getActiveProfile VideoProfile frameRateRange min
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_GET_ACTIVE_PROFILE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_GET_ACTIVE_PROFILE_001';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
          let VideoProfile = mVideoOutput.getActiveProfile();
          console.info(TAG, testName, ' getActiveFrameRate is .', VideoProfile.frameRateRange.min,
            VideoProfile.frameRateRange.max);
          expect(VideoProfile.frameRateRange.min != undefined).assertTrue();
        }} catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_GET_ACTIVE_PROFILE_002
     * @tc.number CAMERA_GET_ACTIVE_PROFILE_002
     * @tc.desc   getActiveProfile VideoProfile frameRateRange max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_GET_ACTIVE_PROFILE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_GET_ACTIVE_PROFILE_002';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
          let VideoProfile = mVideoOutput.getActiveProfile();
          console.info(TAG, testName, ' getActiveFrameRate is .', VideoProfile.frameRateRange.min,
            VideoProfile.frameRateRange.max);
          expect(VideoProfile.frameRateRange.max != undefined).assertTrue();
        }} catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_GET_ACTIVE_PROFILE_003
     * @tc.number CAMERA_GET_ACTIVE_PROFILE_003
     * @tc.desc   getActiveProfile VideoProfile format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_GET_ACTIVE_PROFILE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_GET_ACTIVE_PROFILE_003';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
          let VideoProfile = mVideoOutput.getActiveProfile();
          console.info(TAG, testName, ' VideoProfile.format is .', VideoProfile.format);
          expect(VideoProfile.format != undefined).assertTrue();
        }} catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_GET_ACTIVE_PROFILE_004
     * @tc.number CAMERA_GET_ACTIVE_PROFILE_004
     * @tc.desc   getActiveProfile VideoProfile size height
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_GET_ACTIVE_PROFILE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_GET_ACTIVE_PROFILE_004';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          console.info(TAG, testName, ' createVideoOutput is null.');
          await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
          console.info(TAG, testName, ' getCreateVideoSession is null.');
          let VideoProfile = mVideoOutput.getActiveProfile();
          console.info(TAG, testName, ' VideoProfile.size.height is .', VideoProfile.size.height);
          expect(VideoProfile.size.height != undefined).assertTrue();
        }} catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_GET_ACTIVE_PROFILE_005
     * @tc.number CAMERA_GET_ACTIVE_PROFILE_005
     * @tc.desc   getActiveProfile VideoProfile size width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_GET_ACTIVE_PROFILE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_GET_ACTIVE_PROFILE_005';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
          let VideoProfile = mVideoOutput.getActiveProfile();
          console.info(TAG, testName, ' VideoProfile.size.width is .',VideoProfile.size.width);
          expect(VideoProfile.size.width != undefined).assertTrue();
        }} catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_GET_VIDEO_ROTATION_001
     * @tc.number CAMERA_GET_VIDEO_ROTATION_001
     * @tc.desc   getVideoRotation null Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_GET_VIDEO_ROTATION_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_GET_VIDEO_ROTATION_001';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
          mVideoOutput.getVideoRotation(null);
        }} catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(Number(error.code)).assertEqual(7400101);
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_GET_VIDEO_ROTATION_002
     * @tc.number CAMERA_GET_VIDEO_ROTATION_002
     * @tc.desc   getVideoRotation undefined Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_GET_VIDEO_ROTATION_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_GET_VIDEO_ROTATION_002';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
          mVideoOutput.getVideoRotation(undefined);
        }} catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(Number(error.code)).assertEqual(7400101);
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_GET_VIDEO_ROTATION_003
     * @tc.number CAMERA_GET_VIDEO_ROTATION_003
     * @tc.desc   getVideoRotation videoRotation ROTATION_0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_GET_VIDEO_ROTATION_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_GET_VIDEO_ROTATION_003';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
          let videoRotation = mVideoOutput.getVideoRotation(camera.ImageRotation.ROTATION_0);
          console.info(TAG, testName, "videoRotation:", videoRotation);
          expect(videoRotation === camera.ImageRotation.ROTATION_0 ||
            videoRotation === camera.ImageRotation.ROTATION_90 ||
            videoRotation === camera.ImageRotation.ROTATION_180 || videoRotation === camera.ImageRotation.ROTATION_270)
            .assertTrue();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail()
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_GET_VIDEO_ROTATION_004
     * @tc.number CAMERA_GET_VIDEO_ROTATION_004
     * @tc.desc   getVideoRotation videoRotation ROTATION_90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_GET_VIDEO_ROTATION_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_GET_VIDEO_ROTATION_004';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
          let videoRotation = mVideoOutput.getVideoRotation(camera.ImageRotation.ROTATION_90);
          console.info(TAG, testName, "videoRotation:", videoRotation);
          expect(videoRotation === camera.ImageRotation.ROTATION_0 ||
            videoRotation === camera.ImageRotation.ROTATION_90 ||
            videoRotation === camera.ImageRotation.ROTATION_180 || videoRotation === camera.ImageRotation.ROTATION_270)
            .assertTrue();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail()
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_GET_VIDEO_ROTATION_005
     * @tc.number CAMERA_GET_VIDEO_ROTATION_005
     * @tc.desc   getVideoRotation videoRotation ROTATION_180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_GET_VIDEO_ROTATION_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_GET_VIDEO_ROTATION_005';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
          let videoRotation = mVideoOutput.getVideoRotation(camera.ImageRotation.ROTATION_180);
          console.info(TAG, testName, "videoRotation:", videoRotation);
          expect(videoRotation === camera.ImageRotation.ROTATION_0 ||
            videoRotation === camera.ImageRotation.ROTATION_90 ||
            videoRotation === camera.ImageRotation.ROTATION_180 || videoRotation === camera.ImageRotation.ROTATION_270)
            .assertTrue();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail()
      }finally{
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   CAMERA_GET_VIDEO_ROTATION_006
     * @tc.number CAMERA_GET_VIDEO_ROTATION_006
     * @tc.desc   getVideoRotation videoRotation ROTATION_270
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_GET_VIDEO_ROTATION_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_GET_VIDEO_ROTATION_006';
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        }else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
          let videoRotation = mVideoOutput.getVideoRotation(camera.ImageRotation.ROTATION_270);
          console.info(TAG, testName, "videoRotation:", videoRotation);
          expect(videoRotation === camera.ImageRotation.ROTATION_0 ||
            videoRotation === camera.ImageRotation.ROTATION_90 ||
            videoRotation === camera.ImageRotation.ROTATION_180 || videoRotation === camera.ImageRotation.ROTATION_270)
            .assertTrue();
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail()
      }finally{
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_00001
     * @tc.number SUB_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_00001
     * @tc.desc   createVideoOutput profile Parameter missing null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_00001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_00001';
      try {
        if(mCameraDeviceArray.length > 0) {
          let profile: camera.VideoProfile = {
            frameRateRange: { min: 0, max: 100 },
            format: camera.CameraFormat.CAMERA_FORMAT_RGBA_8888,
            size: { height: 10, width: 0 }
          }
          await getVideoSurfaceId();
          console.info(TAG, 'profile')
          await mCameraManager.createVideoOutput(null, indexSurfaceId);
          console.info(TAG, "success createVideoOutput")
        }
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400101);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_00002
     * @tc.number SUB_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_00002
     * @tc.desc   createVideoOutput profile Parameter missing undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_00002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_00002';
      try {
        if(mCameraDeviceArray.length > 0) {
          let profile: camera.VideoProfile = {
            frameRateRange: { min: 0, max: 100 },
            format: camera.CameraFormat.CAMERA_FORMAT_RGBA_8888,
            size: { height: 10, width: 0 }
          }
          await getVideoSurfaceId();
          console.info(TAG, 'profile')
          await mCameraManager.createVideoOutput(undefined, indexSurfaceId);
          console.info(TAG, "success createVideoOutput")
        }
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400101);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_000001
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_000001
     * @tc.desc   getCameraDevices position CAMERA_POSITION_FOLD_INNER Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_000001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_000001';
      try {
        if(mCameraDeviceArray.length > 0) {
          let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
          console.info(TAG, testName, 'position');
          let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
          console.info(TAG, 'connectType')
          let types = camera.CameraType.CAMERA_TYPE_DEFAULT;
          console.info(TAG, testName, 'type');
          let device = mCameraManager.getCameraDevices(position, [types], connectType)
          console.info(TAG, testName, 'device');
          expect().assertFail()
        }
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_000002
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_000002
     * @tc.desc   getCameraDevices [] Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_000002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_000002';
      try {
        if(mCameraDeviceArray.length > 0) {
          let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
          console.info(TAG, testName, 'position');
          let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
          console.info(TAG, 'connectType')
          let types = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
          console.info(TAG, testName, 'type');
          let device = mCameraManager.getCameraDevices(position, [], connectType)
          console.info(TAG, testName, 'device');
          expect().assertFail()
        }
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00001
     * @tc.number SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00001
     * @tc.desc   createPhotoOutput format CAMERA_FORMAT_RGBA_8888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00001';
      try {
        if (mCameraDeviceArray.length > 0) {
          let cameraOutputCapability =
            mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_PHOTO);
          console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
          for (let i = 0; i < cameraOutputCapability.photoProfiles.length; i++) {
            if (camera.CameraFormat.CAMERA_FORMAT_RGBA_8888 == cameraOutputCapability.photoProfiles[i].format) {
              let size: image.Size = {
                height: 8192,
                width: 8
              }
              let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
              mReceiverSurfaceId = await receiver.getReceivingSurfaceId();
              let mPhotoOutput =
                mCameraManager.createPhotoOutput(cameraOutputCapability.photoProfiles[i], mReceiverSurfaceId);
              console.info(TAG, testName, "mPhotoOutput ok:", mPhotoOutput);
              expect(mPhotoOutput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00002
     * @tc.number SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00002
     * @tc.desc   createPhotoOutput format CAMERA_FORMAT_JPEG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00002';
      try {
        if (mCameraDeviceArray.length > 0) {
          let cameraOutputCapability =
            mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_PHOTO);
          console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
          for (let i = 0; i < cameraOutputCapability.photoProfiles.length; i++) {
            if (camera.CameraFormat.CAMERA_FORMAT_JPEG == cameraOutputCapability.photoProfiles[i].format) {
              let size: image.Size = {
                height: 8192,
                width: 8
              }
              let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
              mReceiverSurfaceId = await receiver.getReceivingSurfaceId();
              let mPhotoOutput =
                mCameraManager.createPhotoOutput(cameraOutputCapability.photoProfiles[i], mReceiverSurfaceId);
              console.info(TAG, testName, "mPhotoOutput ok:", mPhotoOutput);
              expect(mPhotoOutput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00003
     * @tc.number SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00003
     * @tc.desc   createPhotoOutput format CAMERA_FORMAT_YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00003';
      try {
        if (mCameraDeviceArray.length > 0) {
          let cameraOutputCapability =
            mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_PHOTO);
          console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
          for (let i = 0; i < cameraOutputCapability.photoProfiles.length; i++) {
            if (camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010 == cameraOutputCapability.photoProfiles[i].format) {
              let size: image.Size = {
                height: 8192,
                width: 8
              }
              let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
              mReceiverSurfaceId = await receiver.getReceivingSurfaceId();
              let mPhotoOutput =
                mCameraManager.createPhotoOutput(cameraOutputCapability.photoProfiles[i], mReceiverSurfaceId);
              console.info(TAG, testName, "mPhotoOutput ok:", mPhotoOutput);
              expect(mPhotoOutput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00004
     * @tc.number SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00004
     * @tc.desc   createPhotoOutput format CAMERA_FORMAT_YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_00004';
      try {
        if (mCameraDeviceArray.length > 0) {
          let cameraOutputCapability =
            mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_PHOTO);
          console.info(TAG, testName, "getSupportedOutputCapability ok:", cameraOutputCapability);
          for (let i = 0; i < cameraOutputCapability.photoProfiles.length; i++) {
            if (camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010 == cameraOutputCapability.photoProfiles[i].format) {
              let size: image.Size = {
                height: 8192,
                width: 8
              }
              let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
              mReceiverSurfaceId = await receiver.getReceivingSurfaceId();
              let mPhotoOutput =
                mCameraManager.createPhotoOutput(cameraOutputCapability.photoProfiles[i], mReceiverSurfaceId);
              console.info(TAG, testName, "mPhotoOutput ok:", mPhotoOutput);
              expect(mPhotoOutput != null).assertTrue();
              break;
            } else {
              console.info(TAG, testName, "该设备不支持:");
            }
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect().assertFail();
        done();
      }
    })
        /**
     * @tc.name   SUB_CAMERA_SET_EXPOSURE_MODE_00001
     * @tc.number SUB_CAMERA_SET_EXPOSURE_MODE_00001
     * @tc.desc   Camera ExposureMode isExposureModeSupported EXPOSURE_MODE_UNSPECIFIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
        it('SUB_CAMERA_SET_EXPOSURE_MODE_00001', Level.LEVEL2, async (done: Function) => {
          const testName = 'SUB_CAMERA_SET_EXPOSURE_MODE_00001';
          try {
            if(mCameraDeviceArray.length > 0) {
              createPhotoOutput();
              await getCreatePhotoSession(mPreviewOutput,mPhotoOutput);
              let isSupported = mPhotoSession.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_UNSPECIFIED)
              console.info(TAG, testName, 'isSupported',isSupported);
              expect(isSupported).not().assertUndefined();
            }
            await releasePhotoSession();
            done();
          } catch (error) {
            console.error(TAG, testName, error, error.code)
            expect().assertFail();
            await releasePhotoSession();
            done();
          }
        })
        /**
         * @tc.name   SUB_CAMERA_SET_EXPOSURE_MODE_00002
         * @tc.number SUB_CAMERA_SET_EXPOSURE_MODE_00002
         * @tc.desc   Camera ExposureMode setExposureMode EXPOSURE_MODE_UNSPECIFIED
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_CAMERA_SET_EXPOSURE_MODE_00002', Level.LEVEL2, async (done: Function) => {
          const testName = 'SUB_CAMERA_SET_EXPOSURE_MODE_00002';
          try {
            if(mCameraDeviceArray.length > 0) {
              createPhotoOutput();
              await getCreatePhotoSession(mPreviewOutput,mPhotoOutput);
              let isSupported = mPhotoSession.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_UNSPECIFIED)
              console.info(TAG, testName, 'isSupported',isSupported);
              if(isSupported) {
                mPhotoSession.setExposureMode(camera.ExposureMode.EXPOSURE_MODE_UNSPECIFIED);
                let resMode = mPhotoSession.getExposureMode()
                console.info(TAG, testName, 'resMode',resMode);
                expect(resMode).assertEqual(0);
              }else{
                console.info(TAG,testName,"该设备不支持");
              }
            }
            await releasePhotoSession();
            done();
          } catch (error) {
            console.error(TAG, testName, error, error.code)
            expect().assertFail();
            await releasePhotoSession();
            done();
          }
        })
  })
}