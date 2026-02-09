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

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mPhotoSession?.release();
}

async function releaseCaptureSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mCaptureSession?.release();
}

function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info(TAG, 'getEnumMaxValue : ' + maxValue);
  return maxValue;
}

async function captureSessionsetExposureMode(testName: string, exposureMode: camera.ExposureMode | undefined | null,
  callback: (res?: number, errCode?: number) => void) {
  console.info(TAG, testName);
  try {
    createPhotoOutput();
    await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
    console.info(TAG, testName, 'mCaptureSession', mCaptureSession);
    mCaptureSession.setExposureMode(exposureMode);
    let ExposureMode = mCaptureSession.getExposureMode();
    console.info(TAG, testName, 'getExposureMode', ExposureMode);
    callback(ExposureMode, undefined)
    await releaseCaptureSession();
  } catch (err) {
    console.error(TAG, testName, err.message, err.code);
    callback(undefined, err.code)
    await releasePhotoSession();
  }
}

async function getFlashModePhoto(done: Function, testName: string, flashMode: camera.FlashMode,
  callback: (mode?: camera.FlashMode) => void) {
  try {
    if (isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName, ' mCameraDeviceArray is null.');
      return;
    } else {
      createPhotoOutput();
      await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
      if (mCaptureSession.hasFlash()) {
        if (mCaptureSession.isFlashModeSupported(flashMode)) {
          mCaptureSession.setFlashMode(flashMode);
          let mode = mCaptureSession.getFlashMode();
          console.info(TAG, testName, ' photo set flash mode, status: ', flashMode, mode);
          callback(mode);
        } else {
          console.error(TAG, testName, "Flash mode not supported on this device");
        }
      } else {
        console.error(TAG, testName, "Device does not support flash");
      }
    }
  } catch (error) {
    console.error(TAG, testName, JSON.stringify(error), error.code);
    expect().assertFail();
  } finally {
    await releasePhotoSession();
    done();
  }
}

async function getFlashModeVideo(done: Function, testName: string, flashMode: camera.FlashMode,
  callback: (mode?: camera.FlashMode) => void) {
  try {
    if (isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName, ' mCameraDeviceArray is null.');
      return;
    } else {
      createPhotoOutput();
      await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
      if (mCaptureSession.hasFlash()) {
        if (mCaptureSession.isFlashModeSupported(flashMode)) {
          mCaptureSession.setFlashMode(flashMode);
          let mode = mCaptureSession.getFlashMode();
          console.info(TAG, testName, ' video set flash mode, status: ', flashMode, mode);
          callback(mode);
        } else {
          console.error(TAG, "Flash mode not supported on this device");
        }
      } else {
        console.error(TAG, "Device does not support flash");
      }
    }
  } catch (error) {
    console.error(TAG, testName, JSON.stringify(error), error.code);
    expect().assertFail();
  } finally {
    await releasePhotoSession();
    done();
  }
}

async function getActiveStabilizationModeVideo(done: Function, testName: string,
  expectedMode: camera.VideoStabilizationMode, callback: (mode?: camera.VideoStabilizationMode) => void) {
  try {
    if (isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName, ' mCameraDeviceArray is null.');
      return;
    } else {
      createPhotoOutput();
      await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
      if (mCaptureSession.isVideoStabilizationModeSupported(expectedMode)) {
        mCaptureSession.setVideoStabilizationMode(expectedMode);
        let mode = mCaptureSession.getActiveVideoStabilizationMode();
        console.info(TAG, testName, 'video stabilization mode, expected: ', expectedMode, 'actual: ', mode);
        callback(mode);
      } else {
        console.error(TAG, "Stabilization mode not supported on this device");
      }
    }
  } catch (error) {
    console.error(TAG, testName, JSON.stringify(error), error.code);
    expect().assertFail();
  } finally {
    await releasePhotoSession();
    done();
  }
}

async function getFocusModeTest(done: Function, testName: string,
  expectedMode: camera.FocusMode, callback: (mode?: camera.FocusMode) => void) {
  try {
    if (isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName, ' mCameraDeviceArray is null.');
      return;
    } else {
      createPhotoOutput();
      await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
      if (mCaptureSession.isFocusModeSupported(expectedMode)) {
        mCaptureSession.setFocusMode(expectedMode);
        let mode = mCaptureSession.getFocusMode();
        console.info(TAG, testName, 'video FocusModeSupported, expected: ', expectedMode, 'actual: ', mode);
        callback(mode);
      } else {
        console.error(TAG, "FocusModeSupported not supported on this device");
      }
    }
  } catch (error) {
    console.error(TAG, testName, JSON.stringify(error), error.code);
    expect().assertFail();
  } finally {
    await releasePhotoSession();
    done();
  }
}

async function getZoomRatioRangeTest(done: Function, testName: string, callback: (res: Array<number>) => void) {
  try {
    if (isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName, ' mCameraDeviceArray is null.');
      done();
      return;
    } else {
      createPhotoOutput();
      await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
      if (mCaptureSession.getZoomRatioRange()) {
        let res: Array<number> = mCaptureSession.getZoomRatioRange();
        console.info(TAG, testName, 'video FocusModeSupported, expected: ', JSON.stringify(res));
        callback(res);
      } else {
        console.error(TAG, testName, "该设备不支持变焦");
      }
    }
  } catch (error) {
    console.error(TAG, testName, JSON.stringify(error), error.code);
    expect().assertFail();
  } finally {
    await releasePhotoSession();
    done();
  }
}

export default function CameraDeprecatedCaptureSessionTest() {
  describe('CameraDeprecatedCaptureSessionTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      getCameraManager();
      getSupportedCameraDeviceArray();
      getCameraInput();
      AppStorage.setOrCreate('test', [])
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
    });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_HAS_FLASH_PHOTO_0100
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_HAS_FLASH_PHOTO_0100
     * @tc.desc   test camera session photo hasFlash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_HAS_FLASH_PHOTO_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_HAS_FLASH_PHOTO_0100'
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          return;
        } else {
          createPhotoOutput();
          await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
          let hasFlash: boolean = mCaptureSession.hasFlash();
          console.info(TAG, testName, 'hasFlash', hasFlash);
          expect(isEmpty(hasFlash)).assertFalse();
        }
      } catch (err) {
        console.error(TAG, testName, JSON.stringify(err), err.code);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_HAS_FLASH_VIDEO_0100
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_HAS_FLASH_VIDEO_0100
     * @tc.desc   test camera session video hasFlash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_HAS_FLASH_VIDEO_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_HAS_FLASH_VIDEO_0100'
      try {
        if (isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
          return;
        } else {
          createPhotoOutput();
          await getCreateCaptureSession(mPreviewOutput, mPhotoOutput);
          let hasFlash: boolean = mCaptureSession.hasFlash();
          console.info(TAG, testName, 'hasFlash', hasFlash);
          expect(isEmpty(hasFlash)).assertFalse();
        }
      } catch (err) {
        console.error(TAG, testName, JSON.stringify(err), err.code);
        expect().assertFail();
      } finally {
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0100
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0100
     * @tc.desc   test camera session photo getFlashMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0100'
      await getFlashModePhoto(done, testName, camera.FlashMode.FLASH_MODE_CLOSE, (res?: camera.FlashMode) => {
        expect(res).assertEqual(camera.FlashMode.FLASH_MODE_CLOSE);
      })
    })

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0200
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0200
     * @tc.desc   test camera session photo getFlashMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0200'
      await getFlashModePhoto(done, testName, camera.FlashMode.FLASH_MODE_OPEN, (res?: camera.FlashMode) => {
        expect(res).assertEqual(camera.FlashMode.FLASH_MODE_OPEN);
      })
    })

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0300
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0300
     * @tc.desc   test camera session photo getFlashMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0300', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0300'
      await getFlashModePhoto(done, testName, camera.FlashMode.FLASH_MODE_AUTO, (res?: camera.FlashMode) => {
        expect(res).assertEqual(camera.FlashMode.FLASH_MODE_AUTO);
      })
    })

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0400
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0400
     * @tc.desc   test camera session photo getFlashMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0400', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_PHOTO_0400'
      await getFlashModePhoto(done, testName, camera.FlashMode.FLASH_MODE_ALWAYS_OPEN, (res?: camera.FlashMode) => {
        expect(res).assertEqual(camera.FlashMode.FLASH_MODE_ALWAYS_OPEN);
      })
    })

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0100
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0100
     * @tc.desc   test camera session video getFlashMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0100'
      await getFlashModeVideo(done, testName, camera.FlashMode.FLASH_MODE_CLOSE, (res?: camera.FlashMode) => {
        expect(res).assertEqual(camera.FlashMode.FLASH_MODE_CLOSE);
      })
    })

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0200
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0200
     * @tc.desc   test camera session video getFlashMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0200'
      await getFlashModeVideo(done, testName, camera.FlashMode.FLASH_MODE_OPEN, (res?: camera.FlashMode) => {
        expect(res).assertEqual(camera.FlashMode.FLASH_MODE_OPEN);
      })
    })

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0300
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0300
     * @tc.desc   test camera session video getFlashMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0300', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0300'
      await getFlashModeVideo(done, testName, camera.FlashMode.FLASH_MODE_AUTO, (res?: camera.FlashMode) => {
        expect(res).assertEqual(camera.FlashMode.FLASH_MODE_AUTO);
      })
    })

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0400
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0400
     * @tc.desc   test camera session video getFlashMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0400', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FLASH_MODE_VIDEO_0400'
      await getFlashModeVideo(done, testName, camera.FlashMode.FLASH_MODE_ALWAYS_OPEN, (res?: camera.FlashMode) => {
        expect(res).assertEqual(camera.FlashMode.FLASH_MODE_ALWAYS_OPEN);
      })
    })

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0100
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0100
     * @tc.desc   Test get VIDEO_STABILIZATION_MODE_OFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0100';
      await getActiveStabilizationModeVideo(done, testName,
        camera.VideoStabilizationMode.OFF, (res?: camera.VideoStabilizationMode) => {
          expect(res).assertEqual(camera.VideoStabilizationMode.OFF);
        });
    });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0200
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0200
     * @tc.desc   Test get VIDEO_STABILIZATION_MODE_LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0200';
      await getActiveStabilizationModeVideo(done, testName,
        camera.VideoStabilizationMode.LOW, (res?: camera.VideoStabilizationMode) => {
          expect(res).assertEqual(camera.VideoStabilizationMode.LOW);
        });
    });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0300
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0300
     * @tc.desc   Test get VIDEO_STABILIZATION_MODE_MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0300', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0300';
      await getActiveStabilizationModeVideo(done, testName,
        camera.VideoStabilizationMode.MIDDLE, (res?: camera.VideoStabilizationMode) => {
          expect(res).assertEqual(camera.VideoStabilizationMode.MIDDLE);
        });
    });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0400
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0400
     * @tc.desc   Test get VIDEO_STABILIZATION_MODE_HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0400', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0400';
      await getActiveStabilizationModeVideo(done, testName,
        camera.VideoStabilizationMode.HIGH, (res?: camera.VideoStabilizationMode) => {
          expect(res).assertEqual(camera.VideoStabilizationMode.AUTO);
        });
    });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0500
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0500
     * @tc.desc   Test get VIDEO_STABILIZATION_MODE_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0500', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_STABILIZATION_MODE_0500';
      await getActiveStabilizationModeVideo(done, testName,
        camera.VideoStabilizationMode.AUTO, (res?: camera.VideoStabilizationMode) => {
          expect(res).assertEqual(camera.VideoStabilizationMode.AUTO);
        });
    });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0100
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0100
     * @tc.desc   Test get FOCUS_MODE_MANUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0100';
      await getFocusModeTest(done, testName,
        camera.FocusMode.FOCUS_MODE_MANUAL, (res?: camera.FocusMode) => {
          expect(res).assertEqual(camera.FocusMode.FOCUS_MODE_MANUAL);
        });
    });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0200
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0200
     * @tc.desc   Test get FOCUS_MODE_CONTINUOUS_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0200', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0200';
      await getFocusModeTest(done, testName,
        camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO, (res?: camera.FocusMode) => {
          expect(res).assertEqual(camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
        });
    });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0300
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0300
     * @tc.desc   Test get FOCUS_MODE_MANUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0300', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0300';
      await getFocusModeTest(done, testName,
        camera.FocusMode.FOCUS_MODE_AUTO, (res?: camera.FocusMode) => {
          expect(res).assertEqual(camera.FocusMode.FOCUS_MODE_AUTO);
        });
    });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0400
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0400
     * @tc.desc   Test get FOCUS_MODE_LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0400', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_FOCUS_MODE_0400';
      await getFocusModeTest(done, testName,
        camera.FocusMode.FOCUS_MODE_LOCKED, (res?: camera.FocusMode) => {
          expect(res).assertEqual(camera.FocusMode.FOCUS_MODE_LOCKED);
        });
    });

    /**
     * @tc.name   SUB_CAP_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_RANGE_0100
     * @tc.number SUB_CAP_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_RANGE_0100
     * @tc.desc   Test get GET_ZOOM_RATIO_RANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_CAP_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_RANGE_0100', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_CAP_MULTIMEDIA_CAMERA_GET_ZOOM_RATIO_RANGE_0100';
      await getZoomRatioRangeTest(done, testName, (res: Array<number>) => {
        expect(res.length > 0).assertTrue();
      });
    });
  })
}