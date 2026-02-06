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
  describe('scrollToJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollPageJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/scrollTo",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollToJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollTo" == pages.name)) {
          console.info("get scrollToJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollToJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollToJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.clear()
      console.info("Grid_scrollToIndex1 after each called");
    });
    /**
     * @tc.name   scrollToJsunit_0001
     * @tc.number SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
     * @tc.desc   Y-axis slide 90
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollToJsunit_0001',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollToJsunit_0001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo1'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('scrollTo_text1');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('1');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text1');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();


      console.info('[scrollToJsunit_0001] END');
      done();
    });

    /**
     * @tc.name   scrollToJsunit_0002
     * @tc.number SUB_ACE_TS_COMPONENT_SR000IFDKV_0002
     * @tc.desc   The Y-axis and the X-axis slide to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollToJsunit_0002',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollToJsunit_0002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo2'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('scrollTo_text0');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0002] END');
      done();
    });


    /**
     * @tc.name   scrollToJsunit_0003
     * @tc.number scrollToJsunit_0003
     * @tc.desc   scrollToJsunit_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollToJsunit_0003',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollToJsunit_0003] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo3'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('scrollTo_text0');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0003] END');
      done();
    });


    /**
     * @tc.name   scrollToJsunit_0004
     * @tc.number scrollToJsunit_0004
     * @tc.desc   scrollToJsunit_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollToJsunit_0004',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollToJsunit_0004] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo4'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('scrollTo_text0');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');


      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0004] END');
      done();
    });


    /**
     * @tc.name   scrollToJsunit_0005
     * @tc.number scrollToJsunit_0005
     * @tc.desc   scrollToJsunit_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollToJsunit_0005',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollToJsunit_0005] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo5'));
      await btn.click();
      await CommonFunc.sleep(100);

      let strJson2 = getInspectorByKey('scrollTo_text0');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0005] END');
      done();
    });

    /**
     * @tc.name   scrollToJsunit_0006
     * @tc.number scrollToJsunit_0006
     * @tc.desc   scrollToJsunit_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollToJsunit_0006',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollToJsunit_0006] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo6'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('scrollTo_text3');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('3');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text3');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0006] END');
      done();
    });


    /**
     * @tc.name   scrollToJsunit_0007
     * @tc.number scrollToJsunit_0007
     * @tc.desc   scrollToJsunit_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollToJsunit_0007',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollToJsunit_0007] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo7'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('scrollTo_text0');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0007] END');
      done();
    });


    /**
     * @tc.name   scrollToJsunit_0008
     * @tc.number scrollToJsunit_0008
     * @tc.desc   scrollToJsunit_0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollToJsunit_0008',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollToJsunit_0008] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo8'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('scrollTo_text0');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0008] END');
      done();
    });


    /**
     * @tc.name   scrollToJsunit_0009
     * @tc.number scrollToJsunit_0009
     * @tc.desc   scrollToJsunit_0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollToJsunit_0009',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollToJsunit_0009] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollTo9'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('scrollTo_text0');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollToPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollTo_text0');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollToJsunit_0009] END');
      done();
    });

  })
}
