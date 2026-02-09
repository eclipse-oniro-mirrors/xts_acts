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
import { expect, describe, it, afterEach, Level  } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, Component, Rect } from '@ohos.UiTest';

export default function WaterFlowFillPolicyTest(){

  describe('WaterFlowFillPolicyTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   waterFlowFillPolicyTest001
     * @tc.number waterFlowFillPolicyTest001
     * @tc.desc   Normal value testing of itemFillPolicy interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('waterFlowFillPolicyTest001', Level.LEVEL1, async (done: Function) => {
      console.info('waterFlowFillPolicyTest001 START');
      let PAGE_TAG = 'WaterFlowFillPolicyTest';
      await Utils.pushPage(`waterFlow/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('waterFlow');
      console.info("[testWaterFlowFillPolicy001] itemFillPolicy: " + JSON.stringify(JSON.parse(strJson).$attrs.itemFillPolicy));
      expect(JSON.parse(strJson).$attrs.itemFillPolicy).assertEqual("PresetFillType.BREAKPOINT_DEFAULT");
      done();
    });

    /**
     * @tc.name   waterFlowFillPolicyTest002
     * @tc.number waterFlowFillPolicyTest002
     * @tc.desc   Normal value testing of itemFillPolicy interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('waterFlowFillPolicyTest002', Level.LEVEL1, async (done: Function) => {
      console.info('waterFlowFillPolicyTest002 START');
      let PAGE_TAG = 'WaterFlowFillPolicyTest';
      await Utils.pushPage(`waterFlow/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('btn1'));
      await btn.click();
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('waterFlow');
      console.info("[testWaterFlowFillPolicy002] itemFillPolicy: " + JSON.stringify(JSON.parse(strJson).$attrs.itemFillPolicy));
      expect(JSON.parse(strJson).$attrs.itemFillPolicy).assertEqual("PresetFillType.BREAKPOINT_SM1MD2LG3");
      done();
    });

    /**
     * @tc.name   waterFlowFillPolicyTest003
     * @tc.number waterFlowFillPolicyTest003
     * @tc.desc   Normal value testing of itemFillPolicy interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('waterFlowFillPolicyTest003', Level.LEVEL1, async (done: Function) => {
      console.info('waterFlowFillPolicyTest003 START');
      let PAGE_TAG = 'WaterFlowFillPolicyTest';
      await Utils.pushPage(`waterFlow/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('btn2'));
      await btn.click();
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('waterFlow');
      console.info("[testWaterFlowFillPolicy003] itemFillPolicy: " + JSON.stringify(JSON.parse(strJson).$attrs.itemFillPolicy));
      expect(JSON.parse(strJson).$attrs.itemFillPolicy).assertEqual("PresetFillType.BREAKPOINT_SM2MD3LG5");
      done();
    });

    /**
     * @tc.number waterFlowFillPolicyTest004
     * @tc.name   waterFlowFillPolicyTest004
     * @tc.desc   Normal value testing of itemFillPolicy interface
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('waterFlowFillPolicyTest004', Level.LEVEL1, async (done: Function) => {
      console.info('waterFlowFillPolicyTest004 START');
      let PAGE_TAG = 'WaterFlowFillPolicyTest';
      await Utils.pushPage(`waterFlow/${PAGE_TAG}`);
      await Utils.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('btn3'));
      await btn.click();
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('waterFlow');
      console.info("[testWaterFlowFillPolicy004] itemFillPolicy: " + JSON.stringify(JSON.parse(strJson).$attrs.itemFillPolicy));
      expect(JSON.parse(strJson).$attrs.itemFillPolicy).assertEqual(undefined);
      done();
    });
  })
}