/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';

const SLEEP_TIME = 1000;

export default function nestedScroll01Test() {
  describe('nestedScroll01', () => {
    beforeEach(async (done: Function) => {
      console.info('nestedScroll01 beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/nestedScroll/nestedScroll01',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get nestedScroll01 state success ' + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!('BorderImage' == pages.name)) {
          console.info('get nestedScroll01 state success ' + JSON.stringify(pages.name));
          await CommonFunc.sleep(SLEEP_TIME);
          console.info('push nestedScroll01 page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push nestedScroll01 page error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('nestedScroll01 after each called');
    });

     /**
     * @tc.name   nestedScroll01_0010
     * @tc.number nestedScroll01_0010
     * @tc.desc   Print all enumeration values of the nestedScroll interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nestedScroll01_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[nestedScroll01_0010] START');
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('Index'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Indextext');
      console.info("[nestedScroll01_0010] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[nestedScroll01_0010] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('nestedScroll:0,nestedScroll:1,nestedScroll:undefined');
    
      console.info('[nestedScroll01_0010] END');
      done();
    });

  })
}
