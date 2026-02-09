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
import { camera } from '@kit.CameraKit';
import { common } from '@kit.AbilityKit';
import { cameraErrorCode, driveFn, getPermission, isEmpty, sleep } from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';

const TAG = "CameraXts.PhotoOutputTest";
const InvalidParam = -1;
const captureLocation: camera.Location = {
  latitude: 0,
  longitude: 0,
  altitude: 0
};
const InvalidLocation: camera.Location = {
  latitude: InvalidParam,
  longitude: InvalidParam,
  altitude: InvalidParam
};
const NewCaptureLocation: camera.Location = {
  latitude: 99999,
  longitude: 99999,
  altitude: 99999
};

let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mCameraOutputCap: camera.CameraOutputCapability;
let mFullCameraOutputCap: camera.CameraOutputCapability;
let mPreviewOutput: camera.PreviewOutput;
let mPhotoOutput: camera.PhotoOutput;
let mPhotoSession: camera.PhotoSession;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

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
  mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
  if (isEmpty(mCameraInput)) {
    return false;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return true;
}

function getSupportedModes() {
  console.info(TAG, 'getSupportedModes.');
  for (let i = 0; i < mCameraDeviceArray.length; i++) {
    mSupportedModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);
    if (isEmpty(mSupportedModes)) {
      return false;
    }
    console.info(TAG, 'mSupportedModes: ' + JSON.stringify(mSupportedModes));
  }
  return true;
}

function getOutputCapability() {
  console.info(TAG, 'getOutputCapability.');
  mCameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], mSupportedModes[0]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCap));
}

function getFullOutputCapability() {
  console.info(TAG, 'getFullOutputCapability.');
  mFullCameraOutputCap = mCameraManager.getSupportedFullOutputCapability(mCameraDeviceArray[0],
    camera.SceneMode.NORMAL_PHOTO);
  console.info(TAG, 'camera, full output cap: ' + JSON.stringify(mFullCameraOutputCap));
}

async function getPhotoSession(testName: string, previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getPhotoSession.');
  mPhotoSession = mCameraManager.createSession(mSupportedModes[0]);
  console.info(TAG, testName + ' createSession passed.');
  mPhotoSession.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mPhotoSession.addInput(mCameraInput);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput.open();
  console.info(TAG, testName + ' open passed.');
  mPhotoSession.addOutput(previewOutput);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mPhotoSession.addOutput(photoOutput);
  console.info(TAG, testName + ' addOutput photoOutput passed.');
  await mPhotoSession.commitConfig();
  console.info(TAG, testName + ' commitConfig passed.');
}

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  await mPhotoOutput?.release();
  await mPhotoSession?.release();
}

async function captureWithSettingsCallback(done: Function, testName: string,
  settings: camera.PhotoCaptureSetting | undefined | null) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
      mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
      await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
      mPhotoOutput.capture(settings as camera.PhotoCaptureSetting, (error) => {
        if (error !== undefined && error.code !== 0) {
          console.error(TAG, testName + ' failed to capture, err: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
        } else {
          console.info(TAG, testName + ' capture passed.');
          expect(true).assertTrue();
        }
      });
      console.info(TAG, testName + ' capture end.');
      await releasePhotoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    await releasePhotoSession();
    done();
  }
}

async function captureWithSettingsPromise(done: Function, testName: string,
  settings: camera.PhotoCaptureSetting | undefined | null) {
  console.info(TAG, testName + ' begin.');
  try {
    if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
      mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
      await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
      await mPhotoOutput.capture(settings as camera.PhotoCaptureSetting).then(() => {
        console.info(TAG, testName + ' capture passed.');
        expect(true).assertTrue();
      }).catch(async (error: BusinessError) => {
        console.error(TAG, testName + ' failed to capture, err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
        done();
      });
      console.info(TAG, testName + ' capture end.');
      await releasePhotoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    await releasePhotoSession();
    done();
  }
}

export default function PhotoOutputTest() {
  describe('PhotoOutputTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      getCameraManager();
      getSupportedCameraDeviceArray();
      getSupportedModes();
      getOutputCapability();
      getFullOutputCapability();
      await getPermission();
      await driveFn();
      getCameraInput();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   capture_callback_001
     * @tc.number CAMERA_OUTPUT_PHOTO_001
     * @tc.desc   No abnormal scenarios-capture-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
          mPhotoOutput.capture((error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG, testName + ' failed to capture, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            } else {
              console.info(TAG, testName + ' capture passed.');
              expect(true).assertTrue();
            }
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
          console.info(TAG, testName + ' release session.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   capture_promise_001
     * @tc.number CAMERA_OUTPUT_PHOTO_002
     * @tc.desc   No abnormal scenarios-capture-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
          await mPhotoOutput.capture().then(() => {
            console.info(TAG, testName + ' capture passed.');
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error.code + ', msg: ' + error.message);
            expect().assertFail();
          });
          console.info(TAG, testName + ' capture end.');
          await releasePhotoSession();
          console.info(TAG, testName + ' release session.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   capture_callback_with_setting_001
     * @tc.number CAMERA_OUTPUT_PHOTO_003
     * @tc.desc   No abnormal scenarios-quality-QUALITY_LEVEL_HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_with_setting_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_with_setting_001';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
      };
      captureWithSettingsCallback(done, testName, settings);
    })

    /**
     * @tc.name   capture_callback_with_setting_002
     * @tc.number CAMERA_OUTPUT_PHOTO_004
     * @tc.desc   No abnormal scenarios-quality-QUALITY_LEVEL_MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_with_setting_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_with_setting_002';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsCallback(done, testName, settings);
    })

    /**
     * @tc.name   capture_callback_with_setting_003
     * @tc.number CAMERA_OUTPUT_PHOTO_005
     * @tc.desc   No abnormal scenarios-quality-QUALITY_LEVEL_LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_with_setting_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_with_setting_003';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsCallback(done, testName, settings);
    })

    /**
     * @tc.name   capture_callback_with_setting_004
     * @tc.number CAMERA_OUTPUT_PHOTO_006
     * @tc.desc   No abnormal scenarios-rotation-ROTATION_90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_with_setting_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_with_setting_004';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_90,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsCallback(done, testName, settings);
    })

    /**
     * @tc.name   capture_callback_with_setting_005
     * @tc.number CAMERA_OUTPUT_PHOTO_007
     * @tc.desc   No abnormal scenarios-rotation-ROTATION_180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_with_setting_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_with_setting_005';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_180,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsCallback(done, testName, settings);
    })

    /**
     * @tc.name   capture_callback_with_setting_006
     * @tc.number CAMERA_OUTPUT_PHOTO_008
     * @tc.desc   No abnormal scenarios-rotation-ROTATION_270
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_with_setting_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_with_setting_006';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_270,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsCallback(done, testName, settings);
    })

    /**
     * @tc.name   capture_callback_with_setting_007
     * @tc.number CAMERA_OUTPUT_PHOTO_009
     * @tc.desc   No abnormal scenarios-location
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_with_setting_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_with_setting_007';
      let settings: camera.PhotoCaptureSetting = {
        location: NewCaptureLocation,
      };
      await captureWithSettingsCallback(done, testName, settings);
    })

    /**
     * @tc.name   capture_callback_with_setting_008
     * @tc.number CAMERA_OUTPUT_PHOTO_010
     * @tc.desc   No abnormal scenarios-mirror-true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_with_setting_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_with_setting_008';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_0,
        mirror: true
      };
      await captureWithSettingsCallback(done, testName, settings);
    })

    /**
     * @tc.name   capture_promise_with_setting_001
     * @tc.number CAMERA_OUTPUT_PHOTO_011
     * @tc.desc   No abnormal scenarios-quality-QUALITY_LEVEL_HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_with_setting_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_with_setting_001';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsPromise(done, testName, settings);
    })

    /**
     * @tc.name   capture_promise_with_setting_002
     * @tc.number CAMERA_OUTPUT_PHOTO_012
     * @tc.desc   No abnormal scenarios-quality-QUALITY_LEVEL_MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_with_setting_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_with_setting_002';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_MEDIUM,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsPromise(done, testName, settings);
    })

    /**
     * @tc.name   capture_promise_with_setting_003
     * @tc.number CAMERA_OUTPUT_PHOTO_013
     * @tc.desc   No abnormal scenarios-quality-QUALITY_LEVEL_LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_with_setting_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_with_setting_003';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsPromise(done, testName, settings);
    })

    /**
     * @tc.name   capture_promise_with_setting_004
     * @tc.number CAMERA_OUTPUT_PHOTO_014
     * @tc.desc   No abnormal scenarios-rotation-ROTATION_90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_with_setting_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_with_setting_004';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_90,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsPromise(done, testName, settings);
    })

    /**
     * @tc.name   capture_promise_with_setting_005
     * @tc.number CAMERA_OUTPUT_PHOTO_015
     * @tc.desc   No abnormal scenarios-rotation-ROTATION_180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_with_setting_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_with_setting_005';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_180,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsPromise(done, testName, settings);
    })

    /**
     * @tc.name   capture_promise_with_setting_006
     * @tc.number CAMERA_OUTPUT_PHOTO_016
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_with_setting_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_with_setting_006';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_270,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsPromise(done, testName, settings);
    })

    /**
     * @tc.name   capture_promise_with_setting_007
     * @tc.number CAMERA_OUTPUT_PHOTO_017
     * @tc.desc   No abnormal scenarios-rotation-ROTATION_270
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_with_setting_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_with_setting_007';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_0,
        location: NewCaptureLocation,
        mirror: false
      };
      await captureWithSettingsPromise(done, testName, settings);
    })

    /**
     * @tc.name   capture_promise_with_setting_008
     * @tc.number CAMERA_OUTPUT_PHOTO_018
     * @tc.desc   No abnormal scenarios-mirror-true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_with_setting_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_with_setting_008';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_LOW,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: true
      };
      await captureWithSettingsPromise(done, testName, settings);
    })

    /**
     * @tc.name   on_photoAvailable_listen_001
     * @tc.number CAMERA_OUTPUT_PHOTO_019
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_photoAvailable_listen_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_photoAvailable_listen_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
          let isCapture: boolean = false;
          mPhotoOutput.on('photoAvailable', (error, photo) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to listen photoAvailable on, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            } else {
              let mainImage: image.Image = photo.main;
              console.info(TAG, testName + ' succeed to listen photoAvailable on.');
              expect(isEmpty(mainImage)).assertFalse();
              isCapture = true
            }
          });
          mPhotoOutput.capture();
          // 设置超时循环检查
          const maxRetry = 30; // 最大重试次数
          const interval = 200; // 检查间隔200ms
          for (let i = 0; i < maxRetry; i++) {
            await sleep(interval);
            if (isCapture) {
              console.info(TAG, `${testName} succeed to listen photoAvailable on.`);
              break;
            }
            if (i === maxRetry - 1) { // 最后一次循环
              console.error(TAG, `${testName} failed to listen photoAvailable on.`);
              expect().assertFail();
            }
          }
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   off_photoAvailable_listen_001
     * @tc.number CAMERA_OUTPUT_PHOTO_020
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('off_photoAvailable_listen_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'off_photoAvailable_listen_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
          let isCapture: boolean = false;
          mPhotoOutput.on('photoAvailable', (error, photo) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to listen photoAvailable on, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            } else {
              let mainImage: image.Image = photo.main;
              console.info(TAG, testName + ' succeed to listen photoAvailable on.');
              expect(isEmpty(mainImage)).assertFalse();
              isCapture = true
            }
          });
          mPhotoOutput.capture();
          // 设置超时循环检查
          const maxRetry = 30; // 最大重试次数
          const interval = 200; // 检查间隔200ms
          for (let i = 0; i < maxRetry; i++) {
            await sleep(interval);
            if (isCapture) {
              console.info(TAG, `${testName} succeed to listen photoAvailable on.`);
              break;
            }
            if (i === maxRetry - 1) { // 最后一次循环
              console.error(TAG, `${testName} failed to listen photoAvailable on.`);
              expect().assertFail();
            }
          }
          mPhotoOutput.off('photoAvailable', (error, photo) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to listen photoAvailable off, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            } else {
              let mainImage: image.Image = photo.main;
              console.info(TAG, testName + ' succeed to listen photoAvailable off.');
              expect(isEmpty(mainImage)).assertFalse();
            }
          });
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   on_photoAssetAvailable_listen_001
     * @tc.number CAMERA_OUTPUT_PHOTO_021
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_photoAssetAvailable_listen_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_photoAssetAvailable_listen_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
          mPhotoOutput.on('photoAssetAvailable', (error, photoAsset: photoAccessHelper.PhotoAsset) => {
            if ((error !== undefined && error.code !== 0) || photoAsset === undefined) {
              console.error(TAG,
                testName + ' failed to listen photoAvailable on, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            } else {
              console.info(TAG,
                testName + ' succeed to listen photoAvailable on, photoAsset: ' + JSON.stringify(photoAsset));
              expect(isEmpty(photoAsset)).assertFalse();
            }
          });
          await mPhotoOutput.capture();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   off_photoAssetAvailable_listen_001
     * @tc.number CAMERA_OUTPUT_PHOTO_022
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('off_photoAssetAvailable_listen_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'off_photoAssetAvailable_listen_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
          mPhotoOutput.on('photoAssetAvailable', (error, photoAsset: photoAccessHelper.PhotoAsset) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to listen photoAssetAvailable on, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            } else {
              console.info(TAG,
                testName + ' succeed to listen photoAssetAvailable on, photoAsset: ' + JSON.stringify(photoAsset));
              expect(isEmpty(photoAsset)).assertFalse();
            }
          });
          mPhotoOutput.off('photoAvailable', (error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to listen photoAssetAvailable off, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
              done();
            } else {
              console.info(TAG,
                testName + ' succeed to listen photoAssetAvailable off.');
              expect(true).assertTrue();
              done();
            }
          });
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   release_callback_photo_001
     * @tc.number CAMERA_OUTPUT_PHOTO_023
     * @tc.desc   No abnormal scenarios-release-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_callback_photo_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_callback_photo_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
          console.info(TAG, testName + ' getPhotoSession passed.');
          await mPreviewOutput.release();
          mPhotoOutput.release((error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to release photoOutput, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            } else {
              console.info(TAG, testName + ' release passed.');
              expect(true).assertTrue();
            }
          });
          await mPhotoSession.release();
          console.info(TAG, testName + ' end.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   release_promise_photo_001
     * @tc.number CAMERA_OUTPUT_PHOTO_024
     * @tc.desc   No abnormal scenarios-release-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_promise_photo_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_promise_photo_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
          console.info(TAG, testName + ' getPhotoSession passed.');
          await mPreviewOutput.release();
          await mPhotoOutput.release().then(() => {
            console.info(TAG, testName + ' release passed.');
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            console.error(TAG,
              testName + ' failed to release photoOutput, err: ' + error.code + ', msg: ' + error.message);
            expect().assertFail();
          });
          await mPhotoSession.release();
          console.info(TAG, testName + ' end.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   capture_callback_with_setting_abnormal_001
     * @tc.number CAMERA_OUTPUT_PHOTO_025
     * @tc.desc   callback, settings-undefined -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_with_setting_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_with_setting_abnormal_001';
      let settings: camera.PhotoCaptureSetting | undefined = undefined;
      await captureWithSettingsCallback(done, testName, settings);
    })

    /**
     * @tc.name   capture_callback_with_setting_abnormal_002
     * @tc.number CAMERA_OUTPUT_PHOTO_026
     * @tc.desc   callback, settings quality-abnormal -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_with_setting_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_with_setting_abnormal_002';
      let settings: camera.PhotoCaptureSetting = {
        quality: InvalidParam,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsCallback(done, testName, settings);
    })

    /**
     * @tc.name   capture_callback_with_setting_abnormal_003
     * @tc.number CAMERA_OUTPUT_PHOTO_027
     * @tc.desc   callback, settings rotation-abnormal -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_with_setting_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_with_setting_abnormal_003';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
        rotation: InvalidParam,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsCallback(done, testName, settings);
    })

    /**
     * @tc.name   capture_callback_with_setting_abnormal_004
     * @tc.number CAMERA_OUTPUT_PHOTO_028
     * @tc.desc   callback, settings location-abnormal -> passed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_with_setting_abnormal_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_with_setting_abnormal_004';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
        rotation: camera.ImageRotation.ROTATION_0,
        location: InvalidLocation,
        mirror: false
      };
      await captureWithSettingsCallback(done, testName, settings);
    })

    /**
     * @tc.name   capture_callback_with_setting_abnormal_005
     * @tc.number CAMERA_OUTPUT_PHOTO_029
     * @tc.desc   callback, settings-null -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_with_setting_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_with_setting_abnormal_005';
      let settings: camera.PhotoCaptureSetting | null = null;
      await captureWithSettingsCallback(done, testName, settings);
    })

    /**
     * @tc.name   capture_promise_with_setting_abnormal_001
     * @tc.number CAMERA_OUTPUT_PHOTO_030
     * @tc.desc   promise, settings-undefined -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_with_setting_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_with_setting_abnormal_001';
      let settings: camera.PhotoCaptureSetting | undefined = undefined;
      await captureWithSettingsPromise(done, testName, settings);
    })

    /**
     * @tc.name   capture_promise_with_setting_abnormal_002
     * @tc.number CAMERA_OUTPUT_PHOTO_031
     * @tc.desc   promise, settings quality-abnormal -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_with_setting_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_with_setting_abnormal_002';
      let settings: camera.PhotoCaptureSetting = {
        quality: InvalidParam,
        rotation: camera.ImageRotation.ROTATION_0,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsPromise(done, testName, settings);
    })

    /**
     * @tc.name   capture_promise_with_setting_abnormal_003
     * @tc.number CAMERA_OUTPUT_PHOTO_032
     * @tc.desc   promise, settings rotation-abnormal -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_with_setting_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_with_setting_abnormal_003';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
        rotation: InvalidParam,
        location: captureLocation,
        mirror: false
      };
      await captureWithSettingsPromise(done, testName, settings);
    })

    /**
     * @tc.name   capture_promise_with_setting_abnormal_004
     * @tc.number CAMERA_OUTPUT_PHOTO_033
     * @tc.desc   promise, settings location-abnormal -> passed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_with_setting_abnormal_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_with_setting_abnormal_004';
      let settings: camera.PhotoCaptureSetting = {
        quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
        rotation: camera.ImageRotation.ROTATION_0,
        location: InvalidLocation,
        mirror: false
      };
      await captureWithSettingsPromise(done, testName, settings);
    })

    /**
     * @tc.name   capture_promise_with_setting_abnormal_005
     * @tc.number CAMERA_OUTPUT_PHOTO_034
     * @tc.desc   settings-undefined -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_with_setting_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_with_setting_abnormal_005';
      let settings: camera.PhotoCaptureSetting | null = null;
      await captureWithSettingsPromise(done, testName, settings);
    })

    /**
     * @tc.name   capture_callback_error_001
     * @tc.number CAMERA_OUTPUT_PHOTO_035
     * @tc.desc   No session, only capture-callback -> error_code: 7400104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_error_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_error_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          await mCameraInput.open();
          console.info(TAG, testName + ' open passed.');
          mPhotoOutput.capture(async (error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG, testName + ' failed to capture, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            } else {
              console.info(TAG, testName + ' capture passed.');
              expect(true).assertTrue();
            }
          });
          console.info(TAG, testName + ' capture end.');
          await mPhotoOutput.release();
          console.info(TAG, testName + ' release photoOutput.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   capture_promise_error_001
     * @tc.number CAMERA_OUTPUT_PHOTO_036
     * @tc.desc   No session, only capture-promise -> error_code: 7400104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_error_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_error_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          await mCameraInput.open();
          await mPhotoOutput.capture().then(() => {
            console.info(TAG, testName + ' capture passed.');
            expect(true).assertTrue();
          }).catch(async (error: BusinessError) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error.code + ', msg: ' + error.message);
            expect(error.code == cameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            done();
          });
          console.info(TAG, testName + ' capture end.');
          await mPhotoOutput.release();
          console.info(TAG, testName + ' release photoOutput.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' capture failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   capture_callback_with_setting_error_001
     * @tc.number CAMERA_OUTPUT_PHOTO_037
     * @tc.desc   No session, only capture with settings-callback -> error_code: 7400104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_callback_with_setting_error_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_callback_with_setting_error_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          await mCameraInput.open();
          console.info(TAG, testName + ' open passed.');
          let settings: camera.PhotoCaptureSetting = {
            quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
            rotation: camera.ImageRotation.ROTATION_0
          }
          mPhotoOutput.capture(settings, async (error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG, testName + ' failed to capture, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            } else {
              console.info(TAG, testName + ' capture passed.');
              expect(true).assertTrue();
            }
          });
          console.info(TAG, testName + ' capture end.');
          await mPhotoOutput.release();
          console.info(TAG, testName + ' release photoOutput.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   capture_promise_with_setting_error_001
     * @tc.number CAMERA_OUTPUT_PHOTO_038
     * @tc.desc   No session, only capture with settings-promise -> error_code: 7400104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('capture_promise_with_setting_error_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'capture_promise_with_setting_error_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          await mCameraInput.open();
          console.info(TAG, testName + ' open passed.');
          let settings: camera.PhotoCaptureSetting = {
            quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
            rotation: camera.ImageRotation.ROTATION_0
          }
          await mPhotoOutput.capture(settings).then(() => {
            console.info(TAG, testName + ' capture passed.');
            expect(true).assertTrue();
          }).catch(async (error: BusinessError) => {
            console.error(TAG, testName + ' failed to capture, err: ' + error.code + ', msg: ' + error.message);
            expect(error.code == cameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            done();
          });
          console.info(TAG, testName + ' capture end.');
          await mPhotoOutput.release();
          console.info(TAG, testName + ' release photoOutput.');
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   on_photoAvailable_listen_002
     * @tc.number CAMERA_OUTPUT_PHOTO_039
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_photoAvailable_listen_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_photoAvailable_listen_002';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let targetProfile = mFullCameraOutputCap.photoProfiles[0];
          for (let i = 0; i < mFullCameraOutputCap.photoProfiles.length; i++) {
            if (mFullCameraOutputCap.photoProfiles[i].format === camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP) {
              targetProfile = mFullCameraOutputCap.photoProfiles[i];
              break;
            }
          }
          console.info(TAG, 'yuv test, photo profile: ' + JSON.stringify(targetProfile));
          mPhotoOutput = mCameraManager.createPhotoOutput(targetProfile);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
          mPhotoOutput.onCapturePhotoAvailable((CapturePhoto: camera.CapturePhoto) => {
            if (!CapturePhoto || !CapturePhoto.main) {
              console.error(TAG, testName + ' received invalid CapturePhoto or missing main image');
              expect().assertFail();
              return;
            }
            let mainImage: image.Image | image.Picture = CapturePhoto.main;
            console.info(TAG, testName + ' succeed to listen photoAvailable on.');
            expect(isEmpty(mainImage)).assertFalse();
            CapturePhoto.release();
          });
          await mPhotoOutput.capture;
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   off_photoAvailable_listen_002
     * @tc.number CAMERA_OUTPUT_PHOTO_040
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('off_photoAvailable_listen_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'off_photoAvailable_listen_002';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let targetProfile = mFullCameraOutputCap.photoProfiles[0];
          for (let i = 0; i < mFullCameraOutputCap.photoProfiles.length; i++) {
            if (mFullCameraOutputCap.photoProfiles[i].format === camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP) {
              targetProfile = mFullCameraOutputCap.photoProfiles[i];
              break;
            }
          }
          console.info(TAG, 'yuv test, photo profile: ' + JSON.stringify(targetProfile));
          mPhotoOutput = mCameraManager.createPhotoOutput(targetProfile);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
          mPhotoOutput.onCapturePhotoAvailable((CapturePhoto: camera.CapturePhoto) => {
            if (!CapturePhoto || !CapturePhoto.main) {
              console.error(TAG, testName + ' received invalid CapturePhoto or missing main image');
              expect().assertFail();
              return;
            }
            let mainImage: image.Image | image.Picture = CapturePhoto.main;
            console.info(TAG, testName + ' succeed to listen photoAvailable on.');
            expect(isEmpty(mainImage)).assertFalse();
            CapturePhoto.release();
          });
          await mPhotoOutput.capture();
          mPhotoOutput.offCapturePhotoAvailable();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await releasePhotoSession();
        done();
      }
    })
  })
}