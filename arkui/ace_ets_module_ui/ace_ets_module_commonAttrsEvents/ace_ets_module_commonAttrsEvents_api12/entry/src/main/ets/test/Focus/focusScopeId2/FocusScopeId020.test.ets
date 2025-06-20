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


export default function FocusScopeId020() {
  describe('FocusScopeId020', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId020 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId2/FocusScopeId020',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId020 state success " + JSON.stringify(pages));
        if (!("FocusScopeId020" == pages.name)) {
          console.info("get FocusScopeId020 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId020 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId020 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId020 after each called");
    });

    /**
     * @tc.number    FocusScopeId020_0100
     * @tc.name      FocusScopeId020_0100
     * @tc.desc      Test focusScopeId
     * @tc.level     Level 2
     */
    it('FocusScopeId020_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId020_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let Split = await driver.findComponent(ON.id('FocusScopeId020_btn2_5'));
      await Split.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId020_0100] Split click');

      let pushPageOne = await driver.findComponent(ON.id('FocusScopeId020_btn3_5'));
      await pushPageOne.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId020_0100] pushPageOne click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_7 = await driver.findComponent(ON.id('FocusScopeId020_btn1_7'));
      let btn1_7_isFocusedValue = await btn1_7.isFocused()
      expect(btn1_7_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId020_0100] btn1_7 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3 = await driver.findComponent(ON.id('FocusScopeId020_btn3'));
      let btn3_isFocusedValue = await btn3.isFocused()
      expect(btn3_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId020_0100] btn3 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_1 = await driver.findComponent(ON.id('FocusScopeId020_btn1_1'));
      let btn1_1_isFocusedValue = await btn1_1.isFocused()
      expect(btn1_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId020_0100] btn1_1 isFocused');

      let clearFocus = await driver.findComponent(ON.id('FocusScopeId020_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId020_0100] clearFocus click');

      console.info('[FocusScopeId020_0100] END');
      done();
    });
  })
}

