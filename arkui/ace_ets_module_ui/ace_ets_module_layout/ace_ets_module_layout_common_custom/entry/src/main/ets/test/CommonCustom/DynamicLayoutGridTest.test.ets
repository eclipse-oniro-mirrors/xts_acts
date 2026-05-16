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
export default function DynamicLayoutGridTest() {
  describe('DynamicLayoutGridTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DynamicLayoutGridTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonCustom/DynamicLayoutGrid",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DynamicLayoutGrid state pages: " + JSON.stringify(pages));
        if (!("DynamicLayoutGrid" == pages.name)) {
          console.info("get DynamicLayoutGrid state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DynamicLayoutGrid success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DynamicLayoutGrid page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   DynamicLayoutGridTest_0100
     * @tc.number SUB_ARKUI_API_DynamicLayoutGridTest_0100
     * @tc.desc   ArkUIAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DynamicLayoutGridTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[DynamicLayoutGridTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('DynamicLayoutGrid');
      console.info('DynamicLayoutGridTest_0100 columnsTemplate:'+JSON.parse(strJson).$attrs.columnsTemplate);
      console.info('DynamicLayoutGridTest_0100 rowsGap:'+JSON.parse(strJson).$attrs.rowsGap);
      
      let button1 = await driver.findComponent(ON.id('GridLayoutAlgorithmVp(-1)'));
      await button1.click();
      await Utils.sleep(2000)
      let strJson1 = getInspectorByKey('DynamicLayoutGrid');
      console.info('DynamicLayoutGridTest_0100 rowsGap:'+JSON.parse(strJson1).$attrs.rowsGap);

      let button2 = await driver.findComponent(ON.id('GridLayoutAlgorithmVp(1)'));
      await button2.click();
      await Utils.sleep(2000)
      let strJson2 = getInspectorByKey('DynamicLayoutGrid');
      console.info('DynamicLayoutGridTest_0100 rowsGap:'+JSON.parse(strJson2).$attrs.rowsGap);

      let button3 = await driver.findComponent(ON.id('GridLayoutAlgorithmNullString'));
      await button3.click();
      await Utils.sleep(2000)
      let strJson3 = getInspectorByKey('DynamicLayoutGrid');
      console.info('DynamicLayoutGridTest_0100 columnsTemplate:'+JSON.parse(strJson3).$attrs.columnsTemplate);

      let button4 = await driver.findComponent(ON.id('GridLayoutAlgorithmUndefined'));
      await button4.click();
      await Utils.sleep(2000)
      let strJson4 = getInspectorByKey('DynamicLayoutGrid');
      console.info('DynamicLayoutGridTest_0100 columnsTemplate:'+JSON.parse(strJson4).$attrs.columnsTemplate);

      expect(JSON.parse(strJson).$attrs.columnsTemplate).assertEqual('1fr');
      expect(JSON.parse(strJson).$attrs.rowsGap).assertEqual('0.00vp');
      expect(JSON.parse(strJson1).$attrs.rowsGap).assertEqual('-1.00vp');
      expect(JSON.parse(strJson2).$attrs.rowsGap).assertEqual('1.00vp');
      expect(JSON.parse(strJson4).$attrs.columnsTemplate).assertEqual('1fr');
      
      console.info('[DynamicLayoutGridTest_0100] END');
      done();
    });
  })
}

