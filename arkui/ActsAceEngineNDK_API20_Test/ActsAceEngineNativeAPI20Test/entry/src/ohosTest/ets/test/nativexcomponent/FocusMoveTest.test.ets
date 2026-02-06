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

import { beforeAll, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import nativexcomponent from 'libnativexcomponent.so';
import Utils from "../common/Utils";

export default function FocusMoveTest() {
  describe('FocusMoveTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPageNoClear(`NativeXComponent/NodeAttributeNativeXComponent`, done);
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_FOCUS_MOVE_FORWARD_0100
     * @tc.name    : testCheckNodeFocusMove0100
     * @tc.desc    : Test ArkUI_FocusMove.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testCheckNodeFocusMove0100', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let Result: number = nativexcomponent.CheckNodeFocusMoveForward();
        expect(1).assertEqual(Result);
        done();
      } catch (err) {
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_FOCUS_MOVE_BACKWARD_0200
     * @tc.name    : testCheckNodeFocusMove0200
     * @tc.desc    : Test ArkUI_FocusMove.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testCheckNodeFocusMove0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let Result: number = nativexcomponent.CheckNodeFocusMoveBackward();
        expect(1).assertEqual(Result);
        done();
      } catch (err) {
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_FOCUS_MOVE_UP_0300
     * @tc.name    : testCheckNodeFocusMove0300
     * @tc.desc    : Test ArkUI_FocusMove.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testCheckNodeFocusMove0300', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let Result: number = nativexcomponent.CheckNodeFocusMoveUp();
        expect(1).assertEqual(Result);
        done();
      } catch (err) {
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_FOCUS_MOVE_DOWN_0400
     * @tc.name    : testCheckNodeFocusMove0400
     * @tc.desc    : Test ArkUI_FocusMove.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testCheckNodeFocusMove0400', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let Result: number = nativexcomponent.CheckNodeFocusMoveDown();
        expect(1).assertEqual(Result);
        done();
      } catch (err) {
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_FOCUS_MOVE_LEFT_0500
     * @tc.name    : testCheckNodeFocusMove0500
     * @tc.desc    : Test ArkUI_FocusMove.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testCheckNodeFocusMove0500', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let Result: number = nativexcomponent.CheckNodeFocusMoveLeft();
        expect(1).assertEqual(Result);
        done();
      } catch (err) {
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_FOCUS_MOVE_RIGHT_0600
     * @tc.name    : testCheckNodeFocusMove0600
     * @tc.desc    : Test ArkUI_FocusMove.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testCheckNodeFocusMove0600', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let Result: number = nativexcomponent.CheckNodeFocusMoveRight();
        expect(1).assertEqual(Result);
        done();
      } catch (err) {
        expect(false).assertEqual(err);
        done();
      }
    })
  })
}