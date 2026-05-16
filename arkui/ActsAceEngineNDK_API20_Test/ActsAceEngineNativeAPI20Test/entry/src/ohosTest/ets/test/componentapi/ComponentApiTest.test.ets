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

export default function ComponentApiTest() {
  describe('ComponentApiTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })
    /**
     * @tc.name   testHoverModeArea0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_HOVER_MODE_AREA_TYPE_BOTTOM_0100
     * @tc.desc   Test ArkUI_HoverModeAreaType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHoverModeArea0100', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        expect(nativexcomponent.TestCustomDialogHoverModeArea()).assertEqual(0);
        done();
      } catch (err) {
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.name   testKeyboardAvoidMode0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_KEYBOARD_AVOID_MODE_NONE_0100
     * @tc.desc   Test ArkUI_KeyboardAvoidMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyboardAvoidMode0100', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        expect(nativexcomponent.TestCustomDialogKeyboardAvoidMode()).assertEqual(0);
        done();
      } catch (err) {
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.name   testInspectorErrorCode0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_INSPECTOR_NATIVE_RESULT_SUCCESSFUL_0100
     * @tc.desc   Test ArkUI_InspectorErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInspectorErrorCode0100', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = nativexcomponent.RegisterLayoutCallbackOnNodeTest_001();
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.name   testInspectorErrorCode0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_INSPECTOR_NATIVE_RESULT_BAD_PARAMETER_0100
     * @tc.desc   Test ArkUI_InspectorErrorCode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInspectorErrorCode0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = nativexcomponent.RegisterLayoutCallbackOnNodeTest_002();
        expect(result).assertEqual(-1);
        done();
      } catch (err) {
        expect(false).assertEqual(err);
        done();
      }
    })
  })
}