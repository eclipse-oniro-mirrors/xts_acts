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
import { isEmpty } from '../common';

const TAG = "CameraXts.getSupportedCamerasTest";

let mCameraManager: camera.CameraManager;
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

function getCameraManager() {
  console.info(TAG, 'getCameraManager.');
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmpty(mCameraManager)) {
    return false;
  }
  return true;
}

export default function getSupportedCamerasTest() {
  describe('getSupportedCamerasTest', () => {
    beforeAll(() => {
      console.info(TAG, 'beforeAll case.');
      getCameraManager();
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
     * @tc.name   getSupportedCameras_001
     * @tc.number CAMERA_MANAGER_GET_SUPPORTED_CAMERAS_001
     * @tc.desc   No abnormal scenarios--Get supported camera device objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSupportedCameras_001', Level.LEVEL0, (done: Function) => {
      const testName = 'getSupportedCameras_001';
      console.info(TAG, testName + ' begin.');
      try {
        if (isEmpty(mCameraManager)) {
          console.info(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
        } else {
          let cameraDeviceArray: Array<camera.CameraDevice> = mCameraManager.getSupportedCameras();
          console.info(TAG, testName + ' supported camera list: ' + JSON.stringify(cameraDeviceArray));
          if (cameraDeviceArray !== null && cameraDeviceArray.length > 0) {
            for (let i = 0; i < cameraDeviceArray.length; i++) {
              let cameraId = cameraDeviceArray[i].cameraId;
              expect(isEmpty(cameraId)).assertFalse();
              console.info(TAG, testName + ' camera : ' + i + ', id: ' + cameraId);
              let cameraPosition = cameraDeviceArray[i].cameraPosition;
              expect(isEmpty(cameraPosition)).assertFalse();
              console.info(TAG, testName + ' camera : ' + i + ', position: ' + cameraPosition);
              let cameraType = cameraDeviceArray[i].cameraType;
              expect(isEmpty(cameraType)).assertFalse();
              console.info(TAG, testName + ' camera : ' + i + ', type: ' + cameraType);
              let connectionType = cameraDeviceArray[i].connectionType;
              expect(isEmpty(connectionType)).assertFalse();
              console.info(TAG, testName + ' camera : ' + i + ', connection type: ' + connectionType);
              let cameraOrientation = cameraDeviceArray[i].cameraOrientation;
              expect(isEmpty(cameraOrientation)).assertFalse();
              console.info(TAG, testName + ' camera : ' + i + ', orientation: ' + cameraOrientation);
              let hostDeviceName = cameraDeviceArray[i].hostDeviceName;
              expect(isEmpty(hostDeviceName)).assertFalse();
              console.info(TAG, testName + ' camera : ' + i + ', host device name: ' + hostDeviceName);
              let hostDeviceType = cameraDeviceArray[i].hostDeviceType;
              expect(isEmpty(hostDeviceType)).assertFalse();
              console.info(TAG, testName + ' camera : ' + i + ', host device type: ' + hostDeviceType);
            }
          } else {
            expect().assertFail();
            console.info(TAG, testName + ' cameraDeviceArray is null.');
          }
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