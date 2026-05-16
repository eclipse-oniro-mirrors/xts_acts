/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of this License at
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
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function updateCustomDialogNullAndUndefinedTest() {
  describe('updateCustomDialogNullAndUndefinedTest', () => {
    beforeEach(async () => {
      console.info("updateCustomDialogNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PromptActionNullAndUndefined/UpdateCustomDialogNullAndUndefined'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get updateCustomDialogNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("UpdateCustomDialogNullAndUndefined" == pages.name)) {
          console.info("get updateCustomDialogNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push updateCustomDialogNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push updateCustomDialogNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      try {
        let driver: Driver = Driver.create();
        let closeButton = await driver.findComponent(ON.text('Close'));
        if (closeButton) {
          await closeButton.click();
          await CommonFunc.sleep(500);
        }
      } catch (err) {
        console.error('afterEach close dialog error: ' + (err as BusinessError).code);
      }
      console.info("updateCustomDialogNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   updateCustomDialogShowInSubWindowTrue001
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_SHOWINSUBWINDOW_001
     * @tc.desc   Test updateCustomDialog with showInSubWindow true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogShowInSubWindowTrue001', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogShowInSubWindowTrue001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnShowInSubWindowTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogShowInSubWindowTrue001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Init');
      console.info('[updateCustomDialogShowInSubWindowTrue001] END');
    });

    /**
     * @tc.name   updateCustomDialogShowInSubWindowFalse002
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_SHOWINSUBWINDOW_002
     * @tc.desc   Test updateCustomDialog with showInSubWindow false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogShowInSubWindowFalse002', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogShowInSubWindowFalse002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnShowInSubWindowFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogShowInSubWindowFalse002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('showInSubWindow false error: 103303');
      console.info('[updateCustomDialogShowInSubWindowFalse002] END');
    });

    /**
     * @tc.name   updateCustomDialogIsModalTrue001
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_ISMODAL_001
     * @tc.desc   Test updateCustomDialog with isModal true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogIsModalTrue001', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogIsModalTrue001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnIsModalTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogIsModalTrue001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('isModal true error: 103303');
      console.info('[updateCustomDialogIsModalTrue001] END');
    });

    /**
     * @tc.name   updateCustomDialogIsModalFalse002
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_ISMODAL_002
     * @tc.desc   Test updateCustomDialog with isModal false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogIsModalFalse002', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogIsModalFalse002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnIsModalFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogIsModalFalse002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('103303');
      console.info('[updateCustomDialogIsModalFalse002] END');
    });

    /**
     * @tc.name   updateCustomDialogContentNull001
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_PARAM_001
     * @tc.desc   Test updateCustomDialog with content null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogContentNull001', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogContentNull001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnContentNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogContentNull001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('content null catch');
      console.info('[updateCustomDialogContentNull001] END');
    });

    /**
     * @tc.name   updateCustomDialogContentUndefined002
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_PARAM_002
     * @tc.desc   Test updateCustomDialog with content undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogContentUndefined002', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogContentUndefined002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnContentUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogContentUndefined002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('content undefined catch');
      console.info('[updateCustomDialogContentUndefined002] END');
    });

    /**
     * @tc.name   updateCustomDialogAutoCancelTrue003
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_AUTOCANCEL_003
     * @tc.desc   Test updateCustomDialog with autoCancel true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogAutoCancelTrue003', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogAutoCancelTrue003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnAutoCancelTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogAutoCancelTrue003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('autoCancel true error');
      console.info('[updateCustomDialogAutoCancelTrue003] END');
    });

    /**
     * @tc.name   updateCustomDialogAutoCancelFalse004
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_AUTOCANCEL_004
     * @tc.desc   Test updateCustomDialog with autoCancel false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogAutoCancelFalse004', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogAutoCancelFalse004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnAutoCancelFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogAutoCancelFalse004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('autoCancel false error');
      console.info('[updateCustomDialogAutoCancelFalse004] END');
    });

    /**
     * @tc.name   updateCustomDialogEnableHoverModeTrue005
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_ENABLEHOVERMODE_005
     * @tc.desc   Test updateCustomDialog with enableHoverMode true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogEnableHoverModeTrue005', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogEnableHoverModeTrue005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnEnableHoverModeTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogEnableHoverModeTrue005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('enableHoverMode true error');
      console.info('[updateCustomDialogEnableHoverModeTrue005] END');
    });

    /**
     * @tc.name   updateCustomDialogEnableHoverModeFalse006
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_ENABLEHOVERMODE_006
     * @tc.desc   Test updateCustomDialog with enableHoverMode false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogEnableHoverModeFalse006', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogEnableHoverModeFalse006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnEnableHoverModeFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogEnableHoverModeFalse006] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('enableHoverMode false error');
      console.info('[updateCustomDialogEnableHoverModeFalse006] END');
    });

    /**
     * @tc.name   updateCustomDialogLevelModeOverlay007
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_LEVELMODE_007
     * @tc.desc   Test updateCustomDialog with levelMode OVERLAY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogLevelModeOverlay007', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogLevelModeOverlay007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnLevelModeOverlay'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogLevelModeOverlay007] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('levelMode OVERLAY error');
      console.info('[updateCustomDialogLevelModeOverlay007] END');
    });

    /**
     * @tc.name   updateCustomDialogLevelModeEmbedded008
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_LEVELMODE_008
     * @tc.desc   Test updateCustomDialog with levelMode EMBEDDED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogLevelModeEmbedded008', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogLevelModeEmbedded008] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnLevelModeEmbedded'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogLevelModeEmbedded008] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('levelMode EMBEDDED error');
      console.info('[updateCustomDialogLevelModeEmbedded008] END');
    });

    /**
     * @tc.name   updateCustomDialogImmersiveModeDefault009
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_IMMERSIVEMODE_009
     * @tc.desc   Test updateCustomDialog with immersiveMode DEFAULT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogImmersiveModeDefault009', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogImmersiveModeDefault009] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnImmersiveModeDefault'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogImmersiveModeDefault009] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('immersiveMode DEFAULT error');
      console.info('[updateCustomDialogImmersiveModeDefault009] END');
    });

    /**
     * @tc.name   updateCustomDialogImmersiveModeExtend010
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_IMMERSIVEMODE_010
     * @tc.desc   Test updateCustomDialog with immersiveMode EXTEND.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogImmersiveModeExtend010', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogImmersiveModeExtend010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnImmersiveModeExtend'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogImmersiveModeExtend010] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('immersiveMode EXTEND error');
      console.info('[updateCustomDialogImmersiveModeExtend010] END');
    });

    /**
     * @tc.name   updateCustomDialogFocusableTrue011
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_FOCUSABLE_011
     * @tc.desc   Test updateCustomDialog with focusable true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogFocusableTrue011', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogFocusableTrue011] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnFocusableTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogFocusableTrue011] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('focusable true error');
      console.info('[updateCustomDialogFocusableTrue011] END');
    });

    /**
     * @tc.name   updateCustomDialogFocusableFalse012
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_FOCUSABLE_012
     * @tc.desc   Test updateCustomDialog with focusable false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogFocusableFalse012', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogFocusableFalse012] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnFocusableFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogFocusableFalse012] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('focusable false error');
      console.info('[updateCustomDialogFocusableFalse012] END');
    });

    /**
     * @tc.name   updateCustomDialogOptionsNull013
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_OPTIONS_013
     * @tc.desc   Test updateCustomDialog with options null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogOptionsNull013', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogOptionsNull013] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOptionsNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogOptionsNull013] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('options null catch: 401');
      console.info('[updateCustomDialogOptionsNull013] END');
    });

    /**
     * @tc.name   updateCustomDialogOptionsUndefined014
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATECUSTOMDIALOG_OPTIONS_014
     * @tc.desc   Test updateCustomDialog with options undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updateCustomDialogOptionsUndefined014', Level.LEVEL0, async () => {
      console.info('[updateCustomDialogOptionsUndefined014] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOptionsUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdateCustomDialog');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialogOptionsUndefined014] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('options undefined catch: 401');
      console.info('[updateCustomDialogOptionsUndefined014] END');
    });
  })
}
