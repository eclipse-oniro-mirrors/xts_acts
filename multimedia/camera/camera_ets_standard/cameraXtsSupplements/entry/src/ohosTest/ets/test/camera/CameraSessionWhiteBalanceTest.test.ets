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

const TAG = "CameraXts.CameraSessionModeSuppTest";
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
  console.info(TAG, 'getSupportedCameraDeviceArray length: ', mCameraDeviceArray.length);
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


export default function CameraSessionSuppTest() {
  describe('CameraSessionSuppTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      getCameraManager();
      getSupportedCameraDeviceArray();
      getCameraInput();
      await getVideoSurfaceId();
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
     * @tc.name   CAMERA_SESSION_WHITE_BALANCE_GET_WHITE_BALANCE_0001
     * @tc.number CAMERA_SESSION_WHITE_BALANCE_GET_WHITE_BALANCE_0001
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_SESSION_WHITE_BALANCE_GET_WHITE_BALANCE_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_SESSION_WHITE_BALANCE_GET_WHITE_BALANCE_0001';
      try {
        await createVideoOutput();
        mVideoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_VIDEO);
        mVideoSession.beginConfig();
        let mode = mVideoSession.getWhiteBalanceMode();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code).assertEqual('7400103');
        done();
      }
    })

    /**
     * @tc.name   CAMERA_SESSION_WHITE_BALANCE_SET_WHITE_BALANCE_0001
     * @tc.number CAMERA_SESSION_WHITE_BALANCE_SET_WHITE_BALANCE_0001
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_SESSION_WHITE_BALANCE_SET_WHITE_BALANCE_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_SESSION_WHITE_BALANCE_SET_WHITE_BALANCE_0001';
      try {
        await createVideoOutput();
        mVideoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_VIDEO);
        mVideoSession.beginConfig();
        mVideoSession.setWhiteBalanceMode(0);
        let mode = mVideoSession.getWhiteBalanceMode();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code).assertEqual('7400103');
        done();
      }
    })

    /**
     * @tc.number    CAMERA_SESSION_IS_WHITE_BALANCE_MODE_SUPPROTED_VIDEO_SESSION_Abnormal_0100
     * @tc.name      CAMERA_SESSION_IS_WHITE_BALANCE_MODE_SUPPROTED_VIDEO_SESSION_Abnormal_0100
     * @tc.desc      white balance api
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('CAMERA_SESSION_IS_WHITE_BALANCE_MODE_SUPPROTED_VIDEO_SESSION_Abnormal_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_SESSION_IS_WHITE_BALANCE_MODE_SUPPROTED_VIDEO_SESSION_Abnormal_0100';
      try {
        await createVideoOutput();
        mVideoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_VIDEO);
        mVideoSession.beginConfig();
        let isWhiteBalanceModeSupported = mVideoSession.isWhiteBalanceModeSupported(0);
        console.info(TAG, testName, isWhiteBalanceModeSupported);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code).assertEqual('7400103');
        done();
      }
    })

    /**
     * @tc.number    CAMERA_SESSION_GET_WHITE_BALANCE_RANGE_0001
     * @tc.name      CAMERA_SESSION_GET_WHITE_BALANCE_RANGE_0001
     * @tc.desc      getWhiteBalanceRange-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('CAMERA_SESSION_GET_WHITE_BALANCE_RANGE_0001', Level.LEVEL0, async (done: Function) => {
      const testCase = 'liuyiliangCAMERA_SESSION_GET_WHITE_BALANCE_RANGE_0001';
      try {
        mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
        mPhotoSession.beginConfig();
        let range: Array<number> = [];
        range = mPhotoSession.getWhiteBalanceRange();
        console.info(`${testCase} succeed: White balance range = ${range}`);
        expect().assertFail();
        done();
      } catch (error) {
        const err = error as BusinessError;
        console.error(`${testCase} failed. error code: ${err.code}, message: ${err.message}`);
        expect(error.code).assertEqual('7400103');
        done();
      }
    });

    /**
     * @tc.number    CAMERA_PHOTO_OUTPUT_offCapturePhotoAvailable_001
     * @tc.name      CAMERA_PHOTO_OUTPUT_offCapturePhotoAvailable_001
     * @tc.desc      white balance api
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('CAMERA_PHOTO_OUTPUT_offCapturePhotoAvailable_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_PHOTO_OUTPUT_offCapturePhotoAvailable_001';
      try {
        createPhotoOutput();
        mPhotoOutput.offCapturePhotoAvailable((capturePhoto) => {
          capturePhoto.release();
        })
        console.info(TAG, testName + ' offCapturePhotoAvailable success ');
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }
      done();
    })    

  })
}