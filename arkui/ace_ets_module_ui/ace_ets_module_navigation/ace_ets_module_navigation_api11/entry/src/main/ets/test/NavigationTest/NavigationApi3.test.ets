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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/utils/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function NavigationApi3() {
  describe('NavigationApi3',  () =>{
    beforeEach(async  (done:Function) =>{
      console.info("NavigationApi3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationApi3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationApi3 state success " + JSON.stringify(pages));
        if (!("NavigationApi3" == pages.name)) {
          console.info("get NavigationApi3 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push NavigationApi3 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationApi3 page error: " + err);
      }
      done()
    });

    afterEach(async  () =>{
      await Utils.sleep(1000);
      console.info("NavigationApi3 after each called");
    });

    /*
     * @tc.number      NavigationApi3_001
     * @tc.name        NavigationApi3_001
     * @tc.desc        Navigation NavDestinationMode DIALOG and STANDARD test
     * @tc.level       Level 2
     */
    it('NavigationApi3_001',  Level.LEVEL0, async  (done:Function) =>{
      console.info('[NavigationApi3_001] START');
      await Utils.sleep(1000);

      let driver= Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('NavigationApi3_pushPathPageOne'));
      await btn1.click()
      await Utils.sleep(2000);
      console.info("[NavigationApi3_001] btn1")

      let btn2 = await driver.findComponent(ON.id('NavigationApi3_pushPathPageTwo'));
      await btn2.click()
      await Utils.sleep(2000);
      console.info("[NavigationApi3_001] btn2")

      let strJson1 = getInspectorByKey('NavigationApi3_text1');
      await Utils.sleep(1000);
      console.info("[NavigationApi3_001] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('pageOne onHidden');

      let strJson2 = getInspectorByKey('NavigationApi3_text2');
      await Utils.sleep(1000);
      console.info("[NavigationApi3_001] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('pageTwo onShown');

      let btn3 = await driver.findComponent(ON.id('NavigationApi3_pushPathPageThree'));
      await btn3.click()
      await Utils.sleep(2000);
      console.info("[NavigationApi3_001] btn3")

      let strJson3 = getInspectorByKey('NavigationApi3_text2');
      await Utils.sleep(1000);
      console.info("[NavigationApi3_001] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('pageTwo onShown');

      let strJson4 = getInspectorByKey('NavigationApi3_text3');
      await Utils.sleep(1000);
      console.info("[NavigationApi3_001] obj4 is: " + JSON.stringify(JSON.parse(strJson4)));
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('pageThree onShown');

      console.info('[NavigationApi3_001] END');
      done();

    });
  })
}


