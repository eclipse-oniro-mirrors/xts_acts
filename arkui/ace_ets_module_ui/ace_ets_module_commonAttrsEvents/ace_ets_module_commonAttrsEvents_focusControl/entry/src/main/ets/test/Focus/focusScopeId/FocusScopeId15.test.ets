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


export default function FocusScopeId15() {
  describe('FocusScopeId15', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId15 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId15',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId15 state success " + JSON.stringify(pages));
        if (!("FocusScopeId15" == pages.name)) {
          console.info("get FocusScopeId15 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId15 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId15 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId15 after each called");
    });

    /**
     * @tc.name   FocusScopeId15_0100
     * @tc.number FocusScopeId15_0100
     * @tc.desc   Support cross group and circular focusing with tab keys in focus groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FocusScopeId15_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId15_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let scrollBar = await driver.findComponent(ON.id('FocusScopeId15_scroll'));
      let btn_requestFocus1 = await scrollBar.scrollSearch(ON.id('FocusScopeId15_requestFocus1'));
      await btn_requestFocus1.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId15_0100] btn_requestFocus1 click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_1 = await driver.findComponent(ON.id('FocusScopeId15_btn2_1'));
      let btn2_1_isFocusedValue = await btn2_1.isFocused()
      expect(btn2_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId15_0100] btn2_1 isFocused');


      let btn_requestFocus2 = await scrollBar.scrollSearch(ON.id('FocusScopeId15_requestFocus2'));
      await btn_requestFocus2.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId15_0100] btn_requestFocus2 click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_2 = await driver.findComponent(ON.id('FocusScopeId15_btn2_2'));
      let btn2_2_isFocusedValue = await btn2_2.isFocused()
      expect(btn2_2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId15_0100] btn2_2 isFocused');

      let clearFocus = await scrollBar.scrollSearch(ON.id('FocusScopeId15_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId15_0100] clearFocus click');

      console.info('[FocusScopeId15_0100] END');
      done();
    });
  })
}

