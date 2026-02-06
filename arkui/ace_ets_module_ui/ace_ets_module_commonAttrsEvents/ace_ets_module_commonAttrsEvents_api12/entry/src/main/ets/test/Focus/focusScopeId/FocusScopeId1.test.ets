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


export default function FocusScopeId1() {
  describe('FocusScopeId1', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId1 state success " + JSON.stringify(pages));
        if (!("FocusScopeId1" == pages.name)) {
          console.info("get FocusScopeId1 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId1 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId1 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId1 after each called");
    });

    /**
     * @tc.number FocusScopeId1_0100
     * @tc.name FocusScopeId1_0100
     * @tc.desc Test support for directional key focus group penetration ability
     * @tc.level Level 2
     */
    it('FocusScopeId1_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId1_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3_6 = await driver.findComponent(ON.id('FocusScopeId1_btn3_6'));
      let btn3_6_isFocusedValue = await btn3_6.isFocused()
      expect(btn3_6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId1_0100] btn3_6 isFocused');

      await driver.triggerKey(2012);
      await CommonFunc.sleep(1000);

      let btn2_6 = await driver.findComponent(ON.id('FocusScopeId1_btn2_6'));
      let btn2_6_isFocusedValue = await btn2_6.isFocused()
      expect(btn2_6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId1_0100] btn2_6 isFocused');

      await driver.triggerKey(2012);
      await CommonFunc.sleep(1000);

      let btn1_6 = await driver.findComponent(ON.id('FocusScopeId1_btn1_6'));
      let btn1_6_isFocusedValue = await btn1_6.isFocused()
      expect(btn1_6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId1_0100] btn1_6 isFocused');

      await driver.triggerKey(2012);
      await CommonFunc.sleep(1000);

      let btn1_5 = await driver.findComponent(ON.id('FocusScopeId1_btn1_5'));
      let btn1_5_isFocusedValue = await btn1_5.isFocused()
      expect(btn1_5_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId1_0100] btn1_5 isFocused');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn2_5 = await driver.findComponent(ON.id('FocusScopeId1_btn2_5'));
      let btn2_5_isFocusedValue = await btn2_5.isFocused()
      expect(btn2_5_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId1_0100] btn2_5 isFocused');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn3_5 = await driver.findComponent(ON.id('FocusScopeId1_btn3_5'));
      let btn3_5_isFocusedValue = await btn3_5.isFocused()
      expect(btn3_5_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId1_0100] btn3_5 isFocused');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn1_6_isFocusedValue2 = await btn1_6.isFocused()
      expect(btn1_6_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId1_0100] btn1_6 isFocused 2');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn2_6_isFocusedValue2 = await btn2_6.isFocused()
      expect(btn2_6_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId1_0100] btn2_6 isFocused 2');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn3_6_isFocusedValue2 = await btn3_6.isFocused()
      expect(btn3_6_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId1_0100] btn3_6 isFocused 2');

      let clearFocus = await driver.findComponent(ON.id('FocusScopeId1_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId1_0100] clearFocus click');

      console.info('[FocusScopeId1_0100] END');
      done();
    });
  })
}

