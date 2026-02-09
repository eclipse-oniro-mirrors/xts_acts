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


export default function FocusScopePriority10() {
  describe('FocusScopePriority10', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopePriority10 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopePriority/FocusScopePriority10',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopePriority10 state success " + JSON.stringify(pages));
        if (!("FocusScopePriority10" == pages.name)) {
          console.info("get FocusScopePriority10 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopePriority10 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopePriority10 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopePriority10 after each called");
    });

    /**
     * @tc.name   FocusScopePriority10_0100
     * @tc.number FocusScopePriority10_0100
     * @tc.desc   Test FocusScopePriority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FocusScopePriority10_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopePriority10_0100] START');
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

      let btn2_12 = await driver.findComponent(ON.id('FocusScopePriority10_btn2_12'));
      let btn2_12_isFocusedValue = await btn2_12.isFocused()
      expect(btn2_12_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority10_0100] btn2_12 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3_12 = await driver.findComponent(ON.id('FocusScopePriority10_btn3_12'));
      let btn3_12_isFocusedValue = await btn3_12.isFocused()
      expect(btn3_12_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority10_0100] btn3_12 isFocused');

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

      let btn1_12 = await driver.findComponent(ON.id('FocusScopePriority10_btn1_12'));
      let btn1_12_isFocusedValue = await btn1_12.isFocused()
      expect(btn1_12_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority10_0100] btn1_12 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_12_isFocusedValue2 = await btn2_12.isFocused()
      expect(btn2_12_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopePriority10_0100] btn2_12 isFocused 2');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3_12_isFocusedValue2 = await btn3_12.isFocused()
      expect(btn3_12_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopePriority10_0100] btn3_12 isFocused 2');

      let scrollBar = await driver.findComponent(ON.id('FocusScopePriority10_scroll'));
      let clearFocus = await scrollBar.scrollSearch(ON.id('FocusScopePriority10_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopePriority10_0100] clearFocus click');

      console.info('[FocusScopePriority10_0100] END');
      done();
    });
  })
}

