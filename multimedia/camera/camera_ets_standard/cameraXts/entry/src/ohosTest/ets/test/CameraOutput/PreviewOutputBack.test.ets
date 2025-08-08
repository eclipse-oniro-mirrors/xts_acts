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
import { cameraErrorCode, checkBackCamera, driveFn, getPermission, isEmpty } from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "CameraXts.PreviewOutputBackTest";
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let mSupportedModes: Array<camera.SceneMode>;
let mCameraInput: camera.CameraInput;
let mCameraOutputCap: camera.CameraOutputCapability;
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
  if (!checkBackCamera()) {
    console.info(TAG, 'The current device does not have a rear camera.');
    return;
  }
  mCameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[1]);
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
  if (!checkBackCamera()) {
    console.info(TAG, 'The current device does not have a rear camera.');
    return;
  }
  mCameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[1], mSupportedModes[0]);
  console.info(TAG, 'camera, output cap: ' + JSON.stringify(mCameraOutputCap));
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

export default function PreviewOutputBackTest() {
  describe('PreviewOutputBackTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      getCameraManager();
      getSupportedCameraDeviceArray();
      getSupportedModes();
      getOutputCapability();
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
     * @tc.number    : CAMERA_OUTPUT_PREVIEW_BACK_001
     * @tc.name      : on_error_listen_previewOutput_back_001
     * @tc.desc      : No abnormal scenarios-listen on error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('on_error_listen_previewOutput_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_error_listen_previewOutput_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          mPreviewOutput.on('error', (error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to listen error previewOutput on, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            } else {
              console.info(TAG, testName + ' succeed to listen error previewOutput on.');
              expect(true).assertFalse();
            }
          });
          await mPreviewOutput.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_OUTPUT_PREVIEW_BACK_002
     * @tc.name      : off_error_listen_previewOutput_back_001
     * @tc.desc      : No abnormal scenarios-listen off error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('off_error_listen_previewOutput_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'off_error_listen_previewOutput_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
          mPreviewOutput.on('error', (error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to listen error previewOutput on, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            } else {
              console.info(TAG, testName + ' succeed to listen error previewOutput on.');
              expect(true).assertFalse();
            }
          });
          mPreviewOutput.off('error', (error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to listen error previewOutput off, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            } else {
              console.info(TAG, testName + ' succeed to listen error previewOutput off.');
              expect(true).assertFalse();
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
     * @tc.number    : CAMERA_OUTPUT_PREVIEW_BACK_003
     * @tc.name      : release_preview_callback_back_001
     * @tc.desc      : No abnormal scenarios-preview output release-callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('release_preview_callback_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_preview_callback_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
          console.info(TAG, testName + ' getPhotoSession passed.');
          mPreviewOutput.release((error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to release previewOutput, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
            } else {
              console.info(TAG, testName + ' release passed.');
              expect(true).assertTrue();
            }
          });
          await mPhotoOutput.release();
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
     * @tc.number    : CAMERA_OUTPUT_PREVIEW_BACK_004
     * @tc.name      : release_preview_promise_back_001
     * @tc.desc      : No abnormal scenarios-preview output release-promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('release_preview_promise_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_preview_promise_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
          console.info(TAG, testName + ' getPhotoSession passed.');
          await mPreviewOutput.release().then(() => {
            console.info(TAG, testName + ' release previewOutput passed.');
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            console.error(TAG,
              testName + ' failed to release previewOutput, err: ' + error.code + ', msg: ' + error.message);
            expect().assertFail();
          });
          await mPhotoOutput.release();
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
     * @tc.number    : CAMERA_OUTPUT_PREVIEW_BACK_005 //TODO 未能成功监听错误码
     * @tc.name      : on_error_listen_previewOutput_abnormal_back_001
     * @tc.desc      : No abnormal scenarios
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*
        it('on_error_listen_previewOutput_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
          const testName = 'on_error_listen_previewOutput_abnormal_back_001';
          console.info(TAG, testName + ' begin.');
          if (!checkBackCamera()) {
            console.info(TAG, testName + ' the current device does not have a rear camera.');
            done();
            return;
          }
          try {
            if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
              console.info(TAG, testName + ' cameraManager is null.');
              expect().assertFail();
            } else {
              mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
              mPhotoSession = mCameraManager.createSession(mSupportedModes[0]);
              mPreviewOutput.on('error', (error) => {
                if (error !== undefined && error.code !== 0) {
                  console.error(TAG,
                    testName + ' failed to listen error previewOutput on, err: ' + error.code + ', msg: ' + error.message);
                  expect().assertFail();
                } else {
                  console.info(TAG, testName + ' succeed to listen error previewOutput on.');
                  expect(true).assertFalse();
                }
              });
              await mPhotoSession.start();
              mPhotoSession.beginConfig();
              await mPhotoSession.release();
            }
            done();
          } catch (error) {
            console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
            expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            await mPhotoSession.release();
            done();
          }
        })
    */
  })
}