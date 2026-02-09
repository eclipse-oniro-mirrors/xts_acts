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

const TAG = "CameraXts.createMetadataOutputBackTest";

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

function createMetadataOutputOrAbnormal(done: Function, testName: string,
  metadataProfile: Array<camera.MetadataObjectType> | null | undefined) {
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
      let metadataOutput = mCameraManager.createMetadataOutput(metadataProfile);
      console.info(TAG, testName + ' metadataOutput: ' + JSON.stringify(metadataOutput));
      expect(isEmpty(metadataOutput)).assertFalse();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    done();
  }
}

export default function createMetadataOutputBackTest() {
  describe('createMetadataOutputBackTest', () => {
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
     * @tc.name   createMetadataOutput_back_001
     * @tc.number CAMERA_MANAGER_CREATE_METADATA_OUTPUT_BACK_001
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createMetadataOutput_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createMetadataOutput_back_001';
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
                let metadataOutput =
                  mCameraManager.createMetadataOutput(cameraOutputCapability.supportedMetadataObjectTypes);
                console.info(TAG, testName + ' metadataOutput: ' + JSON.stringify(metadataOutput));
                expect(isEmpty(metadataOutput)).assertFalse();
              }
            }
          }
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   createMetadataOutput_back_002
     * @tc.number CAMERA_MANAGER_CREATE_METADATA_OUTPUT_BACK_002
     * @tc.desc   No abnormal scenarios-new metadataObjectTypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createMetadataOutput_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createMetadataOutput_back_002';
      let newProfile: Array<camera.MetadataObjectType> = new Array<camera.MetadataObjectType>();
      createMetadataOutputOrAbnormal(done, testName, newProfile);
    })

    /**
     * @tc.name   createMetadataOutput_back_003
     * @tc.number CAMERA_MANAGER_CREATE_METADATA_OUTPUT_BACK_003
     * @tc.desc   No abnormal scenarios-sceneMode: SECURE_PHOTO, normal outputCap list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createMetadataOutput_back_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createMetadataOutput_back_003';
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      let cameraOutputCapability =
        mCameraManager.getSupportedOutputCapability(mCameraDeviceArray[1], camera.SceneMode.SECURE_PHOTO);
      createMetadataOutputOrAbnormal(done, testName, cameraOutputCapability.supportedMetadataObjectTypes);
    })

    /**
     * @tc.name   createMetadataOutput_abnormal_back_001
     * @tc.number CAMERA_MANAGER_CREATE_METADATA_OUTPUT_BACK_004
     * @tc.desc   metadataObjectTypes->undefined -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createMetadataOutput_abnormal_back_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createMetadataOutput_abnormal_back_001';
      createMetadataOutputOrAbnormal(done, testName, undefined);
    })

    /**
     * @tc.name   createMetadataOutput_abnormal_back_002
     * @tc.number CAMERA_MANAGER_CREATE_METADATA_OUTPUT_BACK_005
     * @tc.desc   metadataObjectTypes->null -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createMetadataOutput_abnormal_back_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createMetadataOutput_abnormal_back_002';
      createMetadataOutputOrAbnormal(done, testName, null);
    })
  })
}