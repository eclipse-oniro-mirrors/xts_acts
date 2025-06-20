/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function FocusScopeId10() {
  describe('FocusScopeId10', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId10 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId10',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId10 state success " + JSON.stringify(pages));
        if (!("FocusScopeId10" == pages.name)) {
          console.info("get FocusScopeId10 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId10 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId10 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId10 after each called");
    });

    /**
     * @tc.number    FocusScopeId10_0100
     * @tc.name      FocusScopeId10_0100
     * @tc.desc      Support cross group and circular focusing with tab keys in focus groups
     * @tc.level     Level 2
     */
    it('FocusScopeId10_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId10_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3= await driver.findComponent(ON.id('FocusScopeId10_btn3'));
      let btn3_isFocusedValue = await btn3.isFocused()
      expect(btn3_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_0100] btn3 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn4 = await driver.findComponent(ON.id('FocusScopeId10_btn4'));
      let btn4_isFocusedValue = await btn4.isFocused()
      expect(btn4_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_0100] btn4 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn6 = await driver.findComponent(ON.id('FocusScopeId10_btn6'));
      let btn6_isFocusedValue = await btn6.isFocused()
      expect(btn6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_0100] btn6 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn7 = await driver.findComponent(ON.id('FocusScopeId10_btn7'));
      let btn7_isFocusedValue = await btn7.isFocused()
      expect(btn7_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_0100] btn7 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3_isFocusedValue2 = await btn3.isFocused()
      expect(btn3_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId10_0100] btn3 isFocused 2');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn4_isFocusedValue2 = await btn4.isFocused()
      expect(btn4_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId10_0100] btn4 isFocused 2');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn5 = await driver.findComponent(ON.id('FocusScopeId10_btn5'));
      let btn5_isFocusedValue = await btn5.isFocused()
      expect(btn5_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_0100] btn5 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn6_isFocusedValue2 = await btn6.isFocused()
      expect(btn6_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId10_0100] btn6 isFocused 2');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn7_isFocusedValue2 = await btn7.isFocused()
      expect(btn7_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId10_0100] btn7 isFocused 2');

      let clearFocus = await driver.findComponent(ON.id('FocusScopeId10_btn5'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId10_0100] clearFocus click');

      console.info('[FocusScopeId10_0100] END');
      done();
    });
  })
}

