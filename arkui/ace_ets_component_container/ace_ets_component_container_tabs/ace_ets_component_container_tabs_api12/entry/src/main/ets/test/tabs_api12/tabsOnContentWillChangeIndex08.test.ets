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

export default function tabsOnContentWillChangeIndex08JsunitTest() {
  describe('tabsOnContentWillChangeIndex08JsunitTest', function () {
    beforeEach(async function (done) {
      console.info("tabsOnContentWillChangeIndex08JsunitTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsOnContentWillChangeIndex08JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex08" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex06JsunitTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/tabs_api12/tabs_onContentWillChangeIndex08"})
          await CommonFunc.sleep(2000);
          console.info("push tabsOnContentWillChangeIndex08JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex08JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex08JsunitTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex8JsunitTest after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_NAV_TABS_INTERCEPTION_0080
     * @tc.name   tabsOnContentWillChangeJsunitTest_0080
     * @tc.desc   it can not change to specify index 3 page when trigger the OnContentWillChange interface and click the index3 tab
     * @tc.level  3
     */

    it('tabsOnContentWillChangeJsunitTest_0080', 0, async function (done) {
      console.info('tabsOnContentWillChangeIndex08JsunitTest START');

      // click the index tab it chan change
      let driver = Driver.create();
      let button01 = await driver.findComponent(ON.text("推荐"));
      await button01.click();
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('currentIndex8x');
      let obj1 = JSON.parse(strJson1);
      console.info("[tabsOnContentWillChangeJsunitTest_0080] component obj is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('2');


      // it can not response when click the index 3

      let button02 = await driver.findComponent(ON.text("我的"));
      await button02.click();
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('currentIndex8x');
      let obj2 = JSON.parse(strJson2);
      console.info("[tabsOnContentWillChangeJsunitTest_0080] component obj is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('2');

      console.info('tabsOnContentWillChangeIndex08JsunitTest END');
      done();
    });


  })
}
