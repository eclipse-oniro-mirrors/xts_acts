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

export default function uIContextGetNullAndUndefinedTest() {
  describe('uIContextGetNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("uIContextGetNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentSnapshot/UIContextGet/UIContextGetNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get uIContextGetNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("UIContextGetNullAndUndefined" == pages.name)) {
          console.info("get uIContextGetNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push uIContextGetNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push uIContextGetNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   getIdEmptyV12001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_001
     * @tc.desc   Test componentSnapshot.get with empty id using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getIdEmptyV12001', Level.LEVEL0, async () => {
      console.info('[getIdEmptyV12001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnIdEmpty'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getIdEmptyV12001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[getIdEmptyV12001] END');
    });

    /**
     * @tc.name   getOptionsNullV12004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_004
     * @tc.desc   Test componentSnapshot.get with null options using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOptionsNullV12004', Level.LEVEL0, async () => {
      console.info('[getOptionsNullV12004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsNull'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getOptionsNullV12004] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getOptionsNullV12004] END');
    });

    /**
     * @tc.name   getOptionsUndefinedV12005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_005
     * @tc.desc   Test componentSnapshot.get with undefined options using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOptionsUndefinedV12005', Level.LEVEL0, async () => {
      console.info('[getOptionsUndefinedV12005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsUndefined'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getOptionsUndefinedV12005] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getOptionsUndefinedV12005] END');
    });

    /**
     * @tc.name   getWaitTrueV12006
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_006
     * @tc.desc   Test componentSnapshot.get with waitUntilRenderFinished true using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWaitTrueV12006', Level.LEVEL0, async () => {
      console.info('[getWaitTrueV12006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitTrue'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWaitTrueV12006] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWaitTrueV12006] END');
    });

    /**
     * @tc.name   getWaitFalseV12007
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_007
     * @tc.desc   Test componentSnapshot.get with waitUntilRenderFinished false using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getWaitFalseV12007', Level.LEVEL0, async () => {
      console.info('[getWaitFalseV12007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitFalse'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getWaitFalseV12007] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getWaitFalseV12007] END');
    });

    /**
     * @tc.name   getColorSpaceUNKNOWNV23001
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_008
     * @tc.desc   Test componentSnapshot.get with colorSpace UNKNOWN using UIContext callback
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
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_009
     * @tc.desc   Test componentSnapshot.get with colorSpace ADOBE_RGB_1998 using UIContext callback
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
     * @tc.name   getColorSpaceDCIP3V23003
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_010
     * @tc.desc   Test componentSnapshot.get with colorSpace DCI_P3 using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceDCIP3V23003', Level.LEVEL0, async () => {
      console.info('[getColorSpaceDCIP3V23003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace2'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceDCIP3V23003] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceDCIP3V23003] END');
    });

    /**
     * @tc.name   getColorSpaceDISPLAYP3V23004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_011
     * @tc.desc   Test componentSnapshot.get with colorSpace DISPLAY_P3 using UIContext callback
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
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_012
     * @tc.desc   Test componentSnapshot.get with colorSpace SRGB using UIContext callback
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
     * @tc.name   getColorSpaceCUSTOMV23006
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_013
     * @tc.desc   Test componentSnapshot.get with colorSpace CUSTOM using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceCUSTOMV23006', Level.LEVEL0, async () => {
      console.info('[getColorSpaceCUSTOMV23006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace5'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceCUSTOMV23006] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceCUSTOMV23006] END');
    });

    /**
     * @tc.name   getColorSpaceBT709V23007
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_014
     * @tc.desc   Test componentSnapshot.get with colorSpace BT709 using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceBT709V23007', Level.LEVEL0, async () => {
      console.info('[getColorSpaceBT709V23007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace6'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceBT709V23007] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceBT709V23007] END');
    });

    /**
     * @tc.name   getColorSpaceBT601EBUV23008
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_015
     * @tc.desc   Test componentSnapshot.get with colorSpace BT601_EBU using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceBT601EBUV23008', Level.LEVEL0, async () => {
      console.info('[getColorSpaceBT601EBUV23008] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace7'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceBT601EBUV23008] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceBT601EBUV23008] END');
    });

    /**
     * @tc.name   getColorSpaceBT601SMPTECV23009
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_016
     * @tc.desc   Test componentSnapshot.get with colorSpace BT601_SMPTE_C using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceBT601SMPTECV23009', Level.LEVEL0, async () => {
      console.info('[getColorSpaceBT601SMPTECV23009] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace8'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceBT601SMPTECV23009] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceBT601SMPTECV23009] END');
    });

    /**
     * @tc.name   getColorSpaceBT2020HLGV23010
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_017
     * @tc.desc   Test componentSnapshot.get with colorSpace BT2020_HLG using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceBT2020HLGV23010', Level.LEVEL0, async () => {
      console.info('[getColorSpaceBT2020HLGV23010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace9'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceBT2020HLGV23010] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceBT2020HLGV23010] END');
    });

    /**
     * @tc.name   getColorSpaceBT2020PQV23011
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_018
     * @tc.desc   Test componentSnapshot.get with colorSpace BT2020_PQ using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceBT2020PQV23011', Level.LEVEL0, async () => {
      console.info('[getColorSpaceBT2020PQV23011] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace10'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceBT2020PQV23011] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceBT2020PQV23011] END');
    });

    /**
     * @tc.name   getColorSpaceP3HLGV23012
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_019
     * @tc.desc   Test componentSnapshot.get with colorSpace P3_HLG using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceP3HLGV23012', Level.LEVEL0, async () => {
      console.info('[getColorSpaceP3HLGV23012] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace11'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceP3HLGV23012] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceP3HLGV23012] END');
    });

    /**
     * @tc.name   getColorSpaceP3PQV23013
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_020
     * @tc.desc   Test componentSnapshot.get with colorSpace P3_PQ using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceP3PQV23013', Level.LEVEL0, async () => {
      console.info('[getColorSpaceP3PQV23013] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace12'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceP3PQV23013] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceP3PQV23013] END');
    });

    /**
     * @tc.name   getColorModeIsAutoTrueV23014
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_021
     * @tc.desc   Test componentSnapshot.get with colorMode isAuto true using UIContext callback
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
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_022
     * @tc.desc   Test componentSnapshot.get with colorMode isAuto false using UIContext callback
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
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_023
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode HIGH using UIContext callback
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
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_024
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode CONSTRAINT using UIContext callback
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
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_025
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode STANDARD using UIContext callback
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
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_026
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode isAuto true using UIContext callback
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
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_027
     * @tc.desc   Test componentSnapshot.get with dynamicRangeMode isAuto false using UIContext callback
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
     * @tc.name   getColorSpaceADOBERGB1998LIMITV23021
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_028
     * @tc.desc   Test componentSnapshot.get with colorSpace ADOBE_RGB_1998_LIMIT using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceADOBERGB1998LIMITV23021', Level.LEVEL0, async () => {
      console.info('[getColorSpaceADOBERGB1998LIMITV23021] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace13'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceADOBERGB1998LIMITV23021] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceADOBERGB1998LIMITV23021] END');
    });

    /**
     * @tc.name   getColorSpaceDISPLAYP3LIMITV23022
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_029
     * @tc.desc   Test componentSnapshot.get with colorSpace DISPLAY_P3_LIMIT using UIContext callback
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

    /**
     * @tc.name   getColorSpaceSRGBLIMITV23023
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_030
     * @tc.desc   Test componentSnapshot.get with colorSpace SRGB_LIMIT using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceSRGBLIMITV23023', Level.LEVEL0, async () => {
      console.info('[getColorSpaceSRGBLIMITV23023] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace15'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceSRGBLIMITV23023] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceSRGBLIMITV23023] END');
    });

    /**
     * @tc.name   getColorSpaceBT709LIMITV23024
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_031
     * @tc.desc   Test componentSnapshot.get with colorSpace BT709_LIMIT using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceBT709LIMITV23024', Level.LEVEL0, async () => {
      console.info('[getColorSpaceBT709LIMITV23024] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace16'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceBT709LIMITV23024] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceBT709LIMITV23024] END');
    });

    /**
     * @tc.name   getColorSpaceBT601EBULIMITV23025
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_032
     * @tc.desc   Test componentSnapshot.get with colorSpace BT601_EBU_LIMIT using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceBT601EBULIMITV23025', Level.LEVEL0, async () => {
      console.info('[getColorSpaceBT601EBULIMITV23025] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace17'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceBT601EBULIMITV23025] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceBT601EBULIMITV23025] END');
    });

    /**
     * @tc.name   getColorSpaceBT601SMPTECLIMITV23026
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_033
     * @tc.desc   Test componentSnapshot.get with colorSpace BT601_SMPTE_C_LIMIT using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceBT601SMPTECLIMITV23026', Level.LEVEL0, async () => {
      console.info('[getColorSpaceBT601SMPTECLIMITV23026] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace18'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceBT601SMPTECLIMITV23026] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceBT601SMPTECLIMITV23026] END');
    });

    /**
     * @tc.name   getColorSpaceBT2020HLGLIMITV23027
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_034
     * @tc.desc   Test componentSnapshot.get with colorSpace BT2020_HLG_LIMIT using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceBT2020HLGLIMITV23027', Level.LEVEL0, async () => {
      console.info('[getColorSpaceBT2020HLGLIMITV23027] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace19'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceBT2020HLGLIMITV23027] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceBT2020HLGLIMITV23027] END');
    });

    /**
     * @tc.name   getColorSpaceBT2020PQLIMITV23028
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_035
     * @tc.desc   Test componentSnapshot.get with colorSpace BT2020_PQ_LIMIT using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceBT2020PQLIMITV23028', Level.LEVEL0, async () => {
      console.info('[getColorSpaceBT2020PQLIMITV23028] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace20'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceBT2020PQLIMITV23028] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceBT2020PQLIMITV23028] END');
    });

    /**
     * @tc.name   getColorSpaceP3HLGLIMITV23029
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_036
     * @tc.desc   Test componentSnapshot.get with colorSpace P3_HLG_LIMIT using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceP3HLGLIMITV23029', Level.LEVEL0, async () => {
      console.info('[getColorSpaceP3HLGLIMITV23029] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace21'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceP3HLGLIMITV23029] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceP3HLGLIMITV23029] END');
    });

    /**
     * @tc.name   getColorSpaceP3PQLIMITV23030
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_037
     * @tc.desc   Test componentSnapshot.get with colorSpace P3_PQ_LIMIT using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceP3PQLIMITV23030', Level.LEVEL0, async () => {
      console.info('[getColorSpaceP3PQLIMITV23030] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace22'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceP3PQLIMITV23030] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceP3PQLIMITV23030] END');
    });

    /**
     * @tc.name   getColorSpaceLINEARP3V23031
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_038
     * @tc.desc   Test componentSnapshot.get with colorSpace LINEAR_P3 using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceLINEARP3V23031', Level.LEVEL0, async () => {
      console.info('[getColorSpaceLINEARP3V23031] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace23'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceLINEARP3V23031] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceLINEARP3V23031] END');
    });

    /**
     * @tc.name   getColorSpaceLINEARSRGBV23032
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_039
     * @tc.desc   Test componentSnapshot.get with colorSpace LINEAR_SRGB using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceLINEARSRGBV23032', Level.LEVEL0, async () => {
      console.info('[getColorSpaceLINEARSRGBV23032] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace24'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceLINEARSRGBV23032] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceLINEARSRGBV23032] END');
    });

    /**
     * @tc.name   getColorSpaceLINEARBT2020V23033
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_040
     * @tc.desc   Test componentSnapshot.get with colorSpace LINEAR_BT2020 using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceLINEARBT2020V23033', Level.LEVEL0, async () => {
      console.info('[getColorSpaceLINEARBT2020V23033] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace25'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceLINEARBT2020V23033] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceLINEARBT2020V23033] END');
    });

    /**
     * @tc.name   getColorSpaceHLOGV23034
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_041
     * @tc.desc   Test componentSnapshot.get with colorSpace H_LOG using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceHLOGV23034', Level.LEVEL0, async () => {
      console.info('[getColorSpaceHLOGV23034] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace26'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceHLOGV23034] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceHLOGV23034] END');
    });

    /**
     * @tc.name   getColorSpaceDISPLAYBT2020SRGBV23035
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_UICONTEXT_GET_PARAM_042
     * @tc.desc   Test componentSnapshot.get with colorSpace DISPLAY_BT2020_SRGB using UIContext callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpaceDISPLAYBT2020SRGBV23035', Level.LEVEL0, async () => {
      console.info('[getColorSpaceDISPLAYBT2020SRGBV23035] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace27'));
      await button.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getColorSpaceDISPLAYBT2020SRGBV23035] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[getColorSpaceDISPLAYBT2020SRGBV23035] END');
    });
  })
}
