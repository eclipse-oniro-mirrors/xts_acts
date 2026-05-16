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

export default function NavigationApi() {
  describe('NavigationApi',  () =>{
    beforeEach(async  (done:Function) =>{
      console.info("NavigationApi beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationApi',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationApi state success " + JSON.stringify(pages));
        if (!("NavigationApi" == pages.name)) {
          console.info("get NavigationApi state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push NavigationApi page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationApi page error: " + err);
      }
      done()
    });

    afterEach(async  () =>{
      await Utils.sleep(1000);
      console.info("NavigationApi after each called");
    });

    /**
     * @tc.name   NavigationApi_009
     * @tc.number NavigationApi_009
     * @tc.desc   Navigation replacePathByName test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavigationApi_009',  Level.LEVEL0, async  (done:Function) =>{
      console.info('[NavigationApi_009] START');
      await Utils.sleep(1000);

      let driver= Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('NavigationApi_pushPath'));
      await btn1.click()
      await Utils.sleep(2000);
      console.info("[NavigationApi_009] btn1")

      let btn2 = await driver.findComponent(ON.id('NavigationApi_replacePathByName'));
      await btn2.click()
      await Utils.sleep(2000);
      console.info("[NavigationApi_009] btn2")

      let btn3 = await driver.findComponent(ON.id('NavigationApi_pop2'));
      await btn3.click()
      await Utils.sleep(2000);
      console.info("[NavigationApi_009] btn3")

      let strJson: string = getInspectorByKey('NavigationApi_text_Navigation');
      await Utils.sleep(1000);
      console.info("[NavigationApi_009] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('Navigation');

      console.info('[NavigationApi_009] END');
      done();

    });
  })
}


