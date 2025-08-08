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
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import { isEmpty } from '../common';

const TAG = "CameraXts.getCameraManagerTest";

let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

export default function getCameraManagerTest() {
  describe('getCameraManagerTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
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
     * @tc.number    : CAMERA_CAMERA_GET_CAMERA_MANAGER_001
     * @tc.name      : getCameraManager_001
     * @tc.desc      : No abnormal scenarios
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getCameraManager_001', Level.LEVEL0, (done: Function) => {
      const testName = 'getCameraManager_001';
      console.info(TAG, testName);
      let cameraManager = camera.getCameraManager(testContext);
      expect(isEmpty(cameraManager)).assertFalse();
      done();
    })

    /**
     * @tc.number    : CAMERA_CAMERA_GET_CAMERA_MANAGER_001
     * @tc.name      : getCameraManager_002
     * @tc.desc      : context-null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getCameraManager_002', Level.LEVEL0, (done: Function) => {
      const testName = 'getCameraManager_002';
      console.info(TAG, testName);
      try {
        let cameraManager = camera.getCameraManager(null);
        console.info(TAG, testName + ' cameraManager: ' + isEmpty(cameraManager));
        expect(isEmpty(cameraManager)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName + ' cameraManager is null. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : CAMERA_CAMERA_GET_CAMERA_MANAGER_001
     * @tc.name      : getCameraManager_003
     * @tc.desc      : context-undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getCameraManager_003', Level.LEVEL0, (done: Function) => {
      const testName = 'getCameraManager_003';
      console.info(TAG, testName);
      try {
        let cameraManager = camera.getCameraManager(undefined);
        console.info(TAG, testName + ' cameraManager: ' + isEmpty(cameraManager));
        expect(isEmpty(cameraManager)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName + ' cameraManager is null. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })
  })
}