/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { Component, Driver, On, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../common/Common';
import Utils from '../common/Utils';
const SLEEP_TIME_100 = 100;
const SLEEP_TIME_500 = 500;
const SLEEP_TIME_1000 = 1000
export default function GridFillPolicyTest() {

  console.info('push page export');
  describe('GridFillPolicyTest', () => {
    console.info('push page trying');
    afterEach(async (done: Function) => {
      await Utils.sleep(SLEEP_TIME_100)
      done()
    })

    /**
     * @tc.number   GridFillPolicyTest001
     * @tc.name     GridFillPolicyTest001
     * @tc.desc     Normal value testing of itemFillPolicy interface
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('GridFillPolicyTest001', Level.LEVEL1, async (done: Function) => {
      console.info('GridFillPolicyTest001 START');
      let PAGE_TAG = 'GridFillPolicyTest';
      await Utils.pushPage(`grid/${PAGE_TAG}`,() => setTimeout(() => {}, 20000));
      await Utils.sleep(SLEEP_TIME_1000)

      let driverSTR: Driver = Driver.create();
      let ButtonSTR: Component = await driverSTR.findComponent(ON.id('ButtonSTR'));
      let ButtonRESTR: Component = await driverSTR.findComponent(ON.id('ButtonRESTR'));
      await ButtonRESTR.click();
      await Utils.sleep(SLEEP_TIME_500)
      await ButtonSTR.click();
      await Utils.sleep(SLEEP_TIME_500)

      let GridTemplate_STR1 = getInspectorByKey('GridTemplate_STR0');
      let GridTemplateJson1 = getInspectorByKey('GridTemplate_FR');
      console.info('GridTemplate_STR START1');
      let gridItem1A = CommonFunc.getComponentRectOnScreen('gridType_1');
      let gridItem1B = CommonFunc.getComponentRectOnScreen('gridType_2');
      console.info('GridTemplate_STR START2');
      expect(Math.abs(Math.floor(gridItem1B.left - gridItem1A.right)) <= 1 )
      console.info('GridTemplate_STR START3');
      expect(JSON.parse(GridTemplate_STR1).$attrs.content).assertEqual("ItemFillPolicy: 1");
      console.info('GridTemplate_STR START4');

      const longString = JSON.stringify(GridTemplateJson1);
      const chunkSize = 1000;
      console.info('GridTemplate_STR START4');
      for (let i = 0; i < longString.length; i += chunkSize) {
        console.info('GridTemplate_STR START4' + longString.substring(i, i + chunkSize));
      }

      expect(JSON.parse(GridTemplateJson1).$attrs.itemFillPolicy).assertEqual('PresetFillType.BREAKPOINT_SM1MD2LG3');
      console.info('GridTemplate_STR START5');


      await ButtonSTR.click();
      await Utils.sleep(SLEEP_TIME_500)
      console.info('GridTemplate_STR1');
      let GridTemplate_STR2 = getInspectorByKey('GridTemplate_STR0');
      let GridTemplateJson2 = getInspectorByKey('GridTemplate_FR');
      let gridItem2A = CommonFunc.getComponentRectOnScreen('gridType_1');
      let gridItem2B = CommonFunc.getComponentRectOnScreen('gridType_2');
      await Utils.sleep(SLEEP_TIME_500);
      expect(Math.abs(Math.floor(gridItem2B.left - gridItem2A.right)) <= 1 )
      expect(JSON.parse(GridTemplate_STR2).$attrs.content).assertEqual('ItemFillPolicy: -1');
      expect(JSON.parse(GridTemplateJson2).$attrs.itemFillPolicy).assertEqual(undefined);

      await ButtonSTR.click();
      await Utils.sleep(SLEEP_TIME_500)
      console.info('GridTemplate_STR2');
      let GridTemplate_STR3 = getInspectorByKey('GridTemplate_STR0');
      let GridTemplateJson3 = getInspectorByKey('GridTemplate_FR');
      let gridItem3A = CommonFunc.getComponentRectOnScreen('gridType_1');
      let gridItem3B = CommonFunc.getComponentRectOnScreen('gridType_2');
      expect(Math.abs(Math.floor(gridItem3B.left - gridItem3A.right)) <= 1 )
      expect(JSON.parse(GridTemplate_STR3).$attrs.content).assertEqual('ItemFillPolicy: 2');
      expect(JSON.parse(GridTemplateJson3).$attrs.itemFillPolicy).assertEqual('PresetFillType.BREAKPOINT_SM2MD3LG5');

      await ButtonSTR.click();
      await Utils.sleep(SLEEP_TIME_500)
      console.info('GridTemplate_STR3');
      let GridTemplate_STR4 = getInspectorByKey('GridTemplate_STR0');
      let GridTemplateJson4 = getInspectorByKey('GridTemplate_FR');
      let gridItem4A = CommonFunc.getComponentRectOnScreen('gridType_1');
      let gridItem4B = CommonFunc.getComponentRectOnScreen('gridType_2');
      expect(Math.abs(Math.floor(gridItem4B.left - gridItem4A.right)) <= 1 )
      expect(JSON.parse(GridTemplate_STR4).$attrs.content).assertEqual('ItemFillPolicy: 1');
      expect(JSON.parse(GridTemplateJson4).$attrs.itemFillPolicy).assertEqual('PresetFillType.BREAKPOINT_SM1MD2LG3');

      await ButtonSTR.click();
      await Utils.sleep(SLEEP_TIME_500)
      console.info('GridTemplate_STR4');
      let GridTemplate_STR5 = getInspectorByKey('GridTemplate_STR0');
      let GridTemplateJson5 = getInspectorByKey('GridTemplate_FR');
      let gridItem5A = CommonFunc.getComponentRectOnScreen('gridType_1');
      let gridItem5B = CommonFunc.getComponentRectOnScreen('gridType_2');
      expect(Math.abs(Math.floor(gridItem5B.left - gridItem5A.right)) <= 1 )
      expect(JSON.parse(GridTemplate_STR5).$attrs.content).assertEqual('ItemFillPolicy: 1');
      expect(JSON.parse(GridTemplateJson5).$attrs.itemFillPolicy).assertEqual('PresetFillType.BREAKPOINT_SM1MD2LG3');

      await ButtonSTR.click();
      await Utils.sleep(SLEEP_TIME_500)
      console.info('GridTemplate_STR4');
      let GridTemplate_STR6 = getInspectorByKey('GridTemplate_STR0');
      let GridTemplateJson6 = getInspectorByKey('GridTemplate_FR');
      let gridItem6A = CommonFunc.getComponentRectOnScreen('gridType_1');
      let gridItem6B = CommonFunc.getComponentRectOnScreen('gridType_2');
      expect(Math.abs(Math.floor(gridItem6B.left - gridItem6A.right)) <= 1 )
      expect(JSON.parse(GridTemplate_STR6).$attrs.content).assertEqual('ItemFillPolicy: 1');
      expect(JSON.parse(GridTemplateJson6).$attrs.itemFillPolicy).assertEqual('PresetFillType.BREAKPOINT_SM1MD2LG3');

      await ButtonSTR.click();
      await Utils.sleep(SLEEP_TIME_500)
      console.info('GridTemplate_STR4');
      let GridTemplate_STR7 = getInspectorByKey('GridTemplate_STR0');
      let GridTemplateJson7 = getInspectorByKey('GridTemplate_FR');
      let gridItem7A = CommonFunc.getComponentRectOnScreen('gridType_1');
      let gridItem7B = CommonFunc.getComponentRectOnScreen('gridType_2');
      expect(Math.abs(Math.floor(gridItem7B.left - gridItem7A.right)) <= 1 )
      expect(JSON.parse(GridTemplate_STR7).$attrs.content).assertEqual('ItemFillPolicy: -1');
      expect(JSON.parse(GridTemplateJson7).$attrs.itemFillPolicy).assertEqual(undefined);

      await ButtonSTR.click();
      await Utils.sleep(SLEEP_TIME_500)
      console.info('GridTemplate_STR4');
      let GridTemplate_STR8 = getInspectorByKey('GridTemplate_STR0');
      let GridTemplateJson8 = getInspectorByKey('GridTemplate_FR');
      let gridItem8A = CommonFunc.getComponentRectOnScreen('gridType_1');
      let gridItem8B = CommonFunc.getComponentRectOnScreen('gridType_2');
      expect(Math.abs(Math.floor(gridItem8B.left - gridItem8A.right)) <= 1 )
      expect(JSON.parse(GridTemplate_STR8).$attrs.content).assertEqual('ItemFillPolicy: 0');
      expect(JSON.parse(GridTemplateJson8).$attrs.itemFillPolicy).assertEqual('PresetFillType.BREAKPOINT_DEFAULT');
      done();
    })
  })
}