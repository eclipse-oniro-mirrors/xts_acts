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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../Utils';

export default function ButtonAttributeModifierNullUndefinedTest() {
  describe('ButtonAttributeModifierNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ButtonAttributeModifierNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/button/ButtonAttributeModifierNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ButtonAttributeModifierNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get ButtonAttributeModifierNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ButtonAttributeModifierNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ButtonAttributeModifierNullUndefinedTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   buttonAttributeModifierNullUndefined_0100
     * @tc.number SUB_ARKUI_BUTTON_ATTRIBUTEMODIFIER_NULL_0100
     * @tc.desc   Test Button attributeModifier property with null, should be same as default (unset)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('buttonAttributeModifierNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[buttonAttributeModifierNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('button_attributeModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('button_attributeModifier_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[buttonAttributeModifierNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[buttonAttributeModifierNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值
      expect(obj.$attrs.attributeModifier).assertEqual(objCompare.$attrs.attributeModifier);
      console.info('[buttonAttributeModifierNullUndefined_0100] END');
    })

    /**
     * @tc.name   buttonAttributeModifierNullUndefined_0200
     * @tc.number SUB_ARKUI_BUTTON_ATTRIBUTEMODIFIER_UNDEFINED_0100
     * @tc.desc   Test Button attributeModifier property with undefined, should be same as default (unset)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('buttonAttributeModifierNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[buttonAttributeModifierNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('button_attributeModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('button_attributeModifier_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[buttonAttributeModifierNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[buttonAttributeModifierNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.attributeModifier).assertEqual(objCompare.$attrs.attributeModifier);
      console.info('[buttonAttributeModifierNullUndefined_0200] END');
    })
  })
}
