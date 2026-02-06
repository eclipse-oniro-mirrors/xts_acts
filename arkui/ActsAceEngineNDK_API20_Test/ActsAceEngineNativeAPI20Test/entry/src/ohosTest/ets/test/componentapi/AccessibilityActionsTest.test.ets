/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterEach,beforeAll, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import nativexcomponent from 'libnativexcomponent.so';
import Utils from "../common/Utils";

export default function AccessibilityActionsTest() {
  describe('AccessibilityActionsTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })
    /**
     * @tc.name   testAccessibilityActionType0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_ACTION_CUT_0100
     * @tc.desc   Test ArkUI_AccessibilityActionType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAccessibilityActionType0100', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        expect(nativexcomponent.TestAccessibilityActions001()).assertEqual(0);
        done();
      } catch (err) {
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.name   testAccessibilityActionType0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_ACCESSIBILITY_ACTION_COPY_0100
     * @tc.desc   Test ArkUI_AccessibilityActionType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAccessibilityActionType0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        expect(nativexcomponent.TestAccessibilityActions002()).assertEqual(0);
        done();
      } catch (err) {
        expect(false).assertEqual(err);
        done();
      }
    })
  })
}