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

export default function tabsOnContentWillChangeIndex12JsunitTest() {
  describe('tabsOnContentWillChangeIndex12JsunitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsOnContentWillChangeIndex12JsunitTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsOnContentWillChangeIndex12JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex12" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex12JsunitTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex12"})
          await CommonFunc.sleep(2000);
          console.info("push tabsOnContentWillChangeIndex12JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex12JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex12JsunitTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex12JsunitTest after each called");
    });


    /**
     * @tc.name   tabsOnContentWillChangeJsunitTest_0120
     * @tc.number tabsOnContentWillChangeJsunitTest_0120
     * @tc.desc   tabsOnContentWillChangeJsunitTest_0120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tabsOnContentWillChangeJsunitTest_0120', Level.LEVEL1, async (done: Function) => {
      console.info('tabsOnContentWillChangeJsunitTest_0120 START');
      let driver = Driver.create();
      // get the content rect value
      let tabsRect = CommonFunc.getComponentRect('content12x');
      console.info("tabsOnContentWillChangeJsunitTest_0120  test rect value " + tabsRect.left + "," + tabsRect.right + "," +
      tabsRect.top + "," + tabsRect.bottom );
      // swipe index 0 -1  right swipe to left
      await driver.swipe(Math.round(globalThis.winLeft + (tabsRect.right-tabsRect.left)*0.2 + tabsRect.left),Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top),Math.round(globalThis.winLeft + (tabsRect.right-tabsRect.left)*0.1 + tabsRect.left),
        Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top));
      await CommonFunc.sleep(2000);

      let text01 = await driver.findComponent(ON.text("首页的内容"))
      let texContent = await text01.getText();
      expect(texContent).assertEqual("首页的内容");

      console.info('tabsOnContentWillChangeJsunitTest_0120  END');
      done();

    });


  })
}
