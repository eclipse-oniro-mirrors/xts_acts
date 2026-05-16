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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Hypium,
  Size,
  TestType
} from '../../../../hypium';
import { camera } from '@kit.CameraKit';
import {
  getPermission, resourceName,
} from '../Common.test';
import media from '@ohos.multimedia.media';
import { Context } from '@kit.ArkUI';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';

const TAG = "CameraXts.getSupportedEffectTypes";
let mCameraManager: camera.CameraManager | undefined;
let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
let mSupportedModes: Array<camera.SceneMode> | undefined;
let mCameraInput: camera.CameraInput | undefined;
let mFullCameraOutputCap: camera.CameraOutputCapability | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mVideoOutput: camera.VideoOutput | undefined;
let mVideoSurfaceId: string | undefined;
let mVideoSession: camera.VideoSession | undefined;
let mAVRecorder: media.AVRecorder | undefined;
let fdNumber: int | undefined;
let fdPath: string | undefined;
let mCameraOutputCap: camera.CameraOutputCapability | undefined;
let testContext: Context;
let indexSurfaceId: string = "";
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
  profile: CameraVideoProfile!,
  url: 'file://',
};

let isEmpty01 = (data: camera.CameraManager | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}
let isEmpty02 = (data: camera.CameraDevice[] | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty04 = (data: media.AVRecorder | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let getCameraManagerInstance = () => {
  console.info('Enter getCameraManagerInstance');
  testContext = Hypium.get("Context") as Context;
  indexSurfaceId = Hypium.get('SurfaceId') as string;
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmpty01(mCameraManager!)) {
    console.info(TAG + "getCameraManager FAILED");
    return false;
  }
  console.info(TAG + 'Exit getCameraManagerInstance');

  return true;
}


function getCameraInput(): void {
  console.info(TAG, 'getCameraInput.');
  if (mCameraDeviceArray!.length) {
    let cameras = mCameraManager!.getSupportedCameras();
    console.info(TAG, 'getSupportedCameras.', cameras);
    if (cameras) {
      mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![0]);
    } else {
      console.info(TAG, 'cameras null.');
    }
  } else {
    console.info(TAG, 'getSupportedCameraDeviceArray null.');
  }
}

function getSupportedCameraDeviceArray(): boolean {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager!.getSupportedCameras();
  if (isEmpty02(mCameraDeviceArray!)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray!.length);
  return true;
}

const getFd = async (fileName: string): Promise<int> => {
  let fileDir: string = Hypium.get('pathDir') as string;
  let pathName = fileDir + '/' + fileName;
  let file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  fdNumber = file.fd;
  fdPath = "fd://" + `${fdNumber}`;
  console.info('case getFd number is: ' + fdNumber);
  return fdNumber!;
};


async function getVideoSurfaceId() {
  console.info(TAG, 'getVideoSurfaceId begin.');
  let fileName: string = resourceName();
  fdNumber = await getFd(fileName);
  fdPath = "fd://" + fdNumber;
  console.info(TAG, 'case fdPath is: ' + fdPath);
  videoConfig.url = fdPath!;
  console.info(TAG, 'get videoConfig url.');
  mAVRecorder = await media.createAVRecorder();
  expect(isEmpty04(mAVRecorder)).assertFalse();
  console.info(TAG, 'createAVRecorder passed. state: ' + mAVRecorder!.state);
  mAVRecorder!.prepare(videoConfig).then(() => {
    console.info('prepare success');
  })
  console.info(TAG, 'AVRecorder state: ' + mAVRecorder!.state);
  mVideoSurfaceId = await mAVRecorder!.getInputSurface();
  console.info(TAG, 'mVideoSurfaceId: ' + mVideoSurfaceId);
}


async function createVideoOutput() {
  await getVideoSurfaceId();
  let useDevice: camera.CameraDevice = mCameraDeviceArray![0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray!) {
    mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
    if (mSupportedModes!.includes(camera.SceneMode.NORMAL_VIDEO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_VIDEO);
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let videoProfile = cameraOutputCap.videoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles!) {
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
  CameraVideoProfile!.videoFrameWidth = videoProfile.size.width;
  CameraVideoProfile!.videoFrameHeight = videoProfile.size.height;
  mPreviewOutput = mCameraManager!.createPreviewOutput(previewProfile, indexSurfaceId);
  console.log(TAG, 'createVideoOutput' + videoProfile, 'surfaceID', mVideoSurfaceId);
  mVideoOutput = mCameraManager!.createVideoOutput(videoProfile, mVideoSurfaceId!);
  console.log(TAG, 'create preview output' + mPreviewOutput, 'createVideoOutput', mVideoOutput);
}


async function getCreateVideoSession(testName: string, previewOutput: camera.PreviewOutput,
  videoOutput: camera.VideoOutput) {
  console.info(TAG, 'getCreateVideoSession.');
  mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
  mVideoSession!.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mVideoSession!.addInput(mCameraInput!);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput!.open();
  console.info(TAG, testName + ' camera open passed.');
  mVideoSession!.addOutput(previewOutput);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mVideoSession!.addOutput(videoOutput);
  console.info(TAG, testName + ' addOutput videoOutput passed.');
  await mVideoSession!.commitConfig();
  console.info(TAG, testName + ' session commitConfig successfully.');
}


async function releaseVideoSession() {
  console.info(TAG, 'releaseVideoSession.');
  await mAVRecorder!.release();
  await mPreviewOutput!.release();
  await mVideoOutput!.release();
  await mVideoSession!.release();
}

export default function CameraVideoSessionErrorTest(): void {
  describe('CameraVideoSessionErrorTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      getCameraManagerInstance();
      getSupportedCameraDeviceArray();
      getCameraInput();
    });

    beforeEach(() => {
      console.info('afterEach case');
    });

    afterEach(async () => {
      console.info('afterEach case');
      await Utils.msSleep(500);
    });

    afterAll(async () => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_STATIC_0200
     * @tc.desc   isVideoStabilizationModeSupported api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_STATIC_0200';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG + testName + "Entering start for camera");
          await createVideoOutput();
          mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
          try {
            mVideoSession!.isVideoStabilizationModeSupported(camera.VideoStabilizationMode.OFF);
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          console.info(TAG + testName + "Entering  end for camera");
          await releaseVideoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_ACTIVE_VIDEO_STABILIZATION_MODE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_ACTIVE_VIDEO_STABILIZATION_MODE_STATIC_0300
     * @tc.desc   getActiveVideoStabilizationMode api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_ACTIVE_VIDEO_STABILIZATION_MODE_STATIC_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_ACTIVE_VIDEO_STABILIZATION_MODE_STATIC_0300';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG + testName + "Entering start for camera");
          await createVideoOutput();
          mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
          try {
            mVideoSession!.getActiveVideoStabilizationMode();
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          console.info(TAG + testName + "Entering  end for camera");
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_MODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_MODE_STATIC_0200
     * @tc.desc   setVideoStabilizationMode api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_MODE_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_VIDEO_STABILIZATION_MODE_STATIC_0200';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG + testName + "Entering start for camera");
          await createVideoOutput();
          mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
          try {
            mVideoSession!.setVideoStabilizationMode(camera.VideoStabilizationMode.OFF);
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          console.info(TAG + testName + "Entering  end for camera");
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_SESSION_ADD_OUTPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_VIDEO_SESSION_ADD_OUTPUT_STATIC_0100
     * @tc.desc   VideoSession addOutput api 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_VIDEO_SESSION_ADD_OUTPUT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_VIDEO_SESSION_ADD_OUTPUT_STATIC_0100';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            await createVideoOutput();
            mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
            await Utils.msSleep(1);
            mVideoSession!.addOutput(mVideoOutput!);
            mVideoSession!.beginConfig();
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400102);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_SESSION_ADD_INPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_VIDEO_SESSION_ADD_INPUT_STATIC_0100
     * @tc.desc   VideoSession addInput api 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_VIDEO_SESSION_ADD_INPUT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_VIDEO_SESSION_ADD_INPUT_STATIC_0100';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            await createVideoOutput();
            mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
            await Utils.msSleep(1);
            mVideoSession!.addInput(mCameraInput!);
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400102);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_SESSION_REMOVE_INPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_VIDEO_SESSION_REMOVE_INPUT_STATIC_0100
     * @tc.desc   VideoSession removeInput api 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_VIDEO_SESSION_REMOVE_INPUT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_VIDEO_SESSION_REMOVE_INPUT_STATIC_0100';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            await createVideoOutput();
            mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
            await Utils.msSleep(1);
            mVideoSession!.removeInput(mCameraInput!);
            mVideoSession!.beginConfig();
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400102);
          }
          done();
        }
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_SESSION_REMOVE_OUTPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_VIDEO_SESSION_REMOVE_OUTPUT_STATIC_0100
     * @tc.desc   VideoSession removeOutput api 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_VIDEO_SESSION_REMOVE_OUTPUT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_VIDEO_SESSION_REMOVE_OUTPUT_STATIC_0100';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            await createVideoOutput();
            mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
            await Utils.msSleep(1);
            mVideoSession!.removeOutput(mVideoOutput!);
            mVideoSession!.beginConfig();
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400102);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_START_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_START_STATIC_0100
     * @tc.desc   VideoSession start api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_START_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_START_STATIC_0100';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG + testName + "Entering start for camera");
          await createVideoOutput();
          mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
          try {
            mVideoSession!.setVideoStabilizationMode(camera.VideoStabilizationMode.OFF);
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          console.info(TAG + testName + "Entering  end for camera");
          done();
        }
      })
  })
}