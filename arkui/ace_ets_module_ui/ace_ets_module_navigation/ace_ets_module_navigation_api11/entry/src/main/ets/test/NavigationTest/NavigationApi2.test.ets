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
import Utils from '../../MainAbility/utils/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function NavigationApi2() {
  describe('NavigationApi2', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationApi2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationApi2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationApi2 state success " + JSON.stringify(pages));
        if (!("NavigationApi2" == pages.name)) {
          console.info("get NavigationApi2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push NavigationApi2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationApi2 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("NavigationApi2 after each called");
    });

    /*
     * @tc.number      NavigationApi2_001
     * @tc.name        NavigationApi2_001
     * @tc.desc        Navigation replacePath test
     * @tc.level       Level 2
     */
    it('NavigationApi2_001', 0, async (done: Function) => {
      console.info('[NavigationApi2_001] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('NavigationApi2_pushPath'));
      await btn1.click()
      await Utils.sleep(2000);
      console.info("[NavigationApi2_001] btn1")

      let btn2 = await driver.findComponent(ON.id('NavigationApi2_replacePath'));
      await btn2.click()
      await Utils.sleep(2000);
      console.info("[NavigationApi2_001] btn2")

      let btn3 = await driver.findComponent(ON.id('NavigationApi2_pop'));
      await btn3.click()
      await Utils.sleep(2000);
      console.info("[NavigationApi2_001] btn3")

      let strJson = getInspectorByKey('NavigationApi2_text_Navigation');
      await Utils.sleep(1000);
      console.info("[NavigationApi2_001] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Navigation');

      console.info('[NavigationApi2_001] END');
      done();

    });
  })
}


