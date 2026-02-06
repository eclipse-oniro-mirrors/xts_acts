/**
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

import { expect, describe, it, beforeEach, afterEach, Level  } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';

export default function WaterFlowTypeNodeTest() {
  describe('WaterFlowTypeNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WaterFlowTypeNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/waterFlow/WaterFlowTypeNodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowTypeNode state pages:" + JSON.stringify(pages));
        if (!("waterFlowTypeNodePage" == pages.name)) {
          console.info("get WaterFlowTypeNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WaterFlowTypeNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WaterFlowTypeNode page error:" + err);
      }
      console.info("WaterFlowTypeNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("WaterFlowTypeNode after each called");
    });

    /*
     * @tc.number    WaterFlowTypeNodeTest_0100
     * @tc.name      WaterFlowTypeNodeTest_0100
     * @tc.desc      Test WaterFlowTypeNode
     * @tc.level     Level 1
     */
    it('WaterFlowTypeNodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[WaterFlowTypeNodeTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      console.info("[WaterFlowTypeNodeTest_0100] Initial WaterFlow attributes.");

      let strJson = getInspectorByKey('WaterFlowCrossLanguage_typeNode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[WaterFlowTypeNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[WaterFlowTypeNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[WaterFlowTypeNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('200.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFF0000');

      let button = await driver.findComponent(ON.id('WaterFlowTypeNodePage_Btn'));
      await button.click();
      console.info("[WaterFlowTypeNodeTest_0100] C modify WaterFlow attributes.");
      await Utils.sleep(1000);

      strJson = getInspectorByKey('WaterFlowCrossLanguage_typeNode');
      obj = JSON.parse(strJson);
      console.info("[WaterFlowTypeNodeTest_0100] obj1.$attrs.width is: " + obj.$attrs.width);
      console.info("[WaterFlowTypeNodeTest_0100] obj1.$attrs.height is: " + obj.$attrs.height);
      console.info("[WaterFlowTypeNodeTest_0100] obj1.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('200.00vp');
      expect(obj.$attrs.height).assertEqual('120.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFA500');

      let strJson2 = getInspectorByKey('flowItemNode1');
      console.info("[WaterFlowTypeNodeTest_0100] obj2.$attrs.width is: " + JSON.parse(strJson2).$attrs.width);
      console.info("[WaterFlowTypeNodeTest_0100] obj2.$attrs.height is: " + JSON.parse(strJson2).$attrs.height);
      console.info("[WaterFlowTypeNodeTest_0100] obj2.$attrs.backgroundColor is: " + JSON.parse(strJson2).$attrs.backgroundColor);
      expect(JSON.parse(strJson2).$attrs.width).assertEqual('50.00vp');
      expect(JSON.parse(strJson2).$attrs.height).assertEqual('80.00vp');
      expect(JSON.parse(strJson2).$attrs.backgroundColor).assertEqual('#FFFF0000');

      console.info('[WaterFlowTypeNodeTest_0100] END');
      done();
    });
    /**
     * @tc.number    WaterFlowTypeNodeTest_0200
     * @tc.name      WaterFlowTypeNodeTest_0200
     * @tc.desc      Test WaterFlowTypeNodePage undefined.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('WaterFlowTypeNodeTest_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[WaterFlowTypeNodeTest_0200] START');
      await Utils.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('WaterFlowTypeNodePage_undefined'));
      await btn.click();
      console.info("[WaterFlowTypeNodeTest_0200] Click WaterFlowTypeNodePage_undefined.");
      await Utils.sleep(1500);
      console.info("[WaterFlowTypeNodeTest_0200] AppStorage.get('WaterFlowTypeNodeUn'): " + AppStorage.get('WaterFlowTypeNodeUn'));
      expect(AppStorage.get('WaterFlowTypeNodeUn')).assertEqual(undefined);

      console.info("[WaterFlowTypeNodeTest_0200] AppStorage.get('FlowItemTypeNodeUn'): " + AppStorage.get('FlowItemTypeNodeUn'));
      expect(AppStorage.get('FlowItemTypeNodeUn')).assertEqual(undefined);

      AppStorage.delete('WaterFlowTypeNodeUn')
      AppStorage.delete('FlowItemTypeNodeUn')

      console.info('[WaterFlowTypeNodeTest_0200] END');
      done();
    });
  })
}