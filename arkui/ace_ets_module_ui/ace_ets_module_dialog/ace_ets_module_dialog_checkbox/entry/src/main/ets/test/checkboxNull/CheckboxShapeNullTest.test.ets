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

export default function CheckboxShapeNullTest() {
  describe('CheckboxShapeNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('CheckboxShapeNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkboxNull/CheckboxShapeNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CheckboxShapeNullTest state pages:' + JSON.stringify(pages));
        if (!('CheckboxShapeNullTest' == pages.name)) {
          console.info('get CheckboxShapeNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2500);
          console.info('push CheckboxShapeNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CheckboxShapeNullTest page error:' + err);
      }
      console.info('CheckboxShapeNullTest beforeEach end');
      done();
    });

    /**
     * @tc.name   CheckboxShapeNull_001
     * @tc.number SUB_ARKUI_CHECKBOX_SHAPE_NULL_001
     * @tc.desc   Test Checkbox.shape() method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CheckboxShapeNull_001', Level.LEVEL1, async () => {
      console.info('[CheckboxShapeNull_001] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();

      let button = await driver.findComponent(ON.id('btn_shape_null'));
      await button.click();
      await Utils.sleep(1000);

      let strJson: string = getInspectorByKey('checkbox_shape_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info('[CheckboxShapeNull_001] result: ' + resultText);
      expect(resultText).assertContain('shape null:');
      console.info('[CheckboxShapeNull_001] END');
    })

    /**
     * @tc.name   CheckboxShapeUndefined_001
     * @tc.number SUB_ARKUI_CHECKBOX_SHAPE_UNDEFINED_001
     * @tc.desc   Test Checkbox.shape() method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CheckboxShapeUndefined_001', Level.LEVEL1, async () => {
      console.info('[CheckboxShapeUndefined_001] START');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();

      let button = await driver.findComponent(ON.id('btn_shape_undefined'));
      await button.click();
      await Utils.sleep(1000);

      let strJson: string = getInspectorByKey('checkbox_shape_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content);

      console.info('[CheckboxShapeUndefined_001] result: ' + resultText);
      expect(resultText).assertContain('shape undefined:');
      console.info('[CheckboxShapeUndefined_001] END');
    })
  })
}