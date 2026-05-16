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
const TAG = "CameraManagerGetCameraDevicesTestSupp";
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

export default function CameraManagerGetCameraDevicesTest() {
  describe('CameraManagerGetCameraDevicesTest', () => {
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
      AppStorage.delete('emptyString')
    });

    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_001
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_001
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_001';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_DEFAULT;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_002
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_002
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_002';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_DEFAULT;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_003
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_003
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_003';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_DEFAULT;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_004
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_004
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_004';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_DEFAULT;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_005
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_005
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_005';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_006
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_006
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_006';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_007
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_007
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_007';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG, testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        console.info(TAG, testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG, testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_008
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_008
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_008';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_009
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_009
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_009';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0010
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0010
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0010', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0010';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0011
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0011
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0011', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0011';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0012
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0012
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0012', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0012';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0013
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0013
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0013', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0013';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0014
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0014
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0014', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0014';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0015
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0015
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0015', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0015';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0016
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0016
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0016', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0016';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0017
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0017
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0017', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0017';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0018
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0018
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0018', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0018';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0019
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0019
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0019', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0019';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0020
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0020
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0020', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0020';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FOLD_INNER;
        console.info(TAG,testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
        console.info(TAG,testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG,testName, 'device');
        expect(device.cameraId.length > 0).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0021
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0021
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0021', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0021';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG, testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        console.info(TAG, testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG, testName, 'device');
        expect(device.connectionType !== null).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0022
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0022
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0022', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0022';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG, testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        console.info(TAG, testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG, testName, 'device');
        expect(device.cameraPosition != null).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0023
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0023
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0023', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0023';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG, testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        console.info(TAG, testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG, testName, 'device');
        expect(device.hostDeviceType != null).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0024
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0024
     * @tc.desc   getCameraDevice Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0024', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICE_0024';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG, testName, 'position');
        let type = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        console.info(TAG, testName, 'type');
        let device = mCameraManager?.getCameraDevice(position, type)
        console.info(TAG, testName, 'device');
        expect(device.cameraOrientation >= 0 && device.cameraOrientation <= 360).assertTrue();
        expect(device.cameraPosition).assertEqual(position);
        expect(device.cameraType).assertEqual(type);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_001
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_001
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_001';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_DEFAULT;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_002
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_002
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_002';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_003
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_003
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_003';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_DEFAULT;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_004
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_004
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_004';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_005
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_005
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_005';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_006
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_006
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_006';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_007
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_007
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_007';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_DEFAULT;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_008
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_008
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_008';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_009
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_009
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_009';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0010
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0010
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0010', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0010';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0011
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0011
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0011', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0011';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0012
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0012
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0012', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0012';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_DEFAULT;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0013
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0013
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0013', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0013';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0014
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0014
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0014', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0014';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0015
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0015
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0015', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0015';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0016
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0016
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0016', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0016';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0017
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0017
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0017', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0017';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0018
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0018
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0018', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0018';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0019
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0019
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0019', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0019';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0020
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0020
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0020', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0020';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_FRONT;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0021
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0021
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0021', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0021';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_DEFAULT;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0022
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0022
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0022', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0022';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_ULTRA_WIDE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0023
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0023
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0023', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0023';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_REMOTE;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_WIDE_ANGLE;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0024
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0024
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0024', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0024';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_TRUE_DEPTH;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0025
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0025
     * @tc.desc   getCameraDevices Camera service fatal error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0025', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0025';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_TELEPHOTO;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400201);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0026
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0026
     * @tc.desc   getCameraDevices Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0026', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0026';
      try {
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_DEFAULT;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(null, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0027
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0027
     * @tc.desc   getCameraDevices Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0027', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0027';
      try {
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
        console.info(TAG,'connectType')
        let types = camera.CameraType.CAMERA_TYPE_DEFAULT;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(undefined, [types], connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0028
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0028
     * @tc.desc   getCameraDevices Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0028', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0028';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let types = camera.CameraType.CAMERA_TYPE_DEFAULT;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], null)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0029
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0029
     * @tc.desc   getCameraDevices Parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0029', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0029';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let types = camera.CameraType.CAMERA_TYPE_DEFAULT;
        console.info(TAG,testName, 'type');
        let device = mCameraManager.getCameraDevices(position, [types], undefined)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].cameraPosition).assertEqual(position);
        expect(device[0].cameraType).assertEqual(types);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0030
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0030
     * @tc.desc   getCameraDevices Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0030', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0030';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
        console.info(TAG,'connectType')
        let device = mCameraManager.getCameraDevices(position, null, connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400101);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0031
     * @tc.number SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0031
     * @tc.desc   getCameraDevices Parameter missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0031', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_MANAGER_GET_CAMERA_DEVICES_0031';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_BACK;
        console.info(TAG,testName, 'position');
        let connectType = camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN;
        console.info(TAG,'connectType')
        let device = mCameraManager.getCameraDevices(position, undefined, connectType)
        console.info(TAG,testName, 'device');
        expect(device[0].cameraId.length > 0).assertTrue();
        expect(device[0].connectionType).assertEqual(connectType);
        expect(device[0].cameraPosition).assertEqual(position);
        done();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7400101);
        done();
      }
    })
  })
}



