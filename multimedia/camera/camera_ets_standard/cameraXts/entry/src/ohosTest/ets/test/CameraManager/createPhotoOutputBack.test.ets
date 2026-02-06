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
import { cameraErrorCode, checkBackCamera, isEmpty } from '../common';

const TAG = "CameraXts.createPhotoOutputBackTest";
const abnormalIndex = -1;
let mCameraManager: camera.CameraManager;
let mCameraDeviceArray: Array<camera.CameraDevice>;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

function getCameraManager() {
  console.info(TAG, 'getCameraManager.');
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmpty(mCameraManager)) {
    return false;
  }
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

function createPhotoOutputAbnormal(done: Function, testName: string, profile: camera.Profile | null | undefined) {
  console.info(TAG, testName + ' begin.');
  if (!checkBackCamera()) {
    console.info(TAG, testName + ' the current device does not have a rear camera.');
    done();
    return;
  }
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      let photoOutput = mCameraManager.createPhotoOutput(profile);
      console.info(TAG, testName + ' photoOutput: ' + JSON.stringify(photoOutput));
      expect(isEmpty(photoOutput)).assertFalse();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    done();
  }
}

export default function createPhotoOutputBackTest() {
  describe('createPhotoOutputBackTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      getCameraManager();
      getSupportedCameraDeviceArray();
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
     * @tc.number    : CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_BACK_001
     * @tc.name      : createPhotoOutput_back_001
     * @tc.desc      : No abnormal scenarios
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPhotoOutput_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoOutput_back_001';
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
          for (let i = 0; i < mCameraDeviceArray.length; i++) {
            let sceneModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);
            if (sceneModes !== null && sceneModes.length > 0) {
              for (const mode of sceneModes) {
                let cameraOutputCapability = mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[i], mode);
                expect(isEmpty(cameraOutputCapability)).assertFalse();
                console.info(TAG, testName + ' camera : ' + i + ', mode: ' + mode + ', output cap: ' +
                JSON.stringify(cameraOutputCapability));
                let photoOutput =
                  mCameraManager.createPhotoOutput(cameraOutputCapability.photoProfiles[i]);
                console.info(TAG, testName + ' photoOutput: ' + JSON.stringify(photoOutput));
                expect(isEmpty(photoOutput)).assertFalse();
              }
            }
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_BACK_002
     * @tc.name      : createPhotoOutput_back_002
     * @tc.desc      : No abnormal scenarios-no photoProfile
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPhotoOutput_back_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoOutput_back_002';
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
          let photoOutput = mCameraManager.createPhotoOutput();
          console.info(TAG, testName + ' photoOutput: ' + JSON.stringify(photoOutput));
          expect(isEmpty(photoOutput)).assertFalse();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(error.code === cameraErrorCode.INVALID_ARGUMENT).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_BACK_003
     * @tc.name      : createPhotoOutput_abnormal_back_001
     * @tc.desc      : new photoProfiles -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createPhotoOutput_abnormal_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoOutput_abnormal_back_001';
      let newProfile: Array<camera.Profile> = new Array<camera.Profile>();
      createPhotoOutputAbnormal(done, testName, newProfile[0]);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_BACK_004
     * @tc.name      : createPhotoOutput_abnormal_back_002
     * @tc.desc      : abnormal photoProfiles -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createPhotoOutput_abnormal_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoOutput_abnormal_back_002';
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      let cameraOutputCapability =
        mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[1], camera.SceneMode.NORMAL_PHOTO);
      console.info(TAG, testName + ' camera, output cap: ' + JSON.stringify(cameraOutputCapability));
      createPhotoOutputAbnormal(done, testName, cameraOutputCapability.photoProfiles[abnormalIndex]);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_BACK_005
     * @tc.name      : createPhotoOutput_abnormal_back_003
     * @tc.desc      : photoProfiles->undefined -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createPhotoOutput_abnormal_back_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoOutput_abnormal_back_003';
      createPhotoOutputAbnormal(done, testName, undefined);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_BACK_006
     * @tc.name      : createPhotoOutput_abnormal_back_004
     * @tc.desc      : photoProfiles->null -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createPhotoOutput_abnormal_back_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoOutput_abnormal_back_004';
      createPhotoOutputAbnormal(done, testName, null);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_BACK_007
     * @tc.name      : createPhotoOutput_abnormal_back_005
     * @tc.desc      : no supported sceneMode: SECURE_PHOTO, normal outputCap list -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPhotoOutput_abnormal_back_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoOutput_abnormal_back_005';
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      let cameraOutputCapability =
        mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[1], camera.SceneMode.SECURE_PHOTO);
      console.info(TAG, testName + ' camera, output cap: ' + JSON.stringify(cameraOutputCapability));
      createPhotoOutputAbnormal(done, testName, cameraOutputCapability.photoProfiles[0]);
    })
  })
}