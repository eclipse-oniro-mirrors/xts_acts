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
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function showActionMenuCallbackNullAndUndefinedTest() {
  describe('showActionMenuCallbackNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("showActionMenuCallbackNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PromptActionNullAndUndefined/ShowActionMenuCallbackNullAndUndefined'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get showActionMenuCallbackNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("ShowActionMenuCallbackNullAndUndefined" == pages.name)) {
          console.info("get showActionMenuCallbackNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push showActionMenuCallbackNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showActionMenuCallbackNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      
      try {
        let driver: Driver = Driver.create();
        let menuItem = await driver.findComponent(ON.text('item1'));
        if (menuItem) {
          await menuItem.click();
          await CommonFunc.sleep(500);
          console.info('ActionMenu closed by clicking item1');
        }
      } catch (err) {
        console.info('ActionMenu not found or already closed');
      }
      
      console.info("showActionMenuCallbackNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   showActionMenuCallbackShowInSubWindowTrue001
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUCALLBACK_SHOWINSUBWINDOW_001
     * @tc.desc   Test showActionMenu callback with showInSubWindow true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuCallbackShowInSubWindowTrue001', Level.LEVEL0, async () => {
      console.info('[showActionMenuCallbackShowInSubWindowTrue001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnShowInSubWindowTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuCallbackShowInSubWindowTrue001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Init');
      console.info('[showActionMenuCallbackShowInSubWindowTrue001] END');
    });

    /**
     * @tc.name   showActionMenuCallbackShowInSubWindowFalse002
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUCALLBACK_SHOWINSUBWINDOW_002
     * @tc.desc   Test showActionMenu callback with showInSubWindow false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuCallbackShowInSubWindowFalse002', Level.LEVEL0, async () => {
      console.info('[showActionMenuCallbackShowInSubWindowFalse002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnShowInSubWindowFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuCallbackShowInSubWindowFalse002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('showInSubWindow true: 0');
      console.info('[showActionMenuCallbackShowInSubWindowFalse002] END');
    });

    /**
     * @tc.name   showActionMenuCallbackIsModalTrue003
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUCALLBACK_ISMODAL_003
     * @tc.desc   Test showActionMenu callback with isModal true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuCallbackIsModalTrue003', Level.LEVEL0, async () => {
      console.info('[showActionMenuCallbackIsModalTrue003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnIsModalTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuCallbackIsModalTrue003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('showInSubWindow false');
      console.info('[showActionMenuCallbackIsModalTrue003] END');
    });

    /**
     * @tc.name   showActionMenuCallbackIsModalFalse004
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUCALLBACK_ISMODAL_004
     * @tc.desc   Test showActionMenu callback with isModal false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuCallbackIsModalFalse004', Level.LEVEL0, async () => {
      console.info('[showActionMenuCallbackIsModalFalse004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnIsModalFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuCallbackIsModalFalse004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('isModal true');
      console.info('[showActionMenuCallbackIsModalFalse004] END');
    });

    /**
     * @tc.name   showActionMenuCallbackLevelModeOverlay005
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUCALLBACK_LEVELMODE_005
     * @tc.desc   Test showActionMenu callback with levelMode OVERLAY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuCallbackLevelModeOverlay005', Level.LEVEL0, async () => {
      console.info('[showActionMenuCallbackLevelModeOverlay005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnLevelModeOverlay'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuCallbackLevelModeOverlay005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('isModal false');
      console.info('[showActionMenuCallbackLevelModeOverlay005] END');
    });

    /**
     * @tc.name   showActionMenuCallbackLevelModeEmbedded006
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUCALLBACK_LEVELMODE_006
     * @tc.desc   Test showActionMenu callback with levelMode EMBEDDED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuCallbackLevelModeEmbedded006', Level.LEVEL0, async () => {
      console.info('[showActionMenuCallbackLevelModeEmbedded006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnLevelModeEmbedded'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuCallbackLevelModeEmbedded006] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('levelMode OVERLAY');
      console.info('[showActionMenuCallbackLevelModeEmbedded006] END');
    });

    /**
     * @tc.name   showActionMenuCallbackImmersiveModeDefault007
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUCALLBACK_IMMERSIVEMODE_007
     * @tc.desc   Test showActionMenu callback with immersiveMode DEFAULT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuCallbackImmersiveModeDefault007', Level.LEVEL0, async () => {
      console.info('[showActionMenuCallbackImmersiveModeDefault007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnImmersiveModeDefault'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuCallbackImmersiveModeDefault007] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('levelMode EMBEDDED');
      console.info('[showActionMenuCallbackImmersiveModeDefault007] END');
    });

    /**
     * @tc.name   showActionMenuCallbackImmersiveModeExtend008
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUCALLBACK_IMMERSIVEMODE_008
     * @tc.desc   Test showActionMenu callback with immersiveMode EXTEND.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuCallbackImmersiveModeExtend008', Level.LEVEL0, async () => {
      console.info('[showActionMenuCallbackImmersiveModeExtend008] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnImmersiveModeExtend'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuCallbackImmersiveModeExtend008] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('immersiveMode DEFAULT');
      console.info('[showActionMenuCallbackImmersiveModeExtend008] END');
    });

    /**
     * @tc.name   showActionMenuCallbackOptionsNull009
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUCALLBACK_OPTIONS_009
     * @tc.desc   Test showActionMenu callback with options null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuCallbackOptionsNull009', Level.LEVEL0, async () => {
      console.info('[showActionMenuCallbackOptionsNull009] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOptionsNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuCallbackOptionsNull009] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('options null catch');
      console.info('[showActionMenuCallbackOptionsNull009] END');
    });

    /**
     * @tc.name   showActionMenuCallbackOptionsUndefined010
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUCALLBACK_OPTIONS_010
     * @tc.desc   Test showActionMenu callback with options undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuCallbackOptionsUndefined010', Level.LEVEL0, async () => {
      console.info('[showActionMenuCallbackOptionsUndefined010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOptionsUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuCallbackOptionsUndefined010] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('options undefined catch');
      console.info('[showActionMenuCallbackOptionsUndefined010] END');
    });

    /**
     * @tc.name   showActionMenuCallbackCallbackNull011
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUCALLBACK_CALLBACK_011
     * @tc.desc   Test showActionMenu callback with callback null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuCallbackCallbackNull011', Level.LEVEL0, async () => {
      console.info('[showActionMenuCallbackCallbackNull011] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnCallbackNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuCallbackCallbackNull011] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('callback null');
      console.info('[showActionMenuCallbackCallbackNull011] END');
    });

    /**
     * @tc.name   showActionMenuCallbackCallbackUndefined012
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUCALLBACK_CALLBACK_012
     * @tc.desc   Test showActionMenu callback with callback undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuCallbackCallbackUndefined012', Level.LEVEL0, async () => {
      console.info('[showActionMenuCallbackCallbackUndefined012] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnCallbackUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuCallbackCallbackUndefined012] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('callback undefined');
      console.info('[showActionMenuCallbackCallbackUndefined012] END');
    });
  })
}
