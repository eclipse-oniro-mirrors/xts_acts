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

const TAG = "CameraXts.CameraSessionCameraRotationSuppTest: ";
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

const testVideoRotation = async (rotation: camera.ImageRotation, testName: string, done: Function,
  callback?: (cameraVideoRotation: number) => void, errorCallback?: (errCode: number) => void) => {
  try {
    console.info(`--------------${testName}--------------`);
    if (isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName, ' mCameraDeviceArray is null.');
      return;
    } else {
      console.info(TAG,testName,'Start');
      await createVideoOutput();
      await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
      const cameraVideoRotation = mVideoOutput.getVideoRotation(rotation);
      console.log(TAG, `Testing rotation`, rotation, `is:`, cameraVideoRotation);
      if (callback) {
        callback(cameraVideoRotation);
      }
      console.info(TAG, testName, `end`);
    }
  } catch (err) {
    console.error(TAG, testName, `end`, json.stringify(err), err.code);
    if (errorCallback) {
      errorCallback(err.code);
    }
  } finally {
    await releaseVideoSession();
    done();
  }
};

const testPhotoRotation = async (rotation: camera.ImageRotation, testName: string, done: Function,
  callback?: (cameraVideoRotation: number) => void, errorCallback?: (errCode: number) => void) => {
  try {
    console.info(`--------------${testName}--------------`);
    if (isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName, ' mCameraDeviceArray is null.');
      return;
    } else {
      console.info(TAG,testName,'Start');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      const cameraVideoRotation = mPhotoOutput.getPhotoRotation(rotation);
      console.log(TAG, `Testing rotation`, rotation, `is:`, cameraVideoRotation);
      if (callback) {
        callback(cameraVideoRotation);
      }
      console.info(TAG, testName, `end`);
    }
  } catch (err) {
    console.error(TAG, testName, `end`, json.stringify(err), err.code);
    if (errorCallback) {
      errorCallback(err.code);
    }
  } finally {
    await releasePhotoSession();
    done();
  }
};

export default function CameraSessionCameraRotationSuppTest() {
  describe('CameraSessionCameraRotationSuppTest', () => {
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
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0100
     * @tc.desc   Check capture session support video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0100', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0100';
        await testVideoRotation(90, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0200
     * @tc.desc   Check capture session support video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0200', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0200';
        await testVideoRotation(180, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0300
     * @tc.desc   Check capture session support video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0300', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0300';
        await testVideoRotation(270, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0400
     * @tc.desc   Check capture session support video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0400', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0400';
        await testVideoRotation(-10, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0500
     * @tc.desc   Check capture session support video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0500', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0500';
        await testVideoRotation(-90, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0600
     * @tc.desc   Check capture session support video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0600', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0600';
        await testVideoRotation(-180, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0900
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0900
     * @tc.desc   Check capture session support video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0900', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_0900';
        await testVideoRotation(Number({ valueOf: () => 1 }), testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1000
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1000
     * @tc.desc   Check capture session support video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1000', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1000';
        await testVideoRotation(NaN, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1100
     * @tc.desc   Check capture session support video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1100', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1100';
        await testVideoRotation(Infinity, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1200
     * @tc.desc   Check capture session support video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1200', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1200';
        await testVideoRotation(Number('auto'), testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1300
     * @tc.desc   Check capture session support video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1300', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1300';
        await testVideoRotation(Number([1, 2, 3]), testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1400
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1400
     * @tc.desc   Check capture session support video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1400', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1400';
        await testVideoRotation(Number(true), testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1500
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1500
     * @tc.desc   Check capture session support video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1500', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_getVideoRotation_1500';
        await testVideoRotation(
          undefined as ESObject,
          testName,
          done,
          (callback) => {
            console.error('This callback should NOT be called when rotation is undefined');
            expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
          },
          (errCode) => {
            console.log('Error callback called with errCode:', errCode);
            expect(errCode == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          }
        );
      }
    );

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0100
     * @tc.desc   Check capture session support photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0100', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0100';
        await testPhotoRotation(90, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0200
     * @tc.desc   Check capture session support photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0200', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0200';
        await testPhotoRotation(180, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0300
     * @tc.desc   Check capture session support photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0300', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0300';
        await testPhotoRotation(270, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0400
     * @tc.desc   Check capture session support photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0400', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0400';
        await testPhotoRotation(-10, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0500
     * @tc.desc   Check capture session support photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0500', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0500';
        await testPhotoRotation(-90, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0600
     * @tc.desc   Check capture session support photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0600', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0600';
        await testPhotoRotation(-180, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0900
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0900
     * @tc.desc   Check capture session support photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0900', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_0900';
        await testPhotoRotation(Number({ valueOf: () => 1 }), testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1000
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1000
     * @tc.desc   Check capture session support photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1000', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1000';
        await testPhotoRotation(NaN, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1100
     * @tc.desc   Check capture session support photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1100', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1100';
        await testPhotoRotation(Infinity, testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1200
     * @tc.desc   Check capture session support photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1200', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1200';
        await testPhotoRotation(Number('auto'), testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1300
     * @tc.desc   Check capture session support photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1300', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1300';
        await testPhotoRotation(Number([1, 2, 3]), testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1400
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1400
     * @tc.desc   Check capture session support photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1400', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1400';
        await testPhotoRotation(Number(true), testName, done, (callback) => {
          expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
        }, (errCode) => {
          expect().assertFail();
        })
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1500
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1500
     * @tc.desc   Check capture session support photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1500', Level.LEVEL2,
      async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_getPhotoRotation_1500';
        await testPhotoRotation(
          undefined as ESObject,
          testName,
          done,
          (callback) => {
            console.error('This callback should NOT be called when rotation is undefined');
            expect(callback === 0 || callback === 90 || callback === 180 || callback === 270).assertTrue();
          },
          (errCode) => {
            console.log('Error callback called with errCode:', errCode);
            expect(errCode == camera.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          }
        );
      });
  })
}