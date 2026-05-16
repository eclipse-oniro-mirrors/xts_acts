/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

    // ══════════════════════════════════════════════════
    // getCameraManager(context: Context): CameraManager
    // ══════════════════════════════════════════════════

    /**
     * @tc.name   getCameraManager_001
     * @tc.number getCameraManager_001
     * @tc.desc   No abnormal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getCameraManager_001', Level.LEVEL0, (done: Function) => {
      const testName = 'getCameraManager_001';
      try {
        let cameraManager = camera.getCameraManager(testContext);
        console.info(testName + ' cameraManager: ' + isEmpty(cameraManager));
        expect(isEmpty(cameraManager)).assertFalse();
        console.info(testName + 'get cameraMnanager success');
        done();
      } catch (error) {
        console.error(testName + 'get cameraMnanager fail, error is ' + error + 'error code is ' + error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getCameraManager_002
     * @tc.number getCameraManager_002
     * @tc.desc   context-null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getCameraManager_002', Level.LEVEL0, (done: Function) => {
      const testName = 'getCameraManager_002';
      try {
        let cameraManager = camera.getCameraManager(null);
        console.info(testName + ' cameraManager: ' + isEmpty(cameraManager));
        expect(isEmpty(cameraManager)).assertFalse();
        console.info(testName + 'get cameraMnanager success');
        done();
      } catch (error) {
        console.error(testName + 'get cameraMnanager fail, error is ' + error + 'error code is ' + error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   getCameraManager_003
     * @tc.number getCameraManager_003
     * @tc.desc   context-undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getCameraManager_003', Level.LEVEL0, (done: Function) => {
      const testName = 'getCameraManager_003';
      try {
        let cameraManager = camera.getCameraManager(undefined);
        console.info(testName + ' cameraManager: ' + isEmpty(cameraManager));
        expect(isEmpty(cameraManager)).assertFalse();
        console.info(testName + 'get cameraMnanager success');
        done();
      } catch (error) {
        console.error(testName + 'get cameraMnanager fail, error is ' + error + 'error code is ' + error.code);
        expect().assertFail();
        done();
      }
    })

  })
}