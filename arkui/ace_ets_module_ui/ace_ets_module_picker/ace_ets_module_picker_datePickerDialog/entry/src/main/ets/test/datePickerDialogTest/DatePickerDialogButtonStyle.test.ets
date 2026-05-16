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

export default function DatePickerDialogButtonStyleTest() {
  describe('DatePickerDialogButtonStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info('DatePickerDialogButtonStyleTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerDialog/DatePickerDialogButtonStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DatePickerDialogButtonStyleTest state pages:' + JSON.stringify(pages));
        if (!('DatePickerDialogButtonStyle' == pages.name)) {
          console.info('get DatePickerDialogButtonStyleTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push DatePickerDialogButtonStyleTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DatePickerDialogButtonStyleTest page error:' + err);
      }
      console.info('DatePickerDialogButtonStyleTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('DatePickerDialogButtonStyleTest after each called');
    });
    
    /**
     * @tc.name   DatePickerDialogButtonStyleTest_001
     * @tc.number DatePickerDialogButtonStyleTest_001
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DatePickerDialogButtonStyleTest_001', Level.LEVEL3, async (done: Function) => {
      console.info('[DatePickerDialogButtonStyleTest_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('DateButtonStyle'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info('[DatePickerDialogButtonStyleTest_001] obj2 is: ' + JSON.stringify(obj2));
      console.info('[DatePickerDialogButtonStyleTest_001] obj2.$children[1].$children[0].$children[0].$children[2].$children[0] is: ' + JSON.stringify(obj2.$children[1].$children[0].$children[0].$children[2].$children[0]));
      expect(obj2.$children[1].$children[0].$children[0].$children[2].$children[0].$attrs.type).assertEqual('ButtonType.Normal');
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      console.info('[DatePickerDialogButtonStyleTest_001] END');
      done();
    });
  })
}