/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/common/Common';
import { MessageManager, Callback } from '../MainAbility/common/MessageManagerNew';
import { CustomKeyboardContinueFeature } from '@ohos.arkui.UIContext';
 
export default function CustomKeyboardContinueTest() {
  describe('CustomKeyboardContinueTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CustomKeyboardContinueTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomKeyboardContinueTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CustomKeyboardContinueTest state pages: " + JSON.stringify(pages));
        if (!("CustomKeyboardContinueTest" == pages.name)) {
          console.info("get CustomKeyboardContinueTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CustomKeyboardContinueTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomKeyboardContinueTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
 
    /**
     * @tc.name   CustomKeyboardContinueTest_0100
     * @tc.number SUB_ACE_CustomKeyboardContinueTest_0100
     * @tc.desc   set CustomKeyboardContinueFeature  ENABLED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomKeyboardContinueTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('CustomKeyboardContinueTest_0100 START');
      expect(CustomKeyboardContinueFeature.ENABLED).assertEqual(0);
      console.info('[CustomKeyboardContinueTest_0100] END');
      done();
    });
 
    /**
     * @tc.name   CustomKeyboardContinueTest_0200
     * @tc.number SUB_ACE_CustomKeyboardContinueTest_0200
     * @tc.desc   set CustomKeyboardContinueFeature  ENABLED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomKeyboardContinueTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('CustomKeyboardContinueTest_0200 START');
	  expect(CustomKeyboardContinueFeature.DISABLED).assertEqual(1);
      console.info('[CustomKeyboardContinueTest_0200] END');
      done();
    });
  })
}