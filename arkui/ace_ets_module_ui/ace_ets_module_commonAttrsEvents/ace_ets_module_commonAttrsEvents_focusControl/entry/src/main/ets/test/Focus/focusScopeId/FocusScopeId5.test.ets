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


export default function FocusScopeId5() {
  describe('FocusScopeId5', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId5',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId5 state success " + JSON.stringify(pages));
        if (!("FocusScopeId5" == pages.name)) {
          console.info("get FocusScopeId5 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId5 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId5 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId5 after each called");
    });

    /**
     * @tc.name   FocusScopeId5_0100
     * @tc.number FocusScopeId5_0100
     * @tc.desc   Support for mixed focusing of focus groups and ordinary components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FocusScopeId5_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId5_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3_6 = await driver.findComponent(ON.id('FocusScopeId5_btn3_6'));
      let btn3_6_isFocusedValue = await btn3_6.isFocused()
      expect(btn3_6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId5_0100] btn3_6 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn_clearFocus = await driver.findComponent(ON.id('FocusScopeId5_clearFocus'));
      let btn_clearFocus_isFocusedValue = await btn_clearFocus.isFocused()
      expect(btn_clearFocus_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId5_0100] btn_clearFocus isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn_requestFocus = await driver.findComponent(ON.id('FocusScopeId5_requestFocus'));
      let btn_requestFocus_isFocusedValue = await btn_requestFocus.isFocused()
      expect(btn_requestFocus_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId5_0100] btn_requestFocus isFocused');

      let clearFocus = await driver.findComponent(ON.id('FocusScopeId5_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId5_0100] clearFocus click');

      console.info('[FocusScopeId5_0100] END');
      done();
    });
  })
}

