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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { camera } from '@kit.CameraKit';
import { driveFn, getFd, getPermission, isEmpty, resourceName, sleep } from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import { media } from '@kit.MediaKit';
 
const TAG = "CameraXts.ManualFocusQueryTest";
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
    mSupportedModes = mCameraManager.getSupportedSceneModes(device);
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
    mSupportedModes = mCameraManager.getSupportedSceneModes(device);
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
 
export default function ManualFocusQueryTest() {
  describe('ManualFocusQueryTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll begin.');
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      getCameraManager();
      getSupportedCameraDeviceArray();
      getCameraInput();
    });
 
    beforeEach(async () => {
      console.info(TAG, 'beforeEach case.');
    });
 
    afterEach(async () => {
      console.info(TAG, 'afterEach case.');
    });
 
    afterAll(async () => {
      console.info(TAG, 'afterAll case.');
    });
 
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_0100
     * @tc.desc   isFocusDistanceSupported return success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_0100';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          try {
            let isSupported: boolean = mPhotoSession.isFocusDistanceSupported();
            expect(isEmpty(isSupported)).assertFalse();
          } catch (error) {
            console.error(TAG, testName, 'isFocusDistanceSupported, failed', JSON.stringify(error), error.code,
              error);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      });
 
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_0200
     * @tc.desc   isFocusDistanceSupported return 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_IS_FOCUS_DISTANCE_SUPPORTED_0200';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
          try {
            mPhotoSession.isFocusDistanceSupported();
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, 'isFocusDistanceSupported, failed', JSON.stringify(error), error.code,
              error);
            expect(Number(error.code)).assertEqual(7400103);
          }
          await releasePhotoSession();
          done();
        }
      });
 
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_0100
     * @tc.desc   getFocusDistance return success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_0100';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          try {
            let isSupported: number = mPhotoSession.getFocusDistance();
            expect(isEmpty(isSupported)).assertFalse();
          } catch (error) {
            console.error(TAG, testName, 'getFocusDistance, failed', JSON.stringify(error), error.code,
              error);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      });
 
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_0200
     * @tc.desc   getFocusDistance return 7400103 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_FOCUS_DISTANCE_0200';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
          try {
            mPhotoSession.getFocusDistance();
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, 'getFocusDistance, failed', JSON.stringify(error), error.code,
              error);
            expect(Number(error.code)).assertEqual(7400103);
          }
          await releasePhotoSession();
          done();
        }
      });
 
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SET_FOCUS_DISTANCE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SET_FOCUS_DISTANCE_0100
     * @tc.desc   setFocusDistance the parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_DISTANCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SET_FOCUS_DISTANCE_0100';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          try {
            mPhotoSession.setFocusDistance(null);
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, 'setFocusDistance, failed', JSON.stringify(error), error.code,
              error);
            expect(Number(error.code)).assertEqual(7400102);
          }
          await releasePhotoSession();
          done();
        }
      });
 
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SET_FOCUS_DISTANCE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SET_FOCUS_DISTANCE_0200
     * @tc.desc   setFocusDistance the parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SET_FOCUS_DISTANCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SET_FOCUS_DISTANCE_0200';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          try {
            mPhotoSession.setFocusDistance(undefined);
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, 'setFocusDistance, failed', JSON.stringify(error), error.code,
              error);
            expect(Number(error.code)).assertEqual(7400102);
          }
          await releasePhotoSession();
          done();
        }
      });
 
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_0100
     * @tc.desc   getSupportedIsoRange return success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_0100';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          try {
            let isSupported: number[] = mPhotoSession.getSupportedIsoRange();
            expect(isEmpty(isSupported)).assertFalse();
          } catch (error) {
            console.error(TAG, testName, 'getSupportedIsoRange, failed', JSON.stringify(error), error.code,
              error);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      });
 
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_0200
     * @tc.desc   getSupportedIsoRange return 7400103 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_ISO_RANGE_0200';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
          try {
            mPhotoSession.getSupportedIsoRange();
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, 'getSupportedIsoRange, failed', JSON.stringify(error), error.code,
              error);
            expect(Number(error.code)).assertEqual(7400103);
          }
          await releasePhotoSession();
          done();
        }
      });
 
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_ISO_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_ISO_0100
     * @tc.desc   getIso return success test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_ISO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_ISO_0100';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          try {
            let isSupported: number = mPhotoSession.getIso();
            expect(isEmpty(isSupported)).assertFalse();
          } catch (error) {
            console.error(TAG, testName, 'getIso, failed', JSON.stringify(error), error.code,
              error);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      });
 
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_ISO_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_ISO_0200
     * @tc.desc   getIso return 7400103 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_ISO_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_ISO_0200';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
          try {
            mPhotoSession.getIso();
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, 'getIso, failed', JSON.stringify(error), error.code,
              error);
            expect(Number(error.code)).assertEqual(7400103);
          }
          await releasePhotoSession();
          done();
        }
      });
 
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SET_ISO_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SET_ISO_0100
     * @tc.desc   setIso the parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SET_ISO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SET_ISO_0100';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          try {
            mPhotoSession.setIso(null);
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, 'setIso, failed', JSON.stringify(error), error.code,
              error);
            expect(Number(error.code)).assertEqual(7400102);
          }
          await releasePhotoSession();
          done();
        }
      });
 
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SET_ISO_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SET_ISO_0200
     * @tc.desc   setIso the parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SET_ISO_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SET_ISO_0200';
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          done();
          return;
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          try {
            mPhotoSession.setIso(undefined);
            expect().assertFail();
          } catch (error) {
            console.error(TAG, testName, 'setIso, failed', JSON.stringify(error), error.code,
              error);
            expect(Number(error.code)).assertEqual(7400102);
          }
          await releasePhotoSession();
          done();
        }
      });
  });
}