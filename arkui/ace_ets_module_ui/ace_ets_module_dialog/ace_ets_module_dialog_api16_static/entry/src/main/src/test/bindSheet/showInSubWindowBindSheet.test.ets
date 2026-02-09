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
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function showInSubWindowBindSheet() {
  describe('showInSubWindowBindSheet', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api16.static", "EntryAbility")
      await CommonFunc.sleep(4000);
    })

    beforeEach(async () => {
      console.info("showInSubWindowBindSheet beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheet/showInSubWindowBindSheet',
      }
      try {
        const showInSubWindowBindSheet = AppStorage.get<Router>("router") as Router
        showInSubWindowBindSheet.clear();
        let pages: router.RouterState = showInSubWindowBindSheet.getState();
        console.info("get showInSubWindowBindSheet state pages: " + JSON.stringify(pages));
        if (!("showInSubWindowBindSheet" == pages.name)) {
          console.info("get showInSubWindowBindSheet state pages.name: " + JSON.stringify(pages.name));
          showInSubWindowBindSheet.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push showInSubWindowBindSheet page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   showInSubWindowBindSheet_static_0100
     * @tc.name     showInSubWindowBindSheet_static_0100
     * @tc.desc     showInSubWindowBindSheet_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('showInSubWindowBindSheet_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info('showInSubWindowBindSheet_static_0100 START');
        if (AppStorage.get<number>("winLeft")! > 0) {
          let driver = Driver.create()
          await CommonFunc.sleep(1000);
          let button = await driver.findComponent(ON.id('openSheet'));
          await (button?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let windowClassFirst: window.Window | undefined = undefined;
          windowClassFirst =
            await window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext);
          let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
          console.info("[showInSubWindowBindSheet_static_0100] title: " + JSON.stringify(propertiesFirst.type));
          expect(propertiesFirst.type).assertEqual(1)
          let button1 = await driver.findComponent(ON.id('closeSheet'));
          await (button1?.click() as Promise<void>);
        }
        console.info('showInSubWindowBindSheet_static_0100 END');
        done();
      });


    
    /**
     * @tc.number   showInSubWindowBindSheet_static_0200
     * @tc.name     showInSubWindowBindSheet_static_0200
     * @tc.desc     showInSubWindowBindSheet_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('showInSubWindowBindSheet_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info('showInSubWindowBindSheet_static_0200 START');
        if (AppStorage.get<number>("winLeft")! > 0) {
          let driver = Driver.create()
          await CommonFunc.sleep(1000);
          let button0 = await driver.findComponent(ON.id('showInSubWindowTrue'));
          await (button0?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let button = await driver.findComponent(ON.id('openSheet'));
          await (button?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let windowClassFirst: window.Window | undefined = undefined;
          windowClassFirst =
            await window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext);
          let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
          console.info("[showInSubWindowBindSheet_static_0200] title: " + JSON.stringify(propertiesFirst.type));
          expect(propertiesFirst.type).assertEqual(0)
          let button1 = await driver.findComponent(ON.id('closeSheet'));
          await (button1?.click() as Promise<void>);
        }
        console.info('showInSubWindowBindSheet_static_0200 END');
        done();
      });


    
    /**
     * @tc.number   showInSubWindowBindSheet_static_0300
     * @tc.name     showInSubWindowBindSheet_static_0300
     * @tc.desc     showInSubWindowBindSheet_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('showInSubWindowBindSheet_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info('showInSubWindowBindSheet_static_0300 START');
        if (AppStorage.get<number>("winLeft")! > 0) {
          let driver = Driver.create()
          await CommonFunc.sleep(1000);
          let button0 = await driver.findComponent(ON.id('showInSubWindowNull'));
          await (button0?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let button = await driver.findComponent(ON.id('openSheet'));
          await (button?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let windowClassFirst: window.Window | undefined = undefined;
          windowClassFirst =
            await window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext);
          let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
          console.info("[showInSubWindowBindSheet_static_0300] title: " + JSON.stringify(propertiesFirst.type));
          expect(propertiesFirst.type).assertEqual(1)
          let button1 = await driver.findComponent(ON.id('closeSheet'));
          await (button1?.click() as Promise<void>);
        }
        console.info('showInSubWindowBindSheet_static_0300 END');
        done();
      });

    
    /**
     * @tc.number   showInSubWindowBindSheet_static_0400
     * @tc.name     showInSubWindowBindSheet_static_0400
     * @tc.desc     showInSubWindowBindSheet_static_0400
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('showInSubWindowBindSheet_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info('showInSubWindowBindSheet_static_0400 START');
        if (AppStorage.get<number>("winLeft")! > 0) {
          let driver = Driver.create()
          await CommonFunc.sleep(1000);
          let button0 = await driver.findComponent(ON.id('showInSubWindowUnd'));
          await (button0?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let button = await driver.findComponent(ON.id('openSheet'));
          await (button?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let windowClassFirst: window.Window | undefined = undefined;
          windowClassFirst =
            await window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext);
          let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
          console.info("[showInSubWindowBindSheet_static_0400] title: " + JSON.stringify(propertiesFirst.type));
          expect(propertiesFirst.type).assertEqual(1)
          let button1 = await driver.findComponent(ON.id('closeSheet'));
          await (button1?.click() as Promise<void>);
        }
        console.info('showInSubWindowBindSheet_static_0400 END');
        done();
      });


    
    /**
     * @tc.number   showInSubWindowBindSheet_static_0500
     * @tc.name     showInSubWindowBindSheet_static_0500
     * @tc.desc     showInSubWindowBindSheet_static_0500
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('showInSubWindowBindSheet_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info('showInSubWindowBindSheet_static_0500 START');
        if (AppStorage.get<number>("winLeft")! > 0) {
          let driver = Driver.create()
          await CommonFunc.sleep(1000);
          let button0 = await driver.findComponent(ON.id('popup'));
          await (button0?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let button1 = await driver.findComponent(ON.id('showInSubWindowFalse'));
          await (button1?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let button = await driver.findComponent(ON.id('openSheet'));
          await (button?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let windowClassFirst: window.Window | undefined = undefined;
          windowClassFirst =
            await window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext);
          let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
          console.info("[showInSubWindowBindSheet_static_0500] title: " + JSON.stringify(propertiesFirst.type));
          expect(propertiesFirst.type).assertEqual(1)
          let button2 = await driver.findComponent(ON.id('closeSheet'));
          await (button2?.click() as Promise<void>);
        }
        console.info('showInSubWindowBindSheet_static_0500 END');
        done();
      });


    
    /**
     * @tc.number   showInSubWindowBindSheet_static_0600
     * @tc.name     showInSubWindowBindSheet_static_0600
     * @tc.desc     showInSubWindowBindSheet_static_0600
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('showInSubWindowBindSheet_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info('showInSubWindowBindSheet_static_0600 START');
        if (AppStorage.get<number>("winLeft")! > 0) {
          let driver = Driver.create()
          await CommonFunc.sleep(1000);
          let button0 = await driver.findComponent(ON.id('popup'));
          await (button0?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let button1 = await driver.findComponent(ON.id('showInSubWindowTrue'));
          await (button1?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let button = await driver.findComponent(ON.id('openSheet'));
          await (button?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let windowClassFirst: window.Window | undefined = undefined;
          windowClassFirst =
            await window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext);
          let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
          console.info("[showInSubWindowBindSheet_static_0600] title: " + JSON.stringify(propertiesFirst.type));
          expect(propertiesFirst.type).assertEqual(0)
          let button2 = await driver.findComponent(ON.id('closeSheet'));
          await (button2?.click() as Promise<void>);
        }
        console.info('showInSubWindowBindSheet_static_0600 END');
        done();
      });


    
    /**
     * @tc.number   showInSubWindowBindSheet_static_0700
     * @tc.name     showInSubWindowBindSheet_static_0700
     * @tc.desc     showInSubWindowBindSheet_static_0700
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('showInSubWindowBindSheet_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info('showInSubWindowBindSheet_static_0700 START');
        if (AppStorage.get<number>("winLeft")! > 0) {
          let driver = Driver.create()
          await CommonFunc.sleep(1000);
          let button0 = await driver.findComponent(ON.id('popup'));
          await (button0?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let button1 = await driver.findComponent(ON.id('showInSubWindowNull'));
          await (button1?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let button = await driver.findComponent(ON.id('openSheet'));
          await (button?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let windowClassFirst: window.Window | undefined = undefined;
          windowClassFirst =
            await window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext);
          let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
          console.info("[showInSubWindowBindSheet_static_0700] title: " + JSON.stringify(propertiesFirst.type));
          expect(propertiesFirst.type).assertEqual(1)
          let button2 = await driver.findComponent(ON.id('closeSheet'));
          await (button2?.click() as Promise<void>);
        }
        console.info('showInSubWindowBindSheet_static_0700 END');
        done();
      });


    
    /**
     * @tc.number   showInSubWindowBindSheet_static_0800
     * @tc.name     showInSubWindowBindSheet_static_0800
     * @tc.desc     showInSubWindowBindSheet_static_0800
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('showInSubWindowBindSheet_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        console.info('showInSubWindowBindSheet_static_0800 START');
        if (AppStorage.get<number>("winLeft")! > 0) {
          let driver = Driver.create()
          await CommonFunc.sleep(1000);
          let button0 = await driver.findComponent(ON.id('popup'));
          await (button0?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let button1 = await driver.findComponent(ON.id('showInSubWindowUnd'));
          await (button1?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let button = await driver.findComponent(ON.id('openSheet'));
          await (button?.click() as Promise<void>);
          await CommonFunc.sleep(1000);
          let windowClassFirst: window.Window | undefined = undefined;
          windowClassFirst =
            await window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext);
          let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
          console.info("[showInSubWindowBindSheet_static_0800] title: " + JSON.stringify(propertiesFirst.type));
          expect(propertiesFirst.type).assertEqual(1)
          let button2 = await driver.findComponent(ON.id('closeSheet'));
          await (button2?.click() as Promise<void>);
        }
        console.info('showInSubWindowBindSheet_static_0800 END');
        done();
      });
  })
}