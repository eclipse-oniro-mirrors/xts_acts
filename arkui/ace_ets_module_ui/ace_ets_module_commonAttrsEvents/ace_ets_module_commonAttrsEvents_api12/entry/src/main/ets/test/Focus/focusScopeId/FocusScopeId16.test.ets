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


export default function FocusScopeId16() {
  describe('FocusScopeId16', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId16 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId16',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId16 state success " + JSON.stringify(pages));
        if (!("FocusScopeId16" == pages.name)) {
          console.info("get FocusScopeId16 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId16 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId16 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId16 after each called");
    });

    /**
     * @tc.number    FocusScopeId16_0100
     * @tc.name      FocusScopeId16_0100
     * @tc.desc      Test support for directional key focus group penetration ability
     * @tc.level     Level 2
     */
    it('FocusScopeId16_0100', 0, async (done: Function) => {
      console.info('[FocusScopeId16_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn_push = await driver.findComponent(ON.id('FocusScopeId16_push'));
      await btn_push.click()
      await CommonFunc.sleep(2000);
      console.info('[FocusScopeId16_0100] btn_push click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn_push_isFocusedValue = await btn_push.isFocused()
      expect(btn_push_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId16_0100] btn_push isFocused');

      let btn_stack = await driver.findComponent(ON.id('FocusScopeId1_stack'));
      await btn_stack.click()
      await CommonFunc.sleep(2000);
      console.info('[FocusScopeId16_0100] btn_stack click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('FocusScopeId16_button1'));
      let btn1_isFocusedValue = await btn1.isFocused()
      expect(btn1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId16_0100] btn1 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn_pop = await driver.findComponent(ON.id('FocusScopeId16_pop'));
      let btn_pop_isFocusedValue = await btn_pop.isFocused()
      expect(btn_pop_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId16_0100] btn_pop isFocused');

      await btn1.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId16_0100] btn1 click');

      console.info('[FocusScopeId16_0100] END');
      done();
    });
  })
}

