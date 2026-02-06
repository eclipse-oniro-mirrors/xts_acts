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

export default function NavigationLevelTest19() {
  describe('NavigationLevelTest19', () => {
    beforeEach(async (done: Function) => {
      console.info("NavigationLevelTest19 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationLevel/NavigationLevelTest19',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationLevelTest19 state success " + JSON.stringify(pages));
        if (!("NavigationLevelTest19" == pages.name)) {
          console.info("get NavigationLevelTest19 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavigationLevelTest19 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationLevelTest19 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavigationLevelTest19 after each called");
    });

    /**
     * @tc.name   NavigationLevelTest19_0100
     * @tc.number NavigationLevelTest19_0100
     * @tc.desc   Test Navigation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavigationLevelTest19_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[NavigationLevelTest19_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('NavigationLevelTest19_btn1'));
      await btn.click()
      console.info('[NavigationLevelTest19_0100] btn click');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('NavigationLevelTest19_text1');
      await CommonFunc.sleep(1000);
      console.info("[NavigationLevelTest19_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('pageOne');

      console.info('[NavigationLevelTest19_0100] END');
      done();
    });
  })
}

