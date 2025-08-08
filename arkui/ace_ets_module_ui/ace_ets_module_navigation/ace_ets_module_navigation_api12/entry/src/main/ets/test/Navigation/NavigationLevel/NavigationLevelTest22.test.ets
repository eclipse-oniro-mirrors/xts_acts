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

export default function NavigationLevelTest22() {
  describe('NavigationLevelTest22', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationLevelTest22 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationLevel/NavigationLevelTest22',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationLevelTest22 state success " + JSON.stringify(pages));
        if (!("NavigationLevelTest22" == pages.name)) {
          console.info("get NavigationLevelTest22 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationLevelTest22 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationLevelTest22 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavigationLevelTest22 after each called");
    });

    /**
     * @tc.number    NavigationLevelTest22_0100
     * @tc.name      NavigationLevelTest22_0100
     * @tc.desc      Test Navigation
     * @tc.level     Level 0
     */
    it('NavigationLevelTest22_0100', 0, async (done: Function) => {
      console.info('[NavigationLevelTest22_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('NavigationLevelTest22_btn1'));
      await btn.click()
      console.info('[NavigationLevelTest22_0100] btn click');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('NavigationLevelTest22_btn2'));
      await btn2.click()
      console.info('[NavigationLevelTest22_0100] btn2 click');
      await CommonFunc.sleep(1000);

      let btn3 = await driver.findComponent(ON.id('NavigationLevelTest22_btn3'));
      await btn3.click()
      console.info('[NavigationLevelTest22_0100] btn3 click');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('NavigationLevelTest22_text1');
      await CommonFunc.sleep(1000);
      console.info("[NavigationLevelTest22_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('from:pageOne;to:pageTwo;operation:1;animated:true');

      let strJson2 = getInspectorByKey('NavigationLevelTest22_text1');
      await CommonFunc.sleep(1000);
      console.info("[NavigationLevelTest22_0100] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('from:pageOne;to:pageTwo;operation:1;animated:true');

      let btn4 = await driver.findComponent(ON.id('NavigationLevelTest22_btn4'));
      await btn4.click()
      console.info('[NavigationLevelTest22_0100] btn4 click');
      await CommonFunc.sleep(1000);

      let strJson3 = getInspectorByKey('NavigationLevelTest22_text3');
      await CommonFunc.sleep(1000);
      console.info("[NavigationLevelTest22_0100] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('from:pageTwo;to:pageThree;operation:3;animated:true');

      let strJson4 = getInspectorByKey('NavigationLevelTest22_text4');
      await CommonFunc.sleep(1000);
      console.info("[NavigationLevelTest22_0100] obj4 is: " + JSON.stringify(JSON.parse(strJson4)));
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('from:pageTwo;to:pageThree;operation:3;animated:true');

      console.info('[NavigationLevelTest22_0100] END');
      done();
    });
  })
}

