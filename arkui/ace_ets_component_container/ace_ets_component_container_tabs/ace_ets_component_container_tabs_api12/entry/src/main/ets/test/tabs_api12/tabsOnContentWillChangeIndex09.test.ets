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

export default function tabsOnContentWillChangeIndex09JsunitTest() {
  describe('tabsOnContentWillChangeIndex09JsunitTest', function () {
    beforeEach(async function (done) {
      console.info("tabsOnContentWillChangeIndex09JsunitTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsOnContentWillChangeIndex09JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex09" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex06JsunitTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/tabs_api12/tabs_onContentWillChangeIndex09"})
          await CommonFunc.sleep(2000);
          console.info("push tabsOnContentWillChangeIndex09JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex09JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex09JsunitTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex9JsunitTest after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_NAV_TABS_INTERCEPTION_0090
     * @tc.name   tabsOnContentWillChangeJsunitTest_0090
     * @tc.desc   it can  change to specify index 3 page when trigger the OnContentWillChange interface and click the index3 tab
     * @tc.level  3
     */

    it('tabsOnContentWillChangeJsunitTest_0090', 0, async function (done) {
      console.info('tabsOnContentWillChangeIndex09JsunitTest START');

      // click the index tab it chan change
      let driver = Driver.create();
      let button01 = await driver.findComponent(ON.text("推荐"));
      await button01.click();
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('currentIndex9x');
      let obj1 = JSON.parse(strJson1);
      console.info("[tabsOnContentWillChangeJsunitTest_0090] component obj is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('2');


      // it can  response when click the index 3

      let button02 = await driver.findComponent(ON.text("我的"));
      await button02.click();
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('currentIndex9x');
      let obj2 = JSON.parse(strJson2);
      console.info("[tabsOnContentWillChangeJsunitTest_0090] component obj is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('3');

      console.info('tabsOnContentWillChangeIndex09JsunitTest END');
      done();
    });


  })
}
