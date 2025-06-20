/*
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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

async function ComparisonLGAssert() {
  let GridRow: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_001');
  let GridCol_1: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_0');
  let GridCol_2: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_1');
  let GridCol_3: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_2');
  let GridCol_4: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_3');
  let GridCol_5: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_4');
  let GridCol_6: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_5');
  let GridCol_7: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_6');
  let GridCol_8: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_7');
  let GridCol_9: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_8');
  let GridCol_10: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_9');
  let GridCol_11: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_10');
  let GridCol_12: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_11');
  let GridCol_13: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_12');

  // first row
  expect(Math.floor(Math.abs(GridCol_1.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_1.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_2.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_3.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_4.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_5.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_6.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_7.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_8.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_9.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_10.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_11.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_12.top - GridRow.top)) <= 1).assertTrue();

  // second row
  expect(Math.floor(Math.abs(GridCol_13.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_13.top - GridCol_1.bottom)) <= 1).assertTrue();
}

async function ComparisonMDAssert() {
  let GridRow: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_001');
  let GridCol_1: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_0');
  let GridCol_2: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_1');
  let GridCol_3: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_2');
  let GridCol_4: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_3');
  let GridCol_5: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_4');
  let GridCol_6: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_5');
  let GridCol_7: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_6');
  let GridCol_8: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_7');
  let GridCol_9: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_8');
  let GridCol_10: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_9');
  let GridCol_11: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_10');
  let GridCol_12: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_11');
  let GridCol_13: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_12');

  // first row
  expect(Math.floor(Math.abs(GridCol_1.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_1.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_2.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_3.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_4.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_5.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_6.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_7.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_8.top - GridRow.top)) <= 1).assertTrue();

  // second row
  expect(Math.floor(Math.abs(GridCol_9.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_9.top - GridCol_1.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_10.top - GridCol_1.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_11.top - GridCol_1.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_12.top - GridCol_1.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_13.top - GridCol_1.bottom)) <= 1).assertTrue();
}

async function ComparisonSMAssert() {
  let GridRow: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_001');
  let GridCol_1: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_0');
  let GridCol_2: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_1');
  let GridCol_3: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_2');
  let GridCol_4: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_3');
  let GridCol_5: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_4');
  let GridCol_6: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_5');
  let GridCol_7: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_6');
  let GridCol_8: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_7');
  let GridCol_9: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_8');
  let GridCol_10: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_9');
  let GridCol_11: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_10');
  let GridCol_12: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_11');
  let GridCol_13: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_12');

  // first row
  expect(Math.floor(Math.abs(GridCol_1.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_1.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_2.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_3.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_4.top - GridRow.top)) <= 1).assertTrue();

  // second row
  expect(Math.floor(Math.abs(GridCol_5.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_5.top - GridCol_1.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_6.top - GridCol_1.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_7.top - GridCol_1.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_8.top - GridCol_1.bottom)) <= 1).assertTrue();

  // third row
  expect(Math.floor(Math.abs(GridCol_9.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_9.top - GridCol_5.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_10.top - GridCol_5.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_11.top - GridCol_5.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_12.top - GridCol_5.bottom)) <= 1).assertTrue();

  // fourth row
  expect(Math.floor(Math.abs(GridCol_13.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_13.top - GridCol_9.bottom)) <= 1).assertTrue();
}

async function ComparisonXSAssert() {
  let GridRow: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_001');
  let GridCol_1: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_0');
  let GridCol_2: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_1');
  let GridCol_3: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_2');
  let GridCol_4: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_3');
  let GridCol_5: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_4');
  let GridCol_6: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_5');
  let GridCol_7: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_6');
  let GridCol_8: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_7');
  let GridCol_9: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_8');
  let GridCol_10: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_9');
  let GridCol_11: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_10');
  let GridCol_12: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_11');
  let GridCol_13: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_12');

  // first row
  expect(Math.floor(Math.abs(GridCol_1.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_1.top - GridRow.top)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_2.top - GridRow.top)) <= 1).assertTrue();

  // second row
  expect(Math.floor(Math.abs(GridCol_3.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_3.top - GridCol_1.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_4.top - GridCol_1.bottom)) <= 1).assertTrue();

  // third row
  expect(Math.floor(Math.abs(GridCol_5.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_5.top - GridCol_3.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_6.top - GridCol_3.bottom)) <= 1).assertTrue();

  // fourth row
  expect(Math.floor(Math.abs(GridCol_7.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_7.top - GridCol_5.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_8.top - GridCol_5.bottom)) <= 1).assertTrue();

  // fifth row
  expect(Math.floor(Math.abs(GridCol_9.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_9.top - GridCol_7.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_10.top - GridCol_7.bottom)) <= 1).assertTrue();

  // sixth row
  expect(Math.floor(Math.abs(GridCol_11.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_11.top - GridCol_9.bottom)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_12.top - GridCol_9.bottom)) <= 1).assertTrue();

  // seventh row
  expect(Math.floor(Math.abs(GridCol_13.left - GridRow.left)) <= 1).assertTrue();
  expect(Math.floor(Math.abs(GridCol_13.top - GridCol_11.bottom)) <= 1).assertTrue();
}

export default function GridRowNoColumnsTest() {
  describe('GridRowNoColumnsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GridRowNoColumnsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridRow/GridRowNoColumnsPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridRowNoColumnsTest state pages:" + JSON.stringify(pages));
        if (!("GridRowNoColumnsPage" == pages.name)) {
          console.info("get GridRowNoColumnsTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridRowNoColumnsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridRowNoColumnsTest page error:" + err);
      }
      console.info("GridRowNoColumnsTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number    GridRowNoColumnsTest_0100
     * @tc.name      GridRowNoColumnsTest_0100
     * @tc.desc      test Flex LayoutPolicy
     * @tc.level:    Level 1
     * @tc.type :    GridRowNoColumns
     * @tc.size :
     */
    it('GridRowNoColumnsTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[GridRowNoColumnsTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      // change to xxl
      let button = await driver.findComponent(ON.id('GridRow_No_Columns_001_Btn_1'));
      await button.click();
      console.info("[GridRowNoColumnsTest_0100] click GridRow_No_Columns_001_Btn_1");
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('GridRow_No_Columns_001_currentBp');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridRowNoColumnsTest_0100] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('xxl');
      await ComparisonLGAssert();

      // change to xl
      button = await driver.findComponent(ON.id('GridRow_No_Columns_001_Btn_2'));
      await button.click();
      console.info("[GridRowNoColumnsTest_0100] click GridRow_No_Columns_001_Btn_2");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('GridRow_No_Columns_001_currentBp');
      obj = JSON.parse(strJson);
      console.info("[GridRowNoColumnsTest_0100] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('xl');
      await ComparisonLGAssert();

      // change to lg
      button = await driver.findComponent(ON.id('GridRow_No_Columns_001_Btn_3'));
      await button.click();
      console.info("[GridRowNoColumnsTest_0100] click GridRow_No_Columns_001_Btn_3");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('GridRow_No_Columns_001_currentBp');
      obj = JSON.parse(strJson);
      console.info("[GridRowNoColumnsTest_0100] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('lg');
      await ComparisonLGAssert();

      // change to md
      button = await driver.findComponent(ON.id('GridRow_No_Columns_001_Btn_4'));
      await button.click();
      console.info("[GridRowNoColumnsTest_0100] click GridRow_No_Columns_001_Btn_4");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('GridRow_No_Columns_001_currentBp');
      obj = JSON.parse(strJson);
      console.info("[GridRowNoColumnsTest_0100] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('md');
      await ComparisonMDAssert();

      // change to sm
      button = await driver.findComponent(ON.id('GridRow_No_Columns_001_Btn_5'));
      await button.click();
      console.info("[GridRowNoColumnsTest_0100] click GridRow_No_Columns_001_Btn_5");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('GridRow_No_Columns_001_currentBp');
      obj = JSON.parse(strJson);
      console.info("[GridRowNoColumnsTest_0100] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('sm');
      await ComparisonSMAssert();

      // change to xs
      button = await driver.findComponent(ON.id('GridRow_No_Columns_001_Btn_6'));
      await button.click();
      console.info("[GridRowNoColumnsTest_0100] click GridRow_No_Columns_001_Btn_6");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('GridRow_No_Columns_001_currentBp');
      obj = JSON.parse(strJson);
      console.info("[GridRowNoColumnsTest_0100] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('xs');
      await ComparisonXSAssert();

      console.info('[GridRowNoColumnsTest_0100] END');
      done();
    });
  })
}