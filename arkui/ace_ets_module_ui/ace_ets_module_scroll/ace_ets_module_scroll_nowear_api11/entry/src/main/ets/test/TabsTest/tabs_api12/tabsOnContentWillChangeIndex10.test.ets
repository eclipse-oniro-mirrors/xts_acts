/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function tabsOnContentWillChangeIndex10JsunitTest() {
  describe('tabsOnContentWillChangeIndex10JsunitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsOnContentWillChangeIndex10JsunitTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsOnContentWillChangeIndex10JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex10" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex10JsunitTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex10"})
          await CommonFunc.sleep(2000);
          console.info("push tabsOnContentWillChangeIndex10JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex10JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex10JsunitTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex10JsunitTest after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_NAV_TABS_INTERCEPTION_0100
     * @tc.name   tabsOnContentWillChangeJsunitTest_0100
     * @tc.desc   it can not change to specify index 3 page when trigger the OnContentWillChange interface and simulate keyboard
     * @tc.level  3
     */

    it('tabsOnContentWillChangeJsunitTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('tabsOnContentWillChangeJsunitTest_0100 START');

      // simulate the "tab"
      let driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);
      // -> 2015
      await driver.triggerKey(2015);
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('currentIndex10x');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[tabsOnContentWillChangeJsunitTest_0100] component obj is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('1');

      // -> 2015
      await driver.triggerKey(2015);
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('currentIndex10x');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[tabsOnContentWillChangeJsunitTest_0100] component obj is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('2');

      // it can not response when ->

      // -> 2015
      await driver.triggerKey(2015);
      await CommonFunc.sleep(1000);

      let strJson3 = getInspectorByKey('currentIndex10x');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[tabsOnContentWillChangeJsunitTest_0100] component obj is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('2');

      console.info('tabsOnContentWillChangeIndex10JsunitTest END');
      done();
    });


  })
}
