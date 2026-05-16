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

export default function uIContextGetSyncNullAndUndefinedTest() {
  describe('uIContextGetSyncNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("uIContextGetSyncNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentSnapshot/UIContextGetSync/UIContextGetSyncNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get uIContextGetSyncNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("UIContextGetSyncNullAndUndefined" == pages.name)) {
          console.info("get uIContextGetSyncNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push uIContextGetSyncNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push uIContextGetSyncNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   getSyncIdEmptyV12001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_001
     * @tc.desc   Test UIContext getSync with empty id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncIdEmptyV12001', Level.LEVEL0, async () => {
      console.info('[getSyncIdEmptyV12001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnIdEmpty'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncIdEmptyV12001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[getSyncIdEmptyV12001] END');
    });

    /**
     * @tc.name   getSyncIdNullV12002
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_002
     * @tc.desc   Test UIContext getSync with null id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncIdNullV12002', Level.LEVEL0, async () => {
      console.info('[getSyncIdNullV12002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnIdNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncIdNullV12002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[getSyncIdNullV12002] END');
    });

    /**
     * @tc.name   getSyncIdUndefinedV12003
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_003
     * @tc.desc   Test UIContext getSync with undefined id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncIdUndefinedV12003', Level.LEVEL0, async () => {
      console.info('[getSyncIdUndefinedV12003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnIdUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncIdUndefinedV12003] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[getSyncIdUndefinedV12003] END');
    });

    /**
     * @tc.name   getSyncOptionsNullV12004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_004
     * @tc.desc   Test UIContext getSync with null options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncOptionsNullV12004', Level.LEVEL0, async () => {
      console.info('[getSyncOptionsNullV12004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsNull'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncOptionsNullV12004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncOptionsNullV12004] END');
    });

    /**
     * @tc.name   getSyncOptionsUndefinedV12005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_005
     * @tc.desc   Test UIContext getSync with undefined options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncOptionsUndefinedV12005', Level.LEVEL0, async () => {
      console.info('[getSyncOptionsUndefinedV12005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsUndefined'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncOptionsUndefinedV12005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncOptionsUndefinedV12005] END');
    });

    /**
     * @tc.name   getSyncColorSpaceUNKNOWNV23001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_006
     * @tc.desc   Test UIContext getSync with ColorSpace.UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncColorSpaceUNKNOWNV23001', Level.LEVEL0, async () => {
      console.info('[getSyncColorSpaceUNKNOWNV23001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace0'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncColorSpaceUNKNOWNV23001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncColorSpaceUNKNOWNV23001] END');
    });

    /**
     * @tc.name   getSyncColorSpaceDISPLAYP3V23004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_007
     * @tc.desc   Test UIContext getSync with ColorSpace.DISPLAY_P3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncColorSpaceDISPLAYP3V23004', Level.LEVEL0, async () => {
      console.info('[getSyncColorSpaceDISPLAYP3V23004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace3'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncColorSpaceDISPLAYP3V23004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncColorSpaceDISPLAYP3V23004] END');
    });

    /**
     * @tc.name   getSyncColorSpaceSRGBV23005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_008
     * @tc.desc   Test UIContext getSync with ColorSpace.SRGB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncColorSpaceSRGBV23005', Level.LEVEL0, async () => {
      console.info('[getSyncColorSpaceSRGBV23005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace4'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncColorSpaceSRGBV23005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncColorSpaceSRGBV23005] END');
    });

    /**
     * @tc.name   getSyncColorModeIsAutoTrueV23014
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_009
     * @tc.desc   Test UIContext getSync with colorMode isAuto set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncColorModeIsAutoTrueV23014', Level.LEVEL0, async () => {
      console.info('[getSyncColorModeIsAutoTrueV23014] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorModeIsAutoTrue'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncColorModeIsAutoTrueV23014] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncColorModeIsAutoTrueV23014] END');
    });

    /**
     * @tc.name   getSyncColorModeIsAutoFalseV23015
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_010
     * @tc.desc   Test UIContext getSync with colorMode isAuto set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncColorModeIsAutoFalseV23015', Level.LEVEL0, async () => {
      console.info('[getSyncColorModeIsAutoFalseV23015] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorModeIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncColorModeIsAutoFalseV23015] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncColorModeIsAutoFalseV23015] END');
    });

    /**
     * @tc.name   getSyncDynamicRangeModeHIGHV23016
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_011
     * @tc.desc   Test UIContext getSync with DynamicRangeMode.HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncDynamicRangeModeHIGHV23016', Level.LEVEL0, async () => {
      console.info('[getSyncDynamicRangeModeHIGHV23016] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrHIGH'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncDynamicRangeModeHIGHV23016] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncDynamicRangeModeHIGHV23016] END');
    });

    /**
     * @tc.name   getSyncDynamicRangeModeCONSTRAINTV23017
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_012
     * @tc.desc   Test UIContext getSync with DynamicRangeMode.CONSTRAINT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncDynamicRangeModeCONSTRAINTV23017', Level.LEVEL0, async () => {
      console.info('[getSyncDynamicRangeModeCONSTRAINTV23017] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrCONSTRAINT'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncDynamicRangeModeCONSTRAINTV23017] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncDynamicRangeModeCONSTRAINTV23017] END');
    });

    /**
     * @tc.name   getSyncDynamicRangeModeSTANDARDV23018
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_013
     * @tc.desc   Test UIContext getSync with DynamicRangeMode.STANDARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncDynamicRangeModeSTANDARDV23018', Level.LEVEL0, async () => {
      console.info('[getSyncDynamicRangeModeSTANDARDV23018] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrSTANDARD'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncDynamicRangeModeSTANDARDV23018] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncDynamicRangeModeSTANDARDV23018] END');
    });

    /**
     * @tc.name   getSyncDynamicRangeModeIsAutoTrueV23019
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_014
     * @tc.desc   Test UIContext getSync with dynamicRangeMode isAuto set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncDynamicRangeModeIsAutoTrueV23019', Level.LEVEL0, async () => {
      console.info('[getSyncDynamicRangeModeIsAutoTrueV23019] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoTrue'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncDynamicRangeModeIsAutoTrueV23019] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncDynamicRangeModeIsAutoTrueV23019] END');
    });

    /**
     * @tc.name   getSyncDynamicRangeModeIsAutoFalseV23020
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_015
     * @tc.desc   Test UIContext getSync with dynamicRangeMode isAuto set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncDynamicRangeModeIsAutoFalseV23020', Level.LEVEL0, async () => {
      console.info('[getSyncDynamicRangeModeIsAutoFalseV23020] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncDynamicRangeModeIsAutoFalseV23020] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncDynamicRangeModeIsAutoFalseV23020] END');
    });

    /**
     * @tc.name   getSyncColorSpaceDISPLAYP3LIMITV23022
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETSYNC_PARAM_016
     * @tc.desc   Test UIContext getSync with ColorSpace.DISPLAY_P3 with limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSyncColorSpaceDISPLAYP3LIMITV23022', Level.LEVEL0, async () => {
      console.info('[getSyncColorSpaceDISPLAYP3LIMITV23022] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace14'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getSyncColorSpaceDISPLAYP3LIMITV23022] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getSyncColorSpaceDISPLAYP3LIMITV23022] END');
    });
  })
}
