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

export default function UiStatesTest() {
  describe('UiStatesTest', () => {

    /**
     * @tc.name   testUIState0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_UI_STATE_NORMAL_0100
     * @tc.desc   Test the ArkUI_UIState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUIState0100', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_UI_STATE_NORMAL_0100 start<====`);
        let result: number = nativexcomponent.TestUIState001();
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_UI_STATE_NORMAL_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })

    /**
     * @tc.name   testUIState0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_UI_STATE_FOCUSED_0100
     * @tc.desc   Test the ArkUI_UIState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUIState0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_UI_STATE_FOCUSED_0100 start<====`);
        let result: number = nativexcomponent.TestUIState002();
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_UI_STATE_FOCUSED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.name   testUIState0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_UI_STATE_DISABLED_0100
     * @tc.desc   Test the ArkUI_UIState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUIState0300', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_UI_STATE_DISABLED_0100 start<====`);
        let result: number = nativexcomponent.TestUIState003();
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_UI_STATE_DISABLED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.name   testUIState0400
     * @tc.number SUB_ARKUI_ACE_ENGINE_UI_STATE_SELECTED_0100
     * @tc.desc   Test the ArkUI_UIState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUIState0400', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_UI_STATE_SELECTED_0100 start<====`);
        let result: number = nativexcomponent.TestUIState004();
        expect(0).assertEqual(result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_UI_STATE_SELECTED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
  })
}