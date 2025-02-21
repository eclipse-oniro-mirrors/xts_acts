/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';
export default function scrollByJsunit() {
  describe('scrollPageJsunit', function () {
    beforeEach(async function (done) {
      console.info("scrollPageJsunit beforeEach start");
      let options = {
        uri: "MainAbility/pages/Grid/Grid_iiregular/scrollPage",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollPageJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollPage" == pages.name)) {
          console.info("get scrollPageJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollPageJsunit page result: " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push scrollPageJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      router.clear()
      console.info("List_scrollToIndex1 after each called");
    });

    /* *
      * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
      * @tc.name  : Slide to the next page
      * @tc.desc  : Set the scroll direction to portrait
      * @tc.level : Level 2
      */




    it('scrollPageJsunit_0001', 0, async function (done) {
      console.info('[scrollPageJsunit_0010] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollPage1'));
      await btn.click();
      await CommonFunc.sleep(1000);


      let strJson2 = getInspectorByKey('scrollPage_text1');
      let obj2 = JSON.parse(strJson2);
      expect(obj2.$attrs.content).assertEqual('1');

      let ScrollBarItem = CommonFunc.getComponentRect('gridPage');
      let scrollTextItem = CommonFunc.getComponentRect('scrollPage_text1');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) -Math.round(scrollTextItem.top)) <=1 ).assertTrue();
      

      console.info('[scrollPageJsunit_0010] END');
      done();
    });

     /* *
      * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0002
      * @tc.name  : scrollPageJsunit_0002
      * @tc.desc  : lide to previous page
      * @tc.level : Level 2
      */

    it('scrollPageJsunit_0002', 0, async function (done) {
      console.info('[scrollPageJsunit_0020] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollPage2'));
      await btn.click();
      await CommonFunc.sleep(1000);


      let strJson2 = getInspectorByKey('scrollPage_text0');
      let obj2 = JSON.parse(strJson2);
      expect(obj2.$attrs.content).assertEqual('0');

      let ScrollBarItem = CommonFunc.getComponentRect('gridPage');
      let scrollTextItem = CommonFunc.getComponentRect('scrollPage_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) -Math.round(scrollTextItem.top)) <=1 ).assertTrue();
    
      console.info('[scrollPageJsunit_0020] END');
      done();
    });

  })
}
