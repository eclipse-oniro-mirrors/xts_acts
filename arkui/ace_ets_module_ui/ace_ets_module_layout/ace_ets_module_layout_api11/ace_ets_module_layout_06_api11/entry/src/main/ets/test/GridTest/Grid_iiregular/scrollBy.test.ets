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
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function scrollByJsunit() {
  describe('scrollByJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollByJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/scrollBy",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollByJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollBy" == pages.name)) {
          console.info("get scrollByJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollByJsunit page result: " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push scrollByJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.clear()
      console.info("scrollBy after each called");
    });


    /**
     * @tc.name   scrollByJsunit_0001
     * @tc.number scrollByJsunit_0001
     * @tc.desc   scrollByJsunit_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollByJsunit_0001',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollByJsunit_0000] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'distance', value: 0
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      console.info('[scrollByJsunit_0000] scrollButton');
      await btn.click();
      await CommonFunc.sleep(1000);


      let strJson2 = getInspectorByKey('content00');
      console.info('[scrollByJsunit_0000] content00');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');


      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      console.info('[scrollByJsunit_0000] scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content00');
      console.info('[scrollByJsunit_0000] content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();


      console.info('[scrollByJsunit_0000] END');
      done();
    });


    /**
     * @tc.name   scrollByJsunit_0002
     * @tc.number scrollByJsunit_0002
     * @tc.desc   scrollByJsunit_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollByJsunit_0002',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollByJsunit_0002] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'distance', value: 1500
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('content30');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('3');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content30');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();


      console.info('[scrollByJsunit_0002] END');
      done();
    });




    /**
     * @tc.name   scrollByJsunit_0003
     * @tc.number scrollByJsunit_0003
     * @tc.desc   scrollByJsunit_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollByJsunit_0003',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollByJsunit_0003] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'distance', value: -150
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('content00');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();
      console.info('[scrollByJsunit_0003] END');
      done();
    });
    /**
     * @tc.name   scrollByJsunit_0004
     * @tc.number SUB_ACE_TS_COMPONENT_SR000IFDKV_0004
     * @tc.desc   Click scrollBy(150px) and slide down 150px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollByJsunit_0004',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollByJsunit_0004] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'distance', value: px2vp(150)
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('content12');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('1');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content12');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();
      console.info('[scrollByJsunit_0004] END');
      done();
    });
    /**
     * @tc.name   scrollByJsunit_0005
     * @tc.number SUB_ACE_TS_COMPONENT_SR000IFDKV_0005
     * @tc.desc   Click scrollBy(150) and slide down 150
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollByJsunit_0005',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollByJsunit_0005] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'distance', value: 150
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('content11');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('1');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content11');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollByJsunit_0005] END');
      done();
    });



    /**
     * @tc.name   scrollByJsunit_0006
     * @tc.number scrollByJsunit_0006
     * @tc.desc   scrollByJsunit_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollByJsunit_0006',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollByJsunit_0060] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'distance', value: '50%'
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('content02');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');
      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content02');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollByJsunit_0060] END');
      done();
    });


    /**
     * @tc.name   scrollByJsunit_0007
     * @tc.number scrollByJsunit_0007
     * @tc.desc   scrollByJsunit_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollByJsunit_0007',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollByJsunit_0070] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'distance', value: 'aa50%'
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('content00');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollByJsunit_0070] END');
      done();
    });
    /**
     * @tc.name   scrollByJsunit_0008
     * @tc.number SUB_ACE_TS_COMPONENT_SR000IFDKV_0008
     * @tc.desc   Clicking on the scrollBy('aa') component does not slide
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollByJsunit_0008',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollByJsunit_0080] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'distance', value: 'aa'
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn.click();

      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('content00');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');


      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();


      console.info('[scrollByJsunit_0080] END');
      done();
    });
    /**
     * @tc.name   scrollByJsunit_0009
     * @tc.number SUB_ACE_TS_COMPONENT_SR000IFDKV_0009
     * @tc.desc   Clicking on the scrollBy(undefined) component does not slide
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollByJsunit_0009',  Level.LEVEL0, async (done: Function) => {
      console.info('[scrollByJsunit_0090] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'distance', value: undefined
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn.click();
      await CommonFunc.sleep(100);


      let strJson2 = getInspectorByKey('content00');

      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollByJsunit_0090] END');
      done();
    });
  })
}
