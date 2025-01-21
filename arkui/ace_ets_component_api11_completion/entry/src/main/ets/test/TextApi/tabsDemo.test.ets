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
import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from '../Utils'
import { Driver, ON } from '@ohos.UiTest';

export default function tabsDemo() {
  describe('tabsDemo', function () {
    beforeEach(async function (done) {
      console.info("tabsDemo beforeEach start");
      let options = {
        uri: 'MainAbility/pages/TextApi/tabsDemo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsDemo state success " + JSON.stringify(pages));
        if (!("tabsDemo" == pages.name)) {
          console.info("get tabsDemo state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push tabsDemo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsDemo page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("tabsDemo after each called");
    });

    /**
     * @tc.number      tabsDemo_001
     * @tc.name        tabsDemo_001
     * @tc.desc        Tabs customContentTransition test
     * @tc.level       Level 2
     */
    it('tabsDemo_001', 0, async function (done) {
      console.info('[tabsDemo_001] START');
      await Utils.sleep(1000);

      let driver= Driver.create();
      await Utils.sleep(1000);
      let btn = await driver.findComponent(ON.text('Yellow'));
      await btn.click()
      await Utils.sleep(4000);

      let strJson = getInspectorByKey('tabsDemo_text1');
      let obj = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info("[tabsDemo_001] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('456');

      console.info('[tabsDemo_001] END');
      done();

    });
  })
}


