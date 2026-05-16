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

export default function CheckboxGroupCheckboxShapeNullTest() {
  describe('CheckboxGroupCheckboxShapeNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CheckboxGroupCheckboxShapeNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkboxGroupNull/CheckboxGroupCheckboxShapeNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CheckboxGroupCheckboxShapeNullTest state pages:' + JSON.stringify(pages));
        if (!('CheckboxGroupCheckboxShapeNullTest' == pages.name)) {
          console.info('get CheckboxGroupCheckboxShapeNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2500);
          console.info('push CheckboxGroupCheckboxShapeNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CheckboxGroupCheckboxShapeNullTest page error:' + err);
      }
      console.info('CheckboxGroupCheckboxShapeNullTest beforeEach end');
      done();
    });

    /**
     * @tc.name   CheckboxGroupCheckboxShapeNull_001
     * @tc.number SUB_ARKUI_CHECKBOXGROUP_CHECKBOXSHAPE_NULL_001
     * @tc.desc   Test CheckboxGroup.checkboxShape() method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CheckboxGroupCheckboxShapeNull_001', Level.LEVEL1, async () => {
      console.info('[CheckboxGroupCheckboxShapeNull_001] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();

      let button = await driver.findComponent(ON.id('btn_checkboxShape_null'));
      await button.click();
      await Utils.sleep(1000);

      let strJson: string = getInspectorByKey('checkboxGroup_checkboxShape_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info('[CheckboxGroupCheckboxShapeNull_001] result: ' + resultText);
      expect(resultText).assertContain('checkboxShape null:');
      console.info('[CheckboxGroupCheckboxShapeNull_001] END');
    })

    /**
     * @tc.name   CheckboxGroupCheckboxShapeUndefined_001
     * @tc.number SUB_ARKUI_CHECKBOXGROUP_CHECKBOXSHAPE_UNDEFINED_001
     * @tc.desc   Test CheckboxGroup.checkboxShape() method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CheckboxGroupCheckboxShapeUndefined_001', Level.LEVEL1, async () => {
      console.info('[CheckboxGroupCheckboxShapeUndefined_001] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();

      let button = await driver.findComponent(ON.id('btn_checkboxShape_undefined'));
      await button.click();
      await Utils.sleep(1000);

      let strJson: string = getInspectorByKey('checkboxGroup_checkboxShape_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info('[CheckboxGroupCheckboxShapeUndefined_001] result: ' + resultText);
      expect(resultText).assertContain('checkboxShape undefined:');
      console.info('[CheckboxGroupCheckboxShapeUndefined_001] END');
    })
  })
}
