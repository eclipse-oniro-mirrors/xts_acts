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


export default function FocusScopePriority6() {
  describe('FocusScopePriority6', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopePriority6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopePriority/FocusScopePriority6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopePriority6 state success " + JSON.stringify(pages));
        if (!("FocusScopePriority6" == pages.name)) {
          console.info("get FocusScopePriority6 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopePriority6 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopePriority6 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopePriority6 after each called");
    });

    /**
     * @tc.number    FocusScopePriority6_0100
     * @tc.name      FocusScopePriority6_0100
     * @tc.desc      Test FocusScopePriority
     * @tc.level     Level 2
     */
    it('FocusScopePriority6_0100', 0, async (done: Function) => {
      console.info('[FocusScopePriority6_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_6 = await driver.findComponent(ON.id('FocusScopePriority6_btn2_6'));
      let btn2_6_isFocusedValue = await btn2_6.isFocused()
      expect(btn2_6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority6_0100] btn2_6 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_6_isFocusedValue2 = await btn2_6.isFocused()
      expect(btn2_6_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopePriority6_0100] btn2_6 isFocused 2');

      let btn1_6 = await driver.findComponent(ON.id('FocusScopePriority6_btn1_6'));
      await btn1_6.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopePriority6_0100] btn1_6 click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_6_isFocusedValue = await btn1_6.isFocused()
      expect(btn1_6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority6_0100] btn1_6 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_6_isFocusedValue2 = await btn1_6.isFocused()
      expect(btn1_6_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopePriority6_0100] btn1_6 isFocused 2');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3_7 = await driver.findComponent(ON.id('FocusScopePriority6_btn3_7'));
      let btn3_7_isFocusedValue = await btn3_7.isFocused()
      expect(btn3_7_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority6_0100] btn3_7 isFocused');

      let scrollBar = await driver.findComponent(ON.id('FocusScopePriority6_scroll'));
      let clearFocus = await scrollBar.scrollSearch(ON.id('FocusScopePriority6_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopePriority6_0100] clearFocus click');

      console.info('[FocusScopePriority6_0100] END');
      done();
    });
  })
}

