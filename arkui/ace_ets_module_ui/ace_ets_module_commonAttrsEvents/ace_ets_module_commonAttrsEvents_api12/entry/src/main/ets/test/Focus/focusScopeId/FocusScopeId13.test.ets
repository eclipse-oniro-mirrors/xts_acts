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


export default function FocusScopeId13() {
  describe('FocusScopeId13', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId13 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId13',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId13 state success " + JSON.stringify(pages));
        if (!("FocusScopeId13" == pages.name)) {
          console.info("get FocusScopeId13 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId13 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId13 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId13 after each called");
    });

    /**
     * @tc.number    FocusScopeId13_0100
     * @tc.name      FocusScopeId13_0100
     * @tc.desc      Support cross group and circular focusing with tab keys in focus groups
     * @tc.level     Level 2
     */
    it('FocusScopeId13_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId13_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btnOpen = await driver.findComponent(ON.id('FocusScopeId13_open'));
      await btnOpen.click()
      await CommonFunc.sleep(2000);
      console.info('[FocusScopeId13_0100] btnOpen click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('FocusScopeId13_btn1'));
      let btn1_isFocusedValue = await btn1.isFocused()
      expect(btn1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId13_0100] btn1 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn4 = await driver.findComponent(ON.id('FocusScopeId13_btn4'));
      let btn4_isFocusedValue = await btn4.isFocused()
      expect(btn4_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId13_0100] btn4 isFocused');

      let btn3 = await driver.findComponent(ON.id('FocusScopeId13_btn3'));
      await btn3.click()
      console.info('[FocusScopeId13_0100] btn3 click');
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3_isFocusedValue = await btn3.isFocused()
      expect(btn3_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId13_0100] btn3 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn4_isFocusedValue2 = await btn4.isFocused()
      expect(btn4_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId13_0100] btn4 isFocused 2');

      await btn4.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId13_0100] close click');

      console.info('[FocusScopeId13_0100] END');
      done();
    });
  })
}

