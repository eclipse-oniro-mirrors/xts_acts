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

export default function CheckboxGroupSelectAllNullTest() {
  describe('CheckboxGroupSelectAllNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CheckboxGroupSelectAllNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkboxGroupNull/CheckboxGroupSelectAllNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CheckboxGroupSelectAllNullTest state pages:' + JSON.stringify(pages));
        if (!('CheckboxGroupSelectAllNullTest' == pages.name)) {
          console.info('get CheckboxGroupSelectAllNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2500);
          console.info('push CheckboxGroupSelectAllNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CheckboxGroupSelectAllNullTest page error:' + err);
      }
      console.info('CheckboxGroupSelectAllNullTest beforeEach end');
      done();
    });

    /**
     * @tc.name   CheckboxGroupSelectAllNull_001
     * @tc.number SUB_ARKUI_CHECKBOXGROUP_SELECTALL_NULL_001
     * @tc.desc   Test CheckboxGroup.selectAll() method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CheckboxGroupSelectAllNull_001', Level.LEVEL1, async () => {
      console.info('[CheckboxGroupSelectAllNull_001] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();

      let button = await driver.findComponent(ON.id('btn_selectAll_null'));
      await button.click();
      await Utils.sleep(1000);

      let strJson: string = getInspectorByKey('checkboxGroup_selectAll_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info('[CheckboxGroupSelectAllNull_001] result: ' + resultText);
      expect(resultText).assertContain('selectAll null:');
      console.info('[CheckboxGroupSelectAllNull_001] END');
    })

    /**
     * @tc.name   CheckboxGroupSelectAllUndefined_001
     * @tc.number SUB_ARKUI_CHECKBOXGROUP_SELECTALL_UNDEFINED_001
     * @tc.desc   Test CheckboxGroup.selectAll() method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CheckboxGroupSelectAllUndefined_001', Level.LEVEL1, async () => {
      console.info('[CheckboxGroupSelectAllUndefined_001] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();

      let button = await driver.findComponent(ON.id('btn_selectAll_undefined'));
      await button.click();
      await Utils.sleep(1000);

      let strJson: string = getInspectorByKey('checkboxGroup_selectAll_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info('[CheckboxGroupSelectAllUndefined_001] result: ' + resultText);
      expect(resultText).assertContain('selectAll undefined:');
      console.info('[CheckboxGroupSelectAllUndefined_001] END');
    })
  })
}