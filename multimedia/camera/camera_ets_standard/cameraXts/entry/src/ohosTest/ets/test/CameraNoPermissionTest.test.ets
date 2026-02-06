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
import { cameraErrorCode, isEmpty } from './common';

const TAG = "CameraXts.CameraNoPermissionTest"

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

export default function CameraNoPermissionTest() {
  describe('CameraNoPermissionTest', () => {
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
     * @tc.number    : CAMERA_NO_PERMISSION_001
     * @tc.name      : NoPermission_001
     * @tc.desc      : no permission-1 param
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('NoPermission_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'NoPermission_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[0]);
          await cameraInput.open();
          await cameraInput.close();
        }
        done();
      } catch (err) {
        console.error(TAG, testName + ' no permission. err: ' + err.code + ', msg: ' + err.message);
        expect(err.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_NO_PERMISSION_002
     * @tc.name      : NoPermission_002
     * @tc.desc      : no permission-2 params
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('NoPermission_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'NoPermission_002';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager) && isEmpty(mCameraDeviceArray)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraInput =
            mCameraManager.createCameraInput(mCameraDeviceArray[0].cameraPosition, mCameraDeviceArray[0].cameraType);
          await cameraInput.open();
          await cameraInput.close();
        }
        done();
      } catch (err) {
        console.error(TAG, testName + ' no permission. err: ' + err.code + ', msg: ' + err.message);
        expect(err.code == cameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        done();
      }
    })
  })
}