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

export default function FocusScopeId010() {
  describe('FocusScopeId010', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId010 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId2/FocusScopeId010',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId010 state success " + JSON.stringify(pages));
        if (!("FocusScopeId010" == pages.name)) {
          console.info("get FocusScopeId010 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId010 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId010 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId010 after each called");
    });

    /**
     * @tc.name   FocusScopeId010_0100
     * @tc.number FocusScopeId010_0100
     * @tc.desc   Test focusScopeId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FocusScopeId010_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId010_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn_hide = await driver.findComponent(ON.id('FocusScopeId010_btn_hide'));
      await btn_hide.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId010_0100] btn_hide click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn_hide_isFocusedValue = await btn_hide.isFocused()
      expect(btn_hide_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId010_0100] btn_hide isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn_hide_isFocusedValue2 = await btn_hide.isFocused()
      expect(btn_hide_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId010_0100] btn_hide isFocused 2');

      let clearFocus = await driver.findComponent(ON.id('FocusScopeId010_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId010_0100] clearFocus click');

      console.info('[FocusScopeId010_0100] END');
      done();
    });
  })
}

