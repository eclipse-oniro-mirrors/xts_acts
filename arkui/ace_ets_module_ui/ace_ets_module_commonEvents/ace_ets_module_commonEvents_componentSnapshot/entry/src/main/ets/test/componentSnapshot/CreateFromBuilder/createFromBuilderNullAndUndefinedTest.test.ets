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

export default function createFromBuilderNullAndUndefined() {
  describe('createFromBuilderNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("createFromBuilderNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentSnapshot/CreateFromBuilder/CreateFromBuilderNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get createFromBuilderNullAndUndefined state success " + JSON.stringify(pages));
        if (!("CreateFromBuilderNullAndUndefined" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push createFromBuilderNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   delayNullV10003
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_003
     * @tc.desc   Test componentSnapshot.createFromBuilder with null delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('delayNullV10003', Level.LEVEL0, async () => {
      console.info('[delayNullV10003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDelayNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[delayNullV10003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[delayNullV10003] END');
    });

    /**
     * @tc.name   delayUndefinedV10004
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_004
     * @tc.desc   Test componentSnapshot.createFromBuilder with undefined delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('delayUndefinedV10004', Level.LEVEL0, async () => {
      console.info('[delayUndefinedV10004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDelayUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[delayUndefinedV10004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[delayUndefinedV10004] END');
    });

    /**
     * @tc.name   checkImageStatusTrueV10005
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_005
     * @tc.desc   Test componentSnapshot.createFromBuilder with checkImageStatus true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('checkImageStatusTrueV10005', Level.LEVEL0, async () => {
      console.info('[checkImageStatusTrueV10005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnCheckTrue'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[checkImageStatusTrueV10005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[checkImageStatusTrueV10005] END');
    });

    /**
     * @tc.name   checkImageStatusFalseV10006
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_006
     * @tc.desc   Test componentSnapshot.createFromBuilder with checkImageStatus false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('checkImageStatusFalseV10006', Level.LEVEL0, async () => {
      console.info('[checkImageStatusFalseV10006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnCheckFalse'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[checkImageStatusFalseV10006] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[checkImageStatusFalseV10006] END');
    });

    /**
     * @tc.name   optionsNullV10007
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_007
     * @tc.desc   Test componentSnapshot.createFromBuilder with null options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('optionsNullV10007', Level.LEVEL0, async () => {
      console.info('[optionsNullV10007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[optionsNullV10007] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[optionsNullV10007] END');
    });

    /**
     * @tc.name   optionsUndefinedV10008
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_008
     * @tc.desc   Test componentSnapshot.createFromBuilder with undefined options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('optionsUndefinedV10008', Level.LEVEL0, async () => {
      console.info('[optionsUndefinedV10008] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnOptionsUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[optionsUndefinedV10008] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[optionsUndefinedV10008] END');
    });

    /**
     * @tc.name   waitTrueV10009
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_009
     * @tc.desc   Test componentSnapshot.createFromBuilder with waitUntilRenderFinished true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('waitTrueV10009', Level.LEVEL0, async () => {
      console.info('[waitTrueV10009] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitTrue'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waitTrueV10009] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[waitTrueV10009] END');
    });

    /**
     * @tc.name   waitFalseV10010
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_010
     * @tc.desc   Test componentSnapshot.createFromBuilder with waitUntilRenderFinished false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('waitFalseV10010', Level.LEVEL0, async () => {
      console.info('[waitFalseV10010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnWaitFalse'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waitFalseV10010] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Success');
      console.info('[waitFalseV10010] END');
    });

    /**
     * @tc.name   colorModeIsAutoFalseV10012
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_012
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorMode isAuto false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorModeIsAutoFalseV10012', Level.LEVEL0, async () => {
      console.info('[colorModeIsAutoFalseV10012] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorModeIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorModeIsAutoFalseV10012] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorModeIsAutoFalseV10012] END');
    });

    /**
     * @tc.name   dynamicRangeModeHIGHV10013
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_013
     * @tc.desc   Test componentSnapshot.createFromBuilder with dynamicRangeMode HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dynamicRangeModeHIGHV10013', Level.LEVEL0, async () => {
      console.info('[dynamicRangeModeHIGHV10013] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrHIGH'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dynamicRangeModeHIGHV10013] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[dynamicRangeModeHIGHV10013] END');
    });

    /**
     * @tc.name   dynamicRangeModeCONSTRAINTV10014
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_014
     * @tc.desc   Test componentSnapshot.createFromBuilder with dynamicRangeMode CONSTRAINT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dynamicRangeModeCONSTRAINTV10014', Level.LEVEL0, async () => {
      console.info('[dynamicRangeModeCONSTRAINTV10014] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrCONSTRAINT'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dynamicRangeModeCONSTRAINTV10014] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[dynamicRangeModeCONSTRAINTV10014] END');
    });

    /**
     * @tc.name   dynamicRangeModeSTANDARDV10015
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_015
     * @tc.desc   Test componentSnapshot.createFromBuilder with dynamicRangeMode STANDARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dynamicRangeModeSTANDARDV10015', Level.LEVEL0, async () => {
      console.info('[dynamicRangeModeSTANDARDV10015] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrSTANDARD'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dynamicRangeModeSTANDARDV10015] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[dynamicRangeModeSTANDARDV10015] END');
    });

    /**
     * @tc.name   dynamicRangeModeIsAutoFalseV10017
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_017
     * @tc.desc   Test componentSnapshot.createFromBuilder with dynamicRangeMode isAuto false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dynamicRangeModeIsAutoFalseV10017', Level.LEVEL0, async () => {
      console.info('[dynamicRangeModeIsAutoFalseV10017] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnDrIsAutoFalse'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dynamicRangeModeIsAutoFalseV10017] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[dynamicRangeModeIsAutoFalseV10017] END');
    });

    /**
     * @tc.name   colorSpace0V10018
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_018
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace0V10018', Level.LEVEL0, async () => {
      console.info('[colorSpace0V10018] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace0'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace0V10018] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace0V10018] END');
    });

    /**
     * @tc.name   colorSpace1V10019
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_019
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace ADOBE_RGB_1998
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace1V10019', Level.LEVEL0, async () => {
      console.info('[colorSpace1V10019] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace1V10019] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace1V10019] END');
    });

    /**
     * @tc.name   colorSpace2V10020
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_020
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace DCI_P3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace2V10020', Level.LEVEL0, async () => {
      console.info('[colorSpace2V10020] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace2V10020] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace2V10020] END');
    });

    /**
     * @tc.name   colorSpace3V10021
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_021
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace DISPLAY_P3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace3V10021', Level.LEVEL0, async () => {
      console.info('[colorSpace3V10021] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace3V10021] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace3V10021] END');
    });

    /**
     * @tc.name   colorSpace4V10022
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_022
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace SRGB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace4V10022', Level.LEVEL0, async () => {
      console.info('[colorSpace4V10022] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace4V10022] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace4V10022] END');
    });

    /**
     * @tc.name   colorSpace5V10023
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_023
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace CUSTOM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace5V10023', Level.LEVEL0, async () => {
      console.info('[colorSpace5V10023] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace5V10023] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace5V10023] END');
    });

    /**
     * @tc.name   colorSpace6V10024
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_024
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace BT709
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace6V10024', Level.LEVEL0, async () => {
      console.info('[colorSpace6V10024] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace6'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace6V10024] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace6V10024] END');
    });

    /**
     * @tc.name   colorSpace7V10025
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_025
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace BT601_EBU
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace7V10025', Level.LEVEL0, async () => {
      console.info('[colorSpace7V10025] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace7'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace7V10025] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace7V10025] END');
    });

    /**
     * @tc.name   colorSpace8V10026
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_026
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace BT601_SMPTE_C
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace8V10026', Level.LEVEL0, async () => {
      console.info('[colorSpace8V10026] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace8'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace8V10026] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace8V10026] END');
    });

    /**
     * @tc.name   colorSpace9V10027
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_027
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace BT2020_HLG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace9V10027', Level.LEVEL0, async () => {
      console.info('[colorSpace9V10027] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace9'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace9V10027] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace9V10027] END');
    });

    /**
     * @tc.name   colorSpace10V10028
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_028
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace BT2020_PQ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace10V10028', Level.LEVEL0, async () => {
      console.info('[colorSpace10V10028] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace10'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace10V10028] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace10V10028] END');
    });

    /**
     * @tc.name   colorSpace11V10029
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_029
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace P3_HLG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace11V10029', Level.LEVEL0, async () => {
      console.info('[colorSpace11V10029] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace11'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace11V10029] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace11V10029] END');
    });

    /**
     * @tc.name   colorSpace12V10030
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_030
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace P3_PQ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace12V10030', Level.LEVEL0, async () => {
      console.info('[colorSpace12V10030] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace12'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace12V10030] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace12V10030] END');
    });

    /**
     * @tc.name   colorSpace13V10031
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_031
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace ADOBE_RGB_1998_LIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace13V10031', Level.LEVEL0, async () => {
      console.info('[colorSpace13V10031] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace13'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace13V10031] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace13V10031] END');
    });

    /**
     * @tc.name   colorSpace14V10032
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_032
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace DISPLAY_P3_LIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace14V10032', Level.LEVEL0, async () => {
      console.info('[colorSpace14V10032] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace14'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace14V10032] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace14V10032] END');
    });

    /**
     * @tc.name   colorSpace15V10033
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_033
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace SRGB_LIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace15V10033', Level.LEVEL0, async () => {
      console.info('[colorSpace15V10033] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace15'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace15V10033] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace15V10033] END');
    });

    /**
     * @tc.name   colorSpace16V10034
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_034
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace BT709_LIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace16V10034', Level.LEVEL0, async () => {
      console.info('[colorSpace16V10034] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace16'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace16V10034] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace16V10034] END');
    });

    /**
     * @tc.name   colorSpace17V10035
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_035
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace BT601_EBU_LIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace17V10035', Level.LEVEL0, async () => {
      console.info('[colorSpace17V10035] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace17'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace17V10035] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace17V10035] END');
    });

    /**
     * @tc.name   colorSpace18V10036
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_036
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace BT601_SMPTE_C_LIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace18V10036', Level.LEVEL0, async () => {
      console.info('[colorSpace18V10036] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace18'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace18V10036] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace18V10036] END');
    });

    /**
     * @tc.name   colorSpace19V10037
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_037
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace BT2020_HLG_LIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace19V10037', Level.LEVEL0, async () => {
      console.info('[colorSpace19V10037] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace19'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace19V10037] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace19V10037] END');
    });

    /**
     * @tc.name   colorSpace20V10038
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_038
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace BT2020_PQ_LIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace20V10038', Level.LEVEL0, async () => {
      console.info('[colorSpace20V10038] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace20'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace20V10038] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace20V10038] END');
    });

    /**
     * @tc.name   colorSpace21V10039
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_039
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace P3_HLG_LIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace21V10039', Level.LEVEL0, async () => {
      console.info('[colorSpace21V10039] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace21'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace21V10039] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace21V10039] END');
    });

    /**
     * @tc.name   colorSpace22V10040
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_040
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace P3_PQ_LIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace22V10040', Level.LEVEL0, async () => {
      console.info('[colorSpace22V10040] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace22'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace22V10040] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace22V10040] END');
    });

    /**
     * @tc.name   colorSpace23V10041
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_041
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace LINEAR_P3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace23V10041', Level.LEVEL0, async () => {
      console.info('[colorSpace23V10041] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace23'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace23V10041] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace23V10041] END');
    });

    /**
     * @tc.name   colorSpace24V10042
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_042
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace LINEAR_SRGB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace24V10042', Level.LEVEL0, async () => {
      console.info('[colorSpace24V10042] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace24'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace24V10042] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace24V10042] END');
    });

    /**
     * @tc.name   colorSpace25V10043
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_043
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace LINEAR_BT2020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace25V10043', Level.LEVEL0, async () => {
      console.info('[colorSpace25V10043] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace25'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace25V10043] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace25V10043] END');
    });

    /**
     * @tc.name   colorSpace26V10044
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_044
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace H_LOG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace26V10044', Level.LEVEL0, async () => {
      console.info('[colorSpace26V10044] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace26'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace26V10044] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace26V10044] END');
    });

    /**
     * @tc.name   colorSpace27V10045
     * @tc.number SUB_ARKUI_COMPONENTSNAPSHOT_CREATEFROMBUILDER_PARAM_045
     * @tc.desc   Test componentSnapshot.createFromBuilder with colorSpace DISPLAY_BT2020_SRGB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('colorSpace27V10045', Level.LEVEL0, async () => {
      console.info('[colorSpace27V10045] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('btnColorSpace27'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[colorSpace27V10045] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Success');
      console.info('[colorSpace27V10045] END');
    });
  })
}
