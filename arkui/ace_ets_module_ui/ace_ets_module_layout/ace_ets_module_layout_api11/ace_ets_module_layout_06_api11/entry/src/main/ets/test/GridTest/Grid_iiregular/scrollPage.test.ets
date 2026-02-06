/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';

export default function scrollByJsunit() {
  describe('scrollPageJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollPageJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/scrollPage",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollPageJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollPage" == pages.name)) {
          console.info("get scrollPageJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollPageJsunit page result: " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push scrollPageJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.clear()
      console.info("List_scrollToIndex1 after each called");
    });



    /**
     * @tc.name   scrollPageJsunit_0001
     * @tc.number scrollPageJsunit_0001
     * @tc.desc   scrollPageJsunit_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollPageJsunit_0001',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollPageJsunit_0010] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollPage1'));
      await btn.click();
      await CommonFunc.sleep(1000);


      let strJson2 = getInspectorByKey('scrollPage_text1');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('1');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('gridPage');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollPage_text1');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();


      console.info('[scrollPageJsunit_0010] END');
      done();
    });


    /**
     * @tc.name   scrollPageJsunit_0002
     * @tc.number scrollPageJsunit_0002
     * @tc.desc   scrollPageJsunit_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollPageJsunit_0002',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollPageJsunit_0020] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollPage2'));
      await btn.click();
      await CommonFunc.sleep(1000);


      let strJson2 = getInspectorByKey('scrollPage_text0');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('gridPage');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollPage_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollPageJsunit_0020] END');
      done();
    });

  })
}
