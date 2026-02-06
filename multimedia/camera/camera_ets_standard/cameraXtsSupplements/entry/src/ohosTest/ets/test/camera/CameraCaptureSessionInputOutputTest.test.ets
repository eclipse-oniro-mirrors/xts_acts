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
  sceneMode,
  sleep
} from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import { BusinessError } from '@kit.BasicServicesKit';
import { media } from '@kit.MediaKit';
import { tag } from '@kit.ConnectivityKit';
import { JSON } from '@kit.ArkTS';

const TAG = "CameraXts.DeprecatedCaptureSession";
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
let mCaptureSession: camera.CaptureSession;
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

async function getCreateCaptureSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreateCaptureSession.');
  mCaptureSession = mCameraManager.createCaptureSession();
  console.info(TAG, 'getCreateCaptureSession.', mCaptureSession);
  mCaptureSession.beginConfig();
  mCaptureSession.addInput(mCameraInput);
  await mCameraInput.open();
  mCaptureSession.addOutput(previewOutput);
  mCaptureSession.addOutput(photoOutput);
  await mCaptureSession.commitConfig();
  mCaptureSession.start();
}

async function releaseCaptureSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mCaptureSession?.release();
}
async function captureSessionAddInputTest(testName: string, done: Function, callback: () => void) {
  try {
    createPhotoOutput();
    console.info(TAG, 'getCreateCaptureSession.');
    mCaptureSession = mCameraManager.createCaptureSession();
    console.info(TAG, 'getCreateCaptureSession.', mCaptureSession);
    mCaptureSession.beginConfig();
    console.info(TAG, testName + 'beginConfig passed.')
    let res = mCaptureSession.addInput(mCameraInput);
    console.log(TAG,testName,res,'addInput')
    await mCameraInput.open();
    mCaptureSession.addOutput(mPreviewOutput);
    mCaptureSession.addOutput(mPhotoOutput);
    callback();
    await mCaptureSession.commitConfig();
    console.info(TAG, 'getCreatePhotoSession.success',);
    mCaptureSession.start();
    await releaseCaptureSession();
    done();
  } catch (error) {
    console.info(TAG,testName, `failed; error:`,JSON.stringify(error),error.code);
    expect(error.code).assertEqual('7400101');
    await releaseCaptureSession();
    done ();
  }
}


export default function CameraCaptureSessionInputOutputTest() {
  describe('CameraCaptureSessionInputOutputTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      getCameraManager();
      getSupportedCameraDeviceArray();
      getCameraInput();
      await getVideoSurfaceId();
      AppStorage.setOrCreate('test', [])
      AppStorage.setOrCreate('emptyString','')

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
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_ADD_INPUT_001
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_ADD_INPUT_001
     * @tc.desc   CaptureSession中AddInput的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_ADD_INPUT_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_ADD_INPUT_001'
      captureSessionAddInputTest(testName, done, () => {
        let res = mCaptureSession.addInput(null)
        console.info(TAG, testName,'AddInput.success', res);
        expect().assertFail();
      })
      })
    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_ADD_INPUT_002
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_ADD_INPUT_002
     * @tc.desc   CaptureSession中AddInput的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_ADD_INPUT_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_ADD_INPUT_002'
      captureSessionAddInputTest(testName, done, () => {
        let res = mCaptureSession.addInput(undefined)
        console.info(TAG, testName,'AddInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_ADD_INPUT_003
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_ADD_INPUT_003
     * @tc.desc   CaptureSession中AddInput的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_ADD_INPUT_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_ADD_INPUT_003'
      captureSessionAddInputTest(testName, done, () => {
        let res = mCaptureSession.addInput(AppStorage.get('emptyString'))
        console.info(TAG, testName,'AddInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_ADD_OUTPUT_004
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_ADD_OUTPUT_004
     * @tc.desc   CaptureSession中AddOutput的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_ADD_OUTPUT_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_ADD_OUTPUT_004'
      captureSessionAddInputTest(testName, done, () => {
        let res = mCaptureSession.addOutput(null)
        console.info(TAG, testName,'AddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_ADD_OUTPUT_005
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_ADD_OUTPUT_005
     * @tc.desc   CaptureSession中AddOutput的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_ADD_OUTPUT_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_ADD_OUTPUT_005'
      captureSessionAddInputTest(testName, done, () => {
        let res = mCaptureSession.addOutput(undefined)
        console.info(TAG,testName, 'AddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_ADD_OUTPUT_006
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_ADD_OUTPUT_006
     * @tc.desc   CaptureSession中AddOutput的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_ADD_OUTPUT_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_ADD_OUTPUT_006'
      captureSessionAddInputTest(testName, done, () => {
        let res = mCaptureSession.addOutput(AppStorage.get('emptyString'))
        console.info(TAG,testName, 'AddOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_INPUT_007
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_INPUT_007
     * @tc.desc   CaptureSession中RemoveInput的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_INPUT_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_INPUT_007'
      captureSessionAddInputTest(testName, done, () => {
        let res = mCaptureSession.removeInput(null)
        console.info(TAG,testName, 'RemoveInput.success', res);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_INPUT_008
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_INPUT_008
     * @tc.desc   CaptureSession中RemoveInput的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_INPUT_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_INPUT_008'
      captureSessionAddInputTest(testName, done, () => {
        let res = mCaptureSession.removeInput(null)
        console.info(TAG, testName,'RemoveInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_INPUT_009
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_INPUT_009
     * @tc.desc   CaptureSession中RemoveInput的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_INPUT_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_INPUT_009'
      captureSessionAddInputTest(testName, done, () => {
        let res = mCaptureSession.removeInput(AppStorage.get('emptyString'))
        console.info(TAG, testName,'RemoveInput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_OUTPUT_0010
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_OUTPUT_0010
     * @tc.desc   CaptureSession中RemoveOutput的null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_OUTPUT_0010', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_OUTPUT_0010'
      captureSessionAddInputTest(testName, done, () => {
        let res = mCaptureSession.removeOutput(null)
        console.info(TAG, testName,'RemoveOutput.success', res);
        expect().assertFail();
      })
    })
    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_OUTPUT_0011
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_OUTPUT_0011
     * @tc.desc   CaptureSession中RemoveOutput的undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_OUTPUT_0011', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_OUTPUT_0011'
      captureSessionAddInputTest(testName, done, () => {
        let res = mCaptureSession.removeOutput(undefined)
        console.info(TAG,testName, 'RemoveOutput.success', res);
        expect().assertFail();
      })
    })

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_OUTPUT_0012
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_OUTPUT_0012
     * @tc.desc   CaptureSession中RemoveOutput的空字符串覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_OUTPUT_0012', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_REMOVE_OUTPUT_0012'
      captureSessionAddInputTest(testName, done, () => {
        let res = mCaptureSession.removeOutput(AppStorage.get('emptyString'))
        console.info(TAG, testName,'RemoveOutput.success', res);
        expect().assertFail();
      })
    })
  })
}