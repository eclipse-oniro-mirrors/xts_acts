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
import { checkBackCamera, driveFn, getPermission, isEmpty } from '../common';

const TAG = "CameraXts.cameraStatusBackTest";

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

async function statusOnListen(done: Function, testName: string) {
  try {
    if (isEmpty(mCameraManager)) {
      console.info(TAG, testName + ' cameraManager is null.');
      expect().assertFail();
    } else {
      mCameraManager.on('cameraStatus', async (error, cameraStatusInfo) => {
        if (error !== undefined && error.code !== 0) {
          console.error(TAG, testName + ' on-listen callback error, code: ' + error.code + ', msg: ' + error.message);
          expect().assertFail();
        }
        console.info(TAG, testName + ' on-listen camera: ' + JSON.stringify(cameraStatusInfo.camera) + ', status: ' +
        JSON.stringify(cameraStatusInfo.status));
        expect(true).assertTrue();
      })
      let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[1]);
      await cameraInput.open();
      await cameraInput.close();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  }
}

export default function cameraStatusBackTest() {
  describe('cameraStatusBackTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      getCameraManager();
      getSupportedCameraDeviceArray();
      await getPermission();
      await driveFn();
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
     * @tc.number    : CAMERA_MANAGER_STATUS_LISTEN_BACK_001
     * @tc.name      : cameraStatus_listen_back_001
     * @tc.desc      : No abnormal scenarios-on('cameraStatus')
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('cameraStatus_listen_back_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'cameraStatus_listen_back_001';
      console.info(TAG, testName + ' begin.');
      if (!checkBackCamera()) {
        console.info(TAG, testName + ' the current device does not have a rear camera.');
        done();
        return;
      }
      await statusOnListen(done, testName);
      mCameraManager.off('cameraStatus');
    })

    /**
     * @tc.number    : CAMERA_MANAGER_STATUS_LISTEN_BACK_002
     * @tc.name      : cameraStatus_listen_back_002
     * @tc.desc      : No abnormal scenarios-off('cameraStatus')
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('cameraStatus_listen_back_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'cameraStatus_listen_back_002';
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
          await statusOnListen(done, testName);
          console.info(TAG, testName + ' on-listen passed.');
          mCameraManager.off('cameraStatus');
          console.info(TAG, testName + ' off-listen end.');
          let cameraInput = mCameraManager.createCameraInput(mCameraDeviceArray[1]);
          console.info(TAG, testName + ' camera open ready.');
          await cameraInput.open();
          console.info(TAG, testName + ' state not changed.');
          await cameraInput.close();
        }
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })
  })
}