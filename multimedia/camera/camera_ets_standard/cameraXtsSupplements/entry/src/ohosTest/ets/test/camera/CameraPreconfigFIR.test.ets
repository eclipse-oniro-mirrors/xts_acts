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
  cameraPreconfigRatio,
  cameraPreconfigType,
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
import { tag } from '@kit.ConnectivityKit';

const TAG = "CameraXts.cameraCanPreconfigTest";
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

async function CameraPreconfigPhoto(done: Function, testName: string, callback: () => void) {
  if (isEmpty(mCameraDeviceArray)) {
    console.info(TAG, testName, ' mCameraDeviceArray is null.');
    return;
  } else {
    createPhotoOutput();
    await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
    callback();
    await releasePhotoSession();
    done();
  }
}


async function CameraPreconfigVideo(done: Function, testName: string, callback: () => void) {
  if (isEmpty(mCameraDeviceArray)) {
    console.info(TAG, testName, ' mCameraDeviceArray is null.');
    return;
  } else {
    await createVideoOutput();
    await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
    callback();
    await releaseVideoSession();
    done();
  }
}


export default function cameraCanPreconfigTest() {
  describe('cameraCanPreconfigTest', () => {
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
      AppStorage.delete('key')
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_001
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_001
     * @tc.desc   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_001';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY, 0);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_002
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_002
     * @tc.desc   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_002';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result = mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY, 0);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_003
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_003
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_003';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_4K, 0);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_004
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_004
     * @tc.desc   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_004';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result = mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_4K, 0);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_005
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_005
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_005';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P, 0);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_006
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_006
     * @tc.desc   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_006';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result = mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P, 0);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_007
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_007
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_007';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_1080P, 0);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_008
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_008
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_008';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result = mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_1080P, 0);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_009
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_009
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_009';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_1080P, camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_010
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_010
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_010';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result =
            mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_1080P, camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_011
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_011
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_011';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_1080P,
            camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_012
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_012
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_012';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result = mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_1080P,
            camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_013
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_013
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_013';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_1080P, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_014
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_014
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_014';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result =
            mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_1080P, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_015
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_015
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_015';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P, camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_016
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_016
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_016';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result =
            mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P, camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_017
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_017
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_017';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P, camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_018
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_018
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_018';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result =
            mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P, camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_019
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_019
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_019';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_020
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_020
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_020';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result =
            mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_021
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_021
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_021';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_022
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_022
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_022';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result =
            mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_023
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_023
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_023';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_024
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_024
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_024';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result =
            mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_025
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_025
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_025';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_026
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_026
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_026';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result =
            mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_027
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_027
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_027';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
            camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_028
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_028
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_028';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result = mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
            camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_029
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_029
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_029';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
            camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_030
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_030
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_030';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result = mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
            camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_031
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_031
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_031', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_031';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
            camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_032
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_032
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_032', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_032';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result = mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
            camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_033
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_033
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_033', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_033';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession.canPreconfig(null, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_034
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_034
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_034', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_034';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result = mVideoSession.canPreconfig(null, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_035
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_035
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_035', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_035';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession.canPreconfig(undefined, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_036
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_036
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_036', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_036';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result = mVideoSession.canPreconfig(undefined, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_037
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_037
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_037', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_037';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P, undefined);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_038
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_038
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_038', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_038';
      CameraPreconfigVideo(done, testName, () => {
        try {
          let result = mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P, undefined);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_039
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_039
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_039', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_039';
      CameraPreconfigPhoto(done, testName, async () => {
        try {
          let result = mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P, null);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          await releasePhotoSession();
          done();
        }
      })
    })


  })
}