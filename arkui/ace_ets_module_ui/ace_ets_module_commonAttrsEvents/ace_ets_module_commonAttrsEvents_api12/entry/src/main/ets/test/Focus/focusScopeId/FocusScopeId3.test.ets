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


export default function FocusScopeId3() {
  describe('FocusScopeId3', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId3 state success " + JSON.stringify(pages));
        if (!("FocusScopeId3" == pages.name)) {
          console.info("get FocusScopeId3 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId3 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId3 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId3 after each called");
    });

    /**
     * @tc.number FocusScopeId3_0100
     * @tc.name FocusScopeId3_0100
     * @tc.desc Test support for directional key focus group penetration ability
     * @tc.level Level 2
     */
    it('FocusScopeId3_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId3_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('FocusScopeId3_pushPageOne'));
      await btn.click()
      await CommonFunc.sleep(2000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('FocusScopeId3_btn1'));
      let btn1_isFocusedValue = await btn1.isFocused()
      expect(btn1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId3_0100] btn1 isFocused');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('FocusScopeId3_btn2'));
      let btn2_isFocusedValue = await btn2.isFocused()
      expect(btn2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId3_0100] btn2 isFocused');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn3 = await driver.findComponent(ON.id('FocusScopeId3_btn3'));
      let btn3_isFocusedValue = await btn3.isFocused()
      expect(btn3_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId3_0100] btn3 isFocused');

      let clearFocus = await driver.findComponent(ON.id('FocusScopeId3_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId3_0100] clearFocus click');

      console.info('[FocusScopeId3_0100] END');
      done();
    });
  })
}

