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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import CommonFunc from '../../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function FocusScopeId14() {
  describe('FocusScopeId14', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId14 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId14',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId14 state success " + JSON.stringify(pages));
        if (!("FocusScopeId14" == pages.name)) {
          console.info("get FocusScopeId14 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId14 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId14 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId14 after each called");
    });

    /**
     * @tc.number    FocusScopeId14_0100
     * @tc.name      FocusScopeId14_0100
     * @tc.desc      Support cross group and circular focusing with tab keys in focus groups
     * @tc.level     Level 2
     */
    it('FocusScopeId14_0100', 0, async (done: Function) => {
      console.info('[FocusScopeId14_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btnOpen = await driver.findComponent(ON.id('FocusScopeId14_open'));
      await btnOpen.click()
      await CommonFunc.sleep(2000);
      console.info('[FocusScopeId14_0100] btnOpen click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('FocusScopeId14_btn1'));
      let btn1_isFocusedValue = await btn1.isFocused()
      expect(btn1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId14_0100] btn1 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn4 = await driver.findComponent(ON.id('FocusScopeId14_btn4'));
      let btn4_isFocusedValue = await btn4.isFocused()
      expect(btn4_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId14_0100] btn4 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_isFocusedValue2 = await btn1.isFocused()
      expect(btn1_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId14_0100] btn1 isFocused 2');

      let btn2 = await driver.findComponent(ON.id('FocusScopeId14_btn2'));
      await btn2.click()
      console.info('[FocusScopeId14_0100] btn2 click');
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_isFocusedValue = await btn2.isFocused()
      expect(btn2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId14_0100] btn2 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn4_isFocusedValue2 = await btn4.isFocused()
      expect(btn4_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId14_0100] btn4 isFocused 2');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_isFocusedValue2 = await btn2.isFocused()
      expect(btn2_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId14_0100] btn2 isFocused 2');

      await btn4.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId14_0100] close click');

      console.info('[FocusScopeId14_0100] END');
      done();
    });
  })
}

