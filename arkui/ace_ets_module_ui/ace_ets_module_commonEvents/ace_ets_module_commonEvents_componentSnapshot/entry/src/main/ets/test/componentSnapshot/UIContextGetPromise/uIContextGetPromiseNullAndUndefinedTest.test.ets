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

export default function uIContextGetPromiseNullAndUndefinedTest() {
  describe('uIContextGetPromiseNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("uIContextGetPromiseNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentSnapshot/UIContextGetPromise/UIContextGetPromiseNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get uIContextGetPromiseNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("UIContextGetPromiseNullAndUndefined" == pages.name)) {
          console.info("get uIContextGetPromiseNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push uIContextGetPromiseNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push uIContextGetPromiseNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   getIdEmptyV15001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_001
     * @tc.desc   Test UIContext get with empty id using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getIdEmptyV15001', Level.LEVEL0, async () => {
      console.info('[getIdEmptyV15001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnIdEmpty'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getIdEmptyV15001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[getIdEmptyV15001] END');
    });

    /**
     * @tc.name   getOptionsNullV15004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_002
     * @tc.desc   Test UIContext get with null options using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOptionsNullV15004', Level.LEVEL0, async () => {
      console.info('[getOptionsNullV15004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsNull'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getOptionsNullV15004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getOptionsNullV15004] END');
    });

    /**
     * @tc.name   getOptionsUndefinedV15005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_003
     * @tc.desc   Test UIContext get with undefined options using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOptionsUndefinedV15005', Level.LEVEL0, async () => {
      console.info('[getOptionsUndefinedV15005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsUndefined'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getOptionsUndefinedV15005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getOptionsUndefinedV15005] END');
    });

    /**
     * @tc.name   getWaitTrueV15006
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_004
     * @tc.desc   Test UIContext get with wait set to true using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWaitTrueV15006', Level.LEVEL0, async () => {
      console.info('[getWaitTrueV15006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitTrue'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWaitTrueV15006] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWaitTrueV15006] END');
    });

    /**
     * @tc.name   getWaitFalseV15007
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_005
     * @tc.desc   Test UIContext get with wait set to false using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWaitFalseV15007', Level.LEVEL0, async () => {
      console.info('[getWaitFalseV15007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWaitFalseV15007] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWaitFalseV15007] END');
    });

    /**
     * @tc.name   getColorSpaceUNKNOWNV23001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_006
     * @tc.desc   Test UIContext get with ColorSpace.UNKNOWN using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceUNKNOWNV23001', Level.LEVEL0, async () => {
      console.info('[getColorSpaceUNKNOWNV23001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace0'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceUNKNOWNV23001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceUNKNOWNV23001] END');
    });

    /**
     * @tc.name   getColorSpaceADOBERGB1998V23002
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_007
     * @tc.desc   Test UIContext get with ColorSpace.ADOBE_RGB_1998 using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceADOBERGB1998V23002', Level.LEVEL0, async () => {
      console.info('[getColorSpaceADOBERGB1998V23002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace1'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceADOBERGB1998V23002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceADOBERGB1998V23002] END');
    });

    /**
     * @tc.name   getColorSpaceDISPLAYP3V23004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_008
     * @tc.desc   Test UIContext get with ColorSpace.DISPLAY_P3 using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceDISPLAYP3V23004', Level.LEVEL0, async () => {
      console.info('[getColorSpaceDISPLAYP3V23004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace3'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceDISPLAYP3V23004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceDISPLAYP3V23004] END');
    });

    /**
     * @tc.name   getColorSpaceSRGBV23005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_009
     * @tc.desc   Test UIContext get with ColorSpace.SRGB using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceSRGBV23005', Level.LEVEL0, async () => {
      console.info('[getColorSpaceSRGBV23005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace4'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceSRGBV23005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceSRGBV23005] END');
    });

    /**
     * @tc.name   getColorModeIsAutoTrueV23014
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_010
     * @tc.desc   Test UIContext get with colorMode isAuto set to true using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorModeIsAutoTrueV23014', Level.LEVEL0, async () => {
      console.info('[getColorModeIsAutoTrueV23014] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorModeIsAutoTrue'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorModeIsAutoTrueV23014] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorModeIsAutoTrueV23014] END');
    });

    /**
     * @tc.name   getColorModeIsAutoFalseV23015
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_011
     * @tc.desc   Test UIContext get with colorMode isAuto set to false using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorModeIsAutoFalseV23015', Level.LEVEL0, async () => {
      console.info('[getColorModeIsAutoFalseV23015] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorModeIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorModeIsAutoFalseV23015] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorModeIsAutoFalseV23015] END');
    });

    /**
     * @tc.name   getDynamicRangeModeHIGHV23016
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_012
     * @tc.desc   Test UIContext get with DynamicRangeMode.HIGH using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeHIGHV23016', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeHIGHV23016] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrHIGH'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeHIGHV23016] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeHIGHV23016] END');
    });

    /**
     * @tc.name   getDynamicRangeModeCONSTRAINTV23017
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_013
     * @tc.desc   Test UIContext get with DynamicRangeMode.CONSTRAINT using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeCONSTRAINTV23017', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeCONSTRAINTV23017] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrCONSTRAINT'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeCONSTRAINTV23017] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeCONSTRAINTV23017] END');
    });

    /**
     * @tc.name   getDynamicRangeModeSTANDARDV23018
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_014
     * @tc.desc   Test UIContext get with DynamicRangeMode.STANDARD using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeSTANDARDV23018', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeSTANDARDV23018] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrSTANDARD'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeSTANDARDV23018] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeSTANDARDV23018] END');
    });

    /**
     * @tc.name   getDynamicRangeModeIsAutoTrueV23019
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_015
     * @tc.desc   Test UIContext get with dynamicRangeMode isAuto set to true using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeIsAutoTrueV23019', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeIsAutoTrueV23019] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoTrue'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeIsAutoTrueV23019] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeIsAutoTrueV23019] END');
    });

    /**
     * @tc.name   getDynamicRangeModeIsAutoFalseV23020
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_016
     * @tc.desc   Test UIContext get with dynamicRangeMode isAuto set to false using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeIsAutoFalseV23020', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeIsAutoFalseV23020] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeIsAutoFalseV23020] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeIsAutoFalseV23020] END');
    });

    /**
     * @tc.name   getColorSpaceDISPLAYP3LIMITV23022
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GETPROMISE_PARAM_017
     * @tc.desc   Test UIContext get with ColorSpace.DISPLAY_P3 with limit using promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceDISPLAYP3LIMITV23022', Level.LEVEL0, async () => {
      console.info('[getColorSpaceDISPLAYP3LIMITV23022] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace14'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceDISPLAYP3LIMITV23022] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceDISPLAYP3LIMITV23022] END');
    });
  })
}
