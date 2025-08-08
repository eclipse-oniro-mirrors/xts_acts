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


export default function FocusScopeId007() {
  describe('FocusScopeId007', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId007 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId2/FocusScopeId007',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId007 state success " + JSON.stringify(pages));
        if (!("FocusScopeId007" == pages.name)) {
          console.info("get FocusScopeId007 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId007 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId007 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId007 after each called");
    });

    /**
     * @tc.number    FocusScopeId007_0100
     * @tc.name      FocusScopeId007_0100
     * @tc.desc      Test focusScopeId
     * @tc.level     Level 2
     */
    it('FocusScopeId007_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId007_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3_6 = await driver.findComponent(ON.id('FocusScopeId007_btn3_6'));
      let btn3_6_isFocusedValue = await btn3_6.isFocused()
      expect(btn3_6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId007_0100] btn3_6 isFocused');

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

      let btn_btn = await driver.findComponent(ON.id('FocusScopeId007_btn_btn'));
      let btn_btn_isFocusedValue = await btn_btn.isFocused()
      expect(btn_btn_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId007_0100] btn_btn isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_4 = await driver.findComponent(ON.id('FocusScopeId007_btn1_4'));
      let btn1_4_isFocusedValue = await btn1_4.isFocused()
      expect(btn1_4_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId007_0100] btn1_4 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn_hide = await driver.findComponent(ON.id('FocusScopeId007_btn_hide'));
      let btn_hide_isFocusedValue = await btn_hide.isFocused()
      expect(btn_hide_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId007_0100] btn_hide isFocused');

      let scrollBar = await driver.findComponent(ON.id('FocusScopeId007_scroll'));
      let clearFocus = await scrollBar.scrollSearch(ON.id('FocusScopeId007_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId007_0100] clearFocus click');

      console.info('[FocusScopeId007_0100] END');
      done();
    });
  })
}

