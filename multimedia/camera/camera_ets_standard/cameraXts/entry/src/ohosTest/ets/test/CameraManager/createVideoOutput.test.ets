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
import { camera } from '@kit.CameraKit';
import { common } from '@kit.AbilityKit';
import { cameraErrorCode, closeFd, getFd, isEmpty, resourceName, sceneMode } from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import { media } from '@kit.MediaKit';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "CameraXts.createVideoOutputTest";
const abnormalIndex = -1;
const abnormalSurfaceId = 'error_value';
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mVideoProfile: camera.VideoProfile;
let mCameraOutputCap: camera.CameraOutputCapability;
let mVideoSurfaceId: string;
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
}

let videoConfig: media.AVRecorderConfig = {
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: videoProfile,
  url: 'file://',
  location: { latitude: 30, longitude: 130 } as camera.Location,
  rotation: 0
}

function getCameraManager() {
  console.info(TAG, 'getCameraManager.');
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmpty(mCameraManager)) {
    return false;
  }
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
  mCameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], sceneMode.NORMAL_VIDEO);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCap));
  mVideoProfile = mCameraOutputCap.videoProfiles[0];
  expect(isEmpty(mVideoProfile)).assertFalse();
  videoProfile.videoFrameWidth = mVideoProfile.size.width;
  videoProfile.videoFrameHeight = mVideoProfile.size.height;
}

function createVideoOutput(done: Function, testName: string, surfaceId: string) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      for (let i = 0; i < mCameraDeviceArray.length; i++) {
        let sceneModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);
        if (sceneModes !== null && sceneModes.length > 0) {
          if (sceneModes.includes(sceneMode.NORMAL_VIDEO)) {
            let cameraOutputCapability =
              mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], sceneMode.NORMAL_VIDEO);
            expect(isEmpty(cameraOutputCapability)).assertFalse();
            console.info(TAG, testName + ' camera : ' + i + ', mode: ' + sceneMode.NORMAL_VIDEO + ', output cap: ' +
            JSON.stringify(cameraOutputCapability));
            let videoOutput = mCameraManager.createVideoOutput(cameraOutputCapability.videoProfiles[i], surfaceId);
            console.info(TAG, testName + ' videoOutput: ' + JSON.stringify(videoOutput));
            expect(isEmpty(videoOutput)).assertFalse();
          }
        }
      }
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  }
}

function createVideoOutputAbnormal(done: Function, testName: string, videoProfile: camera.VideoProfile,
  surfaceId: string | null | undefined) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      let videoOutput = mCameraManager.createVideoOutput(videoProfile, surfaceId);
      console.info(TAG, testName + ' videoOutput: ' + JSON.stringify(videoOutput));
      expect(isEmpty(videoOutput)).assertTrue();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    done();
  }
}

function createVideoOutputNoProfile(done: Function, testName: string, surfaceId: string) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      let videoOutput = mCameraManager.createVideoOutput(surfaceId);
      console.info(TAG, testName + ' videoOutput: ' + JSON.stringify(videoOutput));
      expect(isEmpty(videoOutput)).assertFalse();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  }
}

function createVideoOutputNoProfileAbnormal(done: Function, testName: string, surfaceId: string | null | undefined) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      let videoOutput = mCameraManager.createVideoOutput(surfaceId);
      console.info(TAG, testName + ' videoOutput: ' + JSON.stringify(videoOutput));
      expect(isEmpty(videoOutput)).assertTrue();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    done();
  }
}

export default function createVideoOutputTest() {
  describe('createVideoOutputTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      getCameraManager();
      getSupportedCameraDeviceArray();
      getOutputCapability();
      await getVideoSurfaceId();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case.');
      mVideoSurfaceId = '';
      await closeFd(fdNumber);
    });

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_001
     * @tc.name      : createVideoOutput_with_profile_001
     * @tc.desc      : No abnormal scenarios
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createVideoOutput_with_profile_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createVideoOutput_with_profile_001';
      createVideoOutput(done, testName, indexSurfaceId);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_002
     * @tc.name      : createVideoOutput_with_profile_002
     * @tc.desc      : No abnormal scenarios-with media surfaceId
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createVideoOutput_with_profile_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createVideoOutput_with_profile_002';
      createVideoOutput(done, testName, mVideoSurfaceId);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_003
     * @tc.name      : createVideoOutput_with_profile_abnormal_001
     * @tc.desc      : surfaceId->undefined -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createVideoOutput_with_profile_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createVideoOutput_with_profile_abnormal_001';
      createVideoOutputAbnormal(done, testName, mVideoProfile, undefined);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_004
     * @tc.name      : createVideoOutput_with_profile_abnormal_002
     * @tc.desc      : surfaceId->null -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createVideoOutput_with_profile_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createVideoOutput_with_profile_abnormal_002';
      createVideoOutputAbnormal(done, testName, mVideoProfile, null);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_005
     * @tc.name      : createVideoOutput_with_profile_abnormal_003
     * @tc.desc      : abnormal surfaceId -> videoOutput->null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createVideoOutput_with_profile_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createVideoOutput_with_profile_abnormal_003';
      createVideoOutputAbnormal(done, testName, mVideoProfile, abnormalSurfaceId);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_006
     * @tc.name      : createVideoOutput_with_profile_abnormal_004
     * @tc.desc      : new previewProfile, with Index surfaceId -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createVideoOutput_with_profile_abnormal_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createVideoOutput_with_profile_abnormal_004';
      let newProfile: camera.VideoProfile = new Array<camera.VideoProfile>()[0];
      createVideoOutputAbnormal(done, testName, newProfile, indexSurfaceId);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_007
     * @tc.name      : createVideoOutput_with_profile_abnormal_005
     * @tc.desc      : new previewProfile, with media surfaceId -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createVideoOutput_with_profile_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createVideoOutput_with_profile_abnormal_005';
      let newProfile: camera.VideoProfile = new Array<camera.VideoProfile>()[0];
      createVideoOutputAbnormal(done, testName, newProfile, mVideoSurfaceId);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_008
     * @tc.name      : createVideoOutput_with_profile_abnormal_006
     * @tc.desc      : abnormal previewProfile, with Index surfaceId -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createVideoOutput_with_profile_abnormal_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createVideoOutput_with_profile_abnormal_006';
      createVideoOutputAbnormal(done, testName, mCameraOutputCap.videoProfiles[abnormalIndex], indexSurfaceId);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_009
     * @tc.name      : createVideoOutput_with_profile_abnormal_007
     * @tc.desc      : abnormal previewProfile, with media surfaceId -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createVideoOutput_with_profile_abnormal_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'createVideoOutput_with_profile_abnormal_007';
      createVideoOutputAbnormal(done, testName, mCameraOutputCap.videoProfiles[abnormalIndex], mVideoSurfaceId);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_010
     * @tc.name      : createVideoOutput_001
     * @tc.desc      : No abnormal scenarios-only Index surfaceId
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createVideoOutput_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createVideoOutput_001';
      createVideoOutputNoProfile(done, testName, indexSurfaceId);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_011
     * @tc.name      : createVideoOutput_002
     * @tc.desc      : No abnormal scenarios-only media surfaceId
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createVideoOutput_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createVideoOutput_002';
      createVideoOutputNoProfile(done, testName, mVideoSurfaceId);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_012
     * @tc.name      : createVideoOutput_abnormal_001
     * @tc.desc      : Only surfaceId->null -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createVideoOutput_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createVideoOutput_abnormal_001';
      createVideoOutputNoProfileAbnormal(done, testName, null);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_013
     * @tc.name      : createVideoOutput_abnormal_002
     * @tc.desc      : Only surfaceId->undefined -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createVideoOutput_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createVideoOutput_abnormal_002';
      createVideoOutputNoProfileAbnormal(done, testName, undefined);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_VIDEO_OUTPUT_014
     * @tc.name      : createVideoOutput_abnormal_003
     * @tc.desc      : Only abnormal surfaceId -> videoOutput->null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createVideoOutput_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createVideoOutput_abnormal_003';
      createVideoOutputNoProfileAbnormal(done, testName, abnormalSurfaceId);
    })
  })
}