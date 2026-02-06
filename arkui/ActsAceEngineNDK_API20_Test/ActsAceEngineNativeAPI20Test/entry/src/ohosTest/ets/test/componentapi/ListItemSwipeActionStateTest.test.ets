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

import { afterEach, beforeAll, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import nativexcomponent from 'libnativexcomponent.so';

const ARKUI_LIST_ITEM_SWIPE_ACTION_STATE_COLLAPSED = 0;
const ARKUI_LIST_ITEM_SWIPE_ACTION_STATE_EXPANDED = 1;
const ARKUI_LIST_ITEM_SWIPE_ACTION_STATE_ACTIONING = 2;

export default function ListItemSwipeActionStateTest() {

  describe('ListItemSwipeActionStateTest', () => {
    /**
     * @tc.name   testListItemSwipeActionState0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_ACTION_STATE_COLLAPSED_0100
     * @tc.desc   Test the ArkUI_ListItemSwipeActionState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListItemSwipeActionState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = nativexcomponent.testListSwipeActionItem001();
          expect(result).assertEqual(ARKUI_LIST_ITEM_SWIPE_ACTION_STATE_COLLAPSED);
          done();
        } catch (err) {
          expect(false).assertTrue();
          done();
        }
      })
    /**
     * @tc.name   testListItemSwipeActionState0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_ACTION_STATE_EXPANDED_0200
     * @tc.desc   Test the ArkUI_ListItemSwipeActionState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListItemSwipeActionState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = nativexcomponent.testListSwipeActionItem002();
          expect(result).assertEqual(ARKUI_LIST_ITEM_SWIPE_ACTION_STATE_EXPANDED);
          done();
        } catch (err) {
          expect(false).assertTrue();
          done();
        }
      })
    /**
     * @tc.name   testListItemSwipeActionState0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_ARKUI_LIST_ITEM_SWIPE_ACTION_STATE_ACTIONING_0300
     * @tc.desc   Test the ArkUI_ListItemSwipeActionState.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListItemSwipeActionState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let result = nativexcomponent.testListSwipeActionItem003();
          expect(result).assertEqual(ARKUI_LIST_ITEM_SWIPE_ACTION_STATE_ACTIONING);
          done();
        } catch (err) {
          expect(false).assertTrue();
          done();
        }
      })
  })
}