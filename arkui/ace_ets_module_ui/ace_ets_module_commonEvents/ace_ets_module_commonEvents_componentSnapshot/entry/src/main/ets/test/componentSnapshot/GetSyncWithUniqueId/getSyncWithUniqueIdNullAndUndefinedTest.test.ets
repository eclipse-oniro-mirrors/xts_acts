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

export default function getSyncWithUniqueIdNullAndUndefinedTest() {
  describe('getSyncWithUniqueIdNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("getSyncWithUniqueIdNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentSnapshot/GetSyncWithUniqueId/GetSyncWithUniqueIdNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getSyncWithUniqueIdNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("GetSyncWithUniqueIdNullAndUndefined" == pages.name)) {
          console.info("get getSyncWithUniqueIdNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getSyncWithUniqueIdNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getSyncWithUniqueIdNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   getSyncWithUniqueIdOptionsNullV15003
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_001
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with null options parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdOptionsNullV15003', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdOptionsNullV15003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsNull'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdOptionsNullV15003] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdOptionsNullV15003] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdOptionsUndefinedV15004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_002
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with undefined options parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdOptionsUndefinedV15004', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdOptionsUndefinedV15004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsUndefined'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdOptionsUndefinedV15004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdOptionsUndefinedV15004] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdColorSpaceUNKNOWNV23001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_003
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with ColorSpace.UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdColorSpaceUNKNOWNV23001', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdColorSpaceUNKNOWNV23001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace0'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdColorSpaceUNKNOWNV23001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdColorSpaceUNKNOWNV23001] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdColorSpaceDISPLAYP3V23004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_004
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with ColorSpace.DISPLAY_P3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdColorSpaceDISPLAYP3V23004', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdColorSpaceDISPLAYP3V23004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace3'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdColorSpaceDISPLAYP3V23004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdColorSpaceDISPLAYP3V23004] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdColorSpaceSRGBV23005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_005
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with ColorSpace.SRGB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdColorSpaceSRGBV23005', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdColorSpaceSRGBV23005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace4'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdColorSpaceSRGBV23005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdColorSpaceSRGBV23005] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdColorModeIsAutoTrueV23014
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_006
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with colorMode isAuto set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdColorModeIsAutoTrueV23014', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdColorModeIsAutoTrueV23014] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorModeIsAutoTrue'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdColorModeIsAutoTrueV23014] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdColorModeIsAutoTrueV23014] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdColorModeIsAutoFalseV23015
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_007
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with colorMode isAuto set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdColorModeIsAutoFalseV23015', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdColorModeIsAutoFalseV23015] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorModeIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdColorModeIsAutoFalseV23015] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdColorModeIsAutoFalseV23015] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdDynamicRangeModeHIGHV23016
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_008
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with DynamicRangeMode.HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdDynamicRangeModeHIGHV23016', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdDynamicRangeModeHIGHV23016] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrHIGH'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdDynamicRangeModeHIGHV23016] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdDynamicRangeModeHIGHV23016] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdDynamicRangeModeCONSTRAINTV23017
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_009
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with DynamicRangeMode.CONSTRAINT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdDynamicRangeModeCONSTRAINTV23017', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdDynamicRangeModeCONSTRAINTV23017] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrCONSTRAINT'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdDynamicRangeModeCONSTRAINTV23017] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdDynamicRangeModeCONSTRAINTV23017] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdDynamicRangeModeSTANDARDV23018
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_010
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with DynamicRangeMode.STANDARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdDynamicRangeModeSTANDARDV23018', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdDynamicRangeModeSTANDARDV23018] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrSTANDARD'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdDynamicRangeModeSTANDARDV23018] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdDynamicRangeModeSTANDARDV23018] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdDynamicRangeModeIsAutoTrueV23019
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_011
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with dynamicRangeMode isAuto set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdDynamicRangeModeIsAutoTrueV23019', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdDynamicRangeModeIsAutoTrueV23019] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoTrue'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdDynamicRangeModeIsAutoTrueV23019] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdDynamicRangeModeIsAutoTrueV23019] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdDynamicRangeModeIsAutoFalseV23020
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_012
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with dynamicRangeMode isAuto set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdDynamicRangeModeIsAutoFalseV23020', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdDynamicRangeModeIsAutoFalseV23020] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdDynamicRangeModeIsAutoFalseV23020] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdDynamicRangeModeIsAutoFalseV23020] END');
    });

    /**
     * @tc.name   getSyncWithUniqueIdColorSpaceDISPLAYP3LIMITV23022
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GETSYNCWITHUNIQUEID_PARAM_013
     * @tc.desc   Test componentSnapshot.getSyncWithUniqueId with ColorSpace.DISPLAY_P3 with limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncWithUniqueIdColorSpaceDISPLAYP3LIMITV23022', Level.LEVEL0, async () => {
      console.info('[getSyncWithUniqueIdColorSpaceDISPLAYP3LIMITV23022] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace14'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncWithUniqueIdColorSpaceDISPLAYP3LIMITV23022] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncWithUniqueIdColorSpaceDISPLAYP3LIMITV23022] END');
    });
  })
}
