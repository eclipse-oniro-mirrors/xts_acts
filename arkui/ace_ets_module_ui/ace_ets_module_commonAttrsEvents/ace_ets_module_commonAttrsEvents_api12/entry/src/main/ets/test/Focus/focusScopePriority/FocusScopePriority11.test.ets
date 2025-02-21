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


export default function FocusScopePriority11() {
  describe('FocusScopePriority11', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopePriority11 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopePriority/FocusScopePriority11',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopePriority11 state success " + JSON.stringify(pages));
        if (!("FocusScopePriority11" == pages.name)) {
          console.info("get FocusScopePriority11 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopePriority11 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopePriority11 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopePriority11 after each called");
    });

    /**
     * @tc.number    FocusScopePriority11_0100
     * @tc.name      FocusScopePriority11_0100
     * @tc.desc      Test FocusScopePriority
     * @tc.level     Level 2
     */
    it('FocusScopePriority11_0100', 0, async (done: Function) => {
      console.info('[FocusScopePriority11_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let open = await driver.findComponent(ON.id('FocusScopePriority11_open'));
      await open.click()
      await CommonFunc.sleep(2000);
      console.info('[FocusScopePriority11_0100] open click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let Item1_1 = await driver.findComponent(ON.id('FocusScopePriority11_Item1_1'));
      let Item1_1_isFocusedValue = await Item1_1.isFocused()
      expect(Item1_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority11_0100] Item1_1 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let Item2_1 = await driver.findComponent(ON.id('FocusScopePriority11_Item2_1'));
      let Item2_1_isFocusedValue = await Item2_1.isFocused()
      expect(Item2_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority11_0100] Item2_1 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let Item1_2 = await driver.findComponent(ON.id('FocusScopePriority11_Item1_2'));
      let Item1_2_isFocusedValue = await Item1_2.isFocused()
      expect(Item1_2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority11_0100] Item1_2 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let Item2_2 = await driver.findComponent(ON.id('FocusScopePriority11_Item2_2'));
      let Item2_2_isFocusedValue = await Item2_2.isFocused()
      expect(Item2_2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority11_0100] Item2_1 isFocused');

      await Item1_1.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopePriority11_0100] Item1_1 click');

      console.info('[FocusScopePriority11_0100] END');
      done();
    });
  })
}

