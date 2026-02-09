/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { JSON } from '@kit.ArkTS';

const TAG = "CameraXts.setFrameRate";
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
  console.info(TAG, 'mCameraManager created successfully.' + JSON.stringify(mCameraManager));
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
  console.log(TAG, 'createVideoOutput' + videoProfile,'surfaceID', mVideoSurfaceId);
  mVideoOutput = mCameraManager.createVideoOutput(videoProfile, mVideoSurfaceId);
  console.log(TAG, 'create preview output' + mPreviewOutput,'createVideoOutput', mVideoOutput);
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
  console.info(TAG, 'getCreateVideoSession.' + mCameraManager);
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

async function videoSessionSetFrameRate(done: Function,testName: string,callback: (supportedFrameRatesArray: Array<camera.FrameRateRange>) => void) {
  console.info(TAG, testName);
  if (isEmpty(mCameraDeviceArray)) {
    console.info(TAG, testName + ' mCameraDeviceArray is null.');
    return;
  } else {
    await createVideoOutput();
    await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
    let supportedFrameRatesArray: Array<camera.FrameRateRange> = mVideoOutput.getSupportedFrameRates();
    console.info(TAG, testName, `The Device is supportedFrameRates: ${JSON.stringify(supportedFrameRatesArray)}`)
    if(supportedFrameRatesArray.length>0){
      callback(supportedFrameRatesArray);
    } else {
      done();
    }
    await releaseVideoSession();
  }
}
async function previewOutputSetFrameRate(done: Function,testName: string,callback: (supportedFrameRatesArray: Array<camera.FrameRateRange>) => void) {
  console.info(TAG, testName);
  if (isEmpty(mCameraDeviceArray)) {
    console.info(TAG, testName + ' mCameraDeviceArray is null.');
    return;
  } else {
    createPhotoOutput();
    await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
    let supportedFrameRatesArray: Array<camera.FrameRateRange> = mPreviewOutput.getSupportedFrameRates();
    console.info(TAG, testName, `The Device is supportedFrameRates: ${JSON.stringify(supportedFrameRatesArray)}`)
    if(supportedFrameRatesArray.length>0){
      callback(supportedFrameRatesArray);
    } else {
      done();
    }
    await releasePhotoSession();
  }
}
export default function cameraSetFrameRateTest() {
  describe('cameraSetFrameRateTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      getCameraManager();
      getSupportedCameraDeviceArray();
      getCameraInput();
      AppStorage.setOrCreate('key', '');
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
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_001
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_001
     * @tc.desc   VideoOutput set frame rate with min:1>max:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_001';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate( 0,  -30);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_002
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_002
     * @tc.desc   VideoOutput set frame rate with min:1>max:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_002';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate(-1, -31);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_004
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_004
     * @tc.desc   VideoOutput set frame rate with min:1>max:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_004';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate(30, -31);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400110');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_005
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_005
     * @tc.desc   VideoOutput set frame rate with min:1>max:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_005';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate(30000, -100000);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400110');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_006
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_006
     * @tc.desc   VideoOutput set frame rate with min:1>max:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_006';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate( 30000, 10000);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_007
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_007
     * @tc.desc   VideoOutput set frame rate with min:null>max:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_007';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate(null, null);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_008
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_008
     * @tc.desc   VideoOutput set frame rate with min:undefined>max:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_008';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate(undefined, undefined);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_009
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_009
     * @tc.desc   VideoOutput set frame rate with min:null>max:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_009';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate(null, undefined);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_010
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_010
     * @tc.desc   VideoOutput set frame rate with min:undefined>max:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_010';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate(undefined, null);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_011
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_011
     * @tc.desc   VideoOutput set frame rate with min:'' > max:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_011';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          let min: number = AppStorage.get('key') as ESObject;
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate(min, null);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_012
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_012
     * @tc.desc   VideoOutput set frame rate with min:null > max:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_012';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        let max: number = AppStorage.get('key') as ESObject;
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate(null, max);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_013
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_013
     * @tc.desc   VideoOutput set frame rate with min:'' > max:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_013';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        let max: number = AppStorage.get('key') as ESObject;
        let min: number = AppStorage.get('key') as ESObject;
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate(min, max);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_014
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_014
     * @tc.desc   VideoOutput set frame rate with min:'string' > max:max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_014';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        AppStorage.setOrCreate('string', 'abcdefghijklmn');
        let min: number = AppStorage.get('string') as ESObject;
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate(min, supportedFrameRatesArray[0]['max']);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_015
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_015
     * @tc.desc   VideoOutput set frame rate with min:min > max:'string'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_015';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        AppStorage.setOrCreate('string', 'abcdefghijklmn');
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate(supportedFrameRatesArray[0]['min'], AppStorage.get('string'));
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${AppStorage.get('string')}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_016
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_016
     * @tc.desc   VideoOutput set frame rate with min:'float' > max:max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_016';
      videoSessionSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        AppStorage.setOrCreate('float', 12345.6);
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mVideoOutput.setFrameRate(AppStorage.get('float'), supportedFrameRatesArray[0]['max']);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${AppStorage.get('float')},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_001
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_001
     * @tc.desc   VideoOutput set frame rate with min:1>max:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_001';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate( 0,  -30);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_002
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_002
     * @tc.desc   VideoOutput set frame rate with min:1>max:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_002';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate(-1, -31);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_003
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_003
     * @tc.desc   VideoOutput set frame rate with min:1>max:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_003';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            let min: number = supportedFrameRatesArray[0]['min'];
            let max: number = supportedFrameRatesArray[0]['max'];
            mPreviewOutput.setFrameRate(min, max);
            let res = mPreviewOutput.getActiveFrameRate();
            expect(res.min).assertEqual(min);
            expect(res.max).assertEqual(max);
            console.info(TAG, testName, "Success getActiveFrameRate Min:",res.min , 'Max:',res.max);
            mPreviewOutput.setFrameRate(max, min);
            res = mPreviewOutput.getActiveFrameRate();
            console.info(TAG, testName, "Success getActiveFrameRate Min:",res.min , 'Max:',res.max);
            expect(res.min).assertEqual(min);
            expect(res.max).assertEqual(max);
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (error) {
          console.error(TAG, testName, 'Failed setFrameRate', JSON.stringify(error), error.code);
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_004
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_004
     * @tc.desc   VideoOutput set frame rate with min:1>max:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_004';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate(30, -31);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400110');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_005
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_005
     * @tc.desc   VideoOutput set frame rate with min:1>max:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_005';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate(30000, -100000);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400110');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_006
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_006
     * @tc.desc   VideoOutput set frame rate with min:1>max:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_006';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate( 30000, 10000);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_007
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_007
     * @tc.desc   VideoOutput set frame rate with min:null>max:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_007';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate(null, null);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_008
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_008
     * @tc.desc   VideoOutput set frame rate with min:undefined>max:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_008';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate(undefined, undefined);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_009
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_009
     * @tc.desc   VideoOutput set frame rate with min:null>max:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_009';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate(null, undefined);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_010
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_010
     * @tc.desc   VideoOutput set frame rate with min:undefined>max:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_010';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate(undefined, null);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_011
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_011
     * @tc.desc   VideoOutput set frame rate with min:'' > max:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_011';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        try {
          let min: number = AppStorage.get('key') as ESObject;
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate(min, null);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_012
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_012
     * @tc.desc   VideoOutput set frame rate with min:null > max:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_012';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        let max: number = AppStorage.get('key') as ESObject;
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate(null, max);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_013
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_013
     * @tc.desc   VideoOutput set frame rate with min:'' > max:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_013';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        let max: number = AppStorage.get('key') as ESObject;
        let min: number = AppStorage.get('key') as ESObject;
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate(min, max);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_014
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_014
     * @tc.desc   VideoOutput set frame rate with min:'string' > max:max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_014';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        AppStorage.setOrCreate('string', 'abcdefghijklmn');
        let min: number = AppStorage.get('string') as ESObject;
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate(min, supportedFrameRatesArray[0]['max']);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_015
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_015
     * @tc.desc   VideoOutput set frame rate with min:min > max:'string'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_015';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        AppStorage.setOrCreate('string', 'abcdefghijklmn');
        // let max: number = AppStorage.get('string') as ESObject;
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate(supportedFrameRatesArray[0]['min'], AppStorage.get('string'));
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${supportedFrameRatesArray[0]['min']},max:${ AppStorage.get('string')}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect(err.code).assertEqual('7400101');
          done();
        }
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_016
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_016
     * @tc.desc   VideoOutput set frame rate with min:'float' > max:max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_016';
      previewOutputSetFrameRate(done,testName ,(supportedFrameRatesArray) => {
        AppStorage.setOrCreate('float', 12345.6);
        // let min: number = AppStorage.get('float') as ESObject;
        try {
          if(supportedFrameRatesArray[0]['max'] > 0){
            console.info(TAG, testName,`supportedFrameRatesArray.length: `,supportedFrameRatesArray.length)
            mPreviewOutput.setFrameRate(AppStorage.get('float'), supportedFrameRatesArray[0]['max']);
            console.info(TAG,testName,`videoOutput set FrameRate min greater than max,min:${AppStorage.get('float')},max:${supportedFrameRatesArray[0]['max']}`)
            done();
          }else {
            console.info(TAG, testName ,'The Device is Not supportedFrameRates');
            done();
          }
        } catch (err) {
          console.error(TAG, testName ,"fail error:",err.message, err.code);
          expect().assertFail();
          done();
        }
      })
    })






  })
}