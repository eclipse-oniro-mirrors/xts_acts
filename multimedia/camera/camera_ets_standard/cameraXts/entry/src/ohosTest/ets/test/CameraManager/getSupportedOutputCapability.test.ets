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
import { cameraErrorCode, isEmpty, sceneMode } from '../common';

const TAG = "CameraXts.getSupportedOutputCapabilityTest";
const abnormalValue = -1;
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

function getOutputCapability(done: Function, testName: string, cameraDevice: camera.CameraDevice | null | undefined,
  sMode: camera.SceneMode | null | undefined) {
  console.info(TAG, testName + ' begin.');
  try {
    let cameraOutputCapability =
      mCameraManager.getSupportedOutputCapability(cameraDevice as camera.CameraDevice, sMode as camera.SceneMode);
    expect(isEmpty(cameraOutputCapability)).assertFalse();
    console.info(TAG,
      testName + ' camera mode: ' + sMode + ', output cap: ' + JSON.stringify(cameraOutputCapability));
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    done();
  }
}

export default function getSupportedOutputCapabilityTest() {
  describe('getSupportedOutputCapabilityTest', () => {
    beforeAll(() => {
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
     * @tc.number    : CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_001
     * @tc.name      : getSupportedOutputCapability_001
     * @tc.desc      : No abnormal scenarios-mode->NORMAL_PHOTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getSupportedOutputCapability_001', Level.LEVEL0, (done: Function) => {
      const testName = 'getSupportedOutputCapability_001';
      getOutputCapability(done, testName, mCameraDeviceArray[0], sceneMode.NORMAL_PHOTO);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_002
     * @tc.name      : getSupportedOutputCapability_002
     * @tc.desc      : No abnormal scenarios-mode->NORMAL_VIDEO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getSupportedOutputCapability_002', Level.LEVEL0, (done: Function) => {
      const testName = 'getSupportedOutputCapability_002';
      getOutputCapability(done, testName, mCameraDeviceArray[0], sceneMode.NORMAL_VIDEO);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_003
     * @tc.name      : getSupportedOutputCapability_003
     * @tc.desc      : No abnormal scenarios-mode->SECURE_PHOTO
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getSupportedOutputCapability_003', Level.LEVEL0, (done: Function) => {
      const testName = 'getSupportedOutputCapability_003';
      getOutputCapability(done, testName, mCameraDeviceArray[0], sceneMode.SECURE_PHOTO);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_004
     * @tc.name      : getSupportedOutputCapability_abnormal_001
     * @tc.desc      : scene mode->null -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getSupportedOutputCapability_abnormal_001', Level.LEVEL0, (done: Function) => {
      const testName = 'getSupportedOutputCapability_abnormal_001';
      getOutputCapability(done, testName, mCameraDeviceArray[0], null);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_005
     * @tc.name      : getSupportedOutputCapability_abnormal_002
     * @tc.desc      : scene mode->undefined -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getSupportedOutputCapability_abnormal_002', Level.LEVEL0, (done: Function) => {
      const testName = 'getSupportedOutputCapability_abnormal_002';
      getOutputCapability(done, testName, mCameraDeviceArray[0], undefined);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_006
     * @tc.name      : getSupportedOutputCapability_abnormal_003
     * @tc.desc      : scene mode->invalid mode -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getSupportedOutputCapability_abnormal_003', Level.LEVEL0, (done: Function) => {
      const testName = 'getSupportedOutputCapability_abnormal_003';
      getOutputCapability(done, testName, mCameraDeviceArray[0], abnormalValue);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_007
     * @tc.name      : getSupportedOutputCapability_abnormal_004
     * @tc.desc      : cameraDevice->invalid -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getSupportedOutputCapability_abnormal_004', Level.LEVEL0, (done: Function) => {
      const testName = 'getSupportedOutputCapability_abnormal_004';
      getOutputCapability(done, testName, mCameraDeviceArray[abnormalValue], sceneMode.NORMAL_VIDEO);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_008
     * @tc.name      : getSupportedOutputCapability_abnormal_005
     * @tc.desc      : cameraDevice->undefined -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getSupportedOutputCapability_abnormal_005', Level.LEVEL0, (done: Function) => {
      const testName = 'getSupportedOutputCapability_abnormal_005';
      getOutputCapability(done, testName, undefined, sceneMode.NORMAL_VIDEO);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_009
     * @tc.name      : getSupportedOutputCapability_abnormal_006
     * @tc.desc      : cameraDevice->null -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getSupportedOutputCapability_abnormal_006', Level.LEVEL0, (done: Function) => {
      const testName = 'getSupportedOutputCapability_abnormal_006';
      getOutputCapability(done, testName, null, sceneMode.NORMAL_VIDEO);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_010
     * @tc.name      : getSupportedOutputCapability_abnormal_007
     * @tc.desc      : cameraDevice->invalid -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getSupportedOutputCapability_abnormal_007', Level.LEVEL0, (done: Function) => {
      const testName = 'getSupportedOutputCapability_abnormal_007';
      getOutputCapability(done, testName, mCameraDeviceArray[abnormalValue], sceneMode.NORMAL_PHOTO);
    })

    /**
     * @tc.number    : CAMERA_MANAGER_GET_SUPPORTED_OUTPUT_CAPABILITY_011
     * @tc.name      : getSupportedOutputCapability_abnormal_008
     * @tc.desc      : cameraDevice->invalid, sceneMode: SECURE_PHOTO -> error_code: 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getSupportedOutputCapability_abnormal_008', Level.LEVEL0, (done: Function) => {
      const testName = 'getSupportedOutputCapability_abnormal_008';
      getOutputCapability(done, testName, mCameraDeviceArray[abnormalValue], sceneMode.SECURE_PHOTO);
    })
  })
}