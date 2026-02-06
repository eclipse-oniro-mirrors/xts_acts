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

const TAG = "CameraXts.getSupportedSceneModesSupp";
const abnormalIndex = -1;
const abnormal = '';
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

const getSupportedSceneModes= async (done: Function, testName: string, cameraDevice: camera.CameraDevice | null | undefined,callback: (err: number) => void) => {
  console.info(TAG, testName + ' begin.');
  try {
    let sceneModes = mCameraManager.getSupportedSceneModes(cameraDevice);
    expect(sceneModes.length > 0).assertTrue();
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect(error.code == cameraErrorCode.INVALID_ARGUMENT).assertTrue();
    done();
  }
}

export default function getSupportedSceneModesTest() {
  describe('getSupportedSceneModesTest', () => {
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
     * @tc.name   getSupportedSceneModes_0001
     * @tc.number getSupportedSceneModes_0001
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSupportedSceneModes_0001', Level.LEVEL0, (done: Function) => {
      const testName = 'getSupportedSceneModes_0001';
      console.info(TAG, testName + ' begin.');
      try {
        for (let i = 0; i < mCameraDeviceArray.length; i++) {
          let sceneModes = mCameraManager.getSupportedSceneModes(mCameraDeviceArray[i]);
          console.info(TAG, testName + ' supported camera list: ' + JSON.stringify(sceneModes));
          expect(sceneModes.length > 0).assertTrue();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getSupportedSceneModes_abnormal_001
     * @tc.number getSupportedSceneModes_abnormal_001
     * @tc.desc   sceneMode->invalid mode -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getSupportedSceneModes_abnormal_001', Level.LEVEL2, (done: Function) => {
      const testName = 'getSupportedSceneModes_abnormal_001';
      getSupportedSceneModes(done, testName, mCameraDeviceArray[abnormalIndex],(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   getSupportedSceneModes_abnormal_002
     * @tc.number getSupportedSceneModes_abnormal_002
     * @tc.desc   sceneMode->undefined -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getSupportedSceneModes_abnormal_002', Level.LEVEL2, (done: Function) => {
      const testName = 'getSupportedSceneModes_abnormal_002';
      getSupportedSceneModes(done, testName, undefined,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   getSupportedSceneModes_abnormal_003
     * @tc.number getSupportedSceneModes_abnormal_003
     * @tc.desc   sceneMode->null -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getSupportedSceneModes_abnormal_003', Level.LEVEL2, (done: Function) => {
      const testName = 'getSupportedSceneModes_abnormal_003';
      getSupportedSceneModes(done, testName, null,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   getSupportedSceneModes_abnormal_004
     * @tc.number getSupportedSceneModes_abnormal_004
     * @tc.desc   sceneMode->null -> error_code: 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getSupportedSceneModes_abnormal_004', Level.LEVEL2, (done: Function) => {
      const testName = 'getSupportedSceneModes_abnormal_004';
      getSupportedSceneModes(done, testName, mCameraDeviceArray[abnormal],(errCode) => {
        expect().assertFail();
      });
    })


  })
}