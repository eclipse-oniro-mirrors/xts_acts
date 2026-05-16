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
import { describe, beforeAll, it, expect, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { camera } from '@kit.CameraKit';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { closeFd, driveFn, getFd, getPermission, isEmpty, resourceName, sleep } from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import { media } from '@kit.MediaKit';

const TAG = 'Xts.CameraOISQuery';
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let mVideoSurfaceId: string;
let mPhotoSession: camera.PhotoSession;
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
    console.info(TAG, 'has no valid device')
    return;
  }
  let cameraOutputCap = mCameraManager.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let photoProfile = cameraOutputCap.photoProfiles[0];
  console.info(TAG, 'init  previewProfile ', previewProfile, 'photoProfile', photoProfile);
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

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mPhotoSession?.release();
}

export default function CameraOISQueryTest() {
  describe('CameraOISQueryTest', () => {
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
      await sleep(2000);
    });

    afterAll(async () => {
      console.info('afterAll case');
      await closeFd(fdNumber);
    });

        /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_isOISModeSupported_0100
     * @tc.name    SUB_MULTIMEDIA_CAMERA_isOISModeSupported_0100
     * @tc.desc    isOISModeSupported cover OFF
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_isOISModeSupported_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_isOISModeSupported_0100';
      console.info(TAG, testName + ' begin.');
      let isSupported: boolean = false;
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        isSupported = mPhotoSession.isOISModeSupported(camera.OISMode.OFF);
        console.info(TAG, testName + ' isSupported: ' + isSupported);
        expect(isEmpty(isSupported)).assertFalse();
        console.info(TAG, testName + ' success.');
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_isOISModeSupported_0200
     * @tc.name    SUB_MULTIMEDIA_CAMERA_isOISModeSupported_0200
     * @tc.desc    isOISModeSupported cover AUTO
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_isOISModeSupported_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_isOISModeSupported_0200';
      console.info(TAG, testName + ' begin.');
      let isSupported: boolean = false;
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        isSupported = mPhotoSession!.isOISModeSupported(camera.OISMode.AUTO);
        console.info(TAG, testName + ' isSupported: ' + isSupported);
        expect(isEmpty(isSupported)).assertFalse();
        console.info(TAG, testName + ' success.');
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_isOISModeSupported_0300
     * @tc.name    SUB_MULTIMEDIA_CAMERA_isOISModeSupported_0300
     * @tc.desc    isOISModeSupported cover 7400103
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_isOISModeSupported_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_isOISModeSupported_0300';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      mPhotoSession!.beginConfig();
      try {
        mPhotoSession!.isOISModeSupported(camera.OISMode.OFF);
        console.error(TAG, testName + ' should throw error.');
        expect().assertFail();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG, testName + ' err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400103);
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasRange_0100
     * @tc.name    SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasRange_0100
     * @tc.desc    getSupportedOISBiasRange cover 返回值为空
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasRange_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasRange_0100';
      console.info(TAG, testName + ' begin.');
      let biasRange: Array<number> = [];
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        let isSupported = mPhotoSession!.isOISModeSupported(camera.OISMode.AUTO);
        if (!isSupported) {
          biasRange = mPhotoSession!.getSupportedOISBiasRange(camera.OISAxes.PITCH);
          console.info(TAG, testName + ' biasRange: ' + JSON.stringify(biasRange));
          expect().assertFail();
        }
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400102);
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasRange_0200
     * @tc.name    SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasRange_0200
     * @tc.desc    getSupportedOISBiasRange cover 返回值非空
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasRange_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasRange_0200';
      console.info(TAG, testName + ' begin.');
      let biasRange: Array<number> = [];
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        let isSupported = mPhotoSession!.isOISModeSupported(camera.OISMode.AUTO);
        if (isSupported) {
          biasRange = mPhotoSession!.getSupportedOISBiasRange(camera.OISAxes.PITCH);
          console.info(TAG, testName + ' biasRange: ' + JSON.stringify(biasRange));
          expect(biasRange.length > 0).assertTrue();
        }
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasRange_0300
     * @tc.name    SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasRange_0300
     * @tc.desc    getSupportedOISBiasRange cover 7400103
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasRange_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasRange_0300';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      await releasePhotoSession();
      try {
        mPhotoSession!.getSupportedOISBiasRange(camera.OISAxes.PITCH);
        console.error(TAG, testName + ' should throw error.');
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG, testName + ' err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400103);
        done();
      }
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasStep_0100
     * @tc.name    SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasStep_0100
     * @tc.desc    getSupportedOISBiasStep cover 7400103
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasStep_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasStep_0100';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      await releasePhotoSession();
      try {
        mPhotoSession!.getSupportedOISBiasStep(camera.OISAxes.PITCH);
        console.error(TAG, testName + ' should throw error.');
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG, testName + ' err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400103);
        done();
      }
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasStep_0200
     * @tc.name    SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasStep_0200
     * @tc.desc    getSupportedOISBiasStep cover 7400102
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasStep_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getSupportedOISBiasStep_0200';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        mPhotoSession!.getSupportedOISBiasStep(null);
        console.error(TAG, testName + ' should throw error.');
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG, testName + ' err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400102);
        done();
      }
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0100
     * @tc.name    SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0100
     * @tc.desc    getCurrentOISMode cover 7400103
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0100';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      await releasePhotoSession();
      try {
        mPhotoSession!.getCurrentOISMode();
        console.error(TAG, testName + ' should throw error.');
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG, testName + ' err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400103);
        done();
      }
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0200
     * @tc.name    SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0200
     * @tc.desc    getCurrentOISMode cover OFF
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0200';
      console.info(TAG, testName + ' begin.');
      let currentMode: camera.OISMode = camera.OISMode.OFF;
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        let isSupported = mPhotoSession!.isOISModeSupported(camera.OISMode.AUTO);
        if (!isSupported) {
          currentMode = mPhotoSession!.getCurrentOISMode();
          console.info(TAG, testName + ' currentMode: ' + currentMode);
          expect().assertFail();
        }
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400102);
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0300
     * @tc.name    SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0300
     * @tc.desc    getCurrentOISMode cover OFF
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0300';
      console.info(TAG, testName + ' begin.');
      let currentMode: camera.OISMode = camera.OISMode.OFF;
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        let isSupported = mPhotoSession!.isOISModeSupported(camera.OISMode.AUTO);
        if (isSupported) {
          currentMode = mPhotoSession!.getCurrentOISMode();
          console.info(TAG, testName + ' currentMode: ' + currentMode);
          expect(Number(currentMode)).assertEqual(0);
        }
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0400
     * @tc.name    SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0400
     * @tc.desc    getCurrentOISMode cover AUTO
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0400';
      console.info(TAG, testName + ' begin.');
      let currentMode: camera.OISMode = camera.OISMode.AUTO;
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        let isSupported = mPhotoSession!.isOISModeSupported(camera.OISMode.AUTO);
        if (!isSupported) {
          currentMode = mPhotoSession!.getCurrentOISMode();
          console.info(TAG, testName + ' currentMode: ' + currentMode);
          expect().assertFail();
        }
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400102);
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0500
     * @tc.name    SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0500
     * @tc.desc    getCurrentOISMode cover AUTO
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getCurrentOISMode_0500';
      console.info(TAG, testName + ' begin.');
      let currentMode: camera.OISMode = camera.OISMode.AUTO;
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        let isSupported = mPhotoSession!.isOISModeSupported(camera.OISMode.AUTO);
        if (isSupported) {
          currentMode = mPhotoSession!.getCurrentOISMode();
          console.info(TAG, testName + ' currentMode: ' + currentMode);
          expect(Number(currentMode)).assertEqual(1);
        }
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_getCurrentCustomOISBias_0100
     * @tc.name    SUB_MULTIMEDIA_CAMERA_getCurrentCustomOISBias_0100
     * @tc.desc    getCurrentOISMode cover 7400103
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_getCurrentCustomOISBias_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getCurrentCustomOISBias_0100';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      await releasePhotoSession();
      try {
        mPhotoSession!.getCurrentCustomOISBias(camera.OISAxes.PITCH);
        console.error(TAG, testName + ' should throw error.');
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG, testName + ' err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400103);
        done();
      }
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_getCurrentCustomOISBias_0200
     * @tc.name    SUB_MULTIMEDIA_CAMERA_getCurrentCustomOISBias_0200
     * @tc.desc    getCurrentOISMode cover 7400102
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_getCurrentCustomOISBias_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getCurrentCustomOISBias_0200';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        mPhotoSession!.getCurrentCustomOISBias(null);
        console.error(TAG, testName + ' should throw error.');
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG, testName + ' err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400102);
        done();
      }
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_setOISMode_0100
     * @tc.name    SUB_MULTIMEDIA_CAMERA_setOISMode_0100
     * @tc.desc    setOISMode cover OFF
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_setOISMode_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setOISMode_0100';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        let isSupported = mPhotoSession!.isOISModeSupported(camera.OISMode.AUTO);
        if (!isSupported) {
          let result = mPhotoSession!.setOISMode(camera.OISMode.OFF);
          console.info(TAG, testName + ' result: ' + result);
          expect().assertFail();
        }
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400102);
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_setOISMode_0200
     * @tc.name    SUB_MULTIMEDIA_CAMERA_setOISMode_0200
     * @tc.desc    setOISMode cover OFF
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_setOISMode_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setOISMode_0200';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        let isSupported = mPhotoSession!.isOISModeSupported(camera.OISMode.AUTO);
        if (isSupported) {
          let result = mPhotoSession!.setOISMode(camera.OISMode.OFF);
          console.info(TAG, testName + ' result: ' + result);
          expect(result != undefined).assertTrue();
        }
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_setOISMode_0300
     * @tc.name    SUB_MULTIMEDIA_CAMERA_setOISMode_0300
     * @tc.desc    setOISMode cover AUTO
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_setOISMode_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setOISMode_0300';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        let isSupported = mPhotoSession!.isOISModeSupported(camera.OISMode.AUTO);
        if (!isSupported) {
          let result = mPhotoSession!.setOISMode(camera.OISMode.AUTO);
          console.info(TAG, testName + ' result: ' + result);
          expect().assertFail();
        }
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400102);
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_setOISMode_0400
     * @tc.name    SUB_MULTIMEDIA_CAMERA_setOISMode_0400
     * @tc.desc    setOISMode cover AUTO
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_setOISMode_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setOISMode_0400';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        let isSupported = mPhotoSession!.isOISModeSupported(camera.OISMode.AUTO);
        if (isSupported) {
          let result = mPhotoSession!.setOISMode(camera.OISMode.AUTO);
          console.info(TAG, testName + ' result: ' + result);
          expect(result != undefined).assertTrue();
        }
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_setOISMode_0500
     * @tc.name    SUB_MULTIMEDIA_CAMERA_setOISMode_0500
     * @tc.desc    setOISMode cover 7400103
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_setOISMode_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setOISMode_0500';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      await releasePhotoSession();
      try {
        mPhotoSession!.setOISMode(camera.OISMode.OFF);
        console.error(TAG, testName + ' should throw error.');
        expect().assertFail();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG, testName + ' err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400103);
        done();
      }
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0100
     * @tc.name    SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0100
     * @tc.desc    setOISMode cover null
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0100';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        mPhotoSession!.setOISMode(camera.OISMode.CUSTOM);
        let result = mPhotoSession!.setOISModeCustom(null, 1);
        console.info(TAG, testName + ' result: ' + result);
        expect().assertFail();
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400102);
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0200
     * @tc.name    SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0200
     * @tc.desc    setOISMode cover undefined
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0200';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        mPhotoSession!.setOISMode(camera.OISMode.CUSTOM);
        let result = mPhotoSession!.setOISModeCustom(undefined, 1);
        console.info(TAG, testName + ' result: ' + result);
        expect().assertFail();
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400102);
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0300
     * @tc.name    SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0300
     * @tc.desc    setOISMode cover null
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0300';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        mPhotoSession!.setOISMode(camera.OISMode.CUSTOM);
        let result = mPhotoSession!.setOISModeCustom(1, null);
        console.info(TAG, testName + ' result: ' + result);
        expect().assertFail();
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400102);
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0400
     * @tc.name    SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0400
     * @tc.desc    setOISMode cover undefined
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0400';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
      try {
        mPhotoSession!.setOISMode(camera.OISMode.CUSTOM);
        let result = mPhotoSession!.setOISModeCustom(1, undefined);
        console.info(TAG, testName + ' result: ' + result);
        expect().assertFail();
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400102);
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0500
     * @tc.name    SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0500
     * @tc.desc    setOISMode cover 7400103
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setOISModeCustom_0500';
      console.info(TAG, testName + ' begin.');
      createPhotoOutput();
      mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
      try {
        let result = mPhotoSession!.setOISModeCustom(1, 2);
        console.info(TAG, testName + ' result: ' + result);
        expect().assertFail();
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, testName + ' failed. err: ' + err.code + ', msg: ' + err.message);
        expect(Number(err.code)).assertEqual(7400103);
      }
      await releasePhotoSession();
      done();
    })

  })
}