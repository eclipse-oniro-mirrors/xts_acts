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

export default function tabsOnContentWillChangeJsunitTest() {
  describe('tabsOnContentWillChangeJsunitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsOnContentWillChangeJsunitTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsOnContentWillChangeJsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChange" == pages.name)) {
          console.info("tabsOnContentWillChangeJsunitTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChange"})
          await CommonFunc.sleep(2000);
          console.info("push tabsOnContentWillChangeJsunitTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeJsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeJsunitTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeJsunitTest after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_NAV_TABS_INTERCEPTION_0010
     * @tc.name   tabsOnContentWillChangeJsunitTest_0010
     * @tc.desc   it can not swipe specify index page when trigger the OnContentWillChange interface
     * @tc.level  3
     */

    it('tabsOnContentWillChangeJsunitTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('tabsOnContentWillChangeJsunitTest START');

      let driver = Driver.create();
      // get the content rect value
      let tabsRect = CommonFunc.getComponentRect('content01');
      console.info("tabsOnContentWillChangeJsunitTest_0010  test rect value " + tabsRect.left + "," + tabsRect.right + "," +
      tabsRect.top + "," + tabsRect.bottom );
      // swipe index 0 -1  right swipe to left
      await driver.swipe(globalThis.winLeft + Math.round((tabsRect.right-tabsRect.left)*0.8 + tabsRect.left),Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top),Math.round(globalThis.winLeft + (tabsRect.right-tabsRect.left)*0.1 + tabsRect.left),
        Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top));
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('currentIndexId');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[tabsOnContentWillChangeJsunitTest] component obj is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('1');

      let text01 = await driver.findComponent(ON.text("发现的内容"))
      let texContent = await text01.getText();
      expect(texContent).assertEqual("发现的内容");

      // swipe index 1 -2  right swipe to left
      await driver.swipe(globalThis.winLeft + Math.round((tabsRect.right-tabsRect.left)*0.8 + tabsRect.left),Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top),Math.round(globalThis.winLeft + (tabsRect.right-tabsRect.left)*0.1 + tabsRect.left),
        Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top));
      await CommonFunc.sleep(2000);
     
      let strJson2 = getInspectorByKey('currentIndexId')
      let obj2: ESObject = JSON.parse(strJson2)
      console.info("[tabsOnContentWillChangeJsunitTest] component obj2 is: " + JSON.stringify(obj2))
      expect(obj2.$attrs.content).assertEqual('2');

      let text02 = await driver.findComponent(ON.text("推荐的内容"))
      let texContent2 = await text02.getText();
      expect(texContent2).assertEqual("推荐的内容");

      // swipe index 2 -3  right swipe to left
      await driver.swipe(Math.round(globalThis.winLeft + (tabsRect.right-tabsRect.left)*0.8 + tabsRect.left),Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top),Math.round(globalThis.winLeft + (tabsRect.right-tabsRect.left)*0.1 + tabsRect.left),
        Math.round(globalThis.winTop + (tabsRect.bottom-tabsRect.top)/2 + tabsRect.top));
      await CommonFunc.sleep(2000);
    
      let strJson3 = getInspectorByKey('currentIndexId')
      let obj3: ESObject = JSON.parse(strJson3)
      console.info("[tabsOnContentWillChangeJsunitTest] component obj3 is: " + JSON.stringify(obj3))
      expect(obj3.$attrs.content).assertEqual('2');

      let text03 = await driver.findComponent(ON.text("推荐的内容"))
      let texContent3 = await text03.getText();
      expect(texContent3).assertEqual("推荐的内容");

      console.info('tabsOnContentWillChangeJsunitTest  END');
      done();
    });


  })
}
