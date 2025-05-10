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

export default function NavigationLevelTest4() {
  describe('NavigationLevelTest4', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationLevelTest4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationLevel/NavigationLevelTest4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationLevelTest4 state success " + JSON.stringify(pages));
        if (!("NavigationLevelTest4" == pages.name)) {
          console.info("get NavigationLevelTest4 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationLevelTest4 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationLevelTest4 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavigationLevelTest4 after each called");
    });

    /**
     * @tc.number    NavigationLevelTest4_0100
     * @tc.name      NavigationLevelTest4_0100
     * @tc.desc      Test Navigation
     * @tc.level     Level 0
     */
    it('NavigationLevelTest4_0100', 0, async (done: Function) => {
      console.info('[NavigationLevelTest4_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('NavigationLevelTest4_btn1'));
      await btn.click()
      console.info('[NavigationLevelTest4_0100] btn click');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('NavigationLevelTest4_btn2'));
      await btn2.click()
      console.info('[NavigationLevelTest4_0100] btn2 click');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('NavigationLevelTest4_text1');
      await CommonFunc.sleep(1000);
      console.info("[NavigationLevelTest4_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('popToName:-1');

      console.info('[NavigationLevelTest4_0100] END');
      done();
    });
  })
}

