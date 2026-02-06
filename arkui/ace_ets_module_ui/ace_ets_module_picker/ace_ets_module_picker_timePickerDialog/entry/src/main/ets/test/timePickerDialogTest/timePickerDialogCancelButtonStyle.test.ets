/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';

export default function TimePickerDialogCancelButtonStyleTest() {
  describe('TimePickerDialogCancelButtonStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TimePickerDialogCancelButtonStyleTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePickerDialog/timePickerDialogCancelButtonStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TimePickerDialogCancelButtonStyleTest state pages:' + JSON.stringify(pages));
        if (!('timePickerDialogCancelButtonStyle' == pages.name)) {
          console.info('get TimePickerDialogCancelButtonStyleTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push TimePickerDialogCancelButtonStyleTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TimePickerDialogCancelButtonStyleTest page error:' + err);
      }
      console.info('TimePickerDialogCancelButtonStyleTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TimePickerDialogCancelButtonStyleTest after each called');
    });

    /**
     * @tc.name   TimePickerDialogCancelButtonStyleTest_001
     * @tc.number TimePickerDialogCancelButtonStyleTest
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TimePickerDialogCancelButtonStyleTest_001', Level.LEVEL3, async (done: Function) => {
      console.info('[TimePickerDialogCancelButtonStyleTest_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let row: Component = await driver.findComponent(ON.text('确定'))
      await row.click();
      await CommonFunc.sleep(2000);
      let cancelButtonStyle_Text = getInspectorByKey('cancelButtonStyle_Text');
      console.info('cancelButtonStyle_Text attrs-----' + JSON.parse(cancelButtonStyle_Text).$attrs);
      expect(JSON.parse(cancelButtonStyle_Text).$attrs.content).assertEqual('cancelButtonStyle_Text');
      console.info('[TimePickerDialogCancelButtonStyleTest_001] END');
      done();
    });
  })
}
