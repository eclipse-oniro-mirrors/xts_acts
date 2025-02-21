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

export default function tabsOnContentWillChangeIndex14JsunitTest() {
  describe('tabsOnContentWillChangeIndex14JsunitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsOnContentWillChangeIndex14JsunitTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsOnContentWillChangeIndex14JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex14" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex14JsunitTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex14"})
          await CommonFunc.sleep(2000);
          console.info("push tabsOnContentWillChangeIndex14JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex14JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex14JsunitTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex14JsunitTest after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_NAV_TABS_INTERCEPTION_0140
     * @tc.name   tabsOnContentWillChangeJsunitTest_0140
     * @tc.desc   it can not get index 3 page when trigger the OnContentWillChange interface and onTabBarClick trigger
     * @tc.level  3
     */

    it('tabsOnContentWillChangeJsunitTest_0140', 0, async (done: Function) => {
      console.info('tabsOnContentWillChangeIndex14JsunitTest START');

      let driver = Driver.create();
      let button02 = await driver.findComponent(ON.text("我的"));
      await button02.click();
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('currentIndex14x');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[tabsOnContentWillChangeJsunitTest_0140] component obj is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('0');

      let strJson2 = getInspectorByKey('onTabBarClick14x');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[tabsOnContentWillChangeJsunitTest_0140] component obj is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('3');

      console.info('tabsOnContentWillChangeIndex0140JsunitTest END');
      done();
    });

  })
}
