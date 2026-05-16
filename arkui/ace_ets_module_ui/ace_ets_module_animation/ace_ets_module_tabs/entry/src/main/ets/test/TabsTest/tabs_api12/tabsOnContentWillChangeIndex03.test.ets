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

export default function tabsOnContentWillChangeIndex03JsunitTest() {
  describe('tabsOnContentWillChangeIndex03JsunitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsOnContentWillChangeIndex03JsunitTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsOnContentWillChangeIndex03JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex03" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex03JsunitTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex03"})
          await CommonFunc.sleep(2000);
          console.info("push tabsOnContentWillChangeIndex03JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex03JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex03JsunitTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex3JsunitTest after each called");
    });


    /**
     * @tc.name   tabsOnContentWillChangeJsunitTest_0030
     * @tc.number tabsOnContentWillChangeJsunitTest_0030
     * @tc.desc   tabsOnContentWillChangeJsunitTest_0030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tabsOnContentWillChangeJsunitTest_0030', Level.LEVEL1, async (done: Function) => {
      console.info('tabsOnContentWillChangeIndex03JsunitTest START');

      let driver = Driver.create();
      // get the content rect value
      let tabsRect = CommonFunc.getComponentRect('content4x');
      console.info("tabsOnContentWillChangeJsunitTest_0030  test rect value " + tabsRect.left + "," + tabsRect.right + "," +
      tabsRect.top + "," + tabsRect.bottom );
      // swipe index 3 to index 2  left swipe to right

      await driver.swipe(Math.round(globalThis.winLeft + (tabsRect.right-tabsRect.left)*0.3 + tabsRect.left),Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top),Math.round(globalThis.winLeft + (tabsRect.right-tabsRect.left)*0.9 + tabsRect.left),
        Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top));
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('currentIndex2x');
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

      let strJson2 = getInspectorByKey('currentIndex2x');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[tabsOnContentWillChangeJsunitTest_0030] component obj is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('3');

      let text02 = await driver.findComponent(ON.text("我的内容"))
      let texContent2 = await text02.getText();
      expect(texContent2).assertEqual("我的内容");

      // swipe index 3 to index 4 right swipe to left

      await driver.swipe(Math.round(globalThis.winLeft + (tabsRect.right-tabsRect.left)*0.8 + tabsRect.left),Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top),Math.round(globalThis.winLeft + (tabsRect.right-tabsRect.left)*0.1 + tabsRect.left),
        Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top));
      await CommonFunc.sleep(2000);

      let strJson23 = getInspectorByKey('currentIndex2x');
      let obj23: ESObject = JSON.parse(strJson23);
      console.info("[tabsOnContentWillChangeJsunitTest_0030] component obj is: " + JSON.stringify(obj23));
      expect(obj23.$attrs.content).assertEqual('4');

      let text023 = await driver.findComponent(ON.text("党史1949"))
      let texContent23 = await text023.getText();
      expect(texContent23).assertEqual("党史1949");

      console.info('tabsOnContentWillChangeIndex03JsunitTest END');
      done();
    });


  })
}
