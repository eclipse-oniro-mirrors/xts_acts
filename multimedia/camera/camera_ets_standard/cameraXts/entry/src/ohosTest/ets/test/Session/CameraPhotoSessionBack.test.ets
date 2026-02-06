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
import {
  cameraErrorCode,
  cameraPreconfigRatio,
  cameraPreconfigType,
  checkBackCamera,
  COMMON_WAIT_DURATION,
  driveFn,
  getPermission,
  isEmpty,
  sleep
} from '../common';
import { BusinessError } from '@kit.BasicServicesKit';
import { indexSurfaceId } from '../../testability/pages/Index';

const TAG = "CameraXts.CameraPhotoSessionBackTest";
const abnormalIndex = -1;
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

function getPhotoSession() {
  console.info(TAG, 'getPhotoSession.');
  mPhotoSession = mCameraManager.createSession(mSupportedModes[0]);
}

async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput?.release();
  console.info(TAG, 'release previewOutput passed.');
  await mPhotoOutput?.release();
  console.info(TAG, 'release photoOutput passed.');
  await mPhotoSession?.release();
  console.info(TAG, 'release session passed.');
}

async function getCommitConfig(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCommitConfig.');
  mPhotoSession.beginConfig();
  mPhotoSession.addInput(mCameraInput);
  await mCameraInput.open();
  mPhotoSession.addOutput(previewOutput);
  mPhotoSession.addOutput(photoOutput);
  await mPhotoSession.commitConfig();
}

async function beforeCommit(testName: string, previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'beforeCommit.');
  mPhotoSession.beginConfig();
  console.info(TAG, testName + ' beginConfig passed.');
  mPhotoSession.addInput(mCameraInput);
  console.info(TAG, testName + ' addInput passed.');
  await mCameraInput.open();
  console.info(TAG, testName + ' camera open passed.');
  mPhotoSession.addOutput(previewOutput);
  console.info(TAG, testName + ' addOutput previewOutput passed.');
  mPhotoSession.addOutput(photoOutput);
  console.info(TAG, testName + ' addOutput photoOutput passed.');
}

async function onErrorListen(testName: string) {
  mPhotoSession.on('error', (error) => {
    if (error !== undefined && error.code !== 0) {
      console.error(TAG, 'on error listen, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
    } else {
      console.info(TAG, testName + ' session release passed.');
      expect(true).assertTrue();
    }
  });
}

async function commitPreconfigCallback(done: Function, testName: string, type: camera.PreconfigType,
  ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      expect(isEmpty(mPhotoSession)).assertFalse();
      console.info(TAG, testName + ' session created successfully.');
      let result = mPhotoSession.canPreconfig(type, ratio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        await mPhotoSession.release();
        done();
        return;
      }
      mPhotoSession.preconfig(type, ratio);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
      await beforeCommit(testName, mPreviewOutput, mPhotoOutput);
      mPhotoSession.commitConfig((error) => {
        if (error !== undefined && error.code !== 0) {
          console.error(TAG,
            testName + ' failed to commitConfig, err: ' + error.code + ', msg: ' + error.message);
          expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
          done();
        } else {
          console.info(TAG, testName + ' session commitConfig passed.');
          expect(true).assertTrue();
        }
      });
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

async function commitPreconfigCallbackAbnormal(done: Function, testName: string,
  type: camera.PreconfigType | undefined | null, ratio: camera.PreconfigRatio | undefined | null) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      expect(isEmpty(mPhotoSession)).assertFalse();
      console.info(TAG, testName + ' session created successfully.');
      let result = mPhotoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        await mPhotoSession.release();
        done();
        return;
      }
      mPhotoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
      await beforeCommit(testName, mPreviewOutput, mPhotoOutput);
      mPhotoSession.commitConfig((error) => {
        if (error !== undefined && error.code !== 0) {
          console.error(TAG,
            testName + ' failed to commitConfig, err: ' + error.code + ', msg: ' + error.message);
          expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
          done();
        } else {
          console.info(TAG, testName + ' session commitConfig passed.');
          expect(true).assertTrue();
        }
      });
      await releasePhotoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    await mPhotoSession.release();
    done();
  }
}

async function commitPreconfigPromise(done: Function, testName: string, type: camera.PreconfigType,
  ratio: camera.PreconfigRatio) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      expect(isEmpty(mPhotoSession)).assertFalse();
      console.info(TAG, testName + ' session created successfully.');
      let result = mPhotoSession.canPreconfig(type, ratio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        await mPhotoSession.release();
        done();
        return;
      }
      mPhotoSession.preconfig(type, ratio);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
      await beforeCommit(testName, mPreviewOutput, mPhotoOutput);
      await mPhotoSession.commitConfig().then(async () => {
        console.info(TAG, testName + ' session commitConfig successfully.');
        expect(true).assertTrue();
      }).catch((error: BusinessError) => {
        console.error(TAG,
          testName + ' failed to commit the config, err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        done();
      })
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

async function commitPreconfigPromiseAbnormal(done: Function, testName: string,
  type: camera.PreconfigType | undefined | null, ratio: camera.PreconfigRatio | undefined | null) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      expect(isEmpty(mPhotoSession)).assertFalse();
      console.info(TAG, testName + ' session created successfully.');
      let result = mPhotoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        await mPhotoSession.release();
        done();
        return;
      }
      mPhotoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
      await beforeCommit(testName, mPreviewOutput, mPhotoOutput);
      await mPhotoSession.commitConfig().then(async () => {
        console.info(TAG, testName + ' session commitConfig successfully.');
        expect(true).assertTrue();
      }).catch((error: BusinessError) => {
        console.error(TAG,
          testName + ' failed to commit the config, err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        done();
      })
      await releasePhotoSession();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    await mPhotoSession.release();
    done();
  }
}

async function addOutputPreview(done: Function, testName: string, type: camera.PreconfigType | undefined | null,
  ratio: camera.PreconfigRatio | undefined | null) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      expect(isEmpty(mPhotoSession)).assertFalse();
      console.info(TAG, testName + ' session created successfully.');
      let result = mPhotoSession.canPreconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      if (!result) {
        console.info(TAG, testName + ' the camera of this device does not support pre configuration.');
        await mPhotoSession.release();
        done();
        return;
      }
      mPhotoSession.preconfig(type as camera.PreconfigType, ratio as camera.PreconfigRatio);
      mPreviewOutput = mCameraManager.createPreviewOutput(indexSurfaceId);
      mPhotoSession.beginConfig();
      mPhotoSession.addInput(mCameraInput);
      await mCameraInput.open();
      mPhotoSession.addOutput(mPreviewOutput);
      console.info(TAG, testName + ' addOutput previewOutput passed.');
      mPhotoSession.removeOutput(mPreviewOutput);
      console.info(TAG, testName + ' removeOutput previewOutput passed.');
      expect(true).assertTrue();
      await mPhotoSession.release();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' removeOutput failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    await mPhotoSession.release();
    done();
  }
}

export default function CameraPhotoSessionBackTest() {
  describe('CameraPhotoSessionBackTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      getCameraManager();
      getSupportedCameraDeviceArray();
      getSupportedModes();
      await getPermission();
      await driveFn();
      getCameraInput();
      getOutputCapability();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
      getPhotoSession();
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case.');
      await sleep(COMMON_WAIT_DURATION);
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_001
     * @tc.name      : beginConfig_photo_back_001
     * @tc.desc      : No abnormal scenarios-beginConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('beginConfig_photo_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'beginConfig_photo_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPhotoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          await mPhotoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_002
     * @tc.name      : addInput_removeInput_photo_back_001
     * @tc.desc      : No abnormal scenarios-addInput/removeInput
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('addInput_removeInput_photo_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'addInput_removeInput_photo_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPhotoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          mPhotoSession.addInput(mCameraInput);
          console.info(TAG, testName + ' addInput passed.');
          mPhotoSession.removeInput(mCameraInput);
          console.info(TAG, testName + ' removeInput passed.');
          await mPhotoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_003
     * @tc.name      : addInput_photo_abnormal_back_001
     * @tc.desc      : addInput() not between beginConfig and commitConfig -> error_code: 7400102
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('addInput_photo_abnormal_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'addInput_photo_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPhotoSession.addInput(mCameraInput);
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        await mPhotoSession.release();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_004
     * @tc.name      : addInput_photo_abnormal_back_002
     * @tc.desc      : addInput the same twice -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('addInput_photo_abnormal_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'addInput_photo_abnormal_back_002';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPhotoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          mPhotoSession.addInput(mCameraInput);
          console.info(TAG, testName + ' addInput passed.');
          let result = mPhotoSession.canAddInput(mCameraInput);
          console.info(TAG, testName + ' result: ' + result);
          expect(result).assertFalse();
          mPhotoSession.addInput(mCameraInput);
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        await mPhotoSession.release();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_005
     * @tc.name      : commitConfig_photo_callback_back_001
     * @tc.desc      : No abnormal scenarios-commitConfig-callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('commitConfig_photo_callback_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_photo_callback_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await beforeCommit(testName, mPreviewOutput, mPhotoOutput);
          mPhotoSession.commitConfig((error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to commitConfig, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
              done();
            } else {
              console.info(TAG, testName + ' session commitConfig passed.');
              expect(true).assertTrue();
            }
          });
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_006
     * @tc.name      : commitConfig_photo_promise_back_001
     * @tc.desc      : No abnormal scenarios-commitConfig-promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('commitConfig_photo_promise_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_photo_promise_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          await beforeCommit(testName, mPreviewOutput, mPhotoOutput);
          await mPhotoSession.commitConfig().then(async () => {
            console.info(TAG, testName + ' session commitConfig successfully.');
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            console.error(TAG,
              testName + ' failed to commit the config, err: ' + error.code + ', msg: ' + error.message);
            expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
            done();
          })
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_007
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_back_001
     * @tc.desc      : No abnormal scenarios-addOutput/removeOutput->previewOutput
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_photo_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          mPhotoSession.beginConfig();
          mPhotoSession.addInput(mCameraInput);
          await mCameraInput.open();
          mPhotoSession.addOutput(mPreviewOutput);
          console.info(TAG, testName + ' addOutput previewOutput passed.');
          mPhotoSession.removeOutput(mPreviewOutput);
          console.info(TAG, testName + ' removeOutput previewOutput passed.');
          expect(true).assertTrue();
          await mPreviewOutput.release();
          await mPhotoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_008
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_abnormal_back_001
     * @tc.desc      : Abnormal scenarios-addOutput/removeOutput->no addInput -> error_code: 7400201
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_photo_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          mPhotoSession.beginConfig();
          mPhotoSession.addOutput(mPreviewOutput);
          console.info(TAG, testName + ' addOutput previewOutput passed.');
          mPhotoSession.removeOutput(mPreviewOutput);
          console.info(TAG, testName + ' removeOutput previewOutput passed.');
          expect(true).assertTrue();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        await mPreviewOutput.release();
        await mPhotoSession.release();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_009
     * @tc.name      : addOutput_photo_abnormal_back_001
     * @tc.desc      : First commitConfig(), then addOutput() -> error_code: 7400102
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_photo_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_photo_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          mPhotoSession.beginConfig();
          mPhotoSession.addInput(mCameraInput);
          await mCameraInput.open();
          mPhotoSession.addOutput(mPreviewOutput);
          mPhotoSession.addOutput(mPhotoOutput);
          await mPhotoSession.commitConfig();
          mPhotoSession.addOutput(mPreviewOutput);
          expect(true).assertTrue();
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' addOutput failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_010
     * @tc.name      : removeOutput_photo_abnormal_back_001
     * @tc.desc      : First commitConfig(), then removeOutput() -> error_code: 7400102
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('removeOutput_photo_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'removeOutput_photo_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          mPhotoSession.beginConfig();
          mPhotoSession.addInput(mCameraInput);
          await mCameraInput.open();
          mPhotoSession.addOutput(mPreviewOutput);
          await mPhotoSession.commitConfig();
          mPhotoSession.removeOutput(mPreviewOutput);
          console.info(TAG, testName + ' removeOutput previewOutput passed.');
          expect(true).assertTrue();
          await mPreviewOutput.release();
          await mPhotoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' removeOutput failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        await mPreviewOutput.release();
        await mPhotoSession.release();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_011
     * @tc.name      : start_photo_callback_back_001
     * @tc.desc      : No abnormal scenarios-start-callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('start_photo_callback_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'start_photo_callback_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          await getCommitConfig(mPreviewOutput, mPhotoOutput);
          console.info(TAG, testName + ' session commitConfig successfully.');
          mPhotoSession.start((error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to start, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
              done();
            } else {
              console.info(TAG, testName + ' session start passed.');
              expect(true).assertTrue();
            }
          });
          await mPhotoSession.stop();
          console.info(TAG, testName + ' session stop passed.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_012
     * @tc.name      : start_photo_promise_back_001
     * @tc.desc      : No abnormal scenarios-start-promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('start_photo_promise_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'start_photo_promise_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          await getCommitConfig(mPreviewOutput, mPhotoOutput);
          console.info(TAG, testName + ' session commitConfig successfully.');
          await mPhotoSession.start().then(() => {
            console.info(TAG, testName + ' session start passed.');
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            console.error(TAG,
              testName + ' failed to start, err: ' + error.code + ', msg: ' + error.message);
            expect().assertFail();
            done();
          })
          await mPhotoSession.stop();
          console.info(TAG, testName + ' session stop passed.');
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_013
     * @tc.name      : start_photo_callback_abnormal_back_001
     * @tc.desc      : First start(), then beginConfig()-callback -> error_code: 7400103
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('start_photo_callback_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'start_photo_callback_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPhotoSession.start((error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to start, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
              done();
            } else {
              console.info(TAG, testName + ' session start passed.');
              expect(true).assertTrue();
            }
          });
          mPhotoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          expect(true).assertTrue();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        await mPhotoSession.release();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_014
     * @tc.name      : start_photo_promise_abnormal_back_001
     * @tc.desc      : First start(), then beginConfig()-promise -> error_code: 7400103
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('start_photo_promise_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'start_photo_promise_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          await mPhotoSession.start();
          mPhotoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          expect(true).assertTrue();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        await mPhotoSession.release();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_015
     * @tc.name      : stop_photo_callback_back_001
     * @tc.desc      : No abnormal scenarios-stop-callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('stop_photo_callback_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'stop_photo_callback_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          await getCommitConfig(mPreviewOutput, mPhotoOutput);
          await mPhotoSession.start();
          console.info(TAG, testName + ' session start successfully.');
          mPhotoSession.stop((error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to stop, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
              done();
            } else {
              console.info(TAG, testName + ' session stop passed.');
              expect(true).assertTrue();
            }
          });
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_016
     * @tc.name      : stop_photo_promise_back_001
     * @tc.desc      : No abnormal scenarios-stop-promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('stop_photo_promise_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'stop_photo_promise_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          await getCommitConfig(mPreviewOutput, mPhotoOutput);
          console.info(TAG, testName + ' session commitConfig successfully.');
          await mPhotoSession.start();
          await mPhotoSession.stop().then(() => {
            console.info(TAG, testName + ' session start passed.');
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            console.error(TAG,
              testName + ' failed to stop, err: ' + error.code + ', msg: ' + error.message);
            expect().assertFail();
            done();
          });
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_017
     * @tc.name      : stop_photo_callback_abnormal_back_001
     * @tc.desc      : First stop(), then beginConfig()-callback -> error_code: 7400103
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('stop_photo_callback_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'stop_photo_callback_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          await mPhotoSession.start();
          console.info(TAG, testName + ' session start successfully.');
          mPhotoSession.stop((error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to stop, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
              done();
            } else {
              console.info(TAG, testName + ' session stop passed.');
              expect(true).assertTrue();
            }
          });
          mPhotoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          expect(true).assertTrue();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        await mPhotoSession.release();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_018
     * @tc.name      : stop_photo_promise_abnormal_back_001
     * @tc.desc      : First start(), then beginConfig()-promise -> error_code: 7400103
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('stop_photo_promise_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'stop_photo_promise_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          await mPhotoSession.start();
          await mPhotoSession.stop().then(() => {
            console.info(TAG, testName + ' session start passed.');
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            console.error(TAG,
              testName + ' failed to stop, err: ' + error.code + ', msg: ' + error.message);
            expect().assertFail();
            done();
          });
          mPhotoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          expect(true).assertTrue();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        await mPhotoSession.release();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_019
     * @tc.name      : release_photo_session_callback_back_001
     * @tc.desc      : No abnormal scenarios-release-callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('release_photo_session_callback_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_photo_session_callback_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPhotoSession.release((error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to commit the config, err: ' + error.code + ', msg: ' + error.message);
              expect().assertFail();
            }
            console.info(TAG, testName + ' session release passed.');
            expect(true).assertTrue();
          })
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_020
     * @tc.name      : release_photo_session_promise_back_001
     * @tc.desc      : No abnormal scenarios-release-promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('release_photo_session_promise_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_photo_session_promise_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          await mPhotoSession.release().then(() => {
            console.info(TAG, testName + ' session release passed.');
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName + 'release failed. err: ' + error.code + ', msg: ' + error.message);
            expect().assertFail();
            done();
          })
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_021
     * @tc.name      : on_off_error_listen_photo_back_001
     * @tc.desc      : No abnormal scenarios-on/off('error')
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('on_off_error_listen_photo_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_error_listen_photo_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          await onErrorListen(testName);
          mPhotoSession.off('error');
          await mPhotoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_022
     * @tc.name      : on_off_error_listen_photo_abnormal_back_001
     * @tc.desc      : on/off('error')-start(), beginConfig()
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('on_off_error_listen_photo_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_error_listen_photo_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          await onErrorListen(testName);
          await mPhotoSession.start();
          mPhotoSession.beginConfig();
          mPhotoSession.off('error');
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

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_023
     * @tc.name      : beginConfig_photo_abnormal_back_001
     * @tc.desc      : beginConfig() twice -> error_code: 7400105
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('beginConfig_photo_abnormal_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'beginConfig_photo_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPhotoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          mPhotoSession.beginConfig();
          console.info(TAG, testName + ' beginConfig passed.');
          await mPhotoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SESSION_CONFIG_LOCKED).assertTrue();
        await mPhotoSession.release();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_024
     * @tc.name      : commitConfig_photo_callback_abnormal_back_001
     * @tc.desc      : only commitConfig(), callback -> error_code: 7400102
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('commitConfig_photo_callback_abnormal_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_photo_callback_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPhotoSession.commitConfig((error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to commitConfig, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
            } else {
              console.info(TAG, testName + ' session commitConfig passed.');
              expect(true).assertTrue();
            }
          });
          await mPhotoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        await mPhotoSession.release();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_025
     * @tc.name      : commitConfig_photo_callback_abnormal_back_002
     * @tc.desc      : commitConfig() twice, callback -> error_code: 7400102
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('commitConfig_photo_callback_abnormal_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_photo_callback_abnormal_back_002';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          await getCommitConfig(mPreviewOutput, mPhotoOutput);
          mPhotoSession.commitConfig((error) => {
            if (error !== undefined && error.code !== 0) {
              console.error(TAG,
                testName + ' failed to commitConfig, err: ' + error.code + ', msg: ' + error.message);
              expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
            } else {
              console.info(TAG, testName + ' session commitConfig passed.');
              expect(true).assertTrue();
            }
          });
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_026
     * @tc.name      : commitConfig_photo_promise_abnormal_back_001
     * @tc.desc      : only commitConfig(), promise -> error_code: 7400102
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('commitConfig_photo_promise_abnormal_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_photo_promise_abnormal_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          await mPhotoSession.commitConfig().then(async () => {
            console.info(TAG, testName + ' session commitConfig successfully.');
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            console.error(TAG,
              testName + ' failed to commit the config, err: ' + error.code + ', msg: ' + error.message);
            expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
          });
          await mPhotoSession.release();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        await mPhotoSession.release();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_027
     * @tc.name      : commitConfig_photo_promise_abnormal_back_002
     * @tc.desc      : commitConfig() twice, promise -> error_code: 7400102
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('commitConfig_photo_promise_abnormal_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_photo_promise_abnormal_back_002';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      try {
        if (isEmpty(mCameraManager) && isEmpty(mSupportedModes)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          expect(isEmpty(mPhotoSession)).assertFalse();
          console.info(TAG, testName + ' session created successfully.');
          mPreviewOutput = mCameraManager.createPreviewOutput(mCameraOutputCap.previewProfiles[0], indexSurfaceId);
          mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
          await getCommitConfig(mPreviewOutput, mPhotoOutput);
          await mPhotoSession.commitConfig().then(async () => {
            console.info(TAG, testName + ' session commitConfig successfully.');
            expect(true).assertTrue();
          }).catch((error: BusinessError) => {
            console.error(TAG,
              testName + ' failed to commit the config, err: ' + error.code + ', msg: ' + error.message);
            expect(error.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
          });
          await releasePhotoSession();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_028
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_back_001
     * @tc.desc      : preconfig, type->PRECONFIG_720P, ratio->PRECONFIG_RATIO_4_3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_back_001';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_4_3);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_029
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_back_002
     * @tc.desc      : preconfig, type->PRECONFIG_1080P, ratio->PRECONFIG_RATIO_4_3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_back_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_back_002';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_1080P,
        cameraPreconfigRatio.PRECONFIG_RATIO_4_3);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_030
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_back_003
     * @tc.desc      : preconfig, type->PRECONFIG_4K, ratio->PRECONFIG_RATIO_4_3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_back_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_back_003';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_4K,
        cameraPreconfigRatio.PRECONFIG_RATIO_4_3);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_031
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_back_004
     * @tc.desc      : preconfig, type->PRECONFIG_HIGH_QUALITY, ratio->PRECONFIG_RATIO_4_3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_back_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_back_004';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_HIGH_QUALITY,
        cameraPreconfigRatio.PRECONFIG_RATIO_4_3);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_032
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_back_005
     * @tc.desc      : preconfig, type->PRECONFIG_720P, ratio->PRECONFIG_RATIO_1_1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_back_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_back_005';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_1_1);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_033
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_back_006
     * @tc.desc      : preconfig, type->PRECONFIG_1080P, ratio->PRECONFIG_RATIO_1_1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_back_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_back_006';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_1080P,
        cameraPreconfigRatio.PRECONFIG_RATIO_1_1);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_034
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_back_007
     * @tc.desc      : preconfig, type->PRECONFIG_4K, ratio->PRECONFIG_RATIO_1_1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_back_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_back_007';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_4K,
        cameraPreconfigRatio.PRECONFIG_RATIO_1_1);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_035
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_back_008
     * @tc.desc      : preconfig, type->PRECONFIG_HIGH_QUALITY, ratio->PRECONFIG_RATIO_4_3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_back_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_back_008';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_HIGH_QUALITY,
        cameraPreconfigRatio.PRECONFIG_RATIO_1_1);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_036
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_back_009
     * @tc.desc      : preconfig, type->PRECONFIG_720P, ratio->PRECONFIG_RATIO_16_9
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_back_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_back_009';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_037
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_back_010
     * @tc.desc      : preconfig, type->PRECONFIG_1080P, ratio->PRECONFIG_RATIO_16_9
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_back_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_back_010';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_1080P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_038
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_back_011
     * @tc.desc      : preconfig, type->PRECONFIG_4K, ratio->PRECONFIG_RATIO_16_9
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_back_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_back_011';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_4K,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_039
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_back_012
     * @tc.desc      : preconfig, type->PRECONFIG_HIGH_QUALITY, ratio->PRECONFIG_RATIO_16_9
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_back_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_back_012';
      await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_HIGH_QUALITY,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_040
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_001
     * @tc.desc      : preconfig, type->PRECONFIG_720P, ratio->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_001', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_001';
        await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_720P, undefined);
      })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_041
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_002
     * @tc.desc      : preconfig, type->undefined, ratio->PRECONFIG_RATIO_16_9
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_002', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_002';
        await addOutputPreview(done, testName, undefined, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
      })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_042
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_003
     * @tc.desc      : preconfig, type->null, ratio->PRECONFIG_RATIO_16_9
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_003', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_003';
        await addOutputPreview(done, testName, null, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
      })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_043
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_004
     * @tc.desc      : preconfig, type->abnormalIndex, ratio->PRECONFIG_RATIO_16_9
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_004', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_004';
        await addOutputPreview(done, testName, abnormalIndex, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
      })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_044
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_005
     * @tc.desc      : preconfig, type->PRECONFIG_720P, ratio->null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_005', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_005';
        await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_720P, null);
      })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_045
     * @tc.name      : addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_006
     * @tc.desc      : preconfig, type->PRECONFIG_720P, ratio->abnormalIndex
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_006', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'addOutput_removeOutput_previewOutput_photo_preconfig_abnormal_back_006';
        await addOutputPreview(done, testName, cameraPreconfigType.PRECONFIG_720P, abnormalIndex);
      })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_046
     * @tc.name      : commitConfig_photo_preconfig_callback_back_001
     * @tc.desc      : No abnormal scenarios-commitConfig-callback-preConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('commitConfig_photo_preconfig_callback_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_photo_preconfig_callback_back_001';
      await commitPreconfigCallback(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_047
     * @tc.name      : commitConfig_photo_preconfig_callback_abnormal_back_001
     * @tc.desc      : commitConfig-callback-preConfig, ratio->-1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('commitConfig_photo_preconfig_callback_abnormal_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_photo_preconfig_callback_abnormal_back_001';
      await commitPreconfigCallback(done, testName, cameraPreconfigType.PRECONFIG_720P, abnormalIndex);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_048
     * @tc.name      : commitConfig_photo_preconfig_callback_abnormal_back_002
     * @tc.desc      : commitConfig-callback-preConfig, ratio->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('commitConfig_photo_preconfig_callback_abnormal_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_photo_preconfig_callback_abnormal_back_002';
      await commitPreconfigCallback(done, testName, abnormalIndex, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_049
     * @tc.name      : commitConfig_photo_preconfig_callback_abnormal_back_003
     * @tc.desc      : commitConfig-callback-preConfig, type->-1, ratio->PRECONFIG_RATIO_16_9
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('commitConfig_photo_preconfig_callback_abnormal_back_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_photo_preconfig_callback_abnormal_back_003';
      await commitPreconfigCallbackAbnormal(done, testName, cameraPreconfigType.PRECONFIG_720P, undefined);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_050
     * @tc.name      : commitConfig_photo_preconfig_promise_back_001
     * @tc.desc      : No abnormal scenarios-commitConfig-promise-preConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('commitConfig_photo_preconfig_promise_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_photo_preconfig_promise_back_001';
      await commitPreconfigPromise(done, testName, cameraPreconfigType.PRECONFIG_720P,
        cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_051
     * @tc.name      : commitConfig_photo_preconfig_promise_abnormal_back_001
     * @tc.desc      : commitConfig-promise-preConfig, ratio->-1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('commitConfig_photo_preconfig_promise_abnormal_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_photo_preconfig_promise_abnormal_back_001';
      await commitPreconfigPromise(done, testName, cameraPreconfigType.PRECONFIG_720P, abnormalIndex);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_052
     * @tc.name      : commitConfig_photo_preconfig_promise_abnormal_back_002
     * @tc.desc      : commitConfig-promise-preConfig, type->-1, ratio->PRECONFIG_RATIO_16_9
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('commitConfig_photo_preconfig_promise_abnormal_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_photo_preconfig_promise_abnormal_back_002';
      await commitPreconfigPromise(done, testName, abnormalIndex, cameraPreconfigRatio.PRECONFIG_RATIO_16_9);
    })

    /**
     * @tc.number    : CAMERA_PHOTO_SESSION_BACK_053
     * @tc.name      : commitConfig_photo_preconfig_promise_abnormal_back_003
     * @tc.desc      : commitConfig-promise-preConfig, ratio->undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('commitConfig_photo_preconfig_promise_abnormal_back_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'commitConfig_photo_preconfig_promise_abnormal_003';
      await commitPreconfigPromiseAbnormal(done, testName, cameraPreconfigType.PRECONFIG_720P, undefined);
    })
  })
}