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

const TAG = "CameraXts.cameraCanPreconfigSecTest";
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


export default function cameraCanPreconfigSecTest() {
  describe('cameraCanPreconfigSecTest', () => {
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
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_040
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_040
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_040', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_040';
      CameraPreconfigVideo(done, testName, async () => {
        try {
          let result = mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P, null);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
          done();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          await releaseVideoSession();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_041
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_041
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_041', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_041';
      CameraPreconfigPhoto(done, testName, async () => {
        AppStorage.setOrCreate('key', '');
        let preconfigType: camera.PreconfigType = AppStorage.get('key') as ESObject;
        try {
          let result = mPhotoSession.canPreconfig(preconfigType, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          await releasePhotoSession();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_042
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_042
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_042', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_042';
      CameraPreconfigVideo(done, testName, async () => {
        AppStorage.setOrCreate('key', '');
        let preconfigType: camera.PreconfigType = AppStorage.get('key') as ESObject;
        try {
          let result = mVideoSession.canPreconfig(preconfigType, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          await releaseVideoSession();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_043
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_043
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_043', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_043';
      CameraPreconfigPhoto(done, testName, async () => {
        AppStorage.setOrCreate('key', '');
        let PreconfigRatio: camera.PreconfigRatio = AppStorage.get('key') as ESObject;
        try {
          let result = mPhotoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P, PreconfigRatio);
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
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_044
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_044
     * @tc.desc   Create Video session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_044', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_044';
      CameraPreconfigVideo(done, testName, async () => {
        AppStorage.setOrCreate('key', '');
        let PreconfigRatio: camera.PreconfigRatio = AppStorage.get('key') as ESObject;
        try {
          let result = mVideoSession.canPreconfig(camera.PreconfigType.PRECONFIG_720P, PreconfigRatio);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          await releaseVideoSession();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_045
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_045
     * @tc.desc   Create Video session Preconfig:null,PreconfigRatio:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_045', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_045';
      CameraPreconfigVideo(done, testName, async () => {
        AppStorage.setOrCreate('key', '');
        let PreconfigRatio: camera.PreconfigRatio = AppStorage.get('key') as ESObject;
        try {
          let result = mVideoSession.canPreconfig(null, PreconfigRatio);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          await releaseVideoSession();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_046
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_046
     * @tc.desc   Create photo session  Preconfig:null,PreconfigRatio:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_046', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_046';
      CameraPreconfigPhoto(done, testName, async () => {
        AppStorage.setOrCreate('key', '');
        let PreconfigRatio: camera.PreconfigRatio = AppStorage.get('key') as ESObject;
        try {
          let result = mPhotoSession.canPreconfig(null, PreconfigRatio);
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
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_047
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_047
     * @tc.desc   Create Video session Preconfig:'',PreconfigRatio:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_047', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_047';
      CameraPreconfigVideo(done, testName, async () => {
        AppStorage.setOrCreate('key', '');
        let PreconfigRatio: camera.PreconfigRatio = AppStorage.get('key') as ESObject;
        let PreconfigType: camera.PreconfigType = AppStorage.get('key') as ESObject;
        try {
          let result = mVideoSession.canPreconfig(PreconfigType, PreconfigRatio);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          await releaseVideoSession();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_048
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_048
     * @tc.desc   Create photo session Preconfig:'',PreconfigRatio:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_048', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_048';
      CameraPreconfigPhoto(done, testName, async () => {
        AppStorage.setOrCreate('key', '');
        let PreconfigRatio: camera.PreconfigRatio = AppStorage.get('key') as ESObject;
        let PreconfigType: camera.PreconfigType = AppStorage.get('key') as ESObject;
        try {
          let result = mPhotoSession.canPreconfig(PreconfigType, PreconfigRatio);
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

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_049
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_049
     * @tc.desc   Create Video session Preconfig:undefined,PreconfigRatio:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_049', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_049';
      CameraPreconfigVideo(done, testName, async () => {
        AppStorage.setOrCreate('key', '');
        let PreconfigRatio: camera.PreconfigRatio = AppStorage.get('key') as ESObject;
        try {
          let result = mVideoSession.canPreconfig(undefined, PreconfigRatio);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          await releaseVideoSession();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_050
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_050
     * @tc.desc   Create photo session Preconfig:undefined,PreconfigRatio:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_050', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_050';
      CameraPreconfigPhoto(done, testName, async () => {
        AppStorage.setOrCreate('key', '');
        let PreconfigRatio: camera.PreconfigRatio = AppStorage.get('key') as ESObject;
        try {
          let result = mPhotoSession.canPreconfig(undefined, PreconfigRatio);
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

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_051
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_051
     * @tc.desc   Create Video session Preconfig:undefined,PreconfigRatio:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_051', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_051';
      CameraPreconfigVideo(done, testName, async () => {
        try {
          let result = mVideoSession.canPreconfig(undefined, undefined);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          await releaseVideoSession();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_052
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_052
     * @tc.desc   Create photo session Preconfig:undefined,PreconfigRatio:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_052', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_052';
      CameraPreconfigPhoto(done, testName, async () => {
        try {
          let result = mPhotoSession.canPreconfig(undefined, undefined);
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
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_053
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_053
     * @tc.desc   Create Video session Preconfig:null,PreconfigRatio:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_053', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_053';
      CameraPreconfigVideo(done, testName, async () => {
        try {
          let result = mVideoSession.canPreconfig(null, null);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmpty(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect(error.code).assertEqual('7400101')
          await releaseVideoSession();
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_054
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_054
     * @tc.desc   Create photo session Preconfig:null,PreconfigRatio:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_054', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_054';
      CameraPreconfigPhoto(done, testName, async () => {
        try {
          let result = mPhotoSession.canPreconfig(null, null);
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