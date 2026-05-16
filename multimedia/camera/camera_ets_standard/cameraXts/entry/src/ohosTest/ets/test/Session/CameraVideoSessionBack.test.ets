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
import {
  cameraErrorCode,
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
  sleep
} from '../common';
import { media } from '@kit.MediaKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { indexSurfaceId } from '../../testability/pages/Index';

const TAG = "CameraXts.CameraVideoSessionBackTest";
const abnormalIndex = -1;
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mVideoSurfaceId: string;
let mCameraOutputCap: camera.CameraOutputCapability;
let mPreviewProfilesArray: Array<camera.Profile>;
let mPreviewProfile: camera.Profile | undefined;
let mPreviewOutput: camera.PreviewOutput;
let mVideoOutput: camera.VideoOutput;
let mVideoProfile: camera.VideoProfile;
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
  if (!checkBackCamera()) {
    console.info(TAG, 'The current device does not have a rear camera.');
    return;
  }
  mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[1]);
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
  mCameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[1], mSupportedModes[1]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCap));
  mPreviewProfilesArray = mCameraOutputCap.previewProfiles;
  mVideoProfile = mCameraOutputCap.videoProfiles[0];
  expect(isEmpty(mVideoProfile)).assertFalse();
  videoProfile.videoFrameWidth = mVideoProfile.size.width;
  videoProfile.videoFrameHeight = mVideoProfile.size.height;
}

function getPreviewProfile() {
  if (!checkBackCamera()) {
    console.info(TAG, 'The current device does not have a rear camera.');
    return;
  }
  mPreviewProfile = mPreviewProfilesArray.find((previewProfile: camera.Profile) => {
    return Math.abs((previewProfile.size.width / previewProfile.size.height) -
      (mVideoProfile.size.width / mVideoProfile.size.height)) < Number.EPSILON;
  });
}

function getVideoSession() {
  console.info(TAG, 'getVideoSession.');
  mVideoSession = mCameraManager.createSession(mSupportedModes[1]);
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

async function videoSessionCommitConfig(testName: string) {
  console.info(TAG, 'videoSessionCommitConfig.');
  await getVideoSurfaceId();
  mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, mVideoSurfaceId);
  mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
  mVideoSession.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mVideoSession.addInput(mCameraInput);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput.open();
  console.info(TAG, testName + ' camera open passed.');
  mVideoSession.addOutput(mPreviewOutput);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mVideoSession.addOutput(mVideoOutput);
  console.info(TAG, testName + ' addOutput videoOutput passed.');
  await mVideoSession.commitConfig();
  console.info(TAG, testName + ' session commitConfig successfully.');
}

async function beforeCommit(testName: string, previewOutput: camera.PreviewOutput, videoOutput: camera.VideoOutput) {
  console.info(TAG, 'beforeCommit.');
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
}

async function releaseVideoSession() {
  console.info(TAG, 'releaseVideoSession.');
  await mAVRecorder?.release();
  await mPreviewOutput?.release();
  await mVideoOutput?.release();
  await mVideoSession?.release();
}

async function onErrorListen(testName: string) {
  mVideoSession.on('error', (error) => {
    if (error !== undefined && error.code !== 0) {
      console.error(TAG, testName + ' on error listen, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
    } else {
      console.info(TAG, testName + ' session release passed.');
      expect(true).assertTrue();
    }
  });
}

async function commitPreconfigCallback(done: Function, testName: string, type: camera.PreconfigType,
  ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      expect(isEmpty(mVideoSession)).assertFalse();
      console.info(TAG, testName + ' session created successfully.');
      let result = mVideoSession.canPreconfig(type, ratio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        await mVideoSession.release();
        done();
        return;
      }
      mVideoSession.preconfig(type, ratio);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mVideoOutput = mCameraManager.createVideoOutput(mVideoSurfaceId);
      await beforeCommit(testName, mPreviewOutput, mVideoOutput);
      mVideoSession.commitConfig((error) => {
        if (error !== undefined && error.code !== 0) {
          console.error(TAG,
            testName + ' failed to commitConfig, err: ' + error.code + ', msg: ' + error.message);
          expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
          done();
        } else {
          console.info(TAG, testName + ' session commitConfig passed.');
          expect(true).assertTrue();
        }
      });
      await releaseVideoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    await mVideoSession.release();
    done();
  }
}

async function commitPreconfigCallbackAbnormal(done: Function, testName: string,
  type: camera.PreconfigType | undefined | null, ratio: camera.PreconfigRatio | undefined | null) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      expect(isEmpty(mVideoSession)).assertFalse();
      console.info(TAG, testName + ' session created successfully.');
      let result = mVideoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        await mVideoSession.release();
        done();
        return;
      }
      mVideoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mVideoOutput = mCameraManager.createVideoOutput(mVideoSurfaceId);
      await beforeCommit(testName, mPreviewOutput, mVideoOutput);
      mVideoSession.commitConfig((error) => {
        if (error !== undefined && error.code !== 0) {
          console.error(TAG,
            testName + ' failed to commitConfig, err: ' + error.code + ', msg: ' + error.message);
          expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
          done();
        } else {
          console.info(TAG, testName + ' session commitConfig passed.');
          expect(true).assertTrue();
        }
      });
      await releaseVideoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    await mVideoSession.release();
    done();
  }
}

async function commitPreconfigPromise(done: Function, testName: string, type: camera.PreconfigType,
  ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      expect(isEmpty(mVideoSession)).assertFalse();
      console.info(TAG, testName + ' session created successfully.');
      let result = mVideoSession.canPreconfig(type, ratio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        await mVideoSession.release();
        done();
        return;
      }
      mVideoSession.preconfig(type, ratio);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mVideoOutput = mCameraManager.createVideoOutput(mVideoSurfaceId);
      await beforeCommit(testName, mPreviewOutput, mVideoOutput);
      await mVideoSession.commitConfig().then(async () => {
        console.info(TAG, testName + ' session commitConfig successfully.');
        expect(true).assertTrue();
      }).catch((error: BusinessError) => {
        console.error(TAG,
          testName + ' failed to commit the config, err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        done();
      })
      await releaseVideoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    await mVideoSession.release();
    done();
  }
}

async function commitPreconfigPromiseAbnormal(done: Function, testName: string,
  type: camera.PreconfigType | undefined | null, ratio: camera.PreconfigRatio | undefined | null) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      expect(isEmpty(mVideoSession)).assertFalse();
      console.info(TAG, testName + ' session created successfully.');
      let result = mVideoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        await mVideoSession.release();
        done();
        return;
      }
      mVideoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mVideoOutput = mCameraManager.createVideoOutput(mVideoSurfaceId);
      await beforeCommit(testName, mPreviewOutput, mVideoOutput);
      await mVideoSession.commitConfig().then(async () => {
        console.info(TAG, testName + ' session commitConfig successfully.');
        expect(true).assertTrue();
      }).catch((error: BusinessError) => {
        console.error(TAG,
          testName + ' failed to commit the config, err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        done();
      })
      await releaseVideoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    await mVideoSession.release();
    done();
  }
}

async function addOutputPreview(done: Function, testName: string, type: camera.PreconfigType | undefined | null,
  ratio: camera.PreconfigRatio | undefined | null) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      expect(isEmpty(mVideoSession)).assertFalse();
      console.info(TAG, testName + ' session created successfully.');
      let result = mVideoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        await mVideoSession.release();
        done();
        return;
      }
      mVideoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mVideoSession.beginConfig();
      mVideoSession.addInput(mCameraInput);
      await mCameraInput.open();
      mVideoSession.addOutput(mPreviewOutput);
      console.info(TAG, testName + ' addOutput previewOutput passed.');
      mVideoSession.removeOutput(mPreviewOutput);
      console.info(TAG, testName + ' removeOutput previewOutput passed.');
      expect(true).assertTrue();
      await mVideoSession.release();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' removeOutput failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    await mVideoSession.release();
    done();
  }
}

export default function CameraVideoSessionBackTest() {
  describe('CameraVideoSessionBackTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
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
      console.info(TAG, 'beforeEach case.');
      getVideoSession();
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case.');
      await sleep(COMMON_WAIT_DURATION);
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case.');
      await closeFd(fdNumber);
    });

    /**
     * @tc.name   beginConfig_video_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_001
     * @tc.desc   No abnormal scenarios-beginConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('beginConfig_video_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'beginConfig_video_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mVideoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          await mVideoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   addInput_removeInput_video_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_002
     * @tc.desc   No abnormal scenarios-addInput/removeInput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addInput_removeInput_video_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'addInput_removeInput_video_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mVideoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          mVideoSession.addInput(mCameraInput);
          console.info(TAG, testName + ' addInput passed.');
          mVideoSession.removeInput(mCameraInput);
          console.info(TAG, testName + ' removeInput passed.');
          await mVideoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   addInput_video_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_003
     * @tc.desc   addInput() not between beginConfig and commitConfig -> error_code: 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('addInput_video_abnormal_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'addInput_video_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mVideoSession.addInput(mCameraInput);
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   addInput_video_abnormal_back_002
     * @tc.number CAMERA_VIDEO_SESSION_BACK_004
     * @tc.desc   addInput the same twice -> error_code: 7400201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('addInput_video_abnormal_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'addInput_video_abnormal_back_002';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mVideoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          mVideoSession.addInput(mCameraInput);
          console.info(TAG, testName + ' addInput passed.');
          let result = mVideoSession.canAddInput(mCameraInput);
          console.info(TAG, testName + ' result: ' + result);
          expect(result).assertFalse();
          mVideoSession.addInput(mCameraInput);
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   commitConfig_video_callback_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_005
     * @tc.desc   No abnormal scenarios-commitConfig-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('commitConfig_video_callback_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_video_callback_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' no same resolution preview.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            expect(isEmpty(mVideoSession)).assertFalse();
            console.info(TAG, testName + ' session created successfully.');
            await getVideoSurfaceId();
            mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            await beforeCommit(testName, mPreviewOutput, mVideoOutput);
            mVideoSession.commitConfig((error) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG,
                  testName + ' failed to commitConfig, err: ' + error.code + ', msg: ' + error.message);
                expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
                done();
              } else {
                console.info(TAG, testName + ' session commitConfig passed.');
                expect(true).assertTrue();
              }
            });
            await mVideoSession.release();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   commitConfig_video_promise_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_006
     * @tc.desc   No abnormal scenarios-commitConfig-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('commitConfig_video_promise_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_video_promise_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' no same resolution preview.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            expect(isEmpty(mVideoSession)).assertFalse();
            console.info(TAG, testName + ' session created successfully.');
            await getVideoSurfaceId();
            mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            await beforeCommit(testName, mPreviewOutput, mVideoOutput);
            await mVideoSession.commitConfig().then(async () => {
              console.info(TAG, testName + ' session commitConfig successfully.');
              expect(true).assertTrue();
            }).catch((error: BusinessError) => {
              console.error(TAG,
                testName + ' failed to commit the config, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
              done();
            });
            await mVideoSession.release();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_007
     * @tc.desc   No abnormal scenarios-addOutput/removeOutput->previewOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_video_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' no same resolution preview.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            expect(isEmpty(mVideoSession)).assertFalse();
            console.info(TAG, testName + ' session created successfully.');
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            mVideoSession.beginConfig();
            mVideoSession.addInput(mCameraInput);
            await mCameraInput.open();
            mVideoSession.addOutput(mPreviewOutput);
            console.info(TAG, testName + ' addOutput previewOutput passed.');
            mVideoSession.removeOutput(mPreviewOutput);
            console.info(TAG, testName + ' removeOutput previewOutput passed.');
            expect(true).assertTrue();
            await mPreviewOutput.release();
            await mVideoSession.release();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_008
     * @tc.desc   Abnormal scenarios-addOutput/removeOutput->no addInput -> error_code: 7400201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_video_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' no same resolution preview.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            expect(isEmpty(mVideoSession)).assertFalse();
            console.info(TAG, testName + ' session created successfully.');
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            mVideoSession.beginConfig();
            mVideoSession.addOutput(mPreviewOutput);
            console.info(TAG, testName + ' addOutput previewOutput passed.');
            mVideoSession.removeOutput(mPreviewOutput);
            console.info(TAG, testName + ' removeOutput previewOutput passed.');
            expect(true).assertTrue();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        await mPreviewOutput.release();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   addOutput_video_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_009
     * @tc.desc   First commitConfig(), then addOutput() -> error_code: 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_video_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_video_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' no same resolution preview.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            await getVideoSurfaceId();
            mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, mVideoSurfaceId);
            mVideoSession.beginConfig();
            mVideoSession.addInput(mCameraInput);
            await mCameraInput.open();
            mVideoSession.addOutput(mPreviewOutput);
            mVideoSession.addOutput(mVideoOutput);
            await mVideoSession.commitConfig();
            mVideoSession.addOutput(mPreviewOutput);
            expect(true).assertTrue();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' addOutput failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.name   removeOutput_video_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_010
     * @tc.desc   First commitConfig(), then removeOutput() -> error_code: 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('removeOutput_video_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'removeOutput_video_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' no same resolution preview.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            mVideoSession.beginConfig();
            mVideoSession.addInput(mCameraInput);
            await mCameraInput.open();
            mVideoSession.addOutput(mPreviewOutput);
            await mVideoSession.commitConfig();
            mVideoSession.removeOutput(mPreviewOutput);
            console.info(TAG, testName + ' removeOutput previewOutput passed.');
            expect(true).assertTrue();
            await mVideoSession.release();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' removeOutput failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   start_video_callback_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_011
     * @tc.desc   No abnormal scenarios-start-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('start_video_callback_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'start_video_callback_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' no same resolution preview.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            expect(isEmpty(mVideoSession)).assertFalse();
            console.info(TAG, testName + ' session created successfully.');
            await videoSessionCommitConfig(testName);
            mVideoSession.start((error) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG, testName + ' failed to start, err: ' + error.code + ', msg: ' + error.message);
                expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                done();
              } else {
                console.info(TAG, testName + ' session start passed.');
                expect(true).assertTrue();
              }
            });
            await mVideoSession.stop();
            console.info(TAG, testName + ' session stop passed.');
            await mVideoSession.release();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   start_video_promise_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_012
     * @tc.desc   No abnormal scenarios-start-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('start_video_promise_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'start_video_promise_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' no same resolution preview.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            expect(isEmpty(mVideoSession)).assertFalse();
            console.info(TAG, testName + ' session created successfully.');
            await videoSessionCommitConfig(testName);
            await mVideoSession.start().then(() => {
              console.info(TAG, testName + ' session start passed.');
              expect(true).assertTrue();
            }).catch((error: BusinessError) => {
              console.error(TAG, testName + ' failed to start, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
              done();
            })
            await mVideoSession.stop();
            console.info(TAG, testName + ' session stop passed.');
            await mVideoSession.release();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   start_video_callback_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_013
     * @tc.desc   First start(), then beginConfig()-callback -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('start_video_callback_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'start_video_callback_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mVideoSession.start(async (error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to start, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
              await mVideoSession.release();
              done();
            } else {
              console.info(TAG, testName + ' session start passed.');
              expect(true).assertTrue();
            }
          });
          mVideoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          expect(true).assertTrue();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        await mVideoSession.release();
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   start_video_promise_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_014
     * @tc.desc   First start(), then beginConfig()-promise -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('start_video_promise_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'start_video_promise_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          await mVideoSession.start();
          mVideoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          expect(true).assertTrue();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   stop_video_callback_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_015
     * @tc.desc   No abnormal scenarios-stop-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stop_video_callback_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'stop_video_callback_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' no same resolution preview.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            expect(isEmpty(mVideoSession)).assertFalse();
            console.info(TAG, testName + ' session created successfully.');
            await videoSessionCommitConfig(testName);
            await mVideoSession.start();
            console.info(TAG, testName + ' session start successfully.');
            mVideoSession.stop((error) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG, testName + ' failed to stop, err: ' + error.code + ', msg: ' + error.message);
                expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                done();
              } else {
                console.info(TAG, testName + ' session stop passed.');
                expect(true).assertTrue();
              }
            });
            await mVideoSession.release();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   stop_video_promise_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_016
     * @tc.desc   No abnormal scenarios-stop-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stop_video_promise_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'stop_video_promise_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' no same resolution preview.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            expect(isEmpty(mVideoSession)).assertFalse();
            console.info(TAG, testName + ' session created successfully.');
            await videoSessionCommitConfig(testName);
            await mVideoSession.start();
            await mVideoSession.stop().then(() => {
              console.info(TAG, testName + ' session start passed.');
              expect(true).assertTrue();
            }).catch((error: BusinessError) => {
              console.error(TAG, testName + ' failed to stop, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
              done();
            });
            await mVideoSession.release();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   stop_video_callback_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_017
     * @tc.desc   First stop(), then beginConfig()-callback -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stop_video_callback_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'stop_video_callback_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          await mVideoSession.start();
          console.info(TAG, testName + ' session start successfully.');
          mVideoSession.stop((error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to stop, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
              done();
            } else {
              console.info(TAG, testName + ' session stop passed.');
              expect(true).assertTrue();
            }
          });
          mVideoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          expect(true).assertTrue();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   stop_video_promise_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_018
     * @tc.desc   First start(), then beginConfig()-promise -> error_code: 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stop_video_promise_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'stop_video_promise_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          await mVideoSession.start();
          await mVideoSession.stop().then(() => {
            console.info(TAG, testName + ' session start passed.');
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            console.error(TAG,
              testName + ' failed to stop, err: ' + error.code + ', msg: ' + error.message);
            expect().assertFail();
            done();
          });
          mVideoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          expect(true).assertTrue();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   release_video_session_callback_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_019
     * @tc.desc   No abnormal scenarios-release-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_video_session_callback_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_video_session_callback_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mVideoSession.release((error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to commit the config, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            }
            console.info(TAG, testName + ' session release passed.');
            expect(true).assertTrue();
          })
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   release_video_session_promise_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_020
     * @tc.desc   No abnormal scenarios-release-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_video_session_promise_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_video_session_promise_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          await mVideoSession.release().then(() => {
            console.info(TAG, testName + ' session release passed.');
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName + 'release failed. err: ' + error.code + ', msg: ' + error.message);
            expect().assertFail();
            done();
          })
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   on_off_error_listen_video_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_021
     * @tc.desc   No abnormal scenarios-on/off('error')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_error_listen_video_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_error_listen_video_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          await onErrorListen(testName);
          mVideoSession.off('error');
          await mVideoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   on_off_error_listen_video_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_022
     * @tc.desc   on/off('error')-start(), beginConfig()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_error_listen_video_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_error_listen_video_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          await onErrorListen(testName);
          await mVideoSession.start();
          mVideoSession.beginConfig();
          mVideoSession.off('error');
          await mVideoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   beginConfig_video_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_023
     * @tc.desc   beginConfig() twice -> error_code: 7400105
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('beginConfig_video_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'beginConfig_video_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mVideoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          mVideoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          await mVideoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SESSION_CONFIG_LOCKED).assertTrue();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   commitConfig_video_callback_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_024
     * @tc.desc   only commitConfig(), callback -> error_code: 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('commitConfig_video_callback_abnormal_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_video_callback_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mVideoSession.commitConfig((error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to commitConfig, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
              done();
            } else {
              console.info(TAG, testName + ' session commitConfig passed.');
              expect(true).assertTrue();
            }
          });
          await mVideoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   commitConfig_video_callback_abnormal_back_002
     * @tc.number CAMERA_VIDEO_SESSION_BACK_025
     * @tc.desc   commitConfig() twice, callback -> error_code: 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('commitConfig_video_callback_abnormal_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_video_callback_abnormal_back_002';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' no same resolution preview.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            expect(isEmpty(mVideoSession)).assertFalse();
            console.info(TAG, testName + ' session created successfully.');
            await videoSessionCommitConfig(testName);
            mVideoSession.commitConfig((error) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG,
                  testName + ' failed to commitConfig, err: ' + error.code + ', msg: ' + error.message);
                expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
                done();
              } else {
                console.info(TAG, testName + ' session commitConfig passed.');
                expect(true).assertTrue();
              }
            });
            await mVideoSession.release();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        await mVideoSession.release();
        done();
      }
    })

    /**
     * @tc.name   commitConfig_video_promise_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_026
     * @tc.desc   only commitConfig(), promise -> error_code: 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('commitConfig_video_promise_abnormal_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_video_promise_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mVideoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          await mVideoSession.commitConfig().then(async () => {
            console.info(TAG, testName + ' session commitConfig successfully.');
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            console.error(TAG,
              testName + ' failed to commit the config, err: ' + error.code + ', msg: ' + error.message);
            expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
            done();
          });
          await mVideoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   commitConfig_video_promise_abnormal_back_002
     * @tc.number CAMERA_VIDEO_SESSION_BACK_027
     * @tc.desc   commitConfig() twice, promise -> error_code: 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('commitConfig_video_promise_abnormal_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_video_promise_abnormal_back_002';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' no same resolution preview.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            expect(isEmpty(mVideoSession)).assertFalse();
            console.info(TAG, testName + ' session created successfully.');
            await videoSessionCommitConfig(testName);
            await mVideoSession.commitConfig().then(async () => {
              console.info(TAG, testName + ' session commitConfig successfully.');
              expect(true).assertTrue();
            }).catch((error: BusinessError) => {
              console.error(TAG,
                testName + ' failed to commit the config, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
              done();
            });
            await mVideoSession.release();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_028
     * @tc.desc   preconfig, type->PRECONFIG_720P, ratio->PRECONFIG_RATIO_4_3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_back_001';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_4_3);
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_back_002
     * @tc.number CAMERA_VIDEO_SESSION_BACK_029
     * @tc.desc   preconfig, type->PRECONFIG_1080P, ratio->PRECONFIG_RATIO_4_3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_back_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_back_002';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_1080P,
        cameraPreconfigRatio.PRECONFIG_RATIO_4_3);
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_back_003
     * @tc.number CAMERA_VIDEO_SESSION_BACK_030
     * @tc.desc   preconfig, type->PRECONFIG_4K, ratio->PRECONFIG_RATIO_4_3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_back_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_back_003';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_4K,
        cameraPreconfigRatio.PRECONFIG_RATIO_4_3);
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_back_004
     * @tc.number CAMERA_VIDEO_SESSION_BACK_031
     * @tc.desc   preconfig, type->PRECONFIG_HIGH_QUALITY, ratio->PRECONFIG_RATIO_4_3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_back_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_back_004';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_HIGH_QUALITY,
        cameraPreconfigRatio.PRECONFIG_RATIO_4_3);
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_back_005
     * @tc.number CAMERA_VIDEO_SESSION_BACK_032
     * @tc.desc   preconfig, type->PRECONFIG_720P, ratio->PRECONFIG_RATIO_1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_back_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_back_005';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_1_1);
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_back_006
     * @tc.number CAMERA_VIDEO_SESSION_BACK_033
     * @tc.desc   preconfig, type->PRECONFIG_1080P, ratio->PRECONFIG_RATIO_1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_back_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_back_006';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_1080P,
        cameraPreconfigRatio.PRECONFIG_RATIO_1_1);
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_back_007
     * @tc.number CAMERA_VIDEO_SESSION_BACK_034
     * @tc.desc   preconfig, type->PRECONFIG_4K, ratio->PRECONFIG_RATIO_1_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_back_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_back_007';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_4K,
        cameraPreconfigRatio.PRECONFIG_RATIO_1_1);
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_back_008
     * @tc.number CAMERA_VIDEO_SESSION_BACK_035
     * @tc.desc   preconfig, type->PRECONFIG_HIGH_QUALITY, ratio->PRECONFIG_RATIO_4_3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_back_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_back_008';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_HIGH_QUALITY,
        cameraPreconfigRatio.PRECONFIG_RATIO_1_1);
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_back_009
     * @tc.number CAMERA_VIDEO_SESSION_BACK_036
     * @tc.desc   preconfig, type->PRECONFIG_720P, ratio->PRECONFIG_RATIO_16_9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_back_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_back_009';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_back_010
     * @tc.number CAMERA_VIDEO_SESSION_BACK_037
     * @tc.desc   preconfig, type->PRECONFIG_1080P, ratio->PRECONFIG_RATIO_16_9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_back_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_back_010';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_1080P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_back_011
     * @tc.number CAMERA_VIDEO_SESSION_BACK_038
     * @tc.desc   preconfig, type->PRECONFIG_4K, ratio->PRECONFIG_RATIO_16_9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_back_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_back_011';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_4K,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_back_012
     * @tc.number CAMERA_VIDEO_SESSION_BACK_039
     * @tc.desc   preconfig, type->PRECONFIG_HIGH_QUALITY, ratio->PRECONFIG_RATIO_16_9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_back_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_back_012';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_HIGH_QUALITY,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_040
     * @tc.desc   preconfig, type->PRECONFIG_720P, ratio->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_001', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_001';
        await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_720P, undefined);
      })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_002
     * @tc.number CAMERA_VIDEO_SESSION_BACK_041
     * @tc.desc   preconfig, type->undefined, ratio->PRECONFIG_RATIO_16_9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_002', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_002';
        await addOutputPreview(done, testName, undefined, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
      })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_003
     * @tc.number CAMERA_VIDEO_SESSION_BACK_042
     * @tc.desc   preconfig, type->null, ratio->PRECONFIG_RATIO_16_9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_003', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_003';
        await addOutputPreview(done, testName, null, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
      })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_004
     * @tc.number CAMERA_VIDEO_SESSION_BACK_043
     * @tc.desc   preconfig, type->abnormalIndex, ratio->PRECONFIG_RATIO_16_9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_004', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_004';
        await addOutputPreview(done, testName, abnormalIndex, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
      })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_005
     * @tc.number CAMERA_VIDEO_SESSION_BACK_044
     * @tc.desc   preconfig, type->PRECONFIG_720P, ratio->null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_005', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_005';
        await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_720P, null);
      })

    /**
     * @tc.name   addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_006
     * @tc.number CAMERA_VIDEO_SESSION_BACK_045
     * @tc.desc   preconfig, type->PRECONFIG_720P, ratio->abnormalIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_006', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'addOutput_removeOutput_previewOutput_video_preconfig_abnormal_back_006';
        await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_720P, abnormalIndex);
      })

    /**
     * @tc.name   commitConfig_video_preconfig_callback_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_046
     * @tc.desc   No abnormal scenarios-commitConfig-callback-preConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('commitConfig_video_preconfig_callback_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_video_preconfig_callback_back_001';
      await commitPreconfigCallback(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   commitConfig_video_preconfig_callback_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_047
     * @tc.desc   commitConfig-callback-preConfig, ratio->abnormalIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('commitConfig_video_preconfig_callback_abnormal_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_video_preconfig_callback_abnormal_back_001';
      await commitPreconfigCallback(done, testName, cameraPreconfigType.PRECONFIG_720P, abnormalIndex);
    })

    /**
     * @tc.name   commitConfig_video_preconfig_callback_abnormal_back_002
     * @tc.number CAMERA_VIDEO_SESSION_BACK_048
     * @tc.desc   commitConfig-callback-preConfig, type->abnormalIndex, ratio->PRECONFIG_RATIO_16_9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('commitConfig_video_preconfig_callback_abnormal_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_video_preconfig_callback_abnormal_back_002';
      await commitPreconfigCallback(done, testName, abnormalIndex, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   commitConfig_video_preconfig_callback_abnormal_back_003
     * @tc.number CAMERA_VIDEO_SESSION_BACK_049
     * @tc.desc   commitConfig-callback-preConfig, ratio->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('commitConfig_video_preconfig_callback_abnormal_back_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_video_preconfig_callback_abnormal_back_003';
      await commitPreconfigCallbackAbnormal(done, testName, cameraPreconfigType.PRECONFIG_720P, undefined);
    })

    /**
     * @tc.name   commitConfig_video_preconfig_promise_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_050
     * @tc.desc   No abnormal scenarios-commitConfig-promise-preConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('commitConfig_video_preconfig_promise_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_video_preconfig_promise_back_001';
      await commitPreconfigPromise(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   commitConfig_video_preconfig_promise_abnormal_back_001
     * @tc.number CAMERA_VIDEO_SESSION_BACK_051
     * @tc.desc   commitConfig-promise-preConfig, ratio->abnormalIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('commitConfig_video_preconfig_promise_abnormal_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_video_preconfig_promise_abnormal_back_001';
      await commitPreconfigPromise(done, testName, cameraPreconfigType.PRECONFIG_720P, abnormalIndex);
    })

    /**
     * @tc.name   commitConfig_video_preconfig_promise_abnormal_back_002
     * @tc.number CAMERA_VIDEO_SESSION_BACK_052
     * @tc.desc   commitConfig-promise-preConfig, type->abnormalIndex, ratio->PRECONFIG_RATIO_16_9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('commitConfig_video_preconfig_promise_abnormal_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_video_preconfig_promise_abnormal_back_002';
      await commitPreconfigPromise(done, testName, abnormalIndex, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.name   commitConfig_video_preconfig_promise_abnormal_back_003
     * @tc.number CAMERA_VIDEO_SESSION_BACK_053
     * @tc.desc   commitConfig-promise-preConfig, ratio->undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('commitConfig_video_preconfig_promise_abnormal_back_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_video_preconfig_promise_abnormal_back_003';
      await commitPreconfigPromiseAbnormal(done, testName, cameraPreconfigType.PRECONFIG_720P, undefined);
    })
  })
}