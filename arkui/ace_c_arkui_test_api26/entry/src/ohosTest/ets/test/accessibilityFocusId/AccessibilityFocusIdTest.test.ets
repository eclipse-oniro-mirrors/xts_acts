/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function AccessibilityFocusIdTest() {

  describe('AccessibilityFocusIdTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   AccessibilityNextFocusIdTest_001
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITYNEXTFOCUSID_0100
     * @tc.desc   Test NODE_ACCESSIBILITY_NEXT_FOCUS_ID with normal string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AccessibilityNextFocusIdTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[AccessibilityNextFocusIdTest_001] START');
      expect(nativeFunc.AccessibilityNextFocusIdTest_001()).assertEqual(0);
      console.info('[AccessibilityNextFocusIdTest_001] END');
      done();
    });

    /**
     * @tc.name   AccessibilityNextFocusIdTest_002
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITYNEXTFOCUSID_0200
     * @tc.desc   Test NODE_ACCESSIBILITY_NEXT_FOCUS_ID with empty string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AccessibilityNextFocusIdTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[AccessibilityNextFocusIdTest_002] START');
      expect(nativeFunc.AccessibilityNextFocusIdTest_002()).assertEqual(0);
      console.info('[AccessibilityNextFocusIdTest_002] END');
      done();
    });

    /**
     * @tc.name   AccessibilityDefaultFocusTest_001
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITYDEFAULTFOCUS_0100
     * @tc.desc   Test NODE_ACCESSIBILITY_DEFAULT_FOCUS with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AccessibilityDefaultFocusTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[AccessibilityDefaultFocusTest_001] START');
      expect(nativeFunc.AccessibilityDefaultFocusTest_001()).assertEqual(0);
      console.info('[AccessibilityDefaultFocusTest_001] END');
      done();
    });

    /**
     * @tc.name   AccessibilityDefaultFocusTest_002
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITYDEFAULTFOCUS_0200
     * @tc.desc   Test NODE_ACCESSIBILITY_DEFAULT_FOCUS with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AccessibilityDefaultFocusTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[AccessibilityDefaultFocusTest_002] START');
      expect(nativeFunc.AccessibilityDefaultFocusTest_002()).assertEqual(0);
      console.info('[AccessibilityDefaultFocusTest_002] END');
      done();
    });
  });
}