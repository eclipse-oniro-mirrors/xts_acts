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

export default function tabsOnContentWillChangeIndex13JsunitTest() {
  describe('tabsOnContentWillChangeIndex13JsunitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsOnContentWillChangeIndex13JsunitTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsOnContentWillChangeIndex13JsunitTest state pages:" + JSON.stringify(pages));
        if (!("tabs_onContentWillChangeIndex13" == pages.name)) {
          console.info("tabsOnContentWillChangeIndex13JsunitTest  pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/Tabs/tabs_api12/tabs_onContentWillChangeIndex13"})
          await CommonFunc.sleep(2000);
          console.info("push tabsOnContentWillChangeIndex13JsunitTest result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOnContentWillChangeIndex13JsunitTest page error:" + err);
      }
      console.info("tabsOnContentWillChangeIndex13JsunitTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOnContentWillChangeIndex13JsunitTest after each called");
    });


    /**
     * @tc.number SUB_ACE_UI_COMPONENT_NAV_TABS_INTERCEPTION_0130
     * @tc.name   tabsOnContentWillChangeJsunitTest_0130
     * @tc.desc   it can not change to specify index 3 page when trigger the OnContentWillChange interface and vertical layout
     * @tc.level  3
     */

    it('tabsOnContentWillChangeJsunitTest_0130', 0, async (done: Function) => {
      console.info('tabsOnContentWillChangeJsunitTest_0130 START');
      let driver = Driver.create();
      // get the content rect value
      let tabsRect = CommonFunc.getComponentRect('content13x');
      console.info("tabsOnContentWillChangeJsunitTest_0130  test rect value " + tabsRect.left + "," + tabsRect.right + "," +
      tabsRect.top + "," + tabsRect.bottom );

      // swipe index  0 -1   swipe direction top to bottom
      await driver.swipe(globalThis.winLeft + Math.round((tabsRect.right - tabsRect.left)/2  + tabsRect.left),Math.round(globalThis.winTop + (tabsRect.bottom - tabsRect.top) *0.8 + tabsRect.top),Math.round(globalThis.winLeft + (tabsRect.right - tabsRect.left)/2  + tabsRect.left),


        Math.round(globalThis.winTop + (tabsRect.bottom - tabsRect.top) *0.05 + tabsRect.top));

      await CommonFunc.sleep(2000);

      let text01 = await driver.findComponent(ON.text("发现的内容"))
      let texContent = await text01.getText();
      expect(texContent).assertEqual("发现的内容");

      // swipe index  1 -2   swipe direction top to bottom
      await driver.swipe(globalThis.winLeft + Math.round((tabsRect.right - tabsRect.left)/2  + tabsRect.left),Math.round(globalThis.winTop + (tabsRect.bottom - tabsRect.top) *0.8 + tabsRect.top),Math.round(globalThis.winLeft + (tabsRect.right - tabsRect.left)/2  + tabsRect.left),


        Math.round(globalThis.winTop + (tabsRect.bottom - tabsRect.top) *0.05 + tabsRect.top));

      await CommonFunc.sleep(2000);

      let text02 = await driver.findComponent(ON.text("推荐的内容"))
      let texContent2 = await text02.getText();
      expect(texContent2).assertEqual("推荐的内容");


      // swipe index  2 -3   swipe direction top to bottom
      await driver.swipe(Math.round(globalThis.winLeft + (tabsRect.right - tabsRect.left)/2  + tabsRect.left),Math.round(globalThis.winTop + (tabsRect.bottom - tabsRect.top) *0.8 + tabsRect.top),Math.round(globalThis.winLeft + (tabsRect.right - tabsRect.left)/2  + tabsRect.left),


        Math.round(globalThis.winTop + (tabsRect.bottom - tabsRect.top) *0.05 + tabsRect.top));

      await CommonFunc.sleep(2000);

      let text03 = await driver.findComponent(ON.text("推荐的内容"))
      let texContent3 = await text03.getText();
      expect(texContent3).assertEqual("推荐的内容");

      console.info('tabsOnContentWillChangeJsunitTest_0130 END');
      done();

    });


  })
}
