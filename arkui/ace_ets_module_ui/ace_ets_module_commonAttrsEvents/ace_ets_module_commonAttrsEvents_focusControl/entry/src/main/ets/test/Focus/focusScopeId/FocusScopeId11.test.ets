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


export default function FocusScopeId11() {
  describe('FocusScopeId11', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId11 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId11',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId11 state success " + JSON.stringify(pages));
        if (!("FocusScopeId11" == pages.name)) {
          console.info("get FocusScopeId11 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId11 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId11 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId11 after each called");
    });

    /**
     * @tc.name   FocusScopeId11_0100
     * @tc.number FocusScopeId11_0100
     * @tc.desc   Support cross group and circular focusing with tab keys in focus groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FocusScopeId11_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId11_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_2= await driver.findComponent(ON.id('FocusScopeId1_btn1_2'));
      let btn1_2_isFocusedValue = await btn1_2.isFocused()
      expect(btn1_2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId11_0100] btn1_2 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_1= await driver.findComponent(ON.id('FocusScopeId1_btn1_1'));
      let btn1_1_isFocusedValue = await btn1_1.isFocused()
      expect(btn1_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId11_0100] btn1_1 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_3= await driver.findComponent(ON.id('FocusScopeId1_btn1_3'));
      let btn1_3_isFocusedValue = await btn1_3.isFocused()
      expect(btn1_3_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId11_0100] btn1_3 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_2_isFocusedValue2 = await btn1_2.isFocused()
      expect(btn1_2_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId11_0100] btn1_2 isFocused 2');

      let btn2_3= await driver.findComponent(ON.id('FocusScopeId1_btn2_3'));
      await btn2_3.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId11_0100] btn2_3 click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_3_isFocusedValue = await btn2_3.isFocused()
      expect(btn2_3_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId11_0100] btn2_3 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_2_isFocusedValue3 = await btn1_2.isFocused()
      expect(btn1_2_isFocusedValue3).assertEqual(true);
      console.info('[FocusScopeId11_0100] btn1_2 isFocused 3');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_1_isFocusedValue2 = await btn1_1.isFocused()
      expect(btn1_1_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId11_0100] btn1_1 isFocused 2');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_3_isFocusedValue2 = await btn2_3.isFocused()
      expect(btn2_3_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId11_0100] btn2_3 isFocused 2');

      await btn1_1.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId11_0100] clearFocus click');

      console.info('[FocusScopeId11_0100] END');
      done();
    });
  })
}

