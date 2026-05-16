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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../Utils';

export default function AttributeModifierNullUndefinedTest() {
  describe('AttributeModifierNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("AttributeModifierNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/AttributeModifierNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AttributeModifierNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get AttributeModifierNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push AttributeModifierNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AttributeModifierNullUndefinedTest page error:" + err);
      }
      console.info("AttributeModifierNullUndefinedTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(2000);
      console.info("AttributeModifierNullUndefinedTest after each called");
    });

    /**
     * @tc.name   buttonAttributeModifierMethodNullUndefined_0100
     * @tc.number buttonAttributeModifierMethodNullUndefined_0100
     * @tc.desc   Test Button attributeModifier property with null, should be same as default (unset)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('buttonAttributeModifierMethodNullUndefined_0100', Level.LEVEL0, async (done: Function) => {
      console.info('buttonAttributeModifierMethodNullUndefined_0100 START');
      let driver = await Driver.create()
      await Utils.sleep(2000);
      let button1 = await driver.findComponent(ON.id('attributeModifier_null'));
      await button1.click();
      await Utils.sleep(2000);
      expect(AppStorage.get('ModifierNormalAttributeNullUndefined')).assertEqual(null);
      expect(AppStorage.get('ModifierPressedAttributeNullUndefined')).assertEqual(null);
      expect(AppStorage.get('ModifierFocusedAttributeNullUndefined')).assertEqual(null);
      expect(AppStorage.get('ModifierDisabledAttributeNullUndefined')).assertEqual(null);
      expect(AppStorage.get('ModifierSelectedAttributeNullUndefined')).assertEqual(null);
      AppStorage.delete('ModifierNormalAttributeNullUndefined')
      AppStorage.delete('ModifierPressedAttributeNullUndefined')
      AppStorage.delete('ModifierFocusedAttributeNullUndefined')
      AppStorage.delete('ModifierDisabledAttributeNullUndefined')
      AppStorage.delete('ModifierSelectedAttributeNullUndefined')
      console.info('[buttonAttributeModifierMethodNullUndefined_0100] END');
      done();
    })

    /**
     * @tc.name   buttonAttributeModifierMethodNullUndefined_0200
     * @tc.number buttonAttributeModifierMethodNullUndefined_0200
     * @tc.desc   Test Button attributeModifier property with undefined, should be same as default (unset)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('buttonAttributeModifierMethodNullUndefined_0200', Level.LEVEL0, async (done: Function) => {
      console.info('buttonAttributeModifierMethodNullUndefined_0200 START');
      let driver = await Driver.create()
      await Utils.sleep(2000);
      let button1 = await driver.findComponent(ON.id('attributeModifier_undefined'));
      await button1.click();
      await Utils.sleep(2000);
      expect(AppStorage.get('ModifierNormalAttributeNullUndefined')).assertEqual(undefined);
      expect(AppStorage.get('ModifierPressedAttributeNullUndefined')).assertEqual(undefined);
      expect(AppStorage.get('ModifierFocusedAttributeNullUndefined')).assertEqual(undefined);
      expect(AppStorage.get('ModifierDisabledAttributeNullUndefined')).assertEqual(undefined);
      expect(AppStorage.get('ModifierSelectedAttributeNullUndefined')).assertEqual(undefined);
      AppStorage.delete('ModifierNormalAttributeNullUndefined')
      AppStorage.delete('ModifierPressedAttributeNullUndefined')
      AppStorage.delete('ModifierFocusedAttributeNullUndefined')
      AppStorage.delete('ModifierDisabledAttributeNullUndefined')
      AppStorage.delete('ModifierSelectedAttributeNullUndefined')
      console.info('[buttonAttributeModifierMethodNullUndefined_0200] END');
      done();
    })
  })
}
