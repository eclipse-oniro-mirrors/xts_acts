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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn} from '../common';
import { camera } from '@kit.CameraKit';

const TAG = 'CameraAPIEnumSupplementTest';

export default function CameraAPIEnumSupplementTest() {
  describe('CameraAPIEnumSupplementTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
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
     * @tc.number SYSTEM_PRESSURE_LEVEL_ENUM_001
     * @tc.name   SYSTEM_PRESSURE_LEVEL_ENUM_001
     * @tc.desc   SystemPressureLevel enum values
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SYSTEM_PRESSURE_LEVEL_ENUM_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG, '--------SYSTEM_PRESSURE_LEVEL_ENUM_001---------');
      expect(camera.SystemPressureLevel.SYSTEM_PRESSURE_NORMAL == 0).assertTrue();
      expect(camera.SystemPressureLevel.SYSTEM_PRESSURE_MILD == 1).assertTrue();
      expect(camera.SystemPressureLevel.SYSTEM_PRESSURE_SEVERE == 2).assertTrue();
      expect(camera.SystemPressureLevel.SYSTEM_PRESSURE_CRITICAL == 3).assertTrue();
      expect(camera.SystemPressureLevel.SYSTEM_PRESSURE_SHUTDOWN == 4).assertTrue();
      console.info(TAG, '--------SYSTEM_PRESSURE_LEVEL_ENUM_001,end here---------');
      done();
    });

  })
}