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

let isEmptyBoolean = (data: boolean) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmptyControlCenterEffectType = (data: camera.ControlCenterEffectType[]) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}


export default function CameraVideoSessionTest(): void {
  describe('CameraVideoSessionTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('beforeAll case');
      await getPermission();
      getCameraManagerInstance();
      getSupportedCameraDeviceArray();
      getCameraInput();
    });

    beforeEach(async (): Promise<void> => {
      console.info('afterEach case');
    });

    afterEach(async (): Promise<void> => {
      console.info('afterEach case');
      await Utils.msSleep(500);
    });

    afterAll(async (): Promise<void> => {
      console.info('afterAll case');
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0100
     * @tc.desc   setWhiteBalanceMode camera WhiteBalanceMode AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0100';
      if (mCameraDeviceArray == null) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        console.info(TAG + testName + "Entering start for camera");
        await createVideoOutput();
        await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
        let PMode: camera.WhiteBalanceMode = camera.WhiteBalanceMode.AUTO;
        let status = mVideoSession!.isWhiteBalanceModeSupported(PMode);
        console.info(TAG, testName, "isWhiteBalanceModeSupported :", status);
        if (status) {
          mVideoSession!.setWhiteBalanceMode(camera.WhiteBalanceMode.AUTO);
          let mode = mVideoSession!.getWhiteBalanceMode();
          console.info(TAG, testName, "getWhiteBalanceMode :", mode);
          expect(mode).assertEqual(camera.WhiteBalanceMode.AUTO);
        } else {
          console.info(TAG, testName, "该设备不支持");
        }
        console.info(TAG + testName + "Entering  end for camera");
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0200
     * @tc.desc   setWhiteBalanceMode camera WhiteBalanceMode CLOUDY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0200';
      if (mCameraDeviceArray == null) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        console.info(TAG + testName + "Entering start for camera");
        await createVideoOutput();
        await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
        let PMode: camera.WhiteBalanceMode = camera.WhiteBalanceMode.CLOUDY;
        let status = mVideoSession!.isWhiteBalanceModeSupported(PMode);
        console.info(TAG, testName, "isWhiteBalanceModeSupported :", status);
        if (status) {
          mVideoSession!.setWhiteBalanceMode(camera.WhiteBalanceMode.CLOUDY);
          let mode = mVideoSession!.getWhiteBalanceMode();
          console.info(TAG, testName, "getWhiteBalanceMode :", mode);
          expect(mode).assertEqual(camera.WhiteBalanceMode.CLOUDY);
        } else {
          console.info(TAG, testName, "该设备不支持");
        }
        console.info(TAG + testName + "Entering  end for camera");
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0300
     * @tc.desc   setWhiteBalanceMode camera WhiteBalanceMode INCANDESCENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0300';
      if (mCameraDeviceArray == null) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        console.info(TAG + testName + "Entering start for camera");
        await createVideoOutput();
        await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
        let PMode: camera.WhiteBalanceMode = camera.WhiteBalanceMode.INCANDESCENT;
        let status = mVideoSession!.isWhiteBalanceModeSupported(PMode);
        console.info(TAG, testName, "isWhiteBalanceModeSupported :", status);
        if (status) {
          mVideoSession!.setWhiteBalanceMode(camera.WhiteBalanceMode.INCANDESCENT);
          let mode = mVideoSession!.getWhiteBalanceMode();
          console.info(TAG, testName, "getWhiteBalanceMode :", mode);
          expect(mode).assertEqual(camera.WhiteBalanceMode.INCANDESCENT);
        } else {
          console.info(TAG, testName, "该设备不支持");
        }
        console.info(TAG + testName + "Entering  end for camera");
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0400
     * @tc.desc   setWhiteBalanceMode camera WhiteBalanceMode FLUORESCENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0400';
      if (mCameraDeviceArray == null) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        console.info(TAG + testName + "Entering start for camera");
        await createVideoOutput();
        await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
        let PMode: camera.WhiteBalanceMode = camera.WhiteBalanceMode.FLUORESCENT;
        let status = mVideoSession!.isWhiteBalanceModeSupported(PMode);
        console.info(TAG, testName, "isWhiteBalanceModeSupported :", status);
        if (status) {
          mVideoSession!.setWhiteBalanceMode(camera.WhiteBalanceMode.FLUORESCENT);
          let mode = mVideoSession!.getWhiteBalanceMode();
          console.info(TAG, testName, "getWhiteBalanceMode :", mode);
          expect(mode).assertEqual(camera.WhiteBalanceMode.FLUORESCENT);
        } else {
          console.info(TAG, testName, "该设备不支持");
        }
        console.info(TAG + testName + "Entering  end for camera");
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0500
     * @tc.desc   setWhiteBalanceMode camera WhiteBalanceMode MANUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0500';
      if (mCameraDeviceArray == null) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        console.info(TAG + testName + "Entering start for camera");
        await createVideoOutput();
        await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
        let PMode: camera.WhiteBalanceMode = camera.WhiteBalanceMode.MANUAL;
        let status = mVideoSession!.isWhiteBalanceModeSupported(PMode);
        console.info(TAG, testName, "isWhiteBalanceModeSupported :", status);
        if (status) {
          mVideoSession!.setWhiteBalanceMode(camera.WhiteBalanceMode.MANUAL);
          let mode = mVideoSession!.getWhiteBalanceMode();
          console.info(TAG, testName, "getWhiteBalanceMode :", mode);
          expect(mode).assertEqual(camera.WhiteBalanceMode.MANUAL);
        } else {
          console.info(TAG, testName, "该设备不支持");
        }
        console.info(TAG + testName + "Entering  end for camera");
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0600
     * @tc.desc   setWhiteBalanceMode camera WhiteBalanceMode LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SET_WHITE_BALANCE_MODE_STATIC_0600';
      if (mCameraDeviceArray == null) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
      } else {
        console.info(TAG + testName + "Entering start for camera");
        await createVideoOutput();
        await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
        let PMode: camera.WhiteBalanceMode = camera.WhiteBalanceMode.LOCKED;
        let status = mVideoSession!.isWhiteBalanceModeSupported(PMode);
        console.info(TAG, testName, "isWhiteBalanceModeSupported :", status);
        if (status) {
          mVideoSession!.setWhiteBalanceMode(camera.WhiteBalanceMode.LOCKED);
          let mode = mVideoSession!.getWhiteBalanceMode();
          console.info(TAG, testName, "getWhiteBalanceMode :", mode);
          expect(mode).assertEqual(camera.WhiteBalanceMode.LOCKED);
        } else {
          console.info(TAG, testName, "该设备不支持");
        }
        console.info(TAG + testName + "Entering  end for camera");
        await releaseVideoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_STATIC_0100
     * @tc.desc   isVideoStabilizationModeSupported api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_IS_VIDEO_STABILIZATION_MODE_SUPPORTED_STATIC_0100';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          const formats = [
            camera.VideoStabilizationMode.OFF,
            camera.VideoStabilizationMode.LOW,
            camera.VideoStabilizationMode.MIDDLE,
            camera.VideoStabilizationMode.HIGH,
            camera.VideoStabilizationMode.AUTO,
          ];
          for (const format of formats) {
            try {
              let result = mVideoSession!.isVideoStabilizationModeSupported(format);
              console.info(TAG, testName, "Entering start PASSED", format, 'is', result);
              expect(isEmptyBoolean(result)).assertFalse();
            } catch (err) {
              console.error(TAG, testName, " FAILED", err.code);
              expect().assertFail();
            }
            console.info(TAG + testName + "Entering  end for camera");
          }
          await releaseVideoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_ACTIVE_VIDEO_STABILIZATION_MODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_ACTIVE_VIDEO_STABILIZATION_MODE_STATIC_0100
     * @tc.desc   getActiveVideoStabilizationMode api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_ACTIVE_VIDEO_STABILIZATION_MODE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_ACTIVE_VIDEO_STABILIZATION_MODE_STATIC_0100';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG + testName + "Entering start for camera");
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          const formats = [
            camera.VideoStabilizationMode.OFF,
            camera.VideoStabilizationMode.LOW,
            camera.VideoStabilizationMode.MIDDLE,
            camera.VideoStabilizationMode.AUTO,
          ];
          for (const format of formats) {
            try {
              if (mVideoSession!.isVideoStabilizationModeSupported(format)) {
                mVideoSession!.start();
                console.warn(TAG, testName, "setVideoStabilizationMode  PASSED", format);
                mVideoSession!.setVideoStabilizationMode(format);
                let res = mVideoSession!.getActiveVideoStabilizationMode();
                console.warn(TAG, testName, "Entering start PASSED set is ", format, 'get is', res);
                expect(res).assertEqual(format);
                mVideoSession!.stop();
              } else {
                console.warn(TAG, testName, "当前设备不支持", format,);
              }
            } catch (err) {
              console.error(TAG, testName, " FAILED", err.code, err);
              expect().assertFail();
            }
            console.info(TAG + testName + "Entering  end for camera");
          }
          await releaseVideoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_ACTIVE_VIDEO_STABILIZATION_MODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_ACTIVE_VIDEO_STABILIZATION_MODE_STATIC_0200
     * @tc.desc   getActiveVideoStabilizationMode api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_ACTIVE_VIDEO_STABILIZATION_MODE_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_ACTIVE_VIDEO_STABILIZATION_MODE_STATIC_0200';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG + testName + "Entering start for camera");
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          try {
            if (mVideoSession!.isVideoStabilizationModeSupported(camera.VideoStabilizationMode.HIGH)) {
              mVideoSession!.start();
              console.warn(TAG, testName, "setVideoStabilizationMode  PASSED", camera.VideoStabilizationMode.HIGH);
              mVideoSession!.setVideoStabilizationMode(camera.VideoStabilizationMode.HIGH);
              let res = mVideoSession!.getActiveVideoStabilizationMode();
              console.warn(TAG, testName, "Entering start PASSED set is ", camera.VideoStabilizationMode.HIGH, 'get is',
                res);
              expect(res).assertEqual(camera.VideoStabilizationMode.AUTO);
              mVideoSession!.stop();
            } else {
              console.warn(TAG, testName, "当前设备不支持", camera.VideoStabilizationMode.HIGH);
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code, err);
            expect().assertFail();
          }
          await releaseVideoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_CONTROL_CENTER_SUPPORTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_CONTROL_CENTER_SUPPORTED_STATIC_0100
     * @tc.desc   isControlCenterSupported api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_CONTROL_CENTER_SUPPORTED_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_IS_CONTROL_CENTER_SUPPORTED_STATIC_0100';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG + testName + "Entering start for camera");
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          try {
            let result = mVideoSession!.isControlCenterSupported();
            console.info(TAG, testName, "Entering start PASSED", 'is', result);
            expect(isEmptyBoolean(result)).assertFalse();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          console.info(TAG + testName + "Entering  end for camera");
          await releaseVideoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_SUPPORTED_EFFECT_TYPES_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_SUPPORTED_EFFECT_TYPES_STATIC_0100
     * @tc.desc   getSupportedEffectTypes api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_SUPPORTED_EFFECT_TYPES_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_SUPPORTED_EFFECT_TYPES_STATIC_0100';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG + testName + "Entering start for camera");
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          try {
            let result = mVideoSession!.getSupportedEffectTypes();
            console.info(TAG, testName, "Entering start PASSED", 'is', result);
            expect(isEmptyControlCenterEffectType(result)).assertFalse();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          console.info(TAG + testName + "Entering  end for camera");
          await releaseVideoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_CONTROL_CENTER_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_CONTROL_CENTER_STATIC_0100
     * @tc.desc   enableControlCenter api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_CONTROL_CENTER_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_CONTROL_CENTER_STATIC_0100';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG + testName + "Entering start for camera");
          await createVideoOutput();
          await getCreateVideoSession(testName, mPreviewOutput!, mVideoOutput!);
          try {
            if (mVideoSession!.isControlCenterSupported()) {
              mVideoSession!.enableControlCenter(false);
              console.info(TAG, testName, "Entering start PASSED", 'is');
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          console.info(TAG + testName + "Entering  end for camera");
          await releaseVideoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_SESSION_CAN_ADD_INPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_VIDEO_SESSION_CAN_ADD_INPUT_STATIC_0100
     * @tc.desc   VideoSession canAddInput api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_VIDEO_SESSION_CAN_ADD_INPUT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_VIDEO_SESSION_CAN_ADD_INPUT_STATIC_0100';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            await createVideoOutput();
            mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
            await Utils.msSleep(1);
            mVideoSession!.beginConfig();
            let res = mVideoSession!.canAddInput(mCameraInput!);
            console.info(TAG, testName, "Entering start PASSED");
            expect(isEmptyBoolean(res)).assertFalse();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_ADD_OUTPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_ADD_OUTPUT_STATIC_0100
     * @tc.desc   VideoSession canaddOutput api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_ADD_OUTPUT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_VIDEO_SESSION_CAN_ADD_OUTPUT_STATIC_0100';
        if (mCameraDeviceArray == null) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            await createVideoOutput();
            mVideoSession = mCameraManager!.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
            mVideoSession!.beginConfig();
            console.info(TAG, testName + ' beginConfig passed.');
            if (mCameraInput) {
              mVideoSession!.addInput(mCameraInput!);
              console.info(TAG, testName + ' addInput passed.');
              let res = mVideoSession!.canAddOutput(mVideoOutput!);
              console.info(TAG, testName, "Entering start PASSED");
              expect(isEmptyBoolean(res)).assertFalse();
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          done();
        }
      })
  })
}