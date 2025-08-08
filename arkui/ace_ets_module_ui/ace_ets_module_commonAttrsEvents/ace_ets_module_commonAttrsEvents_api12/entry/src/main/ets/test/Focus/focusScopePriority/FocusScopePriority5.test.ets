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


export default function FocusScopePriority5() {
  describe('FocusScopePriority5', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopePriority5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopePriority/FocusScopePriority5',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopePriority5 state success " + JSON.stringify(pages));
        if (!("FocusScopePriority5" == pages.name)) {
          console.info("get FocusScopePriority5 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopePriority5 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopePriority5 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopePriority5 after each called");
    });

    /**
     * @tc.number    FocusScopePriority5_0100
     * @tc.name      FocusScopePriority5_0100
     * @tc.desc      Test FocusScopePriority
     * @tc.level     Level 2
     */
    it('FocusScopePriority5_0100', 0, async (done: Function) => {
      console.info('[FocusScopePriority5_0100] START');
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

      let btn2_5 = await driver.findComponent(ON.id('FocusScopePriority5_btn2_5'));
      let btn2_5_isFocusedValue = await btn2_5.isFocused()
      expect(btn2_5_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority5_0100] btn2_5 isFocused');

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

      let btn2_5_isFocusedValue2 = await btn2_5.isFocused()
      expect(btn2_5_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopePriority5_0100] btn2_5 isFocused 2');

      let scrollBar = await driver.findComponent(ON.id('FocusScopePriority5_scroll'));
      let clearFocus = await scrollBar.scrollSearch(ON.id('FocusScopePriority5_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopePriority5_0100] clearFocus click');

      console.info('[FocusScopePriority5_0100] END');
      done();
    });
  })
}

