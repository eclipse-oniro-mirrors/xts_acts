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

export default function tabsOnContentWillChangeIndex3JsunitTest() {
  describe('tabsOnContentWillChangeIndex3JsunitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsOnContentWillChangeIndex3JsunitTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsOnContentWillChangeIndex3JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex" == pages.name)) {
          console.info("tabsOnContentWillChangeJsunitTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex3"})
          await CommonFunc.sleep(2000);
          console.info("push tabsOnContentWillChangeIndex3JsunitTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex3JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex3JsunitTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex3JsunitTest after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_NAV_TABS_INTERCEPTION_0020
     * @tc.name   tabsOnContentWillChangeJsunitTest_0020
     * @tc.desc   it can not swipe specify index 3 page when trigger the OnContentWillChange interface
     * @tc.level  3
     */

    it('tabsOnContentWillChangeJsunitTest_0020', 0, async (done: Function) => {
      console.info('tabsOnContentWillChangeIndex3JsunitTest START');

      let driver = Driver.create();
      // get the content rect value
      let tabsRect = CommonFunc.getComponentRect('content4');
      console.info("tabsOnContentWillChangeJsunitTest_0020  test rect value " + tabsRect.left + "," + tabsRect.right + "," +
      tabsRect.top + "," + tabsRect.bottom );
      // swipe index 3 to index 2  left swipe to right

      await driver.swipe(Math.round(globalThis.winLeft + (tabsRect.right-tabsRect.left)*0.1 + tabsRect.left),Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top),Math.round(globalThis.winLeft + (tabsRect.right-tabsRect.left)*0.8 + tabsRect.left),
        Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top));
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('currentIndex2');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[tabsOnContentWillChangeJsunitTest_0020] component obj is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('2');

      let text01 = await driver.findComponent(ON.text("推荐的内容"))
      let texContent = await text01.getText();
      expect(texContent).assertEqual("推荐的内容");

      // swipe index 2 to index 3 right swipe to left

      await driver.swipe(Math.round(globalThis.winLeft + (tabsRect.right-tabsRect.left)*0.8 + tabsRect.left),Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top),Math.round(globalThis.winLeft + (tabsRect.right-tabsRect.left)*0.1 + tabsRect.left),
        Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top));
      await CommonFunc.sleep(2000);

      let strJson2 = getInspectorByKey('currentIndex2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[tabsOnContentWillChangeJsunitTest_0020] component obj is: " + JSON.stringify(obj2));
      expect(obj1.$attrs.content).assertEqual('2');

      let text02 = await driver.findComponent(ON.text("推荐的内容"))
      let texContent2 = await text02.getText();
      expect(texContent2).assertEqual("推荐的内容");

      console.info('tabsOnContentWillChangeIndex3JsunitTest END');
      done();
    });


  })
}
