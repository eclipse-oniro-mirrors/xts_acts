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


export default function FocusScopeId12() {
  describe('FocusScopeId12', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId12 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId12',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId12 state success " + JSON.stringify(pages));
        if (!("FocusScopeId12" == pages.name)) {
          console.info("get FocusScopeId12 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId12 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId12 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId12 after each called");
    });

    /**
     * @tc.number    FocusScopeId12_0100
     * @tc.name      FocusScopeId12_0100
     * @tc.desc      Support cross group and circular focusing with tab keys in focus groups
     * @tc.level     Level 2
     */
    it('FocusScopeId12_0100', 0, async (done: Function) => {
      console.info('[FocusScopeId12_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btnOpen = await driver.findComponent(ON.id('FocusScopeId12_open'));
      await btnOpen.click()
      await CommonFunc.sleep(2000);
      console.info('[FocusScopeId12_0100] btnOpen click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_1 = await driver.findComponent(ON.id('FocusScopeId12_btn1_1'));
      let btn1_1_isFocusedValue = await btn1_1.isFocused()
      expect(btn1_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId12_0100] btn1_1 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let textInput = await driver.findComponent(ON.id('FocusScopeId12_TextInput'));
      let textInput_isFocusedValue = await textInput.isFocused()
      expect(textInput_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId12_0100] textInput isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn_close = await driver.findComponent(ON.id('FocusScopeId12_close'));
      let btn_close_isFocusedValue = await btn_close.isFocused()
      expect(btn_close_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId12_0100] btn_close isFocused');

      await btn_close.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId12_0100] close click');

      console.info('[FocusScopeId12_0100] END');
      done();
    });
  })
}

