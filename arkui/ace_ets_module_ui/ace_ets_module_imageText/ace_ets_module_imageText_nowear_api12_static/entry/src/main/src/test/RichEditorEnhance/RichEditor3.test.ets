'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Point} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from "../Util.test"
import CommonFunc from "../../../ets/MainAbility/common/Common";
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;



export default function RichEditor3() {
  describe('RichEditor3', () => {
    beforeAll(() => {
      console.info("RichEditor3 beforeEach start");

      ;
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility");
      ;
    });
    beforeEach(async (): Promise<void> => {
      console.info("RichEditor3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorEnhance/RichEditor3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RichEditor3 state pages:" + JSON.stringify(pages));
        if (!("RichEditor3" == pages.name)) {
          console.info("get RichEditor3 pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          let driver = Driver.create();
          await driver.delayMs(2000)
          // console.info("push RichEditor3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditor3 page error:" + err);
      }
      console.info("RichEditor3 beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await driver.delayMs(1000)
      console.info("RichEditor3 after each called");
    });
    
    
/**
     * @tc.number   RichEditor3_static_0100
     * @tc.name     RichEditor3_static_0100
     * @tc.desc     RichEditor3_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('RichEditor3_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[RichEditor3_0100] START');
      let driver = Driver.create();
      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditorGetAttribute"));
      await CommonFunc.sleep(1000);
      await (RichEditorGetAttribute?.inputText('1') as Promise<void>)
      await CommonFunc.sleep(500);
      let PSTextAlign = await driver.findComponent(ON.id("PSTextAlign"));
      await CommonFunc.sleep(500);
      let PSLeadingMargin = await driver.findComponent(ON.id("PSLeadingMargin"));
      await CommonFunc.sleep(500);
      let PSTextAlignText = await (PSTextAlign?.getText() as Promise<String>)
      await CommonFunc.sleep(500);
      let PSLeadingMarginText = await (PSLeadingMargin?.getText() as Promise<String>)
      await CommonFunc.sleep(500);
      expect(Boolean(PSTextAlignText)).assertTrue()
      expect(Boolean(PSLeadingMarginText)).assertTrue()
      await (RichEditorGetAttribute?.clearText() as Promise<void>)
      await CommonFunc.sleep(500);
      console.info('[RichEditor3_0100] END');
      done();
    });



/**
     * @tc.number   RichEditor3_static_0200
     * @tc.name     RichEditor3_static_0200
     * @tc.desc     RichEditor3_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('RichEditor3_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[RichEditor3_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let setContent = await driver.findComponent(ON.id("setContent"));
      await CommonFunc.sleep(500);
      await (setContent?.click() as Promise<void>)
      console.log("========================== setContent")

      await CommonFunc.sleep(500);
      console.log("========================== getSPans1")
      let getSPans = await driver.findComponent(ON.id("getSPans"));
      await CommonFunc.sleep(500);
      await (getSPans?.click() as Promise<void>)
      console.log("========================== getSPans")
      await CommonFunc.sleep(500);


      let PSTextAlign = await driver.findComponent(ON.id("PSTextAlign"));
      await CommonFunc.sleep(500);
      let PSLeadingMargin = await driver.findComponent(ON.id("PSLeadingMargin"));
      await CommonFunc.sleep(500);
      let LSBorderRadius = await driver.findComponent(ON.id("LSBorderRadius"));
      await CommonFunc.sleep(500);
      let LSMargin = await driver.findComponent(ON.id("LSMargin"));
      await CommonFunc.sleep(500);
      console.log("========================== PSTextAlign?.getText()")
      let PSTextAlignText = await (PSTextAlign?.getText() as Promise<String>)
      console.log("========================== PSTextAlign?.getText()")
      await CommonFunc.sleep(500);
      let PSLeadingMarginText = await (PSLeadingMargin?.getText() as Promise<String>)
      console.log("========================== PSLeadingMargin?.getText()")
      await CommonFunc.sleep(500);
      let LSBorderRadiusText = await (LSBorderRadius?.getText() as Promise<String>)
      console.log("========================== LSBorderRadius?.getText()")
      await CommonFunc.sleep(500);
      let LSMarginText = await (LSMargin?.getText() as Promise<String>)
      console.log("========================== LSMargin?.getText()")
      await CommonFunc.sleep(500);
      expect(Boolean(PSTextAlignText)).assertTrue()
      expect(Boolean(PSLeadingMarginText)).assertTrue()
      expect(Boolean(LSBorderRadiusText)).assertTrue()
      expect(Boolean(LSMarginText)).assertTrue()

      console.info('[RichEditor3_0200] END');
      done();
    });

    
    
/**
     * @tc.number   RichEditor3_static_0300
     * @tc.name     RichEditor3_static_0300
     * @tc.desc     RichEditor3_static_0300
     * @tc.level    Level.LEVEL2
     */
    it('RichEditor3_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[RichEditor3_0300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditorGetAttribute"));
      await CommonFunc.sleep(500);
      await (RichEditorGetAttribute?.clearText() as Promise<void>)
      let setContent = await driver.findComponent(ON.id("setContent"));
      await CommonFunc.sleep(500);
      await (setContent?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      // doubleClick
      let richEditor = await driver.findComponent(ON.id('RichEditorGetAttribute'));
      await CommonFunc.sleep(500);
      let centerPoint = await (richEditor?.getBoundsCenter() as Promise<Point>);
      await CommonFunc.sleep(500);
      let point = `${centerPoint.x} ${centerPoint.y}`;
      let cmd = `uinput -T -d ${point} -u ${point} -i 50 -d ${point} -u ${point}`;
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand(cmd);
      await CommonFunc.sleep(500)
      console.log("=============================================== findComponent(ON.text(\"全选\"))" );
      let quanxuan = await driver.findComponent(ON.text("全选"));
      await CommonFunc.sleep(500);
      await (quanxuan?.click() as Promise<void>)
      await CommonFunc.sleep(500);


        let PSTextAlign = await driver.findComponent(ON.id("PSTextAlign"));
        await CommonFunc.sleep(500);
        let PSLeadingMargin = await driver.findComponent(ON.id("PSLeadingMargin"));
        await CommonFunc.sleep(500);
        let LSBorderRadius = await driver.findComponent(ON.id("LSBorderRadius"));
        await CommonFunc.sleep(500);
        let LSMargin = await driver.findComponent(ON.id("LSMargin"));
        await CommonFunc.sleep(500);
        let PSTextAlignText = await (PSTextAlign?.getText() as Promise<String>)
        await CommonFunc.sleep(500);
        let PSLeadingMarginText = await (PSLeadingMargin?.getText() as Promise<String>)
        await CommonFunc.sleep(500);
        let LSBorderRadiusText = await (LSBorderRadius?.getText() as Promise<String>)
        await CommonFunc.sleep(500);
        let LSMarginText = await (LSMargin?.getText() as Promise<String>)
        await CommonFunc.sleep(500);
        expect(Boolean(PSTextAlignText)).assertTrue()
        expect(Boolean(PSLeadingMarginText)).assertTrue()
        expect(Boolean(LSBorderRadiusText)).assertTrue()
        expect(Boolean(LSMarginText)).assertTrue()

      console.info('[RichEditor3_0300] END');
      done();
    });

    
    
/**
     * @tc.number   RichEditor3_static_0400
     * @tc.name     RichEditor3_static_0400
     * @tc.desc     RichEditor3_static_0400
     * @tc.level    Level.LEVEL2
     */
    it('RichEditor3_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[RichEditor3_0400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditorGetAttribute"));
      await CommonFunc.sleep(500);
      await (RichEditorGetAttribute?.clearText()  as Promise<void>)
      await CommonFunc.sleep(500);
      let setContent = await driver.findComponent(ON.id("setContent"));
      await CommonFunc.sleep(500);
      await (setContent?.click()  as Promise<void>)
      await CommonFunc.sleep(500);
      let richEditor = await driver.findComponent(ON.id('RichEditorGetAttribute'));
      await CommonFunc.sleep(500);
      let centerPoint = await (richEditor?.getBoundsCenter() as Promise<Point>);
      await CommonFunc.sleep(500);
      let point = `${centerPoint.x} ${centerPoint.y}`;
      let cmd = `uinput -T -d ${point} -u ${point} -i 50 -d ${point} -u ${point}`;
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand(cmd);
      await CommonFunc.sleep(500)
      console.log("=============================================== findComponent(ON.text(\"全选\"))" );
      let quanxuan = await driver.findComponent(ON.text("全选"));
      await CommonFunc.sleep(500);
      await (quanxuan?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      let getSelection = await driver.findComponent(ON.id("getSelection"));
      await CommonFunc.sleep(500);
      await (getSelection?.click() as Promise<void>)
      await CommonFunc.sleep(500);


        let PSTextAlign = await driver.findComponent(ON.id("PSTextAlign"));
        await CommonFunc.sleep(500);
        let PSLeadingMargin = await driver.findComponent(ON.id("PSLeadingMargin"));
        await CommonFunc.sleep(500);
        let LSBorderRadius = await driver.findComponent(ON.id("LSBorderRadius"));
        await CommonFunc.sleep(500);
        let LSMargin = await driver.findComponent(ON.id("LSMargin"));
        await CommonFunc.sleep(500);
        let PSTextAlignText = await (PSTextAlign?.getText() as Promise<String>)
        await CommonFunc.sleep(500);
        let PSLeadingMarginText = await (PSLeadingMargin?.getText() as Promise<String>)
        await CommonFunc.sleep(500);
        let LSBorderRadiusText = await (LSBorderRadius?.getText() as Promise<String>)
        await CommonFunc.sleep(500);
        let LSMarginText = await (LSMargin?.getText() as Promise<String>)
        await CommonFunc.sleep(500);
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
     * @tc.number   RichEditor3_static_0500
     * @tc.name     RichEditor3_static_0500
     * @tc.desc     RichEditor3_static_0500
     * @tc.level    Level.LEVEL2
     */
    it('RichEditor3_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Test stop
      console.info('[RichEditor3_0500] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let setContent = await driver.findComponent(ON.id("setContent"));
      await CommonFunc.sleep(500);
      await (setContent?.click() as Promise<void>)
      await CommonFunc.sleep(500);
      let RichEditorGetAttribute = await driver.findComponent(ON.id("RichEditorGetAttribute"));
      await CommonFunc.sleep(500);
      await (RichEditorGetAttribute?.clearText() as Promise<void>)
      await CommonFunc.sleep(500);

        let PSTextAlign = await driver.findComponent(ON.id("PSTextAlign"));
        await CommonFunc.sleep(500);
        let PSLeadingMargin = await driver.findComponent(ON.id("PSLeadingMargin"));
        await CommonFunc.sleep(500);
        let LSBorderRadius = await driver.findComponent(ON.id("LSBorderRadius"));
        await CommonFunc.sleep(500);
        let LSMargin = await driver.findComponent(ON.id("LSMargin"));
        await CommonFunc.sleep(500);
        let PSTextAlignText = await (PSTextAlign?.getText() as Promise<String>)
        await CommonFunc.sleep(500);
        let PSLeadingMarginText = await (PSLeadingMargin?.getText() as Promise<String>)
        await CommonFunc.sleep(500);
        let LSBorderRadiusText = await (LSBorderRadius?.getText() as Promise<String>)
        await CommonFunc.sleep(500);
        let LSMarginText = await (LSMargin?.getText() as Promise<String>)
        await CommonFunc.sleep(500);
        expect(Boolean(PSTextAlignText)).assertTrue()
        expect(Boolean(PSLeadingMarginText)).assertTrue()
        expect(Boolean(LSBorderRadiusText)).assertTrue()
        expect(Boolean(LSMarginText)).assertTrue()

      console.info('[RichEditor3_0500] END');
      done();
    });
  })
}
