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
import { camera } from '@kit.CameraKit';
import { common } from '@kit.AbilityKit';
import {
  cameraErrorCode,
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

const TAG = "CameraXts.cameraOutputTest";

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
  mCameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], mSupportedModes[1]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCap));
  mPreviewProfilesArray = mCameraOutputCap.previewProfiles;
  mVideoProfile = mCameraOutputCap.videoProfiles[0];
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

async function getPhotoSession(testName: string, previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getPhotoSession.');
  mPhotoSession = mCameraManager.createSession(mSupportedModes[0]);
  console.info(TAG, testName + ' createSession passed.');
  mPhotoSession.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mPhotoSession.addInput(mCameraInput);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput.open();
  console.info(TAG, testName + ' open passed.');
  mPhotoSession.addOutput(previewOutput);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mPhotoSession.addOutput(photoOutput);
  console.info(TAG, testName + ' addOutput photoOutput passed.');
  await mPhotoSession.commitConfig();
  console.info(TAG, testName + ' commitConfig passed.');
}

async function releaseVideoSession() {
  console.info(TAG, 'releaseSession.');
  await mPreviewOutput?.release();
  await mVideoOutput?.release();
  await mVideoSession?.release();
}

export default function cameraOutputTest() {
  describe('cameraOutputTest', () => {
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

    // ══════════════════════════════════════════════════
    //  release(callback: AsyncCallback<void>): void
    // ══════════════════════════════════════════════════

    /**
     * @tc.name   CAMERA_OUTPUT_VIDEO_CALLBACK_001
     * @tc.number CAMERA_OUTPUT_VIDEO_CALLBACK_001
     * @tc.desc   video output release-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_OUTPUT_VIDEO_CALLBACK_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_OUTPUT_VIDEO_CALLBACK_001';
      console.info(TAG, testName + ' begin.');
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
     * @tc.name   CAMERA_OUTPUT_VIDEO_CALLBACK_002
     * @tc.number CAMERA_OUTPUT_VIDEO_CALLBACK_002
     * @tc.desc   No abnormal scenarios-preview output release-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_OUTPUT_VIDEO_CALLBACK_002', Level.LEVEL0, async (done: Function) => {
        const testName = 'CAMERA_OUTPUT_VIDEO_CALLBACK_002';
        console.info(TAG, testName + ' begin.');
        try {
          if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
            console.info(TAG, testName + ' cameraManager is null.');
            expect().assertFail();
          } else {
            let photoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
            let previewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
            await getPhotoSession(testName, previewOutput, photoOutput);
            console.info(TAG, testName + ' getPhotoSession passed.');
            previewOutput.release((error) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG,
                  testName + ' failed to release previewOutput, err: ' + error.code + ', msg: ' + error.message);
                expect(error.code == cameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
              } else {
                console.info(TAG, testName + ' release passed.');
                
              }
            });
            await photoOutput.release();
            await mPhotoSession.release();
            console.info(TAG, testName + ' end.');
          }
          done();
        } catch (error) {
          console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   CAMERA_OUTPUT_VIDEO_CALLBACK_003
     * @tc.number CAMERA_OUTPUT_VIDEO_CALLBACK_003
     * @tc.desc   video output release-callback, realease twice, error code is: 7400201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_OUTPUT_VIDEO_CALLBACK_003', Level.LEVEL0, async (done: Function) => {
        const testName = 'CAMERA_OUTPUT_VIDEO_CALLBACK_003';
        console.info(TAG, testName + ' begin.');
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
                  
                }
              });
              mVideoOutput.release((error) => {
                if (error !== undefined && error.code !== 0) {
                  console.error(TAG,
                    testName + ' failed to release previewOutput, err: ' + error.code + ', msg: ' + error.message);
                    expect(Number(error.code)).assertEqual(cameraErrorCode.SERVICE_FATAL_ERROR);
                } else {
                  console.info(TAG, testName + ' release passed.');
                  
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
          done();
        }
      })

    /**
     * @tc.name   CAMERA_OUTPUT_VIDEO_CALLBACK_004
     * @tc.number CAMERA_OUTPUT_VIDEO_CALLBACK_004
     * @tc.desc   abnormal scenarios-preview output release-callback, realease twice, error code is: 7400201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_OUTPUT_VIDEO_CALLBACK_004', Level.LEVEL0, async (done: Function) => {
        const testName = 'CAMERA_OUTPUT_VIDEO_CALLBACK_004';
        console.info(TAG, testName + ' begin.');
        try {
          if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
            console.info(TAG, testName + ' cameraManager is null.');
            expect().assertFail();
          } else {
            let photoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
            let previewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
            await getPhotoSession(testName, previewOutput, photoOutput);
            console.info(TAG, testName + ' getPhotoSession passed.');
            previewOutput.release((error) => {
              if (error !== undefined && error.code !== 0) {
                console.error(TAG,
                  testName + ' failed to release previewOutput, err: ' + error.code + ', msg: ' + error.message);
                  expect(Number(error.code)).assertEqual(cameraErrorCode.SERVICE_FATAL_ERROR);
              } else {
                console.info(TAG, testName + ' release passed.');
                
              }
            });
            previewOutput.release((error) => {
                if (error !== undefined && error.code !== 0) {
                  console.error(TAG,
                    testName + ' failed to release previewOutput, err: ' + error.code + ', msg: ' + error.message);
                    expect(Number(error.code)).assertEqual(cameraErrorCode.SERVICE_FATAL_ERROR);
                } else {
                  console.info(TAG, testName + ' release passed.');
                  
                }
              });
            await photoOutput.release();
            await mPhotoSession.release();
            console.info(TAG, testName + ' end.');
          }
          done();
        } catch (error) {
          console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
          done();
        }
      })

    // ══════════════════════════════════════════════════
    //  release(): Promise<void>
    // ══════════════════════════════════════════════════

    /**
     * @tc.name   CAMERA_OUTPUT_VIDEO_002
     * @tc.number CAMERA_OUTPUT_VIDEO_002
     * @tc.desc   video output release-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_OUTPUT_VIDEO_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_OUTPUT_VIDEO_002';
      console.info(TAG, testName + ' begin.');
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

    /**
     * @tc.name   CAMERA_OUTPUT_VIDEO_003
     * @tc.number CAMERA_OUTPUT_VIDEO_003
     * @tc.desc   video output release twice, error code is: 7400201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_OUTPUT_VIDEO_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_OUTPUT_VIDEO_003';
      console.info(TAG, testName + ' begin.');
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
            await mVideoOutput.release();
            await mVideoOutput.release();
            console.info(TAG, testName + ' videoOutput release twice failed');
            expect().assertFail();
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(Number(error.code)).assertEqual(cameraErrorCode.SERVICE_FATAL_ERROR);
        done();
      }
    })
    
    /**
     * @tc.name   CAMERA_OUTPUT_PREVIEW_002
     * @tc.number CAMERA_OUTPUT_PREVIEW_002
     * @tc.desc   No abnormal scenarios-preview output release-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_OUTPUT_PREVIEW_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_OUTPUT_PREVIEW_002';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let photoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          let previewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, previewOutput, photoOutput);
          console.info(TAG, testName + ' getPhotoSession passed.');
          await previewOutput.release().then(() => {
            console.info(TAG, testName + ' release previewOutput passed.');
            
          }).catch((error: BusinessError) => {
            console.error(TAG,
              testName + ' failed to release previewOutput, err: ' + error.code + ', msg: ' + error.message);
            expect().assertFail();
          });
          await photoOutput.release();
          await mPhotoSession.release();
          console.info(TAG, testName + ' end.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   CAMERA_OUTPUT_PREVIEW_003
     * @tc.number CAMERA_OUTPUT_PREVIEW_003
     * @tc.desc   preview output release twice, error code is: 7400201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CAMERA_OUTPUT_PREVIEW_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'CAMERA_OUTPUT_PREVIEW_003';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let photoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          let previewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, previewOutput, photoOutput);
          console.info(TAG, testName + ' getPhotoSession passed.');
          await previewOutput.release().then(() => {
            console.info(TAG, testName + ' release previewOutput passed.');
            
          }).catch((error: BusinessError) => {
            console.error(TAG,
                testName + ', type of error code: ' + typeof(error.code));
            console.error(TAG,
              testName + ' failed to release previewOutput, err: ' + error.code + ', msg: ' + error.message + ', type of error code: ' + typeof(error.code));
            expect().assertFail();
          });
          // release previewOutput twice
          await previewOutput.release()
          console.info(TAG, testName + ' previewOutput release twice success');
          expect().assertFail();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(Number(error.code)).assertEqual(cameraErrorCode.SERVICE_FATAL_ERROR);
        done();
      }
    })
  })
}