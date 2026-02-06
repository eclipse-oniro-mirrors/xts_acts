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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import window from '@ohos.window';

export default function subwindowDialog() {
  describe('subwindowDialog', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.api16.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info("subwindowDialog beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/subwindowDialog',
      }
      try {
        const updatePopupTesttions = AppStorage.get<Router>("router") as Router
        // updatePopupTesttions.clear();
        let pages = updatePopupTesttions.getState();
        console.info("get subwindowDialog state pages: " + JSON.stringify(pages));
        if (!("subwindowDialog" == pages.name)) {
          console.info("get subwindowDialog state pages.name: " + JSON.stringify(pages.name));
          updatePopupTesttions.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push subwindowDialog page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   subwindowDialog_static_0100
     * @tc.name     subwindowDialog_static_0100
     * @tc.desc     subwindowDialog_static_0100
     * @tc.level    Level.LEVEL2
     */
it('subwindowDialog_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('subwindowDialog_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let buttonSubwindowFalse = await driver.findComponent(ON.id('subwindowDialogClickFalse'));
      let buttonOpenDialog = await driver.findComponent(ON.id('subwindowDialogClickOpen'));
      await (buttonSubwindowFalse?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (buttonOpenDialog?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let windowClassFirst: window.Window | undefined = undefined;
      windowClassFirst = await window.getLastWindow(AppStorage.get<common.UIAbilityContext>('abilityContext')!);
      let propertiesFirst: window.WindowProperties = windowClassFirst!.getWindowProperties();
      console.info("[subwindowDialog_static_0100] title: " + JSON.stringify(propertiesFirst.type));
      expect(propertiesFirst.type).assertEqual(1) //1表示系统告警窗口TYPE_SYSTEM_ALERT

      let buttonSubwindowMenu = await driver.findComponent(ON.id('subwindowDialogLongClickMenu'));

      await (buttonSubwindowMenu?.longClick() as Promise<void>);
      await CommonFunc.sleep(1000);

      let windowClassSecond: window.Window | undefined = undefined;
      windowClassSecond = await window.getLastWindow(AppStorage.get<common.UIAbilityContext>('abilityContext')!);
      let propertiesSecond: window.WindowProperties = windowClassSecond!.getWindowProperties();
      console.info("[subwindowDialog_static_0100] title: " + JSON.stringify(propertiesSecond));
      console.info("[subwindowDialog_static_0100] title: " + JSON.stringify(propertiesSecond.type));
      expect(propertiesSecond.type).assertEqual(0) //0表示应用子窗口TYPE_APP

      await CommonFunc.sleep(1000);
      await driver.click(Math.round(Number(AppStorage.get<number>("winLeft")) + UIContext.resolveUIContext()!.vp2px(100)) as int,Math.round(Number(AppStorage.get<number>('winTop')) + UIContext.resolveUIContext()!.vp2px(100)) as int);
      await CommonFunc.sleep(1000);
      let buttonCloseDialog = await driver.findComponent(ON.id('subwindowDialogClickClose'));
      if (buttonCloseDialog) {
        await buttonCloseDialog.click();
        await CommonFunc.sleep(1000);
      }
      console.info('[subwindowDialog_static_0100] END');
      done();
    });


    
    /**
     * @tc.number   subwindowDialog_static_0200
     * @tc.name     subwindowDialog_static_0200
     * @tc.desc     subwindowDialog_static_0200
     * @tc.level    Level.LEVEL2
     */
it('subwindowDialog_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('subwindowDialog_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let buttonSubwindowTrue = await driver.findComponent(ON.id('subwindowDialogClickTrue'));
      let buttonOpenDialog = await driver.findComponent(ON.id('subwindowDialogClickOpen'));
      await (buttonSubwindowTrue?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (buttonOpenDialog?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(AppStorage.get<common.UIAbilityContext>('abilityContext')!);
      let properties: window.WindowProperties = windowClass!.getWindowProperties();
      console.info("[subwindowDialog_static_0200] title: " + JSON.stringify(properties));
      console.info("[subwindowDialog_static_0200] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(0) //0表示应用子窗口TYPE_APP

      let buttonSubwindowMenu = await driver.findComponent(ON.id('subwindowDialogLongClickMenu'));
      let buttonCloseDialog = await driver.findComponent(ON.id('subwindowDialogClickClose'));

      // await (buttonSubwindowMenu?.longClick() as Promise<void>);
      // await CommonFunc.sleep(1000);
      //
      await (buttonCloseDialog?.click() as Promise<void>);
      // await CommonFunc.sleep(1000);
      console.info('[subwindowDialog_static_0200] END');
      done();
    });

  })
}

