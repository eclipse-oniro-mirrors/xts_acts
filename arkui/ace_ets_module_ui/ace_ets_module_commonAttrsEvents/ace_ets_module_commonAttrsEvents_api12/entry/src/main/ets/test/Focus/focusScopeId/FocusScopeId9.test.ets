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


export default function FocusScopeId9() {
  describe('FocusScopeId9', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId9 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId9',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId9 state success " + JSON.stringify(pages));
        if (!("FocusScopeId9" == pages.name)) {
          console.info("get FocusScopeId9 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId9 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId9 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId9 after each called");
    });

    /**
     * @tc.name   FocusScopeId9_0100
     * @tc.number FocusScopeId9_0100
     * @tc.desc   Support cross group and circular focusing with tab keys in focus groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FocusScopeId9_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId9_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3_6 = await driver.findComponent(ON.id('FocusScopeId9_btn3_6'));
      let btn3_6_isFocusedValue = await btn3_6.isFocused()
      expect(btn3_6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId9_0100] btn3_6 isFocused');

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

      let btn_changIsGroup = await driver.findComponent(ON.id('FocusScopeId9_changIsGroup'));
      let btn_changIsGroup_isFocusedValue = await btn_changIsGroup.isFocused()
      expect(btn_changIsGroup_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId9_0100] btn_changIsGroup isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_1 = await driver.findComponent(ON.id('FocusScopeId9_btn1_1'));
      let btn1_1_isFocusedValue = await btn1_1.isFocused()
      expect(btn1_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId9_0100] btn1_1 isFocused');

      let scrollBar = await driver.findComponent(ON.id('FocusScopeId9_scroll'));
      let clearFocus = await scrollBar.scrollSearch(ON.id('FocusScopeId9_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId9_0100] clearFocus click');

      console.info('[FocusScopeId9_0100] END');
      done();
    });
  })
}

