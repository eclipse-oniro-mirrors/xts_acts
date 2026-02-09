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
import { JSON } from '@kit.ArkTS';

const TAG = "xts.CameraSessionZoomSuppTest:";
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

async function releaseVideoSession() {
  console.info(TAG, 'releaseVideoSession.');
  await mAVRecorder?.release();
  await mPreviewOutput?.release();
  await mVideoOutput?.release();
  await mVideoSession?.release();
}

function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info(TAG, 'getEnumMaxValue : ' + maxValue);
  return maxValue;
}

const testVideoStabilizationModeError =
  async (testName: string, mode: number, done: Function, callback: (errCode?: number) => void) => {
    try {
      if (isEmpty(mCameraDeviceArray)) {
        console.info(TAG, testName, 'mCameraDeviceArray is null.');
        return;
      }
      console.info(TAG,testName,'Start');
      await createVideoOutput();
      await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
      mVideoSession.setVideoStabilizationMode(mode);
      console.info(TAG, testName, 'Success');
      callback(undefined);
    } catch (err) {
      console.error(TAG, testName, 'Failed' ,JSON.stringify(err), err.code);
      callback(err.code);
    } finally {
      await releaseVideoSession();
      done();
    }
  };
const testIsVideoStabilizationModeSupported = async (testName: string, mode: number , done: Function, callback: (errCode?: boolean) => void) => {
  try {
    if (isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName , ' mCameraDeviceArray is null.');
      return;
    } else {
      console.info(TAG,testName,'Start');
      await createVideoOutput();
      await getCreateVideoSession(testName, mPreviewOutput, mVideoOutput);
      const isSupported: boolean = mVideoSession.isVideoStabilizationModeSupported(mode);
      console.info(TAG, testName, 'Success',JSON.stringify(isSupported));
      callback(isSupported);
    }
  } catch (err) {
    console.error(TAG, testName, 'Failed' ,JSON.stringify(err), err.code);
    expect().assertFail();
  } finally {
    await releaseVideoSession();
    done();
  }
}

export default function CameraSessionZoomSuppTest() {
  describe('CameraSessionZoomSuppTest', () => {
    beforeAll(async () => {
      AppStorage.setOrCreate<string>('testString','abc');
      AppStorage.setOrCreate<number[]>('testArray',[-1,0,1]);
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
      AppStorage.delete('testString');
      AppStorage.delete('testArray');
      console.info('afterAll case');
      await closeFd(fdNumber);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0100
     * @tc.desc   Check capture session support video stabilization high mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0100', Level.LEVEL2,
      async (done: Function) => {
        const testName: string =
          'SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0100';
        await testVideoStabilizationModeError(testName, -1, done, (errCode) => {
          if (errCode != undefined) {
            expect(errCode == camera.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
          } else {
            expect().assertFail();
          }
        });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0200
     * @tc.desc   Check capture session support video stabilization high mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0200', Level.LEVEL2,
      async (done: Function) => {
        const testName: string =
          'SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0200';
        await testVideoStabilizationModeError(testName, -1000, done, (errCode) => {
          if (errCode != undefined) {
            expect(errCode == camera.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
          } else {
            expect().assertFail();
          }
        });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0300
     * @tc.desc   Check capture session support video stabilization high mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0300', Level.LEVEL2,
      async (done: Function) => {
        const testName: string =
          'SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0300';
        let maxEnum = getEnumMaxValue(camera.VideoStabilizationMode) +1;
        await testVideoStabilizationModeError(testName, maxEnum, done, (errCode) => {
          if (errCode != undefined) {
            expect(errCode == camera.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
          } else {
            expect().assertFail();
          }
        });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0800
     * @tc.desc   Check capture session support video stabilization high mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0800', Level.LEVEL2,
      async (done: Function) => {
        const testName: string =
          'SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_SETVIDEOSTABILIZATIONMODE_0800';
        testVideoStabilizationModeError(testName, 1000, done, (errCode) => {
          if (errCode != undefined) {
            expect(errCode == camera.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
          } else {
            expect().assertFail();
          }
        });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0100
     * @tc.desc   Check capture session support video stabilization errorcode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0100',
      Level.LEVEL2, async (done: Function) => {
        const testName: string =
          'SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0100';
        testIsVideoStabilizationModeSupported(testName, -1, done, (errCode) => {
          expect(errCode).assertFalse();
        });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0200
     * @tc.desc   Check capture session support video stabilization errorcode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0200',
      Level.LEVEL2, async (done: Function) => {
        const testName: string =
          'SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0200';
        testIsVideoStabilizationModeSupported(testName, -1000, done, (errCode) => {
          expect(errCode).assertFalse();
        });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0300
     * @tc.desc   Check capture session support video stabilization errorcode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0300',
      Level.LEVEL2, async (done: Function) => {
        const testName: string =
          'SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0300';
        let maxEnum = getEnumMaxValue(camera.VideoStabilizationMode) +1;
        testIsVideoStabilizationModeSupported(testName, maxEnum, done, (errCode) => {
          expect(errCode).assertFalse();
        });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0400
     * @tc.desc   Check capture session support video stabilization errorcode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0400',
      Level.LEVEL2, async (done: Function) => {
        const testName: string =
          'SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0400';
        testIsVideoStabilizationModeSupported(testName, null as ESObject, done, (errCode) => {
          expect(errCode == true || errCode == false).assertTrue();
        });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0500
     * @tc.desc   Check capture session support video stabilization errorcode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0500',
      Level.LEVEL2, async (done: Function) => {
        const testName: string =
          'SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0500';
        testIsVideoStabilizationModeSupported(testName, undefined as ESObject, done, (errCode) => {
          expect(errCode == true || errCode == false).assertTrue();
        });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0600
     * @tc.desc   Check capture session support video stabilization errorcode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0600',
      Level.LEVEL2, async (done: Function) => {
        const testName: string =
          'SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0600';
        testIsVideoStabilizationModeSupported(testName, AppStorage.get('testString') as ESObject, done, (errCode) => {
          expect(errCode == true || errCode == false).assertTrue();
        });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0700
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0700
     * @tc.desc   Check capture session support video stabilization errorcode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0700',
      Level.LEVEL2, async (done: Function) => {
        const testName: string =
          'SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0700';
        testIsVideoStabilizationModeSupported(testName, AppStorage.get('testArray') as ESObject, done, (errCode) => {
          expect(errCode == true || errCode == false).assertTrue();
        });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0800
     * @tc.desc   Check capture session support video stabilization errorcode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0800',
      Level.LEVEL2, async (done: Function) => {
        const testName: string =
          'SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATIONQUERY_STABILIZATION_MODE_SUPPORT_ERRORCODE_0800';
        testIsVideoStabilizationModeSupported(testName, 1000, done, (errCode) => {
          expect(errCode).assertFalse();
        });
      })
  })
}