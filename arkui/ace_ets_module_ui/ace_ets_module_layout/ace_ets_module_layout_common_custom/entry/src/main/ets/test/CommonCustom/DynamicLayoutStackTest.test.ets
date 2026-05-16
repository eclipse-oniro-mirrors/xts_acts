/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import Utils from '../../MainAbility/common/Utils';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function DynamicLayoutStackTest() {
  describe('DynamicLayoutStackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DynamicLayoutStackTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonCustom/DynamicLayoutStack",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DynamicLayoutStack state pages: " + JSON.stringify(pages));
        if (!("DynamicLayoutStack" == pages.name)) {
          console.info("get DynamicLayoutStack state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DynamicLayoutStack success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DynamicLayoutStack page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   DynamicLayoutStackTest_0100
     * @tc.number SUB_ARKUI_API_DynamicLayoutStackTest_0100
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DynamicLayoutStackTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[DynamicLayoutStackTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('DynamicLayoutStack');
      console.info('DynamicLayoutStackTest_0100 alignContent:'+JSON.parse(strJson).$attrs.alignContent);
      
      let button1 = await driver.findComponent(ON.id('StackLayoutAlgorithmJAlignContent'));
      await button1.click();
      await Utils.sleep(2000)
      let strJson1 = getInspectorByKey('DynamicLayoutStack');
      console.info('DynamicLayoutStackTest_0100 alignContent:'+JSON.parse(strJson1).$attrs.alignContent);

      let button2 = await driver.findComponent(ON.id('StackLayoutAlgorithmJAlignContent'));
      await button2.click();
      await Utils.sleep(2000)
      let strJson2 = getInspectorByKey('DynamicLayoutStack');
      console.info('DynamicLayoutStackTest_0100 alignContent:'+JSON.parse(strJson2).$attrs.alignContent);

      let button3 = await driver.findComponent(ON.id('StackLayoutAlgorithmJAlignContent'));
      await button3.click();
      await Utils.sleep(2000)
      let strJson3 = getInspectorByKey('DynamicLayoutStack');
      console.info('DynamicLayoutStackTest_0100 alignContent:'+JSON.parse(strJson3).$attrs.alignContent);

      let button4 = await driver.findComponent(ON.id('StackLayoutAlgorithmJAlignContent'));
      await button4.click();
      await Utils.sleep(2000)
      let strJson4 = getInspectorByKey('DynamicLayoutStack');
      console.info('DynamicLayoutStackTest_0100 alignContent:'+JSON.parse(strJson4).$attrs.alignContent);

      let button5 = await driver.findComponent(ON.id('StackLayoutAlgorithmJAlignContent'));
      await button5.click();
      await Utils.sleep(2000)
      let strJson5 = getInspectorByKey('DynamicLayoutStack');
      console.info('DynamicLayoutStackTest_0100 alignContent:'+JSON.parse(strJson5).$attrs.alignContent);

      let button6 = await driver.findComponent(ON.id('StackLayoutAlgorithmJAlignContent'));
      await button6.click();
      await Utils.sleep(2000)
      let strJson6 = getInspectorByKey('DynamicLayoutStack');
      console.info('DynamicLayoutStackTest_0100 alignContent:'+JSON.parse(strJson6).$attrs.alignContent);

      let button7 = await driver.findComponent(ON.id('StackLayoutAlgorithmJAlignContent'));
      await button7.click();
      await Utils.sleep(2000)
      let strJson7 = getInspectorByKey('DynamicLayoutStack');
      console.info('DynamicLayoutStackTest_0100 alignContent:'+JSON.parse(strJson7).$attrs.alignContent);

      let button8 = await driver.findComponent(ON.id('StackLayoutAlgorithmJAlignContent'));
      await button8.click();
      await Utils.sleep(2000)
      let strJson8 = getInspectorByKey('DynamicLayoutStack');
      console.info('DynamicLayoutStackTest_0100 alignContent:'+JSON.parse(strJson8).$attrs.alignContent);

      let button9 = await driver.findComponent(ON.id('StackLayoutAlgorithmUndefined'));
      await button9.click();
      await Utils.sleep(2000)
      let strJson9 = getInspectorByKey('DynamicLayoutStack');
      console.info('DynamicLayoutStackTest_0100 alignContent:'+JSON.parse(strJson9).$attrs.alignContent);

      expect(JSON.parse(strJson).$attrs.alignContent).assertEqual('Alignment.Center');
      expect(JSON.parse(strJson1).$attrs.alignContent).assertEqual('Alignment.TopStart');
      expect(JSON.parse(strJson2).$attrs.alignContent).assertEqual('Alignment.Top');
      expect(JSON.parse(strJson3).$attrs.alignContent).assertEqual('Alignment.TopEnd');
      expect(JSON.parse(strJson4).$attrs.alignContent).assertEqual('Alignment.Start');
      expect(JSON.parse(strJson5).$attrs.alignContent).assertEqual('Alignment.End');
      expect(JSON.parse(strJson6).$attrs.alignContent).assertEqual('Alignment.BottomStart');
      expect(JSON.parse(strJson7).$attrs.alignContent).assertEqual('Alignment.Bottom');
      expect(JSON.parse(strJson8).$attrs.alignContent).assertEqual('Alignment.BottomEnd');
      expect(JSON.parse(strJson9).$attrs.alignContent).assertEqual('Alignment.Center');
      
      console.info('[DynamicLayoutStackTest_0100] END');
      done();
    });
  })
}

