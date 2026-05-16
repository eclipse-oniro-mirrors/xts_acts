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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TextContentControllerBaseMethodsTest() {
  describe('TextContentControllerBaseMethodsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextContentControllerBaseMethodsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextControllerTest/TextContentControllerBaseMethodsTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextContentControllerBaseMethodsTest state pages:" + JSON.stringify(pages));
        if (!("TextContentControllerBaseMethodsTest" == pages.name)) {
          console.info("get TextContentControllerBaseMethodsTest state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push TextContentControllerBaseMethodsTest success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextContentControllerBaseMethodsTest page error:" + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   textContentControllerBaseAddText_null_0100
     * @tc.number SUB_ARKUI_TEXTCONTENTCONTROLLERBASE_ADDTEXT_NULL_0100
     * @tc.desc   Test TextContentControllerBase addText method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textContentControllerBaseAddText_null_0100', Level.LEVEL2, async () => {
      console.info('[textContentControllerBaseAddText_null_0100] START');
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('TextContentControllerBase_addText'));
      await button.click();
      let strJson: string = getInspectorByKey('TextInput_addText_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      console.info('[textContentControllerBaseAddText_null_0100] END');
    })

    /**
     * @tc.name   textContentControllerBaseAddText_undefined_0100
     * @tc.number SUB_ARKUI_TEXTCONTENTCONTROLLERBASE_ADDTEXT_UNDEFINED_0100
     * @tc.desc   Test TextContentControllerBase addText method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textContentControllerBaseAddText_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textContentControllerBaseAddText_undefined_0100] START');

      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('TextContentControllerBase_addText'));
      await button.click();
      let strJson: string = getInspectorByKey('TextInput_addText_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');

      console.info('[textContentControllerBaseAddText_undefined_0100] END');
    })

    /**
     * @tc.name   textContentControllerBaseAddText_emptyString_0100
     * @tc.number SUB_ARKUI_TEXTCONTENTCONTROLLERBASE_ADDTEXT_EMPTYSTRING_0100
     * @tc.desc   Test TextContentControllerBase addText method with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textContentControllerBaseAddText_emptyString_0100', Level.LEVEL2, async () => {
      console.info('[textContentControllerBaseAddText_emptyString_0100] START');

      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('TextContentControllerBase_addText'));
      await button.click();
      let strJson: string = getInspectorByKey('TextInput_addText_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');

      console.info('[textContentControllerBaseAddText_emptyString_0100] END');
    })

    /**
     * @tc.name   textContentControllerBaseSetStyledPlaceholder_null_0100
     * @tc.number SUB_ARKUI_TEXTCONTENTCONTROLLERBASE_SETSTYLEDPLACEHOLDER_NULL_0100
     * @tc.desc   Test TextContentControllerBase setStyledPlaceholder method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textContentControllerBaseSetStyledPlaceholder_null_0100', Level.LEVEL2, async () => {
      console.info('[textContentControllerBaseSetStyledPlaceholder_null_0100] START');

      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('TextContentControllerBase_setStyledPlaceholder'));
      await button.click();
      let strJson: string = getInspectorByKey('TextInput_setStyledPlaceholder_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');

      console.info('[textContentControllerBaseSetStyledPlaceholder_null_0100] END');
    })

    /**
     * @tc.name   textContentControllerBaseSetStyledPlaceholder_undefined_0100
     * @tc.number SUB_ARKUI_TEXTCONTENTCONTROLLERBASE_SETSTYLEDPLACEHOLDER_UNDEFINED_0100
     * @tc.desc   Test TextContentControllerBase setStyledPlaceholder method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textContentControllerBaseSetStyledPlaceholder_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textContentControllerBaseSetStyledPlaceholder_undefined_0100] START');

      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('TextContentControllerBase_setStyledPlaceholder'));
      await button.click();
      let strJson: string = getInspectorByKey('TextInput_setStyledPlaceholder_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');

      console.info('[textContentControllerBaseSetStyledPlaceholder_undefined_0100] END');
    })

    /**
     * @tc.name   textContentControllerBaseScrollToVisible_null_0100
     * @tc.number SUB_ARKUI_TEXTCONTENTCONTROLLERBASE_SCROLLTOVISIBLE_NULL_0100
     * @tc.desc   Test TextContentControllerBase scrollToVisible method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textContentControllerBaseScrollToVisible_null_0100', Level.LEVEL2, async () => {
      console.info('[textContentControllerBaseScrollToVisible_null_0100] START');

      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('TextContentControllerBase_setStyledPlaceholder'));
      await button.click();
      let strJson: string = getInspectorByKey('TextInput_scrollToVisible_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');

      console.info('[textContentControllerBaseScrollToVisible_null_0100] END');
    })

    /**
     * @tc.name   textContentControllerBaseScrollToVisible_undefined_0100
     * @tc.number SUB_ARKUI_TEXTCONTENTCONTROLLERBASE_SCROLLTOVISIBLE_UNDEFINED_0100
     * @tc.desc   Test TextContentControllerBase scrollToVisible method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textContentControllerBaseScrollToVisible_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textContentControllerBaseScrollToVisible_undefined_0100] START');

      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('TextContentControllerBase_setStyledPlaceholder'));
      await button.click();
      let strJson: string = getInspectorByKey('TextInput_scrollToVisible_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');

      console.info('[textContentControllerBaseScrollToVisible_undefined_0100] END');
    })
  })
}
