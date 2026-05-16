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

import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../../MainAbility/common/Utils'

export default function CheckboxGroupContentModifierNullTest() {
  describe('CheckboxGroupContentModifierNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CheckboxGroupContentModifierNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkboxGroupNull/CheckboxGroupContentModifierNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CheckboxGroupContentModifierNullTest state pages:' + JSON.stringify(pages));
        if (!('CheckboxGroupContentModifierNullTest' == pages.name)) {
          console.info('get CheckboxGroupContentModifierNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2500);
          console.info('push CheckboxGroupContentModifierNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CheckboxGroupContentModifierNullTest page error:' + err);
      }
      console.info('CheckboxGroupContentModifierNullTest beforeEach end');
      done();
    });

    /**
     * @tc.name   CheckboxGroupContentModifierNull_001
     * @tc.number SUB_ARKUI_CHECKBOXGROUP_CONTENTMODIFIER_NULL_001
     * @tc.desc   Test CheckboxGroup.contentModifier() method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CheckboxGroupContentModifierNull_001', Level.LEVEL1, async () => {
      console.info('[CheckboxGroupContentModifierNull_001] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();

      let button = await driver.findComponent(ON.id('btn_contentModifier_null'));
      await button.click();
      await Utils.sleep(1000);

      let strJson: string = getInspectorByKey('checkboxGroup_contentModifier_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info('[CheckboxGroupContentModifierNull_001] result: ' + resultText);
      expect(resultText).assertContain('contentModifier null:');
      console.info('[CheckboxGroupContentModifierNull_001] END');
    })

    /**
     * @tc.name   CheckboxGroupContentModifierUndefined_001
     * @tc.number SUB_ARKUI_CHECKBOXGROUP_CONTENTMODIFIER_UNDEFINED_001
     * @tc.desc   Test CheckboxGroup.contentModifier() method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CheckboxGroupContentModifierUndefined_001', Level.LEVEL1, async () => {
      console.info('[CheckboxGroupContentModifierUndefined_001] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();

      let button = await driver.findComponent(ON.id('btn_contentModifier_undefined'));
      await button.click();
      await Utils.sleep(1000);

      let strJson: string = getInspectorByKey('checkboxGroup_contentModifier_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info('[CheckboxGroupContentModifierUndefined_001] result: ' + resultText);
      expect(resultText).assertContain('contentModifier undefined:');
      console.info('[CheckboxGroupContentModifierUndefined_001] END');
    })
  })
}