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
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function tabsOnContentWillChangeIndex06JsunitTest() {
  describe('tabsOnContentWillChangeIndex06JsunitTest', function () {
    beforeEach(async function (done) {
      console.info("tabsOnContentWillChangeIndex06JsunitTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsOnContentWillChangeIndex06JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex06" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex06JsunitTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/tabs_api12/tabs_onContentWillChangeIndex06"})
          await CommonFunc.sleep(2000);
          console.info("push tabsOnContentWillChangeIndex06JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex06JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex06JsunitTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex6JsunitTest after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_NAV_TABS_INTERCEPTION_0060
     * @tc.name   tabsOnContentWillChangeJsunitTest_0060
     * @tc.desc   it can not change to specify index 3 page when trigger the OnContentWillChange interface
     * @tc.level  3
     */

    it('tabsOnContentWillChangeJsunitTest_0060', 0, async function (done) {
      console.info('tabsOnContentWillChangeIndex06JsunitTest START');

      // change index it can change index 3
      let driver = Driver.create();
      let button01 = await driver.findComponent(ON.id("changeIndex6"));
      await button01.click();
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('currentIndex6x');
      let obj1 = JSON.parse(strJson1);
      console.info("[tabsOnContentWillChangeJsunitTest_0060] component obj is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('1');

      await button01.click();
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('currentIndex6x');
      let obj2 = JSON.parse(strJson2);
      console.info("[tabsOnContentWillChangeJsunitTest_0050] component obj is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('2');

      await button01.click();
      await CommonFunc.sleep(2000);

      let strJson3 = getInspectorByKey('currentIndex6x');
      let obj3 = JSON.parse(strJson3);
      console.info("[tabsOnContentWillChangeJsunitTest_0060] component obj is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('2');

      console.info('tabsOnContentWillChangeIndex06JsunitTest END');
      done();
    });


  })
}
