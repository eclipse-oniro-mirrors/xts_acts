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
export default function DynamicLayoutRowTest() {
  describe('DynamicLayoutRowTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DynamicLayoutRowTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonCustom/DynamicLayoutRow",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DynamicLayoutRow state pages: " + JSON.stringify(pages));
        if (!("DynamicLayoutRow" == pages.name)) {
          console.info("get DynamicLayoutRow state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DynamicLayoutRow success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DynamicLayoutRow page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   DynamicLayoutRowTest_0100
     * @tc.number SUB_ARKUI_API_DynamicLayoutRowTest_0100
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DynamicLayoutRowTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[DynamicLayoutRowTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('DynamicLayoutRow');
      console.info('DynamicLayoutRowTest_0100 space:'+JSON.parse(strJson).$attrs.space);
      console.info('DynamicLayoutRowTest_0100 alignItems:'+JSON.parse(strJson).$attrs.alignItems);
      console.info('DynamicLayoutRowTest_0100 justifyContent:'+JSON.parse(strJson).$attrs.justifyContent);

      let button1 = await driver.findComponent(ON.id('RowLayoutAlgorithmSpace++'));
      await button1.click();
      await Utils.sleep(2000)
      let strJson1 = getInspectorByKey('DynamicLayoutRow');
      console.info('DynamicLayoutRowTest_0100 space:'+JSON.parse(strJson1).$attrs.space);

      let button2 = await driver.findComponent(ON.id('RowLayoutAlgorithmSpace--'));
      await button2.click();
      await Utils.sleep(2000)
      let strJson2 = getInspectorByKey('DynamicLayoutRow');
      console.info('DynamicLayoutRowTest_0100 space:'+JSON.parse(strJson2).$attrs.space);

      let button3 = await driver.findComponent(ON.id('RowLayoutAlgorithmAlignItems'));
      await button3.click();
      await Utils.sleep(2000)
      let strJson3 = getInspectorByKey('DynamicLayoutRow');
      console.info('DynamicLayoutRowTest_0100 alignItems:'+JSON.parse(strJson3).$attrs.alignItems);

      let button4 = await driver.findComponent(ON.id('RowLayoutAlgorithmAlignItems'));
      await button4.click();
      await Utils.sleep(2000)
      let strJson4 = getInspectorByKey('DynamicLayoutRow');
      console.info('DynamicLayoutRowTest_0100 alignItems:'+JSON.parse(strJson4).$attrs.alignItems);

      let button5 = await driver.findComponent(ON.id('RowLayoutAlgorithmJustifyContent'));
      await button5.click();
      await Utils.sleep(2000)
      let strJson5 = getInspectorByKey('DynamicLayoutRow');
      console.info('DynamicLayoutRowTest_0100 justifyContent:'+JSON.parse(strJson5).$attrs.justifyContent);

      let button6 = await driver.findComponent(ON.id('RowLayoutAlgorithmJustifyContent'));
      await button6.click();
      await Utils.sleep(2000)
      let strJson6 = getInspectorByKey('DynamicLayoutRow');
      console.info('DynamicLayoutRowTest_0100 justifyContent:'+JSON.parse(strJson6).$attrs.justifyContent);

      let button7 = await driver.findComponent(ON.id('RowLayoutAlgorithmJustifyContent'));
      await button7.click();
      await Utils.sleep(2000)
      let strJson7 = getInspectorByKey('DynamicLayoutRow');
      console.info('DynamicLayoutRowTest_0100 justifyContent:'+JSON.parse(strJson7).$attrs.justifyContent);

      let button8 = await driver.findComponent(ON.id('RowLayoutAlgorithmJustifyContent'));
      await button8.click();
      await Utils.sleep(2000)
      let strJson8 = getInspectorByKey('DynamicLayoutRow');
      console.info('DynamicLayoutRowTest_0100 justifyContent:'+JSON.parse(strJson8).$attrs.justifyContent);

      let button9 = await driver.findComponent(ON.id('RowLayoutAlgorithmJustifyContent'));
      await button9.click();
      await Utils.sleep(2000)
      let strJson9 = getInspectorByKey('DynamicLayoutRow');
      console.info('DynamicLayoutRowTest_0100 justifyContent:'+JSON.parse(strJson9).$attrs.justifyContent);

      let button10 = await driver.findComponent(ON.id('RowLayoutAlgorithmUndefined'));
      await button10.click();
      await Utils.sleep(2000)
      let strJson10 = getInspectorByKey('DynamicLayoutRow');
      console.info('DynamicLayoutRowTest_0100 alignItems:'+JSON.parse(strJson10).$attrs.alignItems);
      console.info('DynamicLayoutRowTest_0100 justifyContent:'+JSON.parse(strJson10).$attrs.justifyContent);

      let button11 = await driver.findComponent(ON.id('RowLayoutAlgorithmIsReverse'));
      await button11.click();
      await Utils.sleep(2000)
      
      expect(JSON.parse(strJson).$attrs.space).assertEqual('0.00vp');
      expect(JSON.parse(strJson).$attrs.alignItems).assertEqual('VerticalAlign.Center');
      expect(JSON.parse(strJson).$attrs.justifyContent).assertEqual('FlexAlign.Start');

      expect(JSON.parse(strJson1).$attrs.space).assertEqual('2.00vp');
      expect(JSON.parse(strJson2).$attrs.space).assertEqual('0.00vp');

      expect(JSON.parse(strJson3).$attrs.alignItems).assertEqual('VerticalAlign.Top');
      expect(JSON.parse(strJson4).$attrs.alignItems).assertEqual('VerticalAlign.Bottom');

      expect(JSON.parse(strJson5).$attrs.justifyContent).assertEqual('FlexAlign.Center');
      expect(JSON.parse(strJson6).$attrs.justifyContent).assertEqual('FlexAlign.End');
      expect(JSON.parse(strJson7).$attrs.justifyContent).assertEqual('FlexAlign.SpaceBetween');
      expect(JSON.parse(strJson8).$attrs.justifyContent).assertEqual('FlexAlign.SpaceAround');
      expect(JSON.parse(strJson9).$attrs.justifyContent).assertEqual('FlexAlign.SpaceEvenly');

      expect(JSON.parse(strJson10).$attrs.alignItems).assertEqual('VerticalAlign.Center');
      expect(JSON.parse(strJson10).$attrs.justifyContent).assertEqual('FlexAlign.Start');

      console.info('[DynamicLayoutRowTest_0100] END');
      done();
    });
  })
}

