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


export default function FocusScopeId7() {
  describe('FocusScopeId7', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId7 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId7',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId7 state success " + JSON.stringify(pages));
        if (!("FocusScopeId7" == pages.name)) {
          console.info("get FocusScopeId7 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId7 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId7 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId7 after each called");
    });

    /**
     * @tc.number FocusScopeId7_0100
     * @tc.name FocusScopeId7_0100
     * @tc.desc Support cross group and circular focusing with tab keys in focus groups
     * @tc.level Level 2
     */
    it('FocusScopeId7_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId7_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3_6 = await driver.findComponent(ON.id('FocusScopeId7_btn3_6'));
      let btn3_6_isFocusedValue = await btn3_6.isFocused()
      expect(btn3_6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId7_0100] btn3_6 isFocused');

      let scrollBar = await driver.findComponent(ON.id('FocusScopeId7_scroll'));
      let clearFocus = await scrollBar.scrollSearch(ON.id('FocusScopeId7_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId7_0100] clearFocus click');

      console.info('[FocusScopeId7_0100] END');
      done();
    });
  })
}

