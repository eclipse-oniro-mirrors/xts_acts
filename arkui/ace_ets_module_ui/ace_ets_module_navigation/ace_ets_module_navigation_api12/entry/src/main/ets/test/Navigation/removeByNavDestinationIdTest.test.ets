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
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function removeByNavDestinationIdTest() {
  describe('removeByNavDestinationIdTest', () => {
    beforeEach(async (done: Function) => {
      console.info("removeByNavDestinationIdTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/removeByNavDestinationIdTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get removeByNavDestinationIdTest state success " + JSON.stringify(pages));
        if (!("removeByNavDestinationIdTest" == pages.name)) {
          console.info("get removeByNavDestinationIdTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push removeByNavDestinationIdTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push removeByNavDestinationIdTest page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("removeByNavDestinationIdTest after each called");
    });

    /**
     * @tc.number    removeByNavDestinationIdTest_0100
     * @tc.name      removeByNavDestinationIdTest_0100
     * @tc.desc      Test removeByNavDestinationId
     * @tc.level     Level 0
     */
    it('removeByNavDestinationIdTest_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[removeByNavDestinationIdTest_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('removeByNavDestinationIdTest_btn1'));
      await btn.click()
      console.info('[removeByNavDestinationIdTest_0100] btn click');
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('removeByNavDestinationIdTest_btn2'));
      await btn2.click()
      console.info('[removeByNavDestinationIdTest_0100] btn2 click');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('removeByNavDestinationIdTest_text1');
      await CommonFunc.sleep(1000);
      console.info("[removeByNavDestinationIdTest_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('NavBar');
      console.info('[removeByNavDestinationIdTest_0100] END');
      done();
    });
  })
}

