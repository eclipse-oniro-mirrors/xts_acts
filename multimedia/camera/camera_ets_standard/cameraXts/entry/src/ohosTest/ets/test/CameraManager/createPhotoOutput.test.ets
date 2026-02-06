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
import { cameraErrorCode, isEmpty } from '../common';

const TAG = "CameraXts.createPhotoOutputTest";
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

export default function createPhotoOutputTest() {
  describe('createPhotoOutputTest', () => {
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
     * @tc.name   createPhotoOutput_001
     * @tc.number CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_001
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPhotoOutput_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoOutput_001';
      console.info(TAG, testName + ' begin.');
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
     * @tc.name   createPhotoOutput_002
     * @tc.number CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_002
     * @tc.desc   No abnormal scenarios-no photoProfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPhotoOutput_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoOutput_002';
      console.info(TAG, testName + ' begin.');
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
     * @tc.name   createPhotoOutput_abnormal_001
     * @tc.number CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_003
     * @tc.desc   new photoProfiles -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createPhotoOutput_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoOutput_abnormal_001';
      let newProfile: Array<camera.Profile> = new Array<camera.Profile>();
      createPhotoOutputAbnormal(done, testName, newProfile[0]);
    })

    /**
     * @tc.name   createPhotoOutput_abnormal_002
     * @tc.number CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_004
     * @tc.desc   abnormal photoProfiles -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createPhotoOutput_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoOutput_abnormal_002';
      let cameraOutputCapability =
        mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.NORMAL_PHOTO);
      console.info(TAG, testName + ' camera, output cap: ' + JSON.stringify(cameraOutputCapability));
      createPhotoOutputAbnormal(done, testName, cameraOutputCapability.photoProfiles[abnormalIndex]);
    })

    /**
     * @tc.name   createPhotoOutput_abnormal_003
     * @tc.number CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_005
     * @tc.desc   photoProfiles->undefined -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createPhotoOutput_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoOutput_abnormal_003';
      createPhotoOutputAbnormal(done, testName, undefined);
    })

    /**
     * @tc.name   createPhotoOutput_abnormal_004
     * @tc.number CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_006
     * @tc.desc   photoProfiles->null -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createPhotoOutput_abnormal_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoOutput_abnormal_004';
      createPhotoOutputAbnormal(done, testName, null);
    })

    /**
     * @tc.name   createPhotoOutput_abnormal_005
     * @tc.number CAMERA_MANAGER_CREATE_PHOTO_OUTPUT_007
     * @tc.desc   no supported sceneMode: SECURE_PHOTO, normal outputCap list -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPhotoOutput_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoOutput_abnormal_005';
      let cameraOutputCapability =
        mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[0], camera.SceneMode.SECURE_PHOTO);
      console.info(TAG, testName + ' camera, output cap: ' + JSON.stringify(cameraOutputCapability));
      createPhotoOutputAbnormal(done, testName, cameraOutputCapability.photoProfiles[0]);
    })
  })
}