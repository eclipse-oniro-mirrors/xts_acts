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
import { indexSurfaceId } from '../../testability/pages/Index';
import { BusinessError } from '@kit.BasicServicesKit';
import { media } from '@kit.MediaKit';

const TAG = "CameraXts.VideoOutputBackTest";

let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mCameraOutputCap: camera.CameraOutputCapability;
let mPreviewProfilesArray: Array<camera.Profile>;
let mPreviewProfile: camera.Profile | undefined;
let mVideoSurfaceId: string;
let mVideoProfile: camera.VideoProfile;
let mPreviewOutput: camera.PreviewOutput;
let mVideoOutput: camera.VideoOutput;
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

async function getVideoSession(testName: string, previewOutput: camera.PreviewOutput, videoOutput: camera.VideoOutput) {
  console.info(TAG, 'getVideoSession.');
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

async function releaseVideoSession() {
  console.info(TAG, 'releaseSession.');
  await mPreviewOutput?.release();
  await mVideoOutput?.release();
  await mVideoSession?.release();
}

function onErrorListen(testName: string, videoOutput: camera.VideoOutput) {
  videoOutput.on('error', (error) => {
    if (error !== undefined && error.code !== 0) {
      console.error(TAG, testName + ' failed to listen on, err: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
    } else {
      console.info(TAG, testName + ' listen on passed.');
      expect(true).assertTrue();
    }
  });
}

export default function VideoOutputBackTest() {
  describe('VideoOutputBackTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      getCameraManager();
      getSupportedCameraDeviceArray();
      getSupportedModes();
      getOutputCapability();
      await getPermission();
      await driveFn();
      getCameraInput();
      getPreviewProfile();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case.');
      if (!isEmpty(mAVRecorder)) {
        await mAVRecorder.release();
      }
      await sleep(COMMON_WAIT_DURATION);
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case.');
      await closeFd(fdNumber);
    });

    /**
     * @tc.number    : CAMERA_OUTPUT_VIDEO_BACK_001
     * @tc.name      : start_video_output_callback_back_001
     * @tc.desc      : No abnormal scenarios-start()-callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('start_video_output_callback_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'start_video_output_callback_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' no same resolution preview.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            await getVideoSurfaceId();
            mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            await getVideoSession(testName, mPreviewOutput, mVideoOutput);
            mVideoOutput.start((error) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG, testName + ' failed to start, err: ' + error.code + ', msg: ' + error.message);
                expect().assertFail();
              } else {
                console.info(TAG, testName + ' start passed.');
                expect(true).assertTrue();
              }
            });
            console.info(TAG, testName + ' start end.');
            await releaseVideoSession();
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
     * @tc.number    : CAMERA_OUTPUT_VIDEO_BACK_002
     * @tc.name      : start_video_output_promise_back_001
     * @tc.desc      : No abnormal scenarios-start()-promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('start_video_output_promise_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'start_video_output_promise_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' No preview with the same resolution.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            await getVideoSurfaceId();
            mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            await getVideoSession(testName, mPreviewOutput, mVideoOutput);
            await mVideoOutput.start().then(() => {
              console.info(TAG, testName + ' start passed.');
              expect(true).assertTrue();
            }).catch((error: BusinessError) => {
              console.error(TAG, testName + ' failed to start, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            });
            console.info(TAG, testName + ' start end.');
            await releaseVideoSession();
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
     * @tc.number    : CAMERA_OUTPUT_VIDEO_BACK_003
     * @tc.name      : stop_video_output_callback_back_001
     * @tc.desc      : No abnormal scenarios-stop()-callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('stop_video_output_callback_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'stop_video_output_callback_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' No preview with the same resolution.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            await getVideoSurfaceId();
            mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            await getVideoSession(testName, mPreviewOutput, mVideoOutput);
            mVideoOutput.stop((error) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG, testName + ' failed to stop, err: ' + error.code + ', msg: ' + error.message);
                expect().assertFail();
              } else {
                console.info(TAG, testName + ' stop passed.');
                expect(true).assertTrue();
              }
            });
            console.info(TAG, testName + ' stop end.');
            await releaseVideoSession();
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
     * @tc.number    : CAMERA_OUTPUT_VIDEO_BACK_004
     * @tc.name      : stop_video_output_promise_back_001
     * @tc.desc      : No abnormal scenarios-stop()-promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('stop_video_output_promise_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'stop_video_output_promise_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' No preview with the same resolution.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            await getVideoSurfaceId();
            mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            await getVideoSession(testName, mPreviewOutput, mVideoOutput);
            await mVideoOutput.stop().then(() => {
              console.info(TAG, testName + ' stop passed.');
              expect(true).assertTrue();
            }).catch((error: BusinessError) => {
              console.error(TAG, testName + ' failed to stop, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            });
            console.info(TAG, testName + ' stop end.');
            await releaseVideoSession();
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
     * @tc.number    : CAMERA_OUTPUT_VIDEO_BACK_005
     * @tc.name      : on_error_listen_video_output_back_001
     * @tc.desc      : No abnormal scenarios-listen on error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('on_error_listen_video_output_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_error_listen_video_output_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' No preview with the same resolution.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            await getVideoSurfaceId();
            mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            await getVideoSession(testName, mPreviewOutput, mVideoOutput);
            onErrorListen(testName, mVideoOutput);
            console.info(TAG, testName + ' on error listen end.');
            await releaseVideoSession();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertFail();
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_OUTPUT_VIDEO_BACK_006
     * @tc.name      : off_error_listen_video_output_back_001
     * @tc.desc      : No abnormal scenarios-listen on error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('off_error_listen_video_output_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'off_error_listen_video_output_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' No preview with the same resolution.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            await getVideoSurfaceId();
            mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            await getVideoSession(testName, mPreviewOutput, mVideoOutput);
            onErrorListen(testName, mVideoOutput);
            mVideoOutput.off('error');
            console.info(TAG, testName + ' off error listen end.');
            await releaseVideoSession();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertFail();
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_OUTPUT_VIDEO_BACK_007
     * @tc.name      : on_error_listen_video_output_abnormal_back_001
     * @tc.desc      : No config, only listen error -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('on_error_listen_video_output_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_error_listen_video_output_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          await getVideoSurfaceId();
          let videoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
          onErrorListen(testName, videoOutput);
          console.info(TAG, testName + ' on error listen end.');
          await videoOutput.release();
          console.info(TAG, testName + ' release session end.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_OUTPUT_VIDEO_BACK_008
     * @tc.name      : off_error_listen_video_output_abnormal_back_001
     * @tc.desc      : No config, only listen error -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('off_error_listen_video_output_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'off_error_listen_video_output_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' No preview with the same resolution.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            await getVideoSurfaceId();
            mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
            onErrorListen(testName, mVideoOutput);
            mVideoOutput.off('error');
            console.info(TAG, testName + ' off error listen end.');
            await mVideoOutput.release();
            console.info(TAG, testName + ' release session end.');
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
     * @tc.number    : CAMERA_OUTPUT_VIDEO_BACK_009
     * @tc.name      : release_video_output_callback_back_001
     * @tc.desc      : video output release-callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('release_video_output_callback_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_video_output_callback_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' No preview with the same resolution.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            await getVideoSurfaceId();
            mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            await getVideoSession(testName, mPreviewOutput, mVideoOutput);
            console.info(TAG, testName + ' getPhotoSession passed.');
            mVideoOutput.release((error) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG,
                  testName + ' failed to release previewOutput, err: ' + error.code + ', msg: ' + error.message);
                expect().assertFail();
              } else {
                console.info(TAG, testName + ' release passed.');
                expect(true).assertTrue();
              }
            });
            await mPreviewOutput.release();
            await mVideoSession.release();
            console.info(TAG, testName + ' end.');
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_OUTPUT_VIDEO_BACK_010
     * @tc.name      : release_video_output_promise_back_001
     * @tc.desc      : video output release-promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('release_video_output_promise_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_video_output_promise_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          if (isEmpty(mPreviewProfile)) {
            console.info(TAG, testName + ' No preview with the same resolution.');
            expect(isEmpty(mPreviewProfile)).assertTrue();
          } else {
            await getVideoSurfaceId();
            mVideoOutput = mCameraManager.createVideoOutput(mVideoProfile, mVideoSurfaceId);
            mPreviewOutput = mCameraManager.createPreviewOutput(mPreviewProfile, indexSurfaceId);
            await getVideoSession(testName, mPreviewOutput, mVideoOutput);
            console.info(TAG, testName + ' getPhotoSession passed.');
            await mVideoOutput.release().then(() => {
              console.info(TAG, testName + ' release videoOutput passed.');
              expect(true).assertTrue();
            }).catch((error: BusinessError) => {
              console.error(TAG,
                testName + ' failed to release videoOutput, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            });
            await mPreviewOutput.release();
            await mVideoSession.release();
            console.info(TAG, testName + ' end.');
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releaseVideoSession();
        done();
      }
    })
  })
}