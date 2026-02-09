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
const TAG = "CameraXts.CameraSessionInputOutputTest";
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
  console.log(TAG, 'createVideoOutput' + videoProfile,'surfaceID', mVideoSurfaceId);
  mVideoOutput = mCameraManager.createVideoOutput(videoProfile, mVideoSurfaceId);
  console.log(TAG, 'create preview output' + mPreviewOutput,'createVideoOutput', mVideoOutput);
}

async function getCreatePhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
  console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
  mPhotoSession.beginConfig();
  mPhotoSession.addInput(mCameraInput);
  await mCameraInput.open();
  mPhotoSession.addOutput(previewOutput);
  mPhotoSession.addOutput(photoOutput);
  await mPhotoSession.commitConfig();
  console.info(TAG, 'getCreatePhotoSession.success',);
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

async function photoSessionCanAddInputTest(testName: string, done: Function, callback: () => void) {
  try {
    createPhotoOutput();
    console.info(TAG, 'getCreatePhotoSession.');
    mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
    console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
    mPhotoSession.beginConfig();
    console.info(TAG, testName + 'beginConfig passed.')
    await mCameraInput.open();
    callback();
    mPhotoSession.addOutput(mPreviewOutput);
    console.info(TAG,testName,"2222222222")
    mPhotoSession.addOutput(mPhotoOutput);
    await mPhotoSession.commitConfig();
    console.info(TAG, 'getCreatePhotoSession.success',);
    await releasePhotoSession();
    done();
  } catch (error) {
    console.info(TAG,testName, `failed; error:`,JSON.stringify(error),error.code);
    expect(error.code).assertUndefined();
    await releasePhotoSession();
    done ();
  }
}

async function photoSessionAddInputTest(testName: string, done: Function, callback: () => void) {
  try {
    createPhotoOutput();
    console.info(TAG, 'getCreatePhotoSession.');
    mPhotoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
    console.info(TAG, 'getCreatePhotoSession.', mPhotoSession);
    mPhotoSession.beginConfig();
    console.info(TAG, testName + 'beginConfig passed.')
    await mCameraInput.open();
    callback();
    mPhotoSession.addOutput(mPreviewOutput);
    mPhotoSession.addOutput(mPhotoOutput);
    await mPhotoSession.commitConfig();
    console.info(TAG, 'getCreatePhotoSession.success',);
    await releasePhotoSession();
    done();
  } catch (error) {
    console.info(TAG,testName, `failed; error:`,JSON.stringify(error),error.code);
    expect(error.code).assertEqual('7400101');
    await releasePhotoSession();
    done ();
  }
}

async function videoSessionCanAddInputTest(testName:string,done:Function,callback:() => void){
  try {
    await createVideoOutput();
    console.info(TAG, 'getCreateVideoSession.');
    mVideoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
    console.info(TAG, 'getCreatePhotoSession.', mVideoSession);
    mVideoSession.beginConfig();
    console.info(TAG, testName + 'beginConfig passed.')
    callback();
    await mCameraInput.open();
    console.info(TAG, testName + 'camera open passed.')
    mVideoSession.addOutput(mPreviewOutput);
    console.info(TAG, testName + 'addOutput mPreviewOutput passed.')
    mVideoSession.addOutput(mVideoOutput);
    console.info(TAG, testName + 'addOutput mVideoOutput passed.')
    await mVideoSession.commitConfig();
    console.info(TAG, testName, 'getCreateVideoSession.success',);
    await releaseVideoSession();
    done();
  } catch (error) {
    console.info(TAG, testName, `failed; error:`, JSON.stringify(error), error.code);
    expect(error.code).assertUndefined();
    await releaseVideoSession();
    done();
  }
}
async function videoSessionAddInputTest(testName:string,done:Function,callback:() => void){
  try {
    await createVideoOutput();
    console.info(TAG, 'getCreateVideoSession.');
    mVideoSession = mCameraManager.createSession(camera.SceneMode.NORMAL_PHOTO);
    console.info(TAG, 'getCreatePhotoSession.', mVideoSession);
    mVideoSession.beginConfig();
    console.info(TAG, testName + 'beginConfig passed.')
    await mCameraInput.open();
    console.info(TAG, testName + 'camera open passed.')
    callback();
    mVideoSession.addOutput(mPreviewOutput);
    console.info(TAG, testName + 'addOutput mPreviewOutput passed.')
    mVideoSession.addOutput(mVideoOutput);
    console.info(TAG, testName + 'addOutput mVideoOutput passed.')
    await mVideoSession.commitConfig();
    console.info(TAG, testName, 'getCreateVideoSession.success',);
    await releaseVideoSession();
    done();
  } catch (error) {
    console.info(TAG, testName, `failed; error:`, JSON.stringify(error), error.code);
    expect(error.code).assertEqual('7400101');
    await releaseVideoSession();
    done();
  }
}
export default function CameraSessionInputOutputTest() {
  describe('CameraSessionInputOutputTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      AppStorage.setOrCreate('emptyString', '')
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
      AppStorage.delete('string1')
      AppStorage.delete('emptyString')
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_001
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_001
     * @tc.desc   canAddInput中PhotoSession的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_001';
      photoSessionCanAddInputTest(testName, done, () => {
        let res = mPhotoSession.canAddInput(null)
        console.info(TAG, testName ,'canAddInput.success', res);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_002
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_002
     * @tc.desc   canAddInput中PhotoSession的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_002';
      photoSessionCanAddInputTest(testName, done, () => {
        let res = mPhotoSession.canAddInput(undefined)
        console.info(TAG,testName , 'canAddInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_003
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_003
     * @tc.desc   canAddInput中PhotoSession的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_003';
      photoSessionCanAddInputTest(testName, done, () => {
        let res = mPhotoSession.canAddInput(AppStorage.get('emptyString'))
        console.info(TAG, testName ,'canAddInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_004
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_004
     * @tc.desc   canAddInput中VideoSession的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_004';
      videoSessionCanAddInputTest(testName, done, () => {
        let res = mVideoSession.canAddInput(null)
        console.info(TAG, testName ,'canAddInput.success', res);
        expect().assertFail();
        done();
      })
    })

      /**
       * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_005
       * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_005
       * @tc.desc   canAddInput中VideoSession的undefined覆盖情况
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_005', Level.LEVEL2, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_005';
        videoSessionCanAddInputTest(testName, done, () => {
          let res = mVideoSession.canAddInput(undefined)
          console.info(TAG, testName ,'canAddInput.success', res);
          expect().assertFail();
        })
      })
      /**
       * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_006
       * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_006
       * @tc.desc   canAddInput中VideoSession的空字符串覆盖情况
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_006', Level.LEVEL2, async (done: Function) => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_006';
        videoSessionCanAddInputTest(testName, done, () => {
          let res = mVideoSession.canAddInput(AppStorage.get('emptyString'))
          console.info(TAG,testName , 'canAddInput.success', res);
          expect().assertFail();
        })
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_007
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_007
     * @tc.desc   canAddOutput中PhotoSession的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_007';
      photoSessionCanAddInputTest(testName, done, () => {
        let res = mPhotoSession.canAddOutput(null)
        console.info(TAG, testName ,'canAddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_008
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_008
     * @tc.desc   canAddOutput中PhotoSession的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_008';
      photoSessionCanAddInputTest(testName, done, () => {
        let res = mPhotoSession.canAddOutput(undefined)
        console.info(TAG, testName ,'canAddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_009
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_009
     * @tc.desc   canAddOutput中PhotoSession的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_009';
      photoSessionCanAddInputTest(testName, done, () => {
        let res = mPhotoSession.canAddOutput(AppStorage.get('emptyString'))
        console.info(TAG, testName ,'canAddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_0010
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_0010
     * @tc.desc   canAddOutput中VideoSession的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_0010', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_0010';
      videoSessionCanAddInputTest(testName, done, () => {
        let res = mVideoSession.canAddOutput(null)
        console.info(TAG,testName , 'canAddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_0011
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_0011
     * @tc.desc   canAddOutput中VideoSession的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_0011', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_0011';
      videoSessionCanAddInputTest(testName, done, () => {
        let res = mVideoSession.canAddOutput(undefined)
        console.info(TAG,testName , 'canAddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_0012
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_0012
     * @tc.desc   canAddOutput中VideoSession的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_0012', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_0012';
      videoSessionCanAddInputTest(testName, done, () => {
        let res = mVideoSession.canAddOutput(AppStorage.get('emptyString'))
        console.info(TAG,testName ,'canAddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0013
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0013
     * @tc.desc   AddInput中PhotoSession的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0013', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0013';
      photoSessionAddInputTest(testName, done, () => {
        let res = mPhotoSession.addInput(null)
        console.info(TAG, testName ,'AddInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0014
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0014
     * @tc.desc   AddInput中PhotoSession的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0014', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0014';
      photoSessionAddInputTest(testName, done, () => {
        let res = mPhotoSession.addInput(undefined)
        console.info(TAG,testName , 'AddInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0015
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0015
     * @tc.desc   AddInput中PhotoSession的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0015', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0015';
      photoSessionAddInputTest(testName, done, () => {
        let res = mPhotoSession.addInput(AppStorage.get('emptyString'))
        console.info(TAG, testName ,'AddInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0016
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0016
     * @tc.desc   AddInput中VideoSession的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0016', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0016';
      videoSessionAddInputTest(testName, done, () => {
        let res = mVideoSession.addInput(null)
        console.info(TAG, testName ,'AddInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0017
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0017
     * @tc.desc   AddInput中VideoSession的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0017', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0017';
      videoSessionAddInputTest(testName, done, () => {
        let res = mVideoSession.addInput(undefined)
        console.info(TAG, testName ,'AddInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0018
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0018
     * @tc.desc   AddInput中VideoSession的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0018', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ADD_INPUT_0018';
      videoSessionAddInputTest(testName, done, () => {
        let res = mVideoSession.addInput(AppStorage.get('emptyString'))
        console.info(TAG,testName , 'AddInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0019
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0019
     * @tc.desc   AddOutput中PhotoSession的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0019', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUT_PUT_0019';
      photoSessionAddInputTest(testName, done, () => {
        let res = mPhotoSession.addOutput(null)
        console.info(TAG, testName ,'AddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0020
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0020
     * @tc.desc   AddOutput中PhotoSession的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0020', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUT_PUT_0020';
      photoSessionAddInputTest(testName, done, () => {
        let res = mPhotoSession.addOutput(undefined)
        console.info(TAG,testName , 'AddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0021
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0021
     * @tc.desc   AddOutput中PhotoSession的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0021', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUT_PUT_0021';
      photoSessionAddInputTest(testName, done, () => {
        let res = mPhotoSession.addOutput(AppStorage.get("emptyString"))
        console.info(TAG,testName , 'AddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0022
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0022
     * @tc.desc   AddOutput中VideoSession的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0022', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUT_PUT_0022';
      videoSessionAddInputTest(testName, done, () => {
        let res = mVideoSession.addOutput(null)
        console.info(TAG,testName , 'AddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0023
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0023
     * @tc.desc   AddOutput中VideoSession的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0023', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUT_PUT_0023';
      videoSessionAddInputTest(testName, done, () => {
        let res = mVideoSession.addOutput(undefined)
        console.info(TAG, testName ,'AddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0024
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0024
     * @tc.desc   AddOutput中VideoSession的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUTPUT_0024', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ADD_OUT_PUT_0024';
      videoSessionAddInputTest(testName, done, () => {
        let res = mVideoSession.addOutput(AppStorage.get('emptyString'))
        console.info(TAG, testName ,'AddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0025
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0025
     * @tc.desc   removeInput中PhotoSession的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0025', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0025';
      photoSessionAddInputTest(testName, done, () => {
        let res = mPhotoSession.removeInput(null)
        console.info(TAG, testName ,'removeInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0026
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0026
     * @tc.desc   removeInput中PhotoSession的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0026', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0026';
      photoSessionAddInputTest(testName, done, () => {
        let res = mPhotoSession.removeInput(undefined)
        console.info(TAG, testName ,'removeInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0027
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0027
     * @tc.desc   removeInput中PhotoSession的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0027', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0027';
      photoSessionAddInputTest(testName, done, () => {
        let res = mPhotoSession.removeInput(AppStorage.get('emptyString'))
        console.info(TAG, testName ,'removeInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0028
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0028
     * @tc.desc   removeInput中VideoSession的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0028', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0028';
      videoSessionAddInputTest(testName, done, () => {
        let res = mVideoSession.removeInput(null)
        console.info(TAG,testName , 'removeInput.success', res);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0029
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0029
     * @tc.desc   removeInput中VideoSession的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0029', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0029';
      videoSessionAddInputTest(testName, done, () => {
        let res = mVideoSession.removeInput(undefined)
        console.info(TAG,testName , 'removeInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0030
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0030
     * @tc.desc   removeInput中VideoSession的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0030', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_INPUT_0030';
      videoSessionAddInputTest(testName, done, () => {
        let res = mVideoSession.removeInput(AppStorage.get('emptyString'))
        console.info(TAG,testName ,'removeInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0031
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0031
     * @tc.desc   removeOutput中PhotoSession的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0031', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0031';
      photoSessionAddInputTest(testName, done, () => {
        let res = mPhotoSession.removeOutput(null)
        console.info(TAG,testName , 'removeOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0032
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0032
     * @tc.desc   removeOutput中PhotoSession的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0032', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0032';
      photoSessionAddInputTest(testName, done, () => {
        let res = mPhotoSession.removeOutput(undefined)
        console.info(TAG, testName ,'removeOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0033
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0033
     * @tc.desc   removeOutput中PhotoSession的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0033', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0033';
      photoSessionAddInputTest(testName, done, () => {
        let res = mPhotoSession.removeOutput(AppStorage.get('emptyString'))
        console.info(TAG, testName ,'removeOutput.success', res);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0034
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0034
     * @tc.desc   removeOutput中VideoSession的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0034', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0034';
      videoSessionAddInputTest(testName, done, () => {
        let res = mVideoSession.removeOutput(null)
        console.info(TAG, testName ,'removeOutput.success', res);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0035
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0035
     * @tc.desc   removeOutput中VideoSession的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0035', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0035';
      videoSessionAddInputTest(testName, done, () => {
        let res = mVideoSession.removeOutput(undefined)
        console.info(TAG, testName ,'removeOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0036
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0036
     * @tc.desc   removeOutput中VideoSession的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0036', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_REMOVE_OUTPUT_0036';
      videoSessionAddInputTest(testName, done, () => {
        let res = mVideoSession.removeOutput(AppStorage.get('emptyString'))
        console.info(TAG, testName ,'removeOutput.success', res);
        expect().assertFail();
      })
    })
  })
}
