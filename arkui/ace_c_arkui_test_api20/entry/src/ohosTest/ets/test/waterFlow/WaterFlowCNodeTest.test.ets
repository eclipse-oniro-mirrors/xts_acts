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

export default function WaterFlowCNodeTest() {
  describe('WaterFlowCNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WaterFlowCNode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/waterFlow/WaterFlowCNodePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowCNode state pages:" + JSON.stringify(pages));
        if (!("waterFlowCNodePage" == pages.name)) {
          console.info("get WaterFlowCNode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WaterFlowCNode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WaterFlowCNode page error:" + err);
      }
      console.info("WaterFlowCNode beforeEach end");
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("WaterFlowCNode after each called");
    });

    /*
     * @tc.number    WaterFlowCNodeTest_0100
     * @tc.name      WaterFlowCNodeTest_0100
     * @tc.desc      Test WaterFlowCNode
     * @tc.level     Level 1
     */
    it('WaterFlowCNodeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[WaterFlowCNodeTest_0100] START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      console.info("[WaterFlowCNodeTest_0100] Initial WaterFlow attributes.");

      let strJson = getInspectorByKey('WaterFlowCrossLanguage_capiNode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[WaterFlowCNodeTest_0100] obj.$attrs.width is: " + obj.$attrs.width);
      console.info("[WaterFlowCNodeTest_0100] obj.$attrs.height is: " + obj.$attrs.height);
      console.info("[WaterFlowCNodeTest_0100] obj.$attrs.backgroundColor is: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.width).assertEqual('200.00vp');
      expect(obj.$attrs.height).assertEqual('100.00vp');
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFF0000');

      let button = await driver.findComponent(ON.id('WaterFlowCNodePage_Btn'));
      await button.click();
      console.info("[WaterFlowCNodeTest_0100] TS modify WaterFlow attributes.");
      await Utils.sleep(1500);

      let strJson2 = getInspectorByKey('flowItemNode1');
      console.info("[WaterFlowCNodeTest_0100] obj2.$attrs.width is: " + JSON.parse(strJson2).$attrs.width);
      console.info("[WaterFlowCNodeTest_0100] obj2.$attrs.height is: " + JSON.parse(strJson2).$attrs.height);
      console.info("[WaterFlowCNodeTest_0100] obj2.$attrs.backgroundColor is: " + JSON.parse(strJson2).$attrs.backgroundColor);
      expect(JSON.parse(strJson2).$attrs.width).assertEqual('50.00vp');
      expect(JSON.parse(strJson2).$attrs.height).assertEqual('50.00vp');
      console.info('[WaterFlowCNodeTest_0100] END');
      done();
    });
  })
}