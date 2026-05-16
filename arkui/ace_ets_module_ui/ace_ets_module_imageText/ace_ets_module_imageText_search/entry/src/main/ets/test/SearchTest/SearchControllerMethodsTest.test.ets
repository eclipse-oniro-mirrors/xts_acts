/**
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

import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function SearchControllerMethodsTest() {
  describe('SearchControllerMethodsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchControllerMethodsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchControllerMethodsTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchControllerMethodsTest state pages: " + JSON.stringify(pages));
        if (!("SearchControllerMethodsTest" == pages.name)) {
          console.info("get SearchControllerMethodsTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchControllerMethodsTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchControllerMethodsTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   searchControllerCaretPosition_value_null_0100
     * @tc.number SUB_ARKUI_SEARCHCONTROLLER_CARETPOSITION_VALUE_NULL_0100
     * @tc.desc   Test SearchController caretPosition method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchControllerCaretPosition_value_null_0100', Level.LEVEL2, async () => {
      console.info('[searchControllerCaretPosition_value_null_0100] START');
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('Search_caretPosition_button'));
      await button.click();
      let strJson: string = getInspectorByKey('Search_caretPosition_value_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');

      console.info('[searchControllerCaretPosition_value_null_0100] END');
    })

    /**
     * @tc.name   searchControllerCaretPosition_value_undefined_0100
     * @tc.number SUB_ARKUI_SEARCHCONTROLLER_CARETPOSITION_VALUE_UNDEFINED_0100
     * @tc.desc   Test SearchController caretPosition method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchControllerCaretPosition_value_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchControllerCaretPosition_value_undefined_0100] START');
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('Search_caretPosition_button'));
      await button.click();
      let strJson: string = getInspectorByKey('Search_caretPosition_value_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');

      console.info('[searchControllerCaretPosition_value_undefined_0100] END');
    })

    /**
     * @tc.name   searchControllerSetTextSelection_null_0100
     * @tc.number SUB_ARKUI_SEARCHCONTROLLER_SETTEXTSELECTION_NULL_0100
     * @tc.desc   Test SearchController setTextSelection method with  null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchControllerSetTextSelection_null_0100', Level.LEVEL2, async () => {
      console.info('[searchControllerSetTextSelection_null_0100] START');

      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('Search_setTextSelection_button'));
      await button.click();
      let strJson: string = getInspectorByKey('Search_setTextSelection_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');

      console.info('[searchControllerSetTextSelection_null_0100] END');
    })

    /**
     * @tc.name   searchControllerSetTextSelection_undefined_0100
     * @tc.number SUB_ARKUI_SEARCHCONTROLLER_SETTEXTSELECTION_UNDEFINED_0100100
     * @tc.desc   Test SearchController setTextSelection method with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchControllerSetTextSelection_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchControllerSetTextSelection_undefined_0100] START');

      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('Search_setTextSelection_button'));
      await button.click();
      let strJson: string = getInspectorByKey('Search_setTextSelection_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Search');

      console.info('[searchControllerSetTextSelection_undefined_0100] END');
    })

  })
}
