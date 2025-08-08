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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function unicodeTest() {
  describe('unicodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("unicodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/onKeyEvent/unicode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get unicodeTest state pages: " + JSON.stringify(pages));
        if (!("unicode" == pages.name)) {
          console.info("get unicodeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push unicodeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push unicodeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number ArkUI_KeyEvent_UnicodeJsunit_1000
     * @tc.name   Tests the unicode property of the keyEvent
     * @tc.desc   Confirm unicode value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_KeyEvent_UnicodeTest_1000', 0, async (done: Function) => {
      console.info('[ArkUI_KeyEvent_UnicodeTest_1000] START');
      let strJson = getInspectorByKey('unicode_KeyEvent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_KeyEvent_UnicodeTest_1000] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual('true');
      console.info('[ArkUI_KeyEvent_UnicodeTest_1000] END');
      done();
    });
  })
}