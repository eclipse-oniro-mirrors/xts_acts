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


export default function FocusScopePriority1() {
  describe('FocusScopePriority1', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopePriority1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopePriority/FocusScopePriority1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopePriority1 state success " + JSON.stringify(pages));
        if (!("FocusScopePriority1" == pages.name)) {
          console.info("get FocusScopePriority1 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopePriority1 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopePriority1 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopePriority1 after each called");
    });

    /**
     * @tc.number    FocusScopePriority1_0100
     * @tc.name      FocusScopePriority1_0100
     * @tc.desc      Test FocusScopePriority
     * @tc.level     Level 2
     */
    it('FocusScopePriority1_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopePriority1_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let clearFocus = await driver.findComponent(ON.id('FocusScopePriority1_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopePriority1_0100] clearFocus click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_1 = await driver.findComponent(ON.id('FocusScopePriority1_btn2_1'));
      let btn2_1_isFocusedValue = await btn2_1.isFocused()
      expect(btn2_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority1_0100] btn2_1 isFocused');

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

      let btn2_1_isFocusedValue2 = await btn2_1.isFocused()
      expect(btn2_1_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopePriority1_0100] btn2_1 isFocused 2');

      let scrollBar = await driver.findComponent(ON.id('FocusScopePriority1_scroll'));
      let clearFocus2 = await scrollBar.scrollSearch(ON.id('FocusScopePriority1_clearFocus'));
      await clearFocus2.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopePriority1_0100] clearFocus2 click');

      console.info('[FocusScopePriority1_0100] END');
      done();
    });
  })
}

