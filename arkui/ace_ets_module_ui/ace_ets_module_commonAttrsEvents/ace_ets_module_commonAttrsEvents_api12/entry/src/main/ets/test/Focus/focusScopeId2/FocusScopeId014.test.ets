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


export default function FocusScopeId014() {
  describe('FocusScopeId014', () => {
    beforeEach(async (done: Function) => {
      console.info("FocusScopeId014 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId2/FocusScopeId014',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusScopeId014 state success " + JSON.stringify(pages));
        if (!("FocusScopeId014" == pages.name)) {
          console.info("get FocusScopeId014 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FocusScopeId014 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FocusScopeId014 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId014 after each called");
    });

    /**
     * @tc.name   FocusScopeId014_0100
     * @tc.number FocusScopeId014_0100
     * @tc.desc   Test focusScopeId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FocusScopeId014_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[FocusScopeId014_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let open = await driver.findComponent(ON.id('FocusScopeId014_open'));
      await open.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId014_0100] open click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let Item = await driver.findComponent(ON.id('FocusScopeId014_Item'));
      let Item_isFocusedValue = await Item.isFocused()
      expect(Item_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId014_0100] Item isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let Item1_1 = await driver.findComponent(ON.id('FocusScopeId014_Item1_1'));
      let Item1_1_isFocusedValue = await Item1_1.isFocused()
      expect(Item1_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId014_0100] Item1_1 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let Item2_1 = await driver.findComponent(ON.id('FocusScopeId014_Item2_1'));
      let Item2_1_isFocusedValue = await Item2_1.isFocused()
      expect(Item2_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId014_0100] Item2_1 isFocused');

      await Item.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId014_0100] Item click');

      console.info('[FocusScopeId014_0100] END');
      done();
    });
  })
}

