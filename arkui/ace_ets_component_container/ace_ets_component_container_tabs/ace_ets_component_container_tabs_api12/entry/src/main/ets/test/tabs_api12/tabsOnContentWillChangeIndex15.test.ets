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

export default function tabsOnContentWillChangeIndex15JsunitTest() {
  describe('tabsOnContentWillChangeIndex15JsunitTest', function () {
    beforeEach(async function (done) {
      console.info("tabsOnContentWillChangeIndex15JsunitTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsOnContentWillChangeIndex15JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex15" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex15JsunitTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/tabs_api12/tabs_onContentWillChangeIndex15"})
          await CommonFunc.sleep(2000);
          console.info("push tabsOnContentWillChangeIndex15JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex15JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex15JsunitTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex15JsunitTest after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_NAV_TABS_INTERCEPTION_0150
     * @tc.name   tabsOnContentWillChangeJsunitTest_0150
     * @tc.desc   it can not get index 3 page when trigger the OnContentWillChange interface and  click array
     * @tc.level  3
     */

    it('tabsOnContentWillChangeJsunitTest_0150', 0, async function (done) {
      console.info('tabsOnContentWillChangeIndex15JsunitTest START');
      // add data
      let driver = Driver.create();
      let button02 = await driver.findComponent(ON.id("tabsAddI"));
      await button02.click();
      await CommonFunc.sleep(2000);

      let text02 = await driver.findComponent(ON.text("建国1950"));
      let textContent =  await text02.getText();
      expect(textContent).assertEqual('建国1950');

      // deleteData

      let button03 = await driver.findComponent(ON.id("tabPopI"));
      await button03.click();
      await CommonFunc.sleep(2000);

      let text03 = await driver.findComponent(ON.text("发现的内容"));
      let textContent3 =  await text03.getText();
      expect(textContent3).assertEqual('发现的内容');

      console.info('tabsOnContentWillChangeIndex0150JsunitTest END');
      done();
    });

  })
}
