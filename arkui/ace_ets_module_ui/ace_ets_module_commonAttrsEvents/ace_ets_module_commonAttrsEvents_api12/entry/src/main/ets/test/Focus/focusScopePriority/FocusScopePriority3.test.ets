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


export default function FocusScopePriority3() {
  describe('FocusScopePriority3', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopePriority3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopePriority/FocusScopePriority3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopePriority3 state success " + JSON.stringify(pages));
        if (!("FocusScopePriority3" == pages.name)) {
          console.info("get FocusScopePriority3 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopePriority3 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopePriority3 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopePriority3 after each called");
    });

    /**
     * @tc.name   FocusScopePriority3_0100
     * @tc.number FocusScopePriority3_0100
     * @tc.desc   Test FocusScopePriority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FocusScopePriority3_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopePriority3_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
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

      let btn2_3 = await driver.findComponent(ON.id('FocusScopePriority3_btn2_3'));
      let btn2_3_isFocusedValue = await btn2_3.isFocused()
      expect(btn2_3_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority3_0100] btn2_3 isFocused');

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

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_3_isFocusedValue2 = await btn2_3.isFocused()
      expect(btn2_3_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopePriority3_0100] btn2_3 isFocused 2');

      let scrollBar = await driver.findComponent(ON.id('FocusScopePriority3_scroll'));
      let clearFocus = await scrollBar.scrollSearch(ON.id('FocusScopePriority3_clearFocus'));
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopePriority3_0100] clearFocus click');

      console.info('[FocusScopePriority3_0100] END');
      done();
    });
  })
}

