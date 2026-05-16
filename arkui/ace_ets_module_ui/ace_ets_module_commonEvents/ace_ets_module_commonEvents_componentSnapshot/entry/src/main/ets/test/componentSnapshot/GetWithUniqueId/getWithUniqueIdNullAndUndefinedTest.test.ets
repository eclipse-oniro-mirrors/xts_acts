/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common'

export default function getWithUniqueIdNullAndUndefinedTest() {
  describe('getWithUniqueIdNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("getWithUniqueIdNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentSnapshot/GetWithUniqueId/GetWithUniqueIdNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getWithUniqueIdNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("GetWithUniqueIdNullAndUndefined" == pages.name)) {
          console.info("get getWithUniqueIdNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getWithUniqueIdNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getWithUniqueIdNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   getWithUniqueIdOptionsNullV15003
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_001
     * @tc.desc   Test componentSnapshot.getWithUniqueId with null options parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdOptionsNullV15003', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdOptionsNullV15003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsNull'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdOptionsNullV15003] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdOptionsNullV15003] END');
    });

    /**
     * @tc.name   getWithUniqueIdOptionsUndefinedV15004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_002
     * @tc.desc   Test componentSnapshot.getWithUniqueId with undefined options parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdOptionsUndefinedV15004', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdOptionsUndefinedV15004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsUndefined'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdOptionsUndefinedV15004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdOptionsUndefinedV15004] END');
    });

    /**
     * @tc.name   getWithUniqueIdWaitTrueV15005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_003
     * @tc.desc   Test componentSnapshot.getWithUniqueId with wait set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdWaitTrueV15005', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdWaitTrueV15005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitTrue'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdWaitTrueV15005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdWaitTrueV15005] END');
    });

    /**
     * @tc.name   getWithUniqueIdWaitFalseV15006
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_004
     * @tc.desc   Test componentSnapshot.getWithUniqueId with wait set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdWaitFalseV15006', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdWaitFalseV15006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdWaitFalseV15006] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdWaitFalseV15006] END');
    });

    /**
     * @tc.name   getWithUniqueIdColorSpaceUNKNOWNV23001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_005
     * @tc.desc   Test componentSnapshot.getWithUniqueId with ColorSpace.UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdColorSpaceUNKNOWNV23001', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdColorSpaceUNKNOWNV23001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace0'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdColorSpaceUNKNOWNV23001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdColorSpaceUNKNOWNV23001] END');
    });

    /**
     * @tc.name   getWithUniqueIdColorSpaceDISPLAYP3V23004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_006
     * @tc.desc   Test componentSnapshot.getWithUniqueId with ColorSpace.DISPLAY_P3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdColorSpaceDISPLAYP3V23004', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdColorSpaceDISPLAYP3V23004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace3'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdColorSpaceDISPLAYP3V23004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdColorSpaceDISPLAYP3V23004] END');
    });

    /**
     * @tc.name   getWithUniqueIdColorSpaceSRGBV23005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_007
     * @tc.desc   Test componentSnapshot.getWithUniqueId with ColorSpace.SRGB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdColorSpaceSRGBV23005', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdColorSpaceSRGBV23005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace4'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdColorSpaceSRGBV23005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdColorSpaceSRGBV23005] END');
    });

    /**
     * @tc.name   getWithUniqueIdColorModeIsAutoTrueV23014
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_008
     * @tc.desc   Test componentSnapshot.getWithUniqueId with colorMode isAuto set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdColorModeIsAutoTrueV23014', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdColorModeIsAutoTrueV23014] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorModeIsAutoTrue'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdColorModeIsAutoTrueV23014] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdColorModeIsAutoTrueV23014] END');
    });

    /**
     * @tc.name   getWithUniqueIdColorModeIsAutoFalseV23015
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_009
     * @tc.desc   Test componentSnapshot.getWithUniqueId with colorMode isAuto set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdColorModeIsAutoFalseV23015', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdColorModeIsAutoFalseV23015] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorModeIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdColorModeIsAutoFalseV23015] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdColorModeIsAutoFalseV23015] END');
    });

    /**
     * @tc.name   getWithUniqueIdDynamicRangeModeHIGHV23016
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_010
     * @tc.desc   Test componentSnapshot.getWithUniqueId with DynamicRangeMode.HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdDynamicRangeModeHIGHV23016', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdDynamicRangeModeHIGHV23016] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrHIGH'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdDynamicRangeModeHIGHV23016] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdDynamicRangeModeHIGHV23016] END');
    });

    /**
     * @tc.name   getWithUniqueIdDynamicRangeModeCONSTRAINTV23017
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_011
     * @tc.desc   Test componentSnapshot.getWithUniqueId with DynamicRangeMode.CONSTRAINT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdDynamicRangeModeCONSTRAINTV23017', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdDynamicRangeModeCONSTRAINTV23017] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrCONSTRAINT'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdDynamicRangeModeCONSTRAINTV23017] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdDynamicRangeModeCONSTRAINTV23017] END');
    });

    /**
     * @tc.name   getWithUniqueIdDynamicRangeModeSTANDARDV23018
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_012
     * @tc.desc   Test componentSnapshot.getWithUniqueId with DynamicRangeMode.STANDARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdDynamicRangeModeSTANDARDV23018', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdDynamicRangeModeSTANDARDV23018] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrSTANDARD'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdDynamicRangeModeSTANDARDV23018] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdDynamicRangeModeSTANDARDV23018] END');
    });

    /**
     * @tc.name   getWithUniqueIdDynamicRangeModeIsAutoTrueV23019
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_013
     * @tc.desc   Test componentSnapshot.getWithUniqueId with dynamicRangeMode isAuto set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdDynamicRangeModeIsAutoTrueV23019', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdDynamicRangeModeIsAutoTrueV23019] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoTrue'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdDynamicRangeModeIsAutoTrueV23019] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdDynamicRangeModeIsAutoTrueV23019] END');
    });

    /**
     * @tc.name   getWithUniqueIdDynamicRangeModeIsAutoFalseV23020
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_014
     * @tc.desc   Test componentSnapshot.getWithUniqueId with dynamicRangeMode isAuto set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdDynamicRangeModeIsAutoFalseV23020', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdDynamicRangeModeIsAutoFalseV23020] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdDynamicRangeModeIsAutoFalseV23020] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdDynamicRangeModeIsAutoFalseV23020] END');
    });

    /**
     * @tc.name   getWithUniqueIdColorSpaceDISPLAYP3LIMITV23022
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETWITHUNIQUEID_PARAM_015
     * @tc.desc   Test componentSnapshot.getWithUniqueId with ColorSpace.DISPLAY_P3 with limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWithUniqueIdColorSpaceDISPLAYP3LIMITV23022', Level.LEVEL0, async () => {
      console.info('[getWithUniqueIdColorSpaceDISPLAYP3LIMITV23022] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace14'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWithUniqueIdColorSpaceDISPLAYP3LIMITV23022] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWithUniqueIdColorSpaceDISPLAYP3LIMITV23022] END');
    });
  })
}
