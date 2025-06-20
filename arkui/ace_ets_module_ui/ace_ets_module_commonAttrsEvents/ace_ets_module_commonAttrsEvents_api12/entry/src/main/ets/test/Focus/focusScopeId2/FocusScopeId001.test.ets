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


export default function FocusScopeId001() {
  describe('FocusScopeId001', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId001 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId2/FocusScopeId001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId001 state success " + JSON.stringify(pages));
        if (!("FocusScopeId001" == pages.name)) {
          console.info("get FocusScopeId001 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId001 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId001 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId001 after each called");
    });

    /**
     * @tc.number    FocusScopeId001_0100
     * @tc.name      FocusScopeId001_0100
     * @tc.desc      Test focusScopeId
     * @tc.level     Level 2
     */
    it('FocusScopeId001_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId001_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let clearFocus = await driver.findComponent(ON.id('FocusScopeId001_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId001_0100] clearFocus click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_1 = await driver.findComponent(ON.id('FocusScopeId001_btn1_1'));
      let btn1_1_isFocusedValue = await btn1_1.isFocused()
      expect(btn1_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId001_0100] btn1_1 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn_del = await driver.findComponent(ON.id('FocusScopeId001_btn_del'));
      let btn_del_isFocusedValue = await btn_del.isFocused()
      expect(btn_del_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId001_0100] btn_del isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn2_2 = await driver.findComponent(ON.id('FocusScopeId001_btn2_2'));
      let btn2_2_isFocusedValue = await btn2_2.isFocused()
      expect(btn2_2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId001_0100] btn2_2 isFocused');

      let changIsGroup = await driver.findComponent(ON.id('FocusScopeId001_changIsGroup'));
      await changIsGroup.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId001_0100] changIsGroup click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_1 = await driver.findComponent(ON.id('FocusScopeId001_btn2_1'));
      let btn2_1_isFocusedValue = await btn2_1.isFocused()
      expect(btn2_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId001_0100] btn2_1 isFocused');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn3_1 = await driver.findComponent(ON.id('FocusScopeId001_btn3_1'));
      let btn3_1_isFocusedValue = await btn3_1.isFocused()
      expect(btn3_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId001_0100] btn3_1 isFocused');

      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId001_0100] clearFocus click 2');

      console.info('[FocusScopeId001_0100] END');
      done();
    });
  })
}

