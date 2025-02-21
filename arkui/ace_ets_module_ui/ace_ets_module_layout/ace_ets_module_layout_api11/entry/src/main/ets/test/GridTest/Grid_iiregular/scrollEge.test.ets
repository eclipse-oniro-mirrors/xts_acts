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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
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
  describe('scrollEgeJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollEgeJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/scrollEge",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollEgeJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollEge" == pages.name)) {
          console.info("get scrollEgeJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollEgeJsunit page result: " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push scrollEgeJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.clear()
      console.info("List_scrollToIndex1 after each called");
    });


    /* *
      * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
      * @tc.name  :  scrollEgeJsunit_0001
      * @tc.desc  :  Click scrollEdge(Edge.Bottom) and the component slides to the bottom
      * @tc.level : Level 2
      */

    it('scrollEgeJsunit_0001', 0, async (done: Function) => {
      console.info('[scrollEgeJsunit_0001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge1'));
      await btn.click();
      await CommonFunc.sleep(1000);


      let strJson2 = getInspectorByKey('text25');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('25');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text25');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.bottom) - Math.round(scrollTextItem.bottom)) <= 1).assertTrue();


      console.info('[scrollEgeJsunit_0001] END');
      done();
    });

    /* *
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0002
     * @tc.name  : scrollEgeJsunit_0002
     * @tc.desc  : Click scrollEdge(Edge.Edge) and the component slides to the bottom
     * @tc.level : Level 2
     */


    it('scrollEgeJsunit_0002', 0, async (done: Function) => {
      console.info('[scrollEgeJsunit_0002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge2'));
      await btn.click();
      await CommonFunc.sleep(1000);


      let strJson2 = getInspectorByKey('text25');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('25');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text25');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.bottom) - Math.round(scrollTextItem.bottom)) <= 1).assertTrue();


      console.info('[scrollEgeJsunit_0002] END');
      done();
    });


    /* *
      * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0003
      * @tc.name  : scrollEgeJsunit_0003
      * @tc.desc  : Click scrollEdge(Edge.Start) and the component slides to the top
      * @tc.level : Level 2
      */


    it('scrollEgeJsunit_0003', 0, async (done: Function) => {
      console.info('[scrollEgeJsunit_0003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge3'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('text0');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollEgeJsunit_0003] END');
      done();
    });


    /* *
      * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0004
      * @tc.name  : scrollEgeJsunit_0004
      * @tc.desc  : Click scrollEdge(Edge.Top) and the component slides to the top
      * @tc.level : Level 2
      */

    it('scrollEgeJsunit_0004', 0, async (done: Function) => {
      console.info('[scrollEgeJsunit_0004] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge4'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('text0');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollEgeJsunit_0004] END');
      done();
    });

    /* *
        * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0005
        * @tc.name  : scrollEgeJsunit_0005
        * @tc.desc  : Click scrollToIndex (-5) and the component does not slide
        * @tc.level : Level 2
        */

    it('scrollEgeJsunit_0005', 0, async (done: Function) => {
      console.info('[scrollEgeJsunit_0005] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge5'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('text0');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollEgeJsunit_0005] END');
      done();
    });

    /* *
         * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0006
         * @tc.name  : scrollEgeJsunit_0006
         * @tc.desc  : Click scrollToIndex (25) and the component slides to index 25
         * @tc.level : Level 2
         */

    it('scrollEgeJsunit_0006', 0, async (done: Function) => {
      console.info('[scrollEgeJsunit_0006] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge6'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('text25');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('25');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text25');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.bottom) - Math.round(scrollTextItem.bottom)) <= 1).assertTrue();

      console.info('[scrollEgeJsunit_0006] END');
      done();
    });


    /* *
      * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0007
      * @tc.name  : scrollEgeJsunit_0007
      * @tc.desc  : Click scrollToIndex (5) and the component slides to index 5
      * @tc.level : Level 2
      */


    it('scrollEgeJsunit_0007', 0, async (done: Function) => {
      console.info('[scrollEgeJsunit_0007] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge7'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('text5');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('5');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text5');
      await CommonFunc.sleep(1000);
      console.info('[scrollEgeJsunit_0007] END');
      done();
    });
    /* *
   * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0008
   * @tc.name  : scrollEgeJsunit_0008
   * @tc.desc  : Click scrollToIndex (undefined) and the component does not slide
   * @tc.level : Level 2
   */


    it('scrollEgeJsunit_0008', 0, async (done: Function) => {
      console.info('[scrollEgeJsunit_0008] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollEge8'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('text0');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollEgePages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollEgeJsunit_0008] END');
      done();
    });
  })
}
