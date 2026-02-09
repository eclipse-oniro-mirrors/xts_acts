/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function PreventDefault() {
  describe('PreventDefault', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Hyperlink/PreventDefault',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PreventDefault state success " + JSON.stringify(pages));
        if (!("PreventDefault" == pages.name)) {
          console.info("get PreventDefault state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PreventDefault page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PreventDefault page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PreventDefault after each called");
    });

    /**
     * @tc.name   PreventDefault0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   Intercepting Hyperlinks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PreventDefault0001', Level.LEVEL0, async () => {
        let driver = Driver.create();
        console.info('preventDefault PreventDefault0001 START');
        await CommonFunc.sleep(1000);
        let hyperlink1 = await driver.findComponent(ON.id('hyperlink1'));
        await CommonFunc.sleep(500);
        await hyperlink1.click()
        await CommonFunc.sleep(500);

        let hyperlink3 = await driver.findComponent(ON.id('hyperlink3'));
        await CommonFunc.sleep(500);
        await hyperlink3.click()
        await CommonFunc.sleep(500);
        let disButton = await driver.findComponent(ON.text('禁掉onclick'));
        expect(disButton != null).assertEqual(true)
        await driver.assertComponentExist(ON.text('禁掉onclick'));
        console.info("[PreventDefault0001] end");
    });
  })
}
