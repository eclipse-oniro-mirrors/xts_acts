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

export default function getCallbackNullAndUndefined() {
  describe('getCallbackNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("getCallbackNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentSnapshot/GetCallback/GetCallbackNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getCallbackNullAndUndefined state success " + JSON.stringify(pages));
        if (!("GetCallbackNullAndUndefined" == pages.name)) {
          console.info("get getCallbackNullAndUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getCallbackNullAndUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getCallbackNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   getIdEmptyV10001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_001
     * @tc.desc   Test componentSnapshot.get with empty id using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getIdEmptyV10001', Level.LEVEL0, async () => {
      console.info('[getIdEmptyV10001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnIdEmpty'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getIdEmptyV10001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[getIdEmptyV10001] END');
    });

    /**
     * @tc.name   getOptionsNullV12001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_004
     * @tc.desc   Test componentSnapshot.get with null options using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOptionsNullV12001', Level.LEVEL0, async () => {
      console.info('[getOptionsNullV12001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsNull'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getOptionsNullV12001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getOptionsNullV12001] END');
    });

    /**
     * @tc.name   getOptionsUndefinedV12002
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_005
     * @tc.desc   Test componentSnapshot.get with undefined options using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOptionsUndefinedV12002', Level.LEVEL0, async () => {
      console.info('[getOptionsUndefinedV12002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsUndefined'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getOptionsUndefinedV12002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getOptionsUndefinedV12002] END');
    });

    /**
     * @tc.name   getWaitTrueV12003
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_006
     * @tc.desc   Test componentSnapshot.get with waitUntilRenderFinished true using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWaitTrueV12003', Level.LEVEL0, async () => {
      console.info('[getWaitTrueV12003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitTrue'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWaitTrueV12003] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWaitTrueV12003] END');
    });

    /**
     * @tc.name   getWaitFalseV12004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_007
     * @tc.desc   Test componentSnapshot.get with waitUntilRenderFinished false using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWaitFalseV12004', Level.LEVEL0, async () => {
      console.info('[getWaitFalseV12004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWaitFalseV12004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWaitFalseV12004] END');
    });

    /**
     * @tc.name   getColorSpaceSRGBV23001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_008
     * @tc.desc   Test componentSnapshot.get with colorSpace SRGB using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceSRGBV23001', Level.LEVEL0, async () => {
      console.info('[getColorSpaceSRGBV23001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace4'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceSRGBV23001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceSRGBV23001] END');
    });

    /**
     * @tc.name   getColorSpaceDISPLAYP3V23002
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_009
     * @tc.desc   Test componentSnapshot.get with colorSpace DISPLAY_P3 using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceDISPLAYP3V23002', Level.LEVEL0, async () => {
      console.info('[getColorSpaceDISPLAYP3V23002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace3'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceDISPLAYP3V23002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceDISPLAYP3V23002] END');
    });

    /**
     * @tc.name   getColorModeIsAutoTrueV23001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_010
     * @tc.desc   Test componentSnapshot.get with colorMode isAuto true using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorModeIsAutoTrueV23001', Level.LEVEL0, async () => {
      console.info('[getColorModeIsAutoTrueV23001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorModeIsAutoTrue'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorModeIsAutoTrueV23001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorModeIsAutoTrueV23001] END');
    });

    /**
     * @tc.name   getColorModeIsAutoFalseV23002
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_011
     * @tc.desc   Test componentSnapshot.get with colorMode isAuto false using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorModeIsAutoFalseV23002', Level.LEVEL0, async () => {
      console.info('[getColorModeIsAutoFalseV23002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorModeIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorModeIsAutoFalseV23002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorModeIsAutoFalseV23002] END');
    });

    /**
     * @tc.name   getDynamicRangeModeHIGHV23001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_012
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode HIGH using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeHIGHV23001', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeHIGHV23001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrHIGH'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeHIGHV23001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeHIGHV23001] END');
    });

    /**
     * @tc.name   getDynamicRangeModeCONSTRAINTV23002
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_013
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode CONSTRAINT using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeCONSTRAINTV23002', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeCONSTRAINTV23002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrCONSTRAINT'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeCONSTRAINTV23002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeCONSTRAINTV23002] END');
    });

    /**
     * @tc.name   getDynamicRangeModeSTANDARDV23003
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_014
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode STANDARD using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeSTANDARDV23003', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeSTANDARDV23003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrSTANDARD'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeSTANDARDV23003] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeSTANDARDV23003] END');
    });

    /**
     * @tc.name   getDynamicRangeModeIsAutoTrueV23004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_015
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode isAuto true using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeIsAutoTrueV23004', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeIsAutoTrueV23004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoTrue'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeIsAutoTrueV23004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeIsAutoTrueV23004] END');
    });

    /**
     * @tc.name   getDynamicRangeModeIsAutoFalseV23005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_016
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode isAuto false using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDynamicRangeModeIsAutoFalseV23005', Level.LEVEL0, async () => {
      console.info('[getDynamicRangeModeIsAutoFalseV23005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDynamicRangeModeIsAutoFalseV23005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getDynamicRangeModeIsAutoFalseV23005] END');
    });

    /**
     * @tc.name   getColorSpace13V23003
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_017
     * @tc.desc   Test componentSnapshot.get with colorSpace ADOBE_RGB_1998_LIMIT using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace13V23003', Level.LEVEL0, async () => {
      console.info('[getColorSpace13V23003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace13'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace13V23003] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace13V23003] END');
    });

    /**
     * @tc.name   getColorSpace14V23004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_018
     * @tc.desc   Test componentSnapshot.get with colorSpace DISPLAY_P3_LIMIT using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace14V23004', Level.LEVEL0, async () => {
      console.info('[getColorSpace14V23004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace14'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace14V23004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace14V23004] END');
    });

    /**
     * @tc.name   getColorSpace15V23005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_019
     * @tc.desc   Test componentSnapshot.get with colorSpace SRGB_LIMIT using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace15V23005', Level.LEVEL0, async () => {
      console.info('[getColorSpace15V23005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace15'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace15V23005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace15V23005] END');
    });

    /**
     * @tc.name   getColorSpace16V23006
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_020
     * @tc.desc   Test componentSnapshot.get with colorSpace BT709_LIMIT using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace16V23006', Level.LEVEL0, async () => {
      console.info('[getColorSpace16V23006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace16'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace16V23006] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace16V23006] END');
    });

    /**
     * @tc.name   getColorSpace17V23007
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_021
     * @tc.desc   Test componentSnapshot.get with colorSpace BT601_EBU_LIMIT using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace17V23007', Level.LEVEL0, async () => {
      console.info('[getColorSpace17V23007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace17'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace17V23007] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace17V23007] END');
    });

    /**
     * @tc.name   getColorSpace18V23008
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_022
     * @tc.desc   Test componentSnapshot.get with colorSpace BT601_SMPTE_C_LIMIT using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace18V23008', Level.LEVEL0, async () => {
      console.info('[getColorSpace18V23008] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace18'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace18V23008] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace18V23008] END');
    });

    /**
     * @tc.name   getColorSpace19V23009
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_023
     * @tc.desc   Test componentSnapshot.get with colorSpace BT2020_HLG_LIMIT using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace19V23009', Level.LEVEL0, async () => {
      console.info('[getColorSpace19V23009] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace19'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace19V23009] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace19V23009] END');
    });

    /**
     * @tc.name   getColorSpace20V23010
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_024
     * @tc.desc   Test componentSnapshot.get with colorSpace BT2020_PQ_LIMIT using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace20V23010', Level.LEVEL0, async () => {
      console.info('[getColorSpace20V23010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace20'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace20V23010] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace20V23010] END');
    });

    /**
     * @tc.name   getColorSpace21V23011
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_025
     * @tc.desc   Test componentSnapshot.get with colorSpace P3_HLG_LIMIT using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace21V23011', Level.LEVEL0, async () => {
      console.info('[getColorSpace21V23011] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace21'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace21V23011] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace21V23011] END');
    });

    /**
     * @tc.name   getColorSpace22V23012
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_026
     * @tc.desc   Test componentSnapshot.get with colorSpace P3_PQ_LIMIT using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace22V23012', Level.LEVEL0, async () => {
      console.info('[getColorSpace22V23012] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace22'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace22V23012] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace22V23012] END');
    });

    /**
     * @tc.name   getColorSpace23V23013
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_027
     * @tc.desc   Test componentSnapshot.get with colorSpace LINEAR_P3 using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace23V23013', Level.LEVEL0, async () => {
      console.info('[getColorSpace23V23013] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace23'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace23V23013] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace23V23013] END');
    });

    /**
     * @tc.name   getColorSpace24V23014
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_028
     * @tc.desc   Test componentSnapshot.get with colorSpace LINEAR_SRGB using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace24V23014', Level.LEVEL0, async () => {
      console.info('[getColorSpace24V23014] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace24'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace24V23014] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace24V23014] END');
    });

    /**
     * @tc.name   getColorSpace25V23015
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_029
     * @tc.desc   Test componentSnapshot.get with colorSpace LINEAR_BT2020 using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace25V23015', Level.LEVEL0, async () => {
      console.info('[getColorSpace25V23015] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace25'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace25V23015] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace25V23015] END');
    });

    /**
     * @tc.name   getColorSpace26V23016
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_030
     * @tc.desc   Test componentSnapshot.get with colorSpace H_LOG using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace26V23016', Level.LEVEL0, async () => {
      console.info('[getColorSpace26V23016] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace26'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace26V23016] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace26V23016] END');
    });

    /**
     * @tc.name   getColorSpace27V23017
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_GET_PARAM_031
     * @tc.desc   Test componentSnapshot.get with colorSpace DISPLAY_BT2020_SRGB using callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace27V23017', Level.LEVEL0, async () => {
      console.info('[getColorSpace27V23017] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace27'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpace27V23017] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpace27V23017] END');
    });
  })
}
