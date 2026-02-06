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
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  ResizeDirection,
  WindowMode,
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function GridScrollPage() {
  describe('GridScrollPage', () => {
    beforeEach(async (done: Function) => {
      console.info("GridScrollPage beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroller/GridScrollPage",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridScrollPage state pages: " + JSON.stringify(pages));
        if (!("GridScrollPage" == pages.name)) {
          console.info("get GridScrollPage state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridScrollPage page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridScrollPage page error: " + err);
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
     * @tc.name   GridScrollPage_0001
     * @tc.number GridScrollPage_0001
     * @tc.desc   Set the scroll direction to portrait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollPage_0001',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollPage_0010] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollPage1'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('scrollPage_text1');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('1');

      let ScrollBarItem = CommonFunc.getComponentRect('gridPage');
      let scrollTextItem = CommonFunc.getComponentRect('scrollPage_text1');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[GridScrollPage_0010] END');
      done();
    });

    /**
     * @tc.name   GridScrollPage_0002
     * @tc.number GridScrollPage_0002
     * @tc.desc   lide to previous page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollPage_0002',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollPage_0020] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollPage2'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('scrollPage_text0');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem = CommonFunc.getComponentRect('gridPage');
      let scrollTextItem = CommonFunc.getComponentRect('scrollPage_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[GridScrollPage_0020] END');
      done();
    });

  })
}
