/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


export default function RichEditor3() {
  describe('RichEditor3', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditor3 state pages:" + JSON.stringify(pages));
        if (!("RichEditor3" == pages.name)) {
          console.info("get RichEditor3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          console.info("push RichEditor3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor3 page error:" + err);
      }
      console.info("RichEditor3 beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor3 after each called");
    });
    /**
     * @tc.name   RichEditor3_0100
     * @tc.number RichEditor3_0100
     * @tc.desc   Test onIMEInputComplete callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditor3_0100', Level.LEVEL2, async (done: Function) => {
      // Test stop
      console.info('[RichEditor3_0100] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      
      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditorGetAttribute"));
      await RichEditorGetAttribute.inputText('1')
      let PSTextAlign = await driver.findComponent(ON.id("PSTextAlign"));
      let PSLeadingMargin = await driver.findComponent(ON.id("PSLeadingMargin"));
      let PSTextAlignText = await PSTextAlign.getText()
      let PSLeadingMarginText = await PSLeadingMargin.getText()
      expect(Boolean(PSTextAlignText)).assertTrue()
      expect(Boolean(PSLeadingMarginText)).assertTrue()
      await RichEditorGetAttribute.clearText()
      console.info('[RichEditor3_0100] END');
      done();
    });

    /**
     * @tc.name   RichEditor3_0200
     * @tc.number RichEditor3_0200
     * @tc.desc   Test getSPans callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditor3_0200', Level.LEVEL2, async (done: Function) => {
      // Test stop
      console.info('[RichEditor3_0200] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let setContent = await driver.findComponent(ON.id("setContent"));
      await setContent.click()
      let getSPans = await driver.findComponent(ON.id("getSPans"));
      await getSPans.click()
      let PSTextAlign = await driver.findComponent(ON.id("PSTextAlign"));
      let PSLeadingMargin = await driver.findComponent(ON.id("PSLeadingMargin"));
      let LSBorderRadius = await driver.findComponent(ON.id("LSBorderRadius"));
      let LSMargin = await driver.findComponent(ON.id("LSMargin"));
      let PSTextAlignText = await PSTextAlign.getText()
      let PSLeadingMarginText = await PSLeadingMargin.getText()
      let LSBorderRadiusText = await LSBorderRadius.getText()
      let LSMarginText = await LSMargin.getText()
      expect(Boolean(PSTextAlignText)).assertTrue()
      expect(Boolean(PSLeadingMarginText)).assertTrue()
      expect(Boolean(LSBorderRadiusText)).assertTrue()
      expect(Boolean(LSMarginText)).assertTrue()
      console.info('[RichEditor3_0200] END');
      done();
    });

    /**
     * @tc.name   RichEditor3_0300
     * @tc.number RichEditor3_0300
     * @tc.desc   Test onSelect callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditor3_0300', Level.LEVEL2, async (done: Function) => {
      // Test stop
      console.info('[RichEditor3_0300] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditorGetAttribute"));
      await RichEditorGetAttribute.clearText()
      let setContent = await driver.findComponent(ON.id("setContent"));
      await setContent.click()
      // doubleClick
      let richEditor = await driver.findComponent(ON.id('RichEditorGetAttribute'));
      let centerPoint = await richEditor.getBoundsCenter();
      let point = `${centerPoint.x} ${centerPoint.y}`;
      let cmd = `uinput -T -d ${point} -u ${point} -i 50 -d ${point} -u ${point}`;
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand(cmd);
      await driver.delayMs(500)
      let quanxuan = await driver.findComponent(ON.text("全选"));
      await quanxuan.click()
      let PSTextAlign = await driver.findComponent(ON.id("PSTextAlign"));
      let PSLeadingMargin = await driver.findComponent(ON.id("PSLeadingMargin"));
      let LSBorderRadius = await driver.findComponent(ON.id("LSBorderRadius"));
      let LSMargin = await driver.findComponent(ON.id("LSMargin"));
      let PSTextAlignText = await PSTextAlign.getText()
      let PSLeadingMarginText = await PSLeadingMargin.getText()
      let LSBorderRadiusText = await LSBorderRadius.getText()
      let LSMarginText = await LSMargin.getText()
      expect(Boolean(PSTextAlignText)).assertTrue()
      expect(Boolean(PSLeadingMarginText)).assertTrue()
      expect(Boolean(LSBorderRadiusText)).assertTrue()
      expect(Boolean(LSMarginText)).assertTrue()
      console.info('[RichEditor3_0300] END');
      done();
    });

    /**
     * @tc.name   RichEditor3_0400
     * @tc.number RichEditor3_0400
     * @tc.desc   Test getSelection callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditor3_0400', Level.LEVEL2, async (done: Function) => {
      // Test stop
      console.info('[RichEditor3_0400] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditorGetAttribute"));
      await RichEditorGetAttribute.clearText()
      let setContent = await driver.findComponent(ON.id("setContent"));
      await setContent.click()
      let richEditor = await driver.findComponent(ON.id('RichEditorGetAttribute'));
      let centerPoint = await richEditor.getBoundsCenter();
      let point = `${centerPoint.x} ${centerPoint.y}`;
      let cmd = `uinput -T -d ${point} -u ${point} -i 50 -d ${point} -u ${point}`;
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand(cmd);
      await driver.delayMs(500)
      let quanxuan = await driver.findComponent(ON.text("全选"));
      await quanxuan.click()
      let getSelection = await driver.findComponent(ON.id("getSelection"));
      await getSelection.click()
      await driver.delayMs(500)
      let PSTextAlign = await driver.findComponent(ON.id("PSTextAlign"));
      let PSLeadingMargin = await driver.findComponent(ON.id("PSLeadingMargin"));
      let LSBorderRadius = await driver.findComponent(ON.id("LSBorderRadius"));
      let LSMargin = await driver.findComponent(ON.id("LSMargin"));
      let PSTextAlignText = await PSTextAlign.getText()
      let PSLeadingMarginText = await PSLeadingMargin.getText()
      let LSBorderRadiusText = await LSBorderRadius.getText()
      let LSMarginText = await LSMargin.getText()
      console.info('[RichEditor3_0400] PSTextAlignText:' + Boolean(PSTextAlignText));
      console.info('[RichEditor3_0400] PSLeadingMarginText:' + Boolean(PSLeadingMarginText));
      console.info('[RichEditor3_0400] LSBorderRadiusText:' + Boolean(LSBorderRadiusText));
      console.info('[RichEditor3_0400] LSMarginText:' + Boolean(LSMarginText));
      expect(Boolean(PSTextAlignText)).assertTrue()
      expect(Boolean(PSLeadingMarginText)).assertTrue()
      expect(Boolean(LSBorderRadiusText)).assertTrue()
      expect(Boolean(LSMarginText)).assertTrue()
      console.info('[RichEditor3_0400] END');
      done();
    });

    /**
     * @tc.name   RichEditor3_0500
     * @tc.number RichEditor3_0500
     * @tc.desc   Test aboutToDelete callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditor3_0500', Level.LEVEL2, async (done: Function) => {
      // Test stop
      console.info('[RichEditor3_0500] START');
      let driver = Driver.create();
      await driver.delayMs(1000)
      let setContent = await driver.findComponent(ON.id("setContent"));
      await setContent.click()
      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditorGetAttribute"));
      await RichEditorGetAttribute.clearText()
      let PSTextAlign = await driver.findComponent(ON.id("PSTextAlign"));
      let PSLeadingMargin = await driver.findComponent(ON.id("PSLeadingMargin"));
      let LSBorderRadius = await driver.findComponent(ON.id("LSBorderRadius"));
      let LSMargin = await driver.findComponent(ON.id("LSMargin"));
      let PSTextAlignText = await PSTextAlign.getText()
      let PSLeadingMarginText = await PSLeadingMargin.getText()
      let LSBorderRadiusText = await LSBorderRadius.getText()
      let LSMarginText = await LSMargin.getText()
      expect(Boolean(PSTextAlignText)).assertTrue()
      expect(Boolean(PSLeadingMarginText)).assertTrue()
      expect(Boolean(LSBorderRadiusText)).assertTrue()
      expect(Boolean(LSMarginText)).assertTrue()
      console.info('[RichEditor3_0500] END');
      done();
    });
  })
}
