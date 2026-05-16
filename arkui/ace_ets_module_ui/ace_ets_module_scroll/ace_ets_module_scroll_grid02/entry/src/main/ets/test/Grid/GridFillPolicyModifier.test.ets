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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import { Component, Driver, On, ON, UiWindow } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

const SLEEP_TIME_500 = 500;
const SLEEP_TIME_1000 = 1000;
export default function GridFillPolicyModifier() {

  describe('GridFillPolicyModifier', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridFillPolicyModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get GridFillPolicyModifier state success ' + JSON.stringify(pages));
        if (!('GridFillPolicyModifier' == pages.name)) {
          console.info('get GridFillPolicyModifier state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push GridFillPolicyModifier page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push GridFillPolicyModifier page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.number    GridFillPolicyModifier_0100
     * @tc.name      GridFillPolicyModifier_0100
     * @tc.desc      Display 2 columns when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.level     Level 3
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('GridFillPolicyModifier_0100', Level.LEVEL3, async (done: Function) => {
      console.info('GridTemplate_STR START');
      await CommonFunc.sleep(SLEEP_TIME_1000)
      let GridTemplate_STR1 = getInspectorByKey('GridTemplate_STR0');
      let GridTemplateJson1 = getInspectorByKey('GridTemplate_STR');
      let gridItem1A = CommonFunc.getComponentRectOnScreen('gridType_1');
      let gridItem1B = CommonFunc.getComponentRectOnScreen('gridType_2');
      await CommonFunc.sleep(SLEEP_TIME_500);
      expect(Math.abs(Math.floor(gridItem1B.left - gridItem1A.right)) <= 1 )
      expect(JSON.parse(GridTemplate_STR1).$attrs.content).assertEqual("ItemFillPolicy: 0");

      const longString = JSON.stringify(GridTemplateJson1);
      const chunkSize = 1000;
      console.info('GridTemplate_STR START4');
      for (let i = 0; i < longString.length; i += chunkSize) {
        console.info('GridTemplate_STR START4' + longString.substring(i, i + chunkSize));
      }

      expect(JSON.parse(GridTemplateJson1).$attrs.itemFillPolicy).assertEqual('PresetFillType.BREAKPOINT_DEFAULT');
      let driverSTR: Driver = Driver.create();
      let ButtonSTR: Component = await driverSTR.findComponent(ON.id('ButtonSTR'));

      await ButtonSTR.click();
      await CommonFunc.sleep(SLEEP_TIME_500)
      console.info('GridTemplate_STR1');
      let GridTemplate_STR2 = getInspectorByKey('GridTemplate_STR0');
      let GridTemplateJson2 = getInspectorByKey('GridTemplate_STR');
      let gridItem2A = CommonFunc.getComponentRectOnScreen('gridType_1');
      let gridItem2B = CommonFunc.getComponentRectOnScreen('gridType_2');
      expect(Math.abs(Math.floor(gridItem2B.left - gridItem2A.right)) <= 1 )
      expect(JSON.parse(GridTemplate_STR2).$attrs.content).assertEqual('ItemFillPolicy: 1');
      expect(JSON.parse(GridTemplateJson2).$attrs.itemFillPolicy).assertEqual('PresetFillType.BREAKPOINT_SM1MD2LG3');
      console.info('GridTemplate_STR1');

      await ButtonSTR.click();
      await CommonFunc.sleep(SLEEP_TIME_500)
      console.info('GridTemplate_STR2');
      let GridTemplate_STR3 = getInspectorByKey('GridTemplate_STR0');
      let GridTemplateJson3 = getInspectorByKey('GridTemplate_STR');
      let gridItem3A = CommonFunc.getComponentRectOnScreen('gridType_1');
      let gridItem3B = CommonFunc.getComponentRectOnScreen('gridType_2');
      expect(Math.abs(Math.floor(gridItem3B.left - gridItem3A.right)) <= 1 )
      expect(JSON.parse(GridTemplate_STR3).$attrs.content).assertEqual('ItemFillPolicy: 2');
      expect(JSON.parse(GridTemplateJson3).$attrs.itemFillPolicy).assertEqual('PresetFillType.BREAKPOINT_SM2MD3LG5');

      await ButtonSTR.click();
      await CommonFunc.sleep(SLEEP_TIME_500)
      console.info('GridTemplate_STR3');
      let GridTemplate_STR4 = getInspectorByKey('GridTemplate_STR0');
      let GridTemplateJson4 = getInspectorByKey('GridTemplate_STR');
      let gridItem4A = CommonFunc.getComponentRectOnScreen('gridType_1');
      let gridItem4B = CommonFunc.getComponentRectOnScreen('gridType_2');
      expect(Math.abs(Math.floor(gridItem4B.left - gridItem4A.right)) <= 1 )
      expect(JSON.parse(GridTemplate_STR4).$attrs.content).assertEqual('ItemFillPolicy: 4');
      expect(JSON.parse(GridTemplateJson4).$attrs.itemFillPolicy).assertEqual('PresetFillType.BREAKPOINT_DEFAULT');

      await ButtonSTR.click();
      await CommonFunc.sleep(SLEEP_TIME_500)
      console.info('GridTemplate_STR4');
      let GridTemplate_STR5 = getInspectorByKey('GridTemplate_STR0');
      let GridTemplateJson5 = getInspectorByKey('GridTemplate_STR');
      let gridItem5A = CommonFunc.getComponentRectOnScreen('gridType_1');
      let gridItem5B = CommonFunc.getComponentRectOnScreen('gridType_2');
      expect(Math.abs(Math.floor(gridItem5B.left - gridItem5A.right)) <= 1 )
      expect(JSON.parse(GridTemplate_STR5).$attrs.content).assertEqual('ItemFillPolicy: 0');
      expect(JSON.parse(GridTemplateJson5).$attrs.itemFillPolicy).assertEqual('PresetFillType.BREAKPOINT_DEFAULT');
      console.info('GridTemplate_STR END');
      done();
    })
  })
}
