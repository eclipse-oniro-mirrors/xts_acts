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


export default function FocusScopeId011() {
  describe('FocusScopeId011', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId011 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId2/FocusScopeId011',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId011 state success " + JSON.stringify(pages));
        if (!("FocusScopeId011" == pages.name)) {
          console.info("get FocusScopeId011 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId011 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId011 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId011 after each called");
    });

    /**
     * @tc.number    FocusScopeId011_0100
     * @tc.name      FocusScopeId011_0100
     * @tc.desc      Test focusScopeId
     * @tc.level     Level 2
     */
    it('FocusScopeId011_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId011_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_2= await driver.findComponent(ON.id('FocusScopeId011_btn1_2'));
      let btn1_2_isFocusedValue = await btn1_2.isFocused()
      expect(btn1_2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId011_0100] btn1_2 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_1= await driver.findComponent(ON.id('FocusScopeId011_btn1_1'));
      let btn1_1_isFocusedValue = await btn1_1.isFocused()
      expect(btn1_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId011_0100] btn1_1 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_3= await driver.findComponent(ON.id('FocusScopeId011_btn1_3'));
      let btn1_3_isFocusedValue = await btn1_3.isFocused()
      expect(btn1_3_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId011_0100] btn1_3 isFocused');

      await btn1_1.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId011_0100] clearFocus click');

      console.info('[FocusScopeId011_0100] END');
      done();
    });
  })
}

