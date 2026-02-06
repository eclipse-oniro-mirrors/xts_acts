/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
 import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
export default function V2ObservedTest() {
  describe('V2ObservedTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uiutils/V2Observed',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get V2ObservedTest state pages: ' + JSON.stringify(pages));
        if (!('V2ObservedTest' == pages.name)) {
          console.info('get V2ObservedTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push V2ObservedTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push V2ObservedTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('V2ObservedTest after each called');
    });
    /**
     * @tc.name   V2ObservedTest_0010
     * @tc.number V2ObservedTest_0010
     * @tc.desc   V2ObservedTest test succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('V2ObservedTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('V2ObservedTest_0010 START');
      await CommonFunc.sleep(2000);
      let driver = await Driver.create();
      let btn: Component = await driver.findComponent(ON.id('V2test_01'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text_1 = await (await driver.findComponent(ON.id('V2text_01'))).getText();
      console.info("[V2ObservedTest_0010] component text_1: " + text_1);
      await CommonFunc.sleep(1000);
      expect(text_1).assertEqual('@Trace true ');
      done();
    });
    /**
     * @tc.name   V2ObservedTest_0020
     * @tc.number V2ObservedTest_0020
     * @tc.desc   V2ObservedTest test succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('V2ObservedTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('V2ObservedTest_0020 START');
      await CommonFunc.sleep(2000);
      let driver = await Driver.create();
      let btn: Component = await driver.findComponent(ON.id('V2test_02'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text_2 = await (await driver.findComponent(ON.id('V2text_02'))).getText();
      console.info("[V2ObservedTest_0020] component text_2: " + text_2);
      await CommonFunc.sleep(1000);
      expect(text_2).assertEqual('@Trace true ');
      done();
    });
    /**
     * @tc.name   V2ObservedTest_0030
     * @tc.number V2ObservedTest_0030
     * @tc.desc   V2ObservedTest test succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('V2ObservedTest_0030', Level.LEVEL1, async (done: Function) => {
      console.info('V2ObservedTest_0030 START');
      await CommonFunc.sleep(2000);
      let driver = await Driver.create();
      let btn: Component = await driver.findComponent(ON.id('V2test_03'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text_3 = await (await driver.findComponent(ON.id('V2text_03'))).getText();
      console.info("[V2ObservedTest_0030] component text_3: " + text_3);
      await CommonFunc.sleep(1000);
      expect(text_3).assertEqual('Child01cc');
      done();
    });
  })
}