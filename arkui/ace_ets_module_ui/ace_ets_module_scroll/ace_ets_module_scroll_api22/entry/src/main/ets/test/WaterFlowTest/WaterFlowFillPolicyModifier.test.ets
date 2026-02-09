/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function WaterFlowFillPolicyModifier() {
  describe('WaterFlowFillPolicyModifier', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlowFillPolicyModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WaterFlowFillPolicyModifier state success ' + JSON.stringify(pages));
        if (!('WaterFlowFillPolicyModifier' == pages.name)) {
          console.info('get WaterFlowFillPolicyModifier state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push WaterFlowFillPolicyModifier page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WaterFlowFillPolicyModifier page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   WaterFlowFillPolicyModifier_0100
     * @tc.number WaterFlowFillPolicyModifier_001
     * @tc.desc   Display 2 columns when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WaterFlowFillPolicyModifier_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[WaterFlowFillPolicyModifier_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('waterFlow_fillType_0'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('waterFlow_fillType_text');
      console.info("[WaterFlowFillPolicyModifier_0100] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("ItemFillPolicy: 0");

      let strJson2 = getInspectorByKey('waterFlow_fillType');
      console.info("[WWaterFlowFillPolicyModifier_0100] itemFillPolicy: " + JSON.stringify(JSON.parse(strJson2).$attrs.itemFillPolicy));
      expect(JSON.parse(strJson2).$attrs.itemFillPolicy).assertEqual("PresetFillType.BREAKPOINT_DEFAULT");

      let flowItem1 = CommonFunc.getComponentRectOnScreen('waterFlowType_1');
      console.info('[WaterFlowFillPolicyModifier_0100] flowItem1.right: ' + flowItem1.right);
      let flowItem2 = CommonFunc.getComponentRectOnScreen('waterFlowType_2');
      console.info('[WaterFlowFillPolicyModifier_0100] flowItem2.left: ' + flowItem2.left);
      await CommonFunc.sleep(500);
      console.info("窗口偏移量 - Left: " + flowItem2.left + ", Top: " + flowItem1.right);
      expect(Math.abs(Math.floor(flowItem2.left - flowItem1.right)) <= 1 ).assertTrue();
      console.info('[WaterFlowFillPolicyModifier_0100] END');
      done();
    });

    /**
     * @tc.name   WaterFlowFillPolicyModifier_0200
     * @tc.number WaterFlowFillPolicyModifier_002
     * @tc.desc   Display 1 column when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WaterFlowFillPolicyModifier_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[WaterFlowFillPolicyModifier_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('waterFlow_fillType_1'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('waterFlow_fillType_text');
      console.info("[WaterFlowFillPolicyModifier_0200] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("ItemFillPolicy: 1");

      let strJson2 = getInspectorByKey('waterFlow_fillType');
      console.info("[WaterFlowFillPolicyModifier_0200] itemFillPolicy: " + JSON.stringify(JSON.parse(strJson2).$attrs.itemFillPolicy));
      expect(JSON.parse(strJson2).$attrs.itemFillPolicy).assertEqual("PresetFillType.BREAKPOINT_SM1MD2LG3");

      let flowItem1 = CommonFunc.getComponentRectOnScreen('waterFlowType_1');
      console.info('[WaterFlowFillPolicyModifier_0200] flowItem1.bottom: ' + flowItem1.bottom);
      let flowItem2 = CommonFunc.getComponentRectOnScreen('waterFlowType_2');
      console.info('[WaterFlowFillPolicyModifier_0200] flowItem2.top: ' + flowItem2.top);
      await CommonFunc.sleep(500);
      expect(Math.abs(Math.floor(flowItem2.top - flowItem1.bottom)) <= 1 ).assertTrue();
      console.info('[WaterFlowFillPolicyModifier_0200] END');
      done();
    });

    /**
     * @tc.name   WaterFlowFillPolicyModifier_0300
     * @tc.number WaterFlowFillPolicyModifier_003
     * @tc.desc   Display 2 columns when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WaterFlowFillPolicyModifier_0300', Level.LEVEL3, async (done: Function) => {
      console.info('[WaterFlowFillPolicyModifier_0300] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('waterFlow_fillType_2'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('waterFlow_fillType_text');
      console.info("[WaterFlowFillPolicyModifier_0300] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("ItemFillPolicy: 2");

      let strJson2 = getInspectorByKey('waterFlow_fillType');
      console.info("[WaterFlowFillPolicyModifier_0300] itemFillPolicy: " + JSON.stringify(JSON.parse(strJson2).$attrs.itemFillPolicy));
      expect(JSON.parse(strJson2).$attrs.itemFillPolicy).assertEqual("PresetFillType.BREAKPOINT_SM2MD3LG5");

      let flowItem1 = CommonFunc.getComponentRectOnScreen('waterFlowType_1');
      console.info('[WaterFlowFillPolicyModifier_0300] flowItem1.right: ' + flowItem1.right);
      let flowItem2 = CommonFunc.getComponentRectOnScreen('waterFlowType_2');
      console.info('[WaterFlowFillPolicyModifier_0300] flowItem2.left: ' + flowItem2.left);
      await CommonFunc.sleep(500);
      expect(Math.abs(Math.floor(flowItem2.left - flowItem1.right)) <= 1 ).assertTrue();
      console.info('[WaterFlowFillPolicyModifier_0300] END');
      done();
    });

    /**
     * @tc.name   WaterFlowFillPolicyModifier_0400
     * @tc.number WaterFlowFillPolicyModifier_004
     * @tc.desc   Display 2 columns when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WaterFlowFillPolicyModifier_0400', Level.LEVEL3, async (done: Function) => {
      console.info('[WaterFlowFillPolicyModifier_0400] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('waterFlow_fillType_3'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('waterFlow_fillType_text');
      console.info("[WaterFlowFillPolicyModifier_0400] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("ItemFillPolicy: 3");

      let strJson2 = getInspectorByKey('waterFlow_fillType');
      console.info("[WaterFlowFillPolicyModifier_0400] itemFillPolicy: " + JSON.stringify(JSON.parse(strJson2).$attrs.itemFillPolicy));
      expect(JSON.parse(strJson2).$attrs.itemFillPolicy).assertEqual("PresetFillType.BREAKPOINT_DEFAULT");

      let flowItem1 = CommonFunc.getComponentRectOnScreen('waterFlowType_1');
      console.info('[WaterFlowFillPolicyModifier_0400] flowItem1.right: ' + flowItem1.right);
      let flowItem2 = CommonFunc.getComponentRectOnScreen('waterFlowType_2');
      console.info('[WaterFlowFillPolicyModifier_0400] flowItem2.left: ' + flowItem2.left);
      await CommonFunc.sleep(500);
      expect(Math.abs(Math.floor(flowItem2.left - flowItem1.right)) <= 1 ).assertTrue();
      console.info('[WaterFlowFillPolicyModifier_0400] END');
      done();
    });

    /**
     * @tc.name   WaterFlowFillPolicyModifier_0500
     * @tc.number WaterFlowFillPolicyModifier_005
     * @tc.desc   Display 2 columns when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WaterFlowFillPolicyModifier_0500', Level.LEVEL3, async (done: Function) => {
      console.info('[WaterFlowFillPolicyModifier_0500] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('waterFlow_fillType_4'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('waterFlow_fillType_text');
      console.info("[WaterFlowFillPolicyModifier_0500] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("ItemFillPolicy: undefined");

      let strJson2 = getInspectorByKey('waterFlow_fillType');
      console.info("[WaterFlowFillPolicyModifier_0500] itemFillPolicy: " + JSON.stringify(JSON.parse(strJson2).$attrs.itemFillPolicy));
      expect(JSON.parse(strJson2).$attrs.itemFillPolicy).assertEqual("PresetFillType.BREAKPOINT_DEFAULT");

      let flowItem1 = CommonFunc.getComponentRectOnScreen('waterFlowType_1');
      console.info('[WaterFlowFillPolicyModifier_0500] flowItem1.right: ' + flowItem1.right);
      let flowItem2 = CommonFunc.getComponentRectOnScreen('waterFlowType_2');
      console.info('[WaterFlowFillPolicyModifier_0500] flowItem2.left: ' + flowItem2.left);
      await CommonFunc.sleep(500);
      expect(Math.abs(Math.floor(flowItem2.left - flowItem1.right)) <= 1 ).assertTrue();
      console.info('[WaterFlowFillPolicyModifier_0500] END');
      done();
    });
  })
}
