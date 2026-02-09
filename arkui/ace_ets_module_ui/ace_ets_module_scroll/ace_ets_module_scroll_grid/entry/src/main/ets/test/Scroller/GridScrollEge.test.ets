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

export default function GridScrollEge() {
  describe('GridScrollEge', () => {
    beforeEach(async (done: Function) => {
      console.info("GridScrollEge beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroller/GridScrollEge",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridScrollEge state pages: " + JSON.stringify(pages));
        if (!("GridScrollEge" == pages.name)) {
          console.info("get GridScrollEge state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridScrollEge page result: " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push GridScrollEge page error: " + err);
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
     * @tc.name   GridScrollEge_0001
     * @tc.number GridScrollEge_0001
     * @tc.desc   GridScrollEge_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollEge_0001',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollEge_0001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge1'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('text25');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('25');

      let ScrollBarItem = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem = CommonFunc.getComponentRect('text25');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.bottom) - Math.round(scrollTextItem.bottom)) <= 1).assertTrue();

      console.info('[GridScrollEge_0001] END');
      done();
    });

    /**
     * @tc.name   GridScrollEge_0002
     * @tc.number GridScrollEge_0002
     * @tc.desc   Click scrollEdge(Edge.Edge) and the component slides to the bottom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollEge_0002',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollEge_0002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge2'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('text25');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('25');

      let ScrollBarItem = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem = CommonFunc.getComponentRect('text25');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.bottom) - Math.round(scrollTextItem.bottom)) <= 1).assertTrue();

      console.info('[GridScrollEge_0002] END');
      done();
    });


    /**
     * @tc.name   GridScrollEge_0003
     * @tc.number GridScrollEge_0003
     * @tc.desc   Click scrollEdge(Edge.Start) and the component slides to the top
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollEge_0003',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollEge_0003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge3'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('text0');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem = CommonFunc.getComponentRect('text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[GridScrollEge_0003] END');
      done();
    });

    /**
     * @tc.name   GridScrollEge_0004
     * @tc.number GridScrollEge_0004
     * @tc.desc   Click scrollEdge(Edge.Top) and the component slides to the top
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollEge_0004',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollEge_0004] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge4'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('text0');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem = CommonFunc.getComponentRect('text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[GridScrollEge_0004] END');
      done();
    });

    /**
     * @tc.name   GridScrollEge_0005
     * @tc.number GridScrollEge_0005
     * @tc.desc   Click scrollToIndex (-5) and the component does not slide
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollEge_0005',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollEge_0005] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge5'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('text0');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem = CommonFunc.getComponentRect('text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[GridScrollEge_0005] END');
      done();
    });

    /**
     * @tc.name   GridScrollEge_0006
     * @tc.number GridScrollEge_0006
     * @tc.desc   Click scrollToIndex (25) and the component slides to index 25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollEge_0006',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollEge_0006] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge6'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('text25');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('25');

      let ScrollBarItem = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem = CommonFunc.getComponentRect('text25');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.bottom) - Math.round(scrollTextItem.bottom)) <= 1).assertTrue();

      console.info('[GridScrollEge_0006] END');
      done();
    });


    /**
     * @tc.name   GridScrollEge_0007
     * @tc.number GridScrollEge_0007
     * @tc.desc   Click scrollToIndex (5) and the component slides to index 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollEge_0007',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollEge_0007] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge7'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('text5');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('5');

      let ScrollBarItem = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem = CommonFunc.getComponentRect('text5');
      await CommonFunc.sleep(1000);
      console.info('[GridScrollEge_0007] END');
      done();
    });
    /**
     * @tc.name   GridScrollEge_0008
     * @tc.number GridScrollEge_0008
     * @tc.desc   Click scrollToIndex (undefined) and the component does not slide
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollEge_0008',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollEge_0008] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge8'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('text0');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem = CommonFunc.getComponentRect('text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[GridScrollEge_0008] END');
      done();
    });
  })
}
