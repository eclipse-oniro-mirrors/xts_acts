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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function tabsOnContentWillChangeIndex07JsunitTest() {
  describe('tabsOnContentWillChangeIndex07JsunitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsOnContentWillChangeIndex07JsunitTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsOnContentWillChangeIndex07JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex07" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex06JsunitTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex07"})
          await CommonFunc.sleep(2000);
          console.info("push tabsOnContentWillChangeIndex07JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex07JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex07JsunitTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex7JsunitTest after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_NAV_TABS_INTERCEPTION_0070
     * @tc.name   tabsOnContentWillChangeJsunitTest_0070
     * @tc.desc   it can not change to specify index 3 page when trigger the OnContentWillChange interface
     * @tc.level  3
     */

    it('tabsOnContentWillChangeJsunitTest_0070', 0, async (done: Function) => {
      console.info('tabsOnContentWillChangeIndex07JsunitTest START');

      // change index it can change index 3
      let driver = Driver.create();
      let button01 = await driver.findComponent(ON.id("changeIndex7"));
      await button01.click();
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('currentIndex7x');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[tabsOnContentWillChangeJsunitTest_0070] component obj is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('1');

      await button01.click();
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('currentIndex7x');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[tabsOnContentWillChangeJsunitTest_0050] component obj is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('2');

      await button01.click();
      await CommonFunc.sleep(2000);

      let strJson3 = getInspectorByKey('currentIndex7x');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[tabsOnContentWillChangeJsunitTest_0070] component obj is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('3');

      console.info('tabsOnContentWillChangeIndex07JsunitTest END');
      done();
    });


  })
}
