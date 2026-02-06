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
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function GridScrollBy() {
  describe('GridScrollBy', () => {
    beforeEach(async (done: Function) => {
      console.info("GridScrollBy beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroller/GridScrollBy",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridScrollBy state pages: " + JSON.stringify(pages));
        if (!("GridScrollBy" == pages.name)) {
          console.info("get GridScrollBy state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridScrollBy page result: " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push GridScrollBy page error: " + err);
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
     * @tc.name   GridScrollBy_0001
     * @tc.number GridScrollBy_0001
     * @tc.desc   Clicking on the scrollBy(0) component does not slide
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollBy_0001',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollBy_0000] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'distance', value: 0
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      console.info('[GridScrollBy_0000] scrollButton');
      await btn.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('content00');
      console.info('[GridScrollBy_0000] content00');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('0');

      let ScrollBarItem = CommonFunc.getComponentRect('scrollByPages');
      console.info('[GridScrollBy_0000] scrollByPages');
      let scrollTextItem = CommonFunc.getComponentRect('content00');
      console.info('[GridScrollBy_0000] content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[GridScrollBy_0000] END');
      done();
    });

    /**
     * @tc.name   GridScrollBy_0002
     * @tc.number GridScrollBy_0002
     * @tc.desc   Click scrollBy(1500) and slide down 1500vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollBy_0002',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollBy_0002] START');
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

      let ScrollBarItem = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem = CommonFunc.getComponentRect('content30');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[GridScrollBy_0002] END');
      done();
    });


    /**
     * @tc.name   GridScrollBy_0003
     * @tc.number GridScrollBy_0003
     * @tc.desc   Click scrollBy(-150) and swipe up 150vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollBy_0003',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollBy_0003] START');
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

      let ScrollBarItem = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem = CommonFunc.getComponentRect('content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();
      console.info('[GridScrollBy_0003] END');
      done();
    });
    /**
     * @tc.name   GridScrollBy_0004
     * @tc.number GridScrollBy_0004
     * @tc.desc   Click scrollBy(150px) and slide down 150px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('GridScrollBy_0004',  Level.LEVEL4, async (done: Function) => {
      console.info('[GridScrollBy_0004] START');
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

      let ScrollBarItem = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem = CommonFunc.getComponentRect('content12');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();
      console.info('[GridScrollBy_0004] END');
      done();
    });
    /**
     * @tc.name   GridScrollBy_0005
     * @tc.number GridScrollBy_0005
     * @tc.desc   Click scrollBy(150) and slide down 150
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollBy_0005',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollBy_0005] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'distance', value: 150
      })

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollButton'));
      await btn.click();
      await CommonFunc.sleep(100)
      let strJson2 = getInspectorByKey('content11');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('1');

      let ScrollBarItem = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem = CommonFunc.getComponentRect('content11');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[GridScrollBy_0005] END');
      done();
    });
    
    /**
     * @tc.name   GridScrollBy_0006
     * @tc.number GridScrollBy_0006
     * @tc.desc   Click on the scrollBy(50%) component without sliding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollBy_0006',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollBy_0060] START');
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

      let ScrollBarItem = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem = CommonFunc.getComponentRect('content02');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[GridScrollBy_0060] END');
      done();
    });

    /**
     * @tc.name   GridScrollBy_0007
     * @tc.number GridScrollBy_0007
     * @tc.desc   Click on the scrollBy('aa50%') component without sliding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollBy_0007',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollBy_0070] START');
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

      let ScrollBarItem = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem = CommonFunc.getComponentRect('content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[GridScrollBy_0070] END');
      done();
    });
    /**
     * @tc.name   GridScrollBy_0008
     * @tc.number GridScrollBy_0008
     * @tc.desc   Clicking on the scrollBy('aa') component does not slide
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollBy_0008',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollBy_0080] START');
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

      let ScrollBarItem = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem = CommonFunc.getComponentRect('content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[GridScrollBy_0080] END');
      done();
    });
    /**
     * @tc.name   GridScrollBy_0009
     * @tc.number GridScrollBy_0009
     * @tc.desc   Clicking on the scrollBy(undefined) component does not slide
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GridScrollBy_0009',  Level.LEVEL2, async (done: Function) => {
      console.info('[GridScrollBy_0090] START');
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

      let ScrollBarItem = CommonFunc.getComponentRect('scrollByPages');
      let scrollTextItem = CommonFunc.getComponentRect('content00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[GridScrollBy_0090] END');
      done();
    });
  })
}
