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
import CameraManagerCreatePhotoOutputTest from './CameraManagerCreatePhotoOutputTest.test';
import { colorSpaceManager } from '@kit.ArkGraphics2D';

const TAG = "CameraTestSupp";
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput;
let mPreviewProfile: camera.Profile;
let mPhotoProfile: camera.Profile;
let mPhotoOutput: camera.PhotoOutput;
let mVideoOutput: camera.VideoOutput;
let mVideoSurfaceId: string;
let mMetadataOutput: camera.MetadataOutput;
let mPhotoSession: camera.PhotoSession;
let mVideoSession: camera.VideoSession;
let mCaptureSession: camera.CaptureSession;
let mCameraSession: camera.SecureSession;
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
  mPreviewProfile = previewProfile;
  mPhotoProfile = photoProfile;
  mPreviewOutput = mCameraManager.createPreviewOutput(previewProfile, indexSurfaceId);
  mPhotoOutput = mCameraManager.createPhotoOutput(photoProfile);
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


async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mPhotoSession?.release();
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


let createSecureSessionInstance = () => {
  console.info('Enter createSecureSessionInstance');
  try {
    mCameraSession = mCameraManager.createSession(12);
  } catch {
    console.info('createSecureSessionInstance FAILED');
  }
  if (isEmpty(mCameraSession)) {
    console.info(TAG + "createSecureSessionInstance FAILED");
    return false;
  }
  mCameraSession.beginConfig();
  console.info('Exit createSecureSessionInstance');
  return true;
}

let releaseCameraSessionInstance = async () => {
  await mCameraSession.release();
}


async function releaseVideoSession() {
  console.info(TAG, 'releaseVideoSession.');
  await mAVRecorder?.release();
  await mPreviewOutput?.release();
  await mVideoOutput?.release();
  await mVideoSession?.release();
}

export default function CameraTest() {
  describe('CameraTest', () => {
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
     * @tc.name   SUB_CAMERA_SESSION_ADD_SECURE_OUTPUT_001
     * @tc.number SUB_CAMERA_SESSION_ADD_SECURE_OUTPUT_001
     * @tc.desc   addSecureOutput null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_SESSION_ADD_SECURE_OUTPUT_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_SESSION_ADD_SECURE_OUTPUT_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createSecureSessionInstance();
        console.info(TAG, 'getCreatePhotoSession');
        mCameraSession.addSecureOutput(null);
        console.info(TAG, testName, 'success addSecureOutput');
        expect().assertFail();
        await releaseCameraSessionInstance();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(Number(err.code)).assertEqual(7400101)
        await releaseCameraSessionInstance();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_SESSION_ADD_SECURE_OUTPUT_002
     * @tc.number SUB_CAMERA_SESSION_ADD_SECURE_OUTPUT_002
     * @tc.desc   addSecureOutput undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_SESSION_ADD_SECURE_OUTPUT_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_SESSION_ADD_SECURE_OUTPUT_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createSecureSessionInstance();
        console.info(TAG, 'getCreatePhotoSession');
        mCameraSession.addSecureOutput(undefined);
        console.info(TAG, testName, 'success addSecureOutput');
        expect().assertFail();
        await releaseCameraSessionInstance();
        done();
      } catch (err) {
        console.error(TAG, testName, err.message, err.code);
        expect(Number(err.code)).assertEqual(7400101)
        await releaseCameraSessionInstance();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_ADD_METADATA_OUTPUT_OBJECT_TYPES_001
     * @tc.number SUB_CAMERA_ADD_METADATA_OUTPUT_OBJECT_TYPES_001
     * @tc.desc   addMetadataObjectTypes null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_ADD_METADATA_OUTPUT_OBJECT_TYPES_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_ADD_METADATA_OUTPUT_OBJECT_TYPES_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let useDevice: camera.CameraDevice = mCameraDeviceArray[0];
      console.log(TAG, testName, `camera.CameraDevice：${useDevice}`);
      try {
        mMetadataOutput = mCameraManager.createMetadataOutput([
          camera.MetadataObjectType.FACE_DETECTION,
        ]);
        let metaDataoutputCapability = mCameraManager.getSupportedOutputCapability(useDevice);
        const types = metaDataoutputCapability.supportedMetadataObjectTypes;
        console.log(TAG, testName, `相机支持的元数据类型：${types}`);
        mMetadataOutput.addMetadataObjectTypes(null);
        console.info(TAG, testName, `addMetadataObjectTypes successs`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect(Number(err.code)).assertEqual(7400103)
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_ADD_METADATA_OUTPUT_OBJECT_TYPES_002
     * @tc.number SUB_CAMERA_ADD_METADATA_OUTPUT_OBJECT_TYPES_002
     * @tc.desc   addMetadataObjectTypes undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_ADD_METADATA_OUTPUT_OBJECT_TYPES_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_ADD_METADATA_OUTPUT_OBJECT_TYPES_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let useDevice: camera.CameraDevice = mCameraDeviceArray[0];
      console.log(TAG, testName, `camera.CameraDevice：${useDevice}`);
      try {
        mMetadataOutput = mCameraManager.createMetadataOutput([
          camera.MetadataObjectType.FACE_DETECTION,
        ]);
        let metaDataoutputCapability = mCameraManager.getSupportedOutputCapability(useDevice);
        const types = metaDataoutputCapability.supportedMetadataObjectTypes;
        console.log(TAG, testName, `相机支持的元数据类型：${types}`);
        mMetadataOutput.addMetadataObjectTypes(undefined);
        console.info(TAG, testName, `addMetadataObjectTypes successs`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect(Number(err.code)).assertEqual(7400103)
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_ADD_METADATA_OUTPUT_OBJECT_TYPES_003
     * @tc.number SUB_CAMERA_ADD_METADATA_OUTPUT_OBJECT_TYPES_003
     * @tc.desc   addMetadataObjectTypes 空值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_ADD_METADATA_OUTPUT_OBJECT_TYPES_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_ADD_METADATA_OUTPUT_OBJECT_TYPES_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let useDevice: camera.CameraDevice = mCameraDeviceArray[0];
      console.log(TAG, testName, `camera.CameraDevice：${useDevice}`);
      try {
        mMetadataOutput = mCameraManager.createMetadataOutput([
          camera.MetadataObjectType.FACE_DETECTION,
        ]);
        let metaDataoutputCapability = mCameraManager.getSupportedOutputCapability(useDevice);
        const types = metaDataoutputCapability.supportedMetadataObjectTypes;
        console.log(TAG, testName, `相机支持的元数据类型：${types}`);
        mMetadataOutput.addMetadataObjectTypes([]);
        console.info(TAG, testName, `addMetadataObjectTypes successs`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect(Number(err.code)).assertEqual(7400103)
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_REMOVE_METADATA_OUTPUT_OBJECT_TYPES_001
     * @tc.number SUB_CAMERA_REMOVE_METADATA_OUTPUT_OBJECT_TYPES_001
     * @tc.desc   removeMetadataObjectTypes null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_REMOVE_METADATA_OUTPUT_OBJECT_TYPES_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_REMOVE_METADATA_OUTPUT_OBJECT_TYPES_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let useDevice: camera.CameraDevice = mCameraDeviceArray[0];
      console.log(TAG, testName, `camera.CameraDevice：${useDevice}`);
      try {
        mMetadataOutput = mCameraManager.createMetadataOutput([
          camera.MetadataObjectType.FACE_DETECTION,
        ]);
        let metaDataoutputCapability = mCameraManager.getSupportedOutputCapability(useDevice);
        const types = metaDataoutputCapability.supportedMetadataObjectTypes;
        console.log(TAG, testName, `相机支持的元数据类型：${types}`);
        mMetadataOutput.removeMetadataObjectTypes(null);
        console.info(TAG, testName, `removeMetadataObjectTypes successs`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect(Number(err.code)).assertEqual(7400103)
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_REMOVE_METADATA_OUTPUT_OBJECT_TYPES_002
     * @tc.number SUB_CAMERA_REMOVE_METADATA_OUTPUT_OBJECT_TYPES_002
     * @tc.desc   removeMetadataObjectTypes undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_REMOVE_METADATA_OUTPUT_OBJECT_TYPES_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_REMOVE_METADATA_OUTPUT_OBJECT_TYPES_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let useDevice: camera.CameraDevice = mCameraDeviceArray[0];
      console.log(TAG, testName, `camera.CameraDevice：${useDevice}`);
      try {
        mMetadataOutput = mCameraManager.createMetadataOutput([
          camera.MetadataObjectType.FACE_DETECTION,
        ]);
        let metaDataoutputCapability = mCameraManager.getSupportedOutputCapability(useDevice);
        const types = metaDataoutputCapability.supportedMetadataObjectTypes;
        console.log(TAG, testName, `相机支持的元数据类型：${types}`);
        mMetadataOutput.removeMetadataObjectTypes(undefined);
        console.info(TAG, testName, `removeMetadataObjectTypes successs`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect(Number(err.code)).assertEqual(7400103)
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_REMOVE_METADATA_OUTPUT_OBJECT_TYPES_003
     * @tc.number SUB_CAMERA_REMOVE_METADATA_OUTPUT_OBJECT_TYPES_003
     * @tc.desc   removeMetadataObjectTypes 空值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_REMOVE_METADATA_OUTPUT_OBJECT_TYPES_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_REMOVE_METADATA_OUTPUT_OBJECT_TYPES_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      let useDevice: camera.CameraDevice = mCameraDeviceArray[0];
      console.log(TAG, testName, `camera.CameraDevice：${useDevice}`);
      try {
        mMetadataOutput = mCameraManager.createMetadataOutput([
          camera.MetadataObjectType.FACE_DETECTION,
        ]);
        let metaDataoutputCapability = mCameraManager.getSupportedOutputCapability(useDevice);
        const types = metaDataoutputCapability.supportedMetadataObjectTypes;
        console.log(TAG, testName, `相机支持的元数据类型：${types}`);
        mMetadataOutput.removeMetadataObjectTypes([]);
        console.info(TAG, testName, `removeMetadataObjectTypes successs`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect(Number(err.code)).assertEqual(7400103)
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_GET_PHOTO_ROTATION_001
     * @tc.number SUB_CAMERA_GET_PHOTO_ROTATION_001
     * @tc.desc   getPhotoRotation null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_GET_PHOTO_ROTATION_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_GET_PHOTO_ROTATION_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoOutput.getPhotoRotation(null);
        console.info(TAG, testName, 'success getPhotoRotation');
        expect().assertFail()
        await releasePhotoSession();
        done()
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect(Number(err.code)).assertEqual(7400101)
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_GET_PHOTO_ROTATION_002
     * @tc.number SUB_CAMERA_GET_PHOTO_ROTATION_002
     * @tc.desc   getPhotoRotation undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_GET_PHOTO_ROTATION_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_GET_PHOTO_ROTATION_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
        mPhotoOutput.getPhotoRotation(undefined);
        console.info(TAG, testName, 'success getPhotoRotation');
        expect().assertFail()
        await releasePhotoSession();
        done()
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect(Number(err.code)).assertEqual(7400101)
        await releasePhotoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_GET_ACTIVE_PROFILE_001
     * @tc.number SUB_CAMERA_GET_ACTIVE_PROFILE_001
     * @tc.desc   getActiveProfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_GET_ACTIVE_PROFILE_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_GET_ACTIVE_PROFILE_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput()
        let newProfile = mPhotoOutput.getActiveProfile();
        console.info(TAG, 'newProfile')
        expect(isEmpty(newProfile.format)).assertFalse();
        expect(isEmpty(newProfile.size)).assertFalse();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_GET_ACTIVE_PROFILE_0001
     * @tc.number SUB_CAMERA_GET_ACTIVE_PROFILE_0001
     * @tc.desc   getActiveProfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_GET_ACTIVE_PROFILE_0001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_GET_ACTIVE_PROFILE_0001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput()
        let newProfile = mPreviewOutput.getActiveProfile();
        console.info(TAG, 'newProfile', JSON.stringify(newProfile))
        expect(newProfile.format == mPreviewProfile.format).assertTrue();
        expect(newProfile.size.width).assertEqual(mPreviewProfile.size.width);
        expect(newProfile.size.height).assertEqual(mPreviewProfile.size.height);
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_GET_PREVIEW_ROTATION_001
     * @tc.number SUB_CAMERA_GET_PREVIEW_ROTATION_001
     * @tc.desc   getPreviewRotation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_GET_PREVIEW_ROTATION_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_GET_PREVIEW_ROTATION_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        await createVideoOutput();
        await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
        let imageRotation: camera.ImageRotation = camera.ImageRotation.ROTATION_270;
        mPreviewOutput.setPreviewRotation(imageRotation);
        let res: camera.ImageRotation = mPreviewOutput.getPreviewRotation()
        console.info(TAG, testName, 'getPreviewOutputRotation, expected: ', res, 'actual: ', imageRotation);
        expect(res == camera.ImageRotation.ROTATION_0 ||
          res == camera.ImageRotation.ROTATION_90 ||
          res == camera.ImageRotation.ROTATION_180 ||
          res == camera.ImageRotation.ROTATION_270).assertTrue();
        await releaseVideoSession();
        done()
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_GET_PREVIEW_ROTATION_002
     * @tc.number SUB_CAMERA_GET_PREVIEW_ROTATION_002
     * @tc.desc   getPreviewRotation null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_GET_PREVIEW_ROTATION_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_GET_PREVIEW_ROTATION_002';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        await createVideoOutput();
        await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
        mPreviewOutput.getPreviewRotation(null)
        console.info(TAG, testName, 'success getPreviewRotation');
        expect().assertFail();
        await releaseVideoSession();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect(Number(err.code)).assertEqual(7400101)
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_GET_PREVIEW_ROTATION_003
     * @tc.number SUB_CAMERA_GET_PREVIEW_ROTATION_003
     * @tc.desc   getPreviewRotation undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_GET_PREVIEW_ROTATION_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_GET_PREVIEW_ROTATION_003';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        await createVideoOutput();
        await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
        mPreviewOutput.getPreviewRotation(undefined)
        console.info(TAG, testName, 'success getPreviewRotation');
        expect().assertFail();
        await releaseVideoSession();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect(Number(err.code)).assertEqual(7400101)
        await releaseVideoSession();
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_SET_PREVIEW_ROTATION_001
     * @tc.number SUB_CAMERA_SET_PREVIEW_ROTATION_001
     * @tc.desc   setPreviewRotation 第一个参数枚举覆盖 第二个参数true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_SET_PREVIEW_ROTATION_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_SET_PREVIEW_ROTATION_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      const formats =
        [camera.ImageRotation.ROTATION_90, camera.ImageRotation.ROTATION_180, camera.ImageRotation.ROTATION_270]
      for (const format of formats) {
        try {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
          console.info(TAG, 'start')
          let previewRotation: camera.ImageRotation = format;
          mPreviewOutput.setPreviewRotation(previewRotation, true);
          console.info(TAG, 'success setPreviewRotation')
          let res: camera.ImageRotation = mPreviewOutput.getPreviewRotation()
          console.info(TAG, testName, 'getPreviewOutputRotation, expected: ', res, 'actual: ', previewRotation);
          expect(res == camera.ImageRotation.ROTATION_0 ||
            res == camera.ImageRotation.ROTATION_90 ||
            res == camera.ImageRotation.ROTATION_180 ||
            res == camera.ImageRotation.ROTATION_270).assertTrue();
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          done();
        } finally {
          await mAVRecorder?.release();
          await mPreviewOutput?.release();
          await mVideoOutput?.release();
          await mVideoSession?.release();
        }
      }
      done();
    })
    /**
     * @tc.name   SUB_CAMERA_GET_FOCUS_POINT_001
     * @tc.number SUB_CAMERA_GET_FOCUS_POINT_001
     * @tc.desc   getFocusPoint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_GET_FOCUS_POINT_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_GET_FOCUS_POINT_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      try {
        createPhotoOutput()
        let res = mPhotoSession.getFocusPoint();
        console.info(TAG, 'newProfile')
        expect(isEmpty(res.x)).assertFalse();
        expect(isEmpty(res.y)).assertFalse();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect(Number(err.code)).assertEqual(7400103);
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_001
     * @tc.number SUB_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_001
     * @tc.desc   enableMirror  false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_001', Level.LEVEL2, async (done: Function) => {
      let testName: string = "SUB_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_001";
      try {
        if (isEmpty(mCameraManager)) {
          console.info(TAG, testName, `cameraManager is null.`);
          done();
          return;
        }
        console.info(TAG, testName, 'Start');
        await createVideoOutput();
        await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
        if (mPhotoOutput.isMovingPhotoSupported()) {
          if (mVideoOutput.isMirrorSupported()) {
            mVideoOutput.enableMirror(false);
            console.info(TAG, testName, `success`);
          } else {
            console.error(TAG, testName, '不支持镜像录像')
          }
        } else {
          console.error(TAG, testName, '不支持动态照片拍摄')
        }
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      } finally {
        await mAVRecorder?.release();
        await mPreviewOutput?.release();
        await mVideoOutput?.release();
        await mVideoSession?.release();
      }
      done();
    });
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_IS_FLASH_MODE_SUPPORTED_001
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_IS_FLASH_MODE_SUPPORTED_001
     * @tc.desc   isFlashModeSupported FlashMode FLASH_MODE_CLOSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_IS_FLASH_MODE_SUPPORTED_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_IS_FLASH_MODE_SUPPORTED_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      const formats =
        [camera.FlashMode.FLASH_MODE_CLOSE, camera.FlashMode.FLASH_MODE_OPEN, camera.FlashMode.FLASH_MODE_ALWAYS_OPEN]
      for (const format of formats) {
        try {
          createPhotoOutput();
          await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
          console.info(TAG, 'getCreateCaptureSession');
          let flashMode: camera.FlashMode = format
          let res = mCaptureSession.isFlashModeSupported(flashMode);
          console.info(TAG, 'success isFlashModeSupported')
          expect(isEmpty(res)).assertFalse()
          await releaseCaptureSession()
          done();
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail()
        }
        await releaseCaptureSession()
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_IS_FOCUS_MODE_SUPPORTED_001
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_IS_FOCUS_MODE_SUPPORTED_001
     * @tc.desc   isFocusModeSupported afMode FOCUS_MODE_CONTINUOUS_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_IS_FOCUS_MODE_SUPPORTED_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_IS_FOCUS_MODE_SUPPORTED_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }

      const formats = [camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO]
      for (const format of formats) {
        try {
          createPhotoOutput();
          await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
          console.info(TAG, 'getCreateCaptureSession');
          let afMode: camera.FocusMode = format
          let res = mCaptureSession.isFocusModeSupported(afMode);
          console.info(TAG, 'success isFocusModeSupported')
          expect(isEmpty(res)).assertFalse()
          await releaseCaptureSession()
          done();
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail()
        }
        await releaseCaptureSession()
        done();
      }
    })
    /**
     * @tc.name   SUB_CAMERA_CAPTURE_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_001
     * @tc.number SUB_CAMERA_CAPTURE_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_001
     * @tc.desc   isVideoStabilizationModeSupported VideoStabilizationMode OFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAMERA_CAPTURE_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAMERA_CAPTURE_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_001';
      if (isEmpty(mCameraManager)) {
        console.info(TAG, `${testName} cameraManager is null.`);
        done();
        return;
      }
      const formats =
        [camera.VideoStabilizationMode.OFF, camera.VideoStabilizationMode.MIDDLE, camera.VideoStabilizationMode.AUTO]
      for (const format of formats) {
        try {
          createPhotoOutput();
          await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
          console.info(TAG, 'getCreateCaptureSession');
          let vsMode: camera.VideoStabilizationMode = format
          let res = mCaptureSession.isVideoStabilizationModeSupported(vsMode);
          console.info(TAG, 'success isVideoStabilizationModeSupported')
          expect(isEmpty(res)).assertFalse()
          await releaseCaptureSession()
          done();
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail()
        }
        await releaseCaptureSession()
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_COLOR_MANAGEMENT_SET_COLOR_SPACE_00001
     * @tc.number SUB_MULTIMEDIA_COLOR_MANAGEMENT_SET_COLOR_SPACE_00001
     * @tc.desc   mPhotoSession setColorSpace colorSpaceManager emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_COLOR_MANAGEMENT_SET_COLOR_SPACE_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_COLOR_MANAGEMENT_SET_COLOR_SPACE_00001';
      const colorSpaces = [
        colorSpaceManager.ColorSpace.ADOBE_RGB_1998,
        colorSpaceManager.ColorSpace.DCI_P3,
        colorSpaceManager.ColorSpace.SRGB,
        colorSpaceManager.ColorSpace.BT709,
        colorSpaceManager.ColorSpace.BT601_EBU,
        colorSpaceManager.ColorSpace.BT601_SMPTE_C,
        colorSpaceManager.ColorSpace.BT2020_HLG,
        colorSpaceManager.ColorSpace.BT2020_PQ,
        colorSpaceManager.ColorSpace.P3_HLG,
        colorSpaceManager.ColorSpace.P3_PQ,
        colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT,
        colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT,
        colorSpaceManager.ColorSpace.SRGB_LIMIT,
        colorSpaceManager.ColorSpace.BT601_EBU_LIMIT,
        colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT,
        colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT,
        colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT,
        colorSpaceManager.ColorSpace.P3_HLG_LIMIT,
        colorSpaceManager.ColorSpace.P3_PQ_LIMIT,
        colorSpaceManager.ColorSpace.LINEAR_P3,
        colorSpaceManager.ColorSpace.LINEAR_SRGB,
        colorSpaceManager.ColorSpace.LINEAR_BT709,
        colorSpaceManager.ColorSpace.LINEAR_BT2020,
        colorSpaceManager.ColorSpace.DISPLAY_SRGB,
        colorSpaceManager.ColorSpace.DISPLAY_P3_HLG,
        colorSpaceManager.ColorSpace.DISPLAY_P3_PQ,
        colorSpaceManager.ColorSpace.H_LOG,
        colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB,
        colorSpaceManager.ColorSpace.CUSTOM
      ];
      const colorSpaceMap = (space: colorSpaceManager.ColorSpace): boolean => {
        if (space == colorSpaceManager.ColorSpace.SRGB || space == colorSpaceManager.ColorSpace.DISPLAY_P3) {
          return mPhotoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP;
        }
        if (space == colorSpaceManager.ColorSpace.BT2020_HLG) {
          return mPhotoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010 || mPhotoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010;
        }
        return false
      }
      for (const space of colorSpaces) {
        try {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput, mPhotoOutput);
          let colorSpaces: Array<colorSpaceManager.ColorSpace> = mPhotoSession.getSupportedColorSpaces();
          console.info(TAG, testName, colorSpaces, `json is`, JSON.stringify(colorSpaces));
          const isSupported = colorSpaces.includes(space);
          if (isSupported && colorSpaceMap(space)) {
            mPhotoSession.setColorSpace(space);
            expect(mPhotoSession.getActiveColorSpace()).assertEqual(space);
            console.info(TAG, testName, `setColorSpace success`);
          } else {
            console.info(TAG, testName, ` 当前设备不支持${space}色彩空间`);
          }
        } catch (error) {
          console.error(TAG, testName, 'setColorSpace, failed', JSON.stringify(error), error.code, error);
          expect().assertFail();
        } finally {
          await releasePhotoSession();
        }
      }
      done();
    })
  })
}