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

export default function showActionMenuNullAndUndefinedTest() {
  describe('showActionMenuNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("showActionMenuNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PromptActionNullAndUndefined/ShowActionMenuNullAndUndefined'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get showActionMenuNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("ShowActionMenuNullAndUndefined" == pages.name)) {
          console.info("get showActionMenuNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push showActionMenuNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showActionMenuNullAndUndefinedTest page error: " + err);
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
      
      console.info("showActionMenuNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   showActionMenuShowInSubWindowTrue001
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENU_SHOWINSUBWINDOW_001
     * @tc.desc   Test showActionMenu with showInSubWindow true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuShowInSubWindowTrue001', Level.LEVEL0, async () => {
      console.info('[showActionMenuShowInSubWindowTrue001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnShowInSubWindowTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuShowInSubWindowTrue001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('Init');
      console.info('[showActionMenuShowInSubWindowTrue001] END');
    });

    /**
     * @tc.name   showActionMenuShowInSubWindowFalse002
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENU_SHOWINSUBWINDOW_002
     * @tc.desc   Test showActionMenu with showInSubWindow false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuShowInSubWindowFalse002', Level.LEVEL0, async () => {
      console.info('[showActionMenuShowInSubWindowFalse002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnShowInSubWindowFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuShowInSubWindowFalse002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('showInSubWindow true');
      console.info('[showActionMenuShowInSubWindowFalse002] END');
    });

    /**
     * @tc.name   showActionMenuIsModalTrue003
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENU_ISMODAL_003
     * @tc.desc   Test showActionMenu with isModal true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuIsModalTrue003', Level.LEVEL0, async () => {
      console.info('[showActionMenuIsModalTrue003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnIsModalTrue'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuIsModalTrue003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('showInSubWindow false');
      console.info('[showActionMenuIsModalTrue003] END');
    });

    /**
     * @tc.name   showActionMenuIsModalFalse004
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENU_ISMODAL_004
     * @tc.desc   Test showActionMenu with isModal false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuIsModalFalse004', Level.LEVEL0, async () => {
      console.info('[showActionMenuIsModalFalse004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnIsModalFalse'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuIsModalFalse004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('isModal true');
      console.info('[showActionMenuIsModalFalse004] END');
    });

    /**
     * @tc.name   showActionMenuLevelModeOverlay005
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENU_LEVELMODE_005
     * @tc.desc   Test showActionMenu with levelMode OVERLAY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuLevelModeOverlay005', Level.LEVEL0, async () => {
      console.info('[showActionMenuLevelModeOverlay005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnLevelModeOverlay'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuLevelModeOverlay005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('isModal false');
      console.info('[showActionMenuLevelModeOverlay005] END');
    });

    /**
     * @tc.name   showActionMenuLevelModeEmbedded006
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENU_LEVELMODE_006
     * @tc.desc   Test showActionMenu with levelMode EMBEDDED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuLevelModeEmbedded006', Level.LEVEL0, async () => {
      console.info('[showActionMenuLevelModeEmbedded006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnLevelModeEmbedded'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuLevelModeEmbedded006] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('levelMode OVERLAY');
      console.info('[showActionMenuLevelModeEmbedded006] END');
    });

    /**
     * @tc.name   showActionMenuImmersiveModeDefault007
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENU_IMMERSIVEMODE_007
     * @tc.desc   Test showActionMenu with immersiveMode DEFAULT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuImmersiveModeDefault007', Level.LEVEL0, async () => {
      console.info('[showActionMenuImmersiveModeDefault007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnImmersiveModeDefault'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuImmersiveModeDefault007] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('levelMode EMBEDDED');
      console.info('[showActionMenuImmersiveModeDefault007] END');
    });

    /**
     * @tc.name   showActionMenuImmersiveModeExtend008
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENU_IMMERSIVEMODE_008
     * @tc.desc   Test showActionMenu with immersiveMode EXTEND.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuImmersiveModeExtend008', Level.LEVEL0, async () => {
      console.info('[showActionMenuImmersiveModeExtend008] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnImmersiveModeExtend'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuImmersiveModeExtend008] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('immersiveMode DEFAULT');
      console.info('[showActionMenuImmersiveModeExtend008] END');
    });

    /**
     * @tc.name   showActionMenuOptionsNull009
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENU_OPTIONS_009
     * @tc.desc   Test showActionMenu with options null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuOptionsNull009', Level.LEVEL0, async () => {
      console.info('[showActionMenuOptionsNull009] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOptionsNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuOptionsNull009] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('options null');
      console.info('[showActionMenuOptionsNull009] END');
    });

    /**
     * @tc.name   showActionMenuOptionsUndefined010
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWACTIONMENU_OPTIONS_010
     * @tc.desc   Test showActionMenu with options undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showActionMenuOptionsUndefined010', Level.LEVEL0, async () => {
      console.info('[showActionMenuOptionsUndefined010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOptionsUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextShow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[showActionMenuOptionsUndefined010] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('options undefined');
      console.info('[showActionMenuOptionsUndefined010] END');
    });
  })
}
