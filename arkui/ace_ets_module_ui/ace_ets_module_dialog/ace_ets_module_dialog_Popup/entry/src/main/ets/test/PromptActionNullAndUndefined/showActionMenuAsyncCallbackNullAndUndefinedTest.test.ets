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

export default function showActionMenuAsyncCallbackNullAndUndefinedTest() {
  describe('showActionMenuAsyncCallbackNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("showActionMenuAsyncCallbackNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PromptActionNullAndUndefined/ShowActionMenuAsyncCallbackNullAndUndefined'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get showActionMenuAsyncCallbackNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("ShowActionMenuAsyncCallbackNullAndUndefined" == pages.name)) {
          console.info("get showActionMenuAsyncCallbackNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push showActionMenuAsyncCallbackNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showActionMenuAsyncCallbackNullAndUndefinedTest page error: " + err);
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
      
      console.info("showActionMenuAsyncCallbackNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   showActionMenuAsyncCallbackShowInSubWindowTrue001
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUASYNCCALLBACK_SHOWINSUBWINDOW_001
     * @tc.desc   Test showActionMenu AsyncCallback with showInSubWindow true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuAsyncCallbackShowInSubWindowTrue001', Level.LEVEL0, async () => {
      console.info('[showActionMenuAsyncCallbackShowInSubWindowTrue001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnShowInSubWindowTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowAsyncCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuAsyncCallbackShowInSubWindowTrue001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Init');
      console.info('[showActionMenuAsyncCallbackShowInSubWindowTrue001] END');
    });

    /**
     * @tc.name   showActionMenuAsyncCallbackShowInSubWindowFalse002
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUASYNCCALLBACK_SHOWINSUBWINDOW_002
     * @tc.desc   Test showActionMenu AsyncCallback with showInSubWindow false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuAsyncCallbackShowInSubWindowFalse002', Level.LEVEL0, async () => {
      console.info('[showActionMenuAsyncCallbackShowInSubWindowFalse002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnShowInSubWindowFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowAsyncCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuAsyncCallbackShowInSubWindowFalse002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('showInSubWindow true');
      console.info('[showActionMenuAsyncCallbackShowInSubWindowFalse002] END');
    });

    /**
     * @tc.name   showActionMenuAsyncCallbackIsModalTrue003
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUASYNCCALLBACK_ISMODAL_003
     * @tc.desc   Test showActionMenu AsyncCallback with isModal true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuAsyncCallbackIsModalTrue003', Level.LEVEL0, async () => {
      console.info('[showActionMenuAsyncCallbackIsModalTrue003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnIsModalTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowAsyncCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuAsyncCallbackIsModalTrue003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('showInSubWindow false');
      console.info('[showActionMenuAsyncCallbackIsModalTrue003] END');
    });

    /**
     * @tc.name   showActionMenuAsyncCallbackIsModalFalse004
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUASYNCCALLBACK_ISMODAL_004
     * @tc.desc   Test showActionMenu AsyncCallback with isModal false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuAsyncCallbackIsModalFalse004', Level.LEVEL0, async () => {
      console.info('[showActionMenuAsyncCallbackIsModalFalse004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnIsModalFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowAsyncCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuAsyncCallbackIsModalFalse004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('isModal true');
      console.info('[showActionMenuAsyncCallbackIsModalFalse004] END');
    });

    /**
     * @tc.name   showActionMenuAsyncCallbackLevelModeOverlay005
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUASYNCCALLBACK_LEVELMODE_005
     * @tc.desc   Test showActionMenu AsyncCallback with levelMode OVERLAY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuAsyncCallbackLevelModeOverlay005', Level.LEVEL0, async () => {
      console.info('[showActionMenuAsyncCallbackLevelModeOverlay005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnLevelModeOverlay'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowAsyncCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuAsyncCallbackLevelModeOverlay005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('isModal false');
      console.info('[showActionMenuAsyncCallbackLevelModeOverlay005] END');
    });

    /**
     * @tc.name   showActionMenuAsyncCallbackLevelModeEmbedded006
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUASYNCCALLBACK_LEVELMODE_006
     * @tc.desc   Test showActionMenu AsyncCallback with levelMode EMBEDDED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuAsyncCallbackLevelModeEmbedded006', Level.LEVEL0, async () => {
      console.info('[showActionMenuAsyncCallbackLevelModeEmbedded006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnLevelModeEmbedded'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowAsyncCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuAsyncCallbackLevelModeEmbedded006] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('levelMode OVERLAY');
      console.info('[showActionMenuAsyncCallbackLevelModeEmbedded006] END');
    });

    /**
     * @tc.name   showActionMenuAsyncCallbackImmersiveModeDefault007
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUASYNCCALLBACK_IMMERSIVEMODE_007
     * @tc.desc   Test showActionMenu AsyncCallback with immersiveMode DEFAULT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuAsyncCallbackImmersiveModeDefault007', Level.LEVEL0, async () => {
      console.info('[showActionMenuAsyncCallbackImmersiveModeDefault007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnImmersiveModeDefault'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowAsyncCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuAsyncCallbackImmersiveModeDefault007] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('levelMode EMBEDDED');
      console.info('[showActionMenuAsyncCallbackImmersiveModeDefault007] END');
    });

    /**
     * @tc.name   showActionMenuAsyncCallbackImmersiveModeExtend008
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUASYNCCALLBACK_IMMERSIVEMODE_008
     * @tc.desc   Test showActionMenu AsyncCallback with immersiveMode EXTEND.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuAsyncCallbackImmersiveModeExtend008', Level.LEVEL0, async () => {
      console.info('[showActionMenuAsyncCallbackImmersiveModeExtend008] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnImmersiveModeExtend'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowAsyncCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuAsyncCallbackImmersiveModeExtend008] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('immersiveMode DEFAULT');
      console.info('[showActionMenuAsyncCallbackImmersiveModeExtend008] END');
    });

    /**
     * @tc.name   showActionMenuAsyncCallbackOptionsNull009
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUASYNCCALLBACK_OPTIONS_009
     * @tc.desc   Test showActionMenu AsyncCallback with options null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuAsyncCallbackOptionsNull009', Level.LEVEL0, async () => {
      console.info('[showActionMenuAsyncCallbackOptionsNull009] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOptionsNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowAsyncCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuAsyncCallbackOptionsNull009] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('ptions null catch');
      console.info('[showActionMenuAsyncCallbackOptionsNull009] END');
    });

    /**
     * @tc.name   showActionMenuAsyncCallbackOptionsUndefined010
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUASYNCCALLBACK_OPTIONS_010
     * @tc.desc   Test showActionMenu AsyncCallback with options undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuAsyncCallbackOptionsUndefined010', Level.LEVEL0, async () => {
      console.info('[showActionMenuAsyncCallbackOptionsUndefined010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOptionsUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowAsyncCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuAsyncCallbackOptionsUndefined010] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('options undefined catch');
      console.info('[showActionMenuAsyncCallbackOptionsUndefined010] END');
    });

    /**
     * @tc.name   showActionMenuAsyncCallbackCallbackNull011
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUASYNCCALLBACK_CALLBACK_011
     * @tc.desc   Test showActionMenu AsyncCallback with callback null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuAsyncCallbackCallbackNull011', Level.LEVEL0, async () => {
      console.info('[showActionMenuAsyncCallbackCallbackNull011] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnCallbackNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowAsyncCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuAsyncCallbackCallbackNull011] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('callback null');
      console.info('[showActionMenuAsyncCallbackCallbackNull011] END');
    });

    /**
     * @tc.name   showActionMenuAsyncCallbackCallbackUndefined012
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENUASYNCCALLBACK_CALLBACK_012
     * @tc.desc   Test showActionMenu AsyncCallback with callback undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuAsyncCallbackCallbackUndefined012', Level.LEVEL0, async () => {
      console.info('[showActionMenuAsyncCallbackCallbackUndefined012] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnCallbackUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShowAsyncCallback');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuAsyncCallbackCallbackUndefined012] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('callback undefined');
      console.info('[showActionMenuAsyncCallbackCallbackUndefined012] END');
    });
  })
}
