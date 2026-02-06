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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
import window from '@ohos.window';


export default function showInSubWindowBindSheet() {
  describe('showInSubWindowBindSheet', () => {
    beforeEach(async (done: Function) => {
      console.info("showInSubWindowBindSheet beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheet/showInSubWindowBindSheet',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get showInSubWindowBindSheet state pages: " + JSON.stringify(pages));
        if (!("showInSubWindowBindSheet" == pages.name)) {
          console.info("get showInSubWindowBindSheet state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push showInSubWindowBindSheet success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showInSubWindowBindSheet page error: " + err);
        expect().assertFail();
      }
      done();
    }
    )
    ;

    /**
     * @tc.name   showInSubWindowBindSheet_0100
     * @tc.number SUB_ACE_showInSubWindowBindSheet_0100
     * @tc.desc   set preferType:SheetType.CENTER;showInSubWindow:false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('showInSubWindowBindSheet_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('showInSubWindowBindSheet_0100 START');
      if (globalThis.winLeft > 0) {
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('openSheet'));
        await button.click();
        await CommonFunc.sleep(1000);
        let windowClassFirst: window.Window | undefined = undefined;
        windowClassFirst = await window.getLastWindow(globalThis.abilityContext);
        let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
        console.info("[showInSubWindowBindSheet_0100] title: " + JSON.stringify(propertiesFirst.type));
        expect(propertiesFirst.type).assertEqual(1)
        let button1 = await driver.findComponent(ON.id('closeSheet'));
        await button1.click();
      }
      console.info('showInSubWindowBindSheet_0100 END');
      done();
    });

    /**
     * @tc.name   showInSubWindowBindSheet_0200
     * @tc.number SUB_ACE_showInSubWindowBindSheet_0200
     * @tc.desc   set preferType:SheetType.CENTER;showInSubWindow:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('showInSubWindowBindSheet_0200',TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('showInSubWindowBindSheet_0200 START');
      if (globalThis.winLeft > 0) {
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button0 = await driver.findComponent(ON.id('showInSubWindowTrue'));
        await button0.click();
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('openSheet'));
        await button.click();
        await CommonFunc.sleep(1000);
        let windowClassFirst: window.Window | undefined = undefined;
        windowClassFirst = await window.getLastWindow(globalThis.abilityContext);
        let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
        console.info("[showInSubWindowBindSheet_0200] title: " + JSON.stringify(propertiesFirst.type));
        expect(propertiesFirst.type).assertEqual(0)
        let button1 = await driver.findComponent(ON.id('closeSheet'));
        await button1.click();
      }
      console.info('showInSubWindowBindSheet_0200 END');
      done();
    });

    /**
     * @tc.name   showInSubWindowBindSheet_0300
     * @tc.number SUB_ACE_showInSubWindowBindSheet_0300
     * @tc.desc   set preferType:SheetType.CENTER;showInSubWindow:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('showInSubWindowBindSheet_0300',TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('showInSubWindowBindSheet_0300 START');
      if (globalThis.winLeft > 0) {
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button0 = await driver.findComponent(ON.id('showInSubWindowNull'));
        await button0.click();
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('openSheet'));
        await button.click();
        await CommonFunc.sleep(1000);
        let windowClassFirst: window.Window | undefined = undefined;
        windowClassFirst = await window.getLastWindow(globalThis.abilityContext);
        let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
        console.info("[showInSubWindowBindSheet_0300] title: " + JSON.stringify(propertiesFirst.type));
        expect(propertiesFirst.type).assertEqual(1)
        let button1 = await driver.findComponent(ON.id('closeSheet'));
        await button1.click();
      }
      console.info('showInSubWindowBindSheet_0300 END');
      done();
    });
    /**
     * @tc.name   showInSubWindowBindSheet_0400
     * @tc.number SUB_ACE_showInSubWindowBindSheet_0400
     * @tc.desc   set preferType:SheetType.CENTER;showInSubWindow:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('showInSubWindowBindSheet_0400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('showInSubWindowBindSheet_0400 START');
      if (globalThis.winLeft > 0) {
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button0 = await driver.findComponent(ON.id('showInSubWindowUnd'));
        await button0.click();
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('openSheet'));
        await button.click();
        await CommonFunc.sleep(1000);
        let windowClassFirst: window.Window | undefined = undefined;
        windowClassFirst = await window.getLastWindow(globalThis.abilityContext);
        let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
        console.info("[showInSubWindowBindSheet_0400] title: " + JSON.stringify(propertiesFirst.type));
        expect(propertiesFirst.type).assertEqual(1)
        let button1 = await driver.findComponent(ON.id('closeSheet'));
        await button1.click();
      }
      console.info('showInSubWindowBindSheet_0400 END');
      done();
    });

    /**
     * @tc.name   showInSubWindowBindSheet_0500
     * @tc.number SUB_ACE_showInSubWindowBindSheet_0500
     * @tc.desc   set preferType:SheetType.POPUP;showInSubWindow:false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('showInSubWindowBindSheet_0500',TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('showInSubWindowBindSheet_0500 START');
      if (globalThis.winLeft > 0) {
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button0 = await driver.findComponent(ON.id('popup'));
        await button0.click();
        await CommonFunc.sleep(1000);
        let button1 = await driver.findComponent(ON.id('showInSubWindowFalse'));
        await button1.click();
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('openSheet'));
        await button.click();
        await CommonFunc.sleep(1000);
        let windowClassFirst: window.Window | undefined = undefined;
        windowClassFirst = await window.getLastWindow(globalThis.abilityContext);
        let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
        console.info("[showInSubWindowBindSheet_0500] title: " + JSON.stringify(propertiesFirst.type));
        expect(propertiesFirst.type).assertEqual(1)
        let button2 = await driver.findComponent(ON.id('closeSheet'));
        await button2.click();
      }
      console.info('showInSubWindowBindSheet_0500 END');
      done();
    });

    /**
     * @tc.name   showInSubWindowBindSheet_0600
     * @tc.number SUB_ACE_showInSubWindowBindSheet_0600
     * @tc.desc   set preferType:SheetType.POPUP;showInSubWindow:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('showInSubWindowBindSheet_0600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('showInSubWindowBindSheet_0600 START');
      if (globalThis.winLeft > 0) {
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button0 = await driver.findComponent(ON.id('popup'));
        await button0.click();
        await CommonFunc.sleep(1000);
        let button1 = await driver.findComponent(ON.id('showInSubWindowTrue'));
        await button1.click();
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('openSheet'));
        await button.click();
        await CommonFunc.sleep(1000);
        let windowClassFirst: window.Window | undefined = undefined;
        windowClassFirst = await window.getLastWindow(globalThis.abilityContext);
        let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
        console.info("[showInSubWindowBindSheet_0600] title: " + JSON.stringify(propertiesFirst.type));
        expect(propertiesFirst.type).assertEqual(0)
        let button2 = await driver.findComponent(ON.id('closeSheet'));
        await button2.click();
      }
      console.info('showInSubWindowBindSheet_0600 END');
      done();
    });

    /**
     * @tc.name   showInSubWindowBindSheet_0700
     * @tc.number SUB_ACE_showInSubWindowBindSheet_0700
     * @tc.desc   set preferType:SheetType.POPUP;showInSubWindow:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('showInSubWindowBindSheet_0700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('showInSubWindowBindSheet_0700 START');
      if (globalThis.winLeft > 0) {
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button0 = await driver.findComponent(ON.id('popup'));
        await button0.click();
        await CommonFunc.sleep(1000);
        let button1 = await driver.findComponent(ON.id('showInSubWindowNull'));
        await button1.click();
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('openSheet'));
        await button.click();
        await CommonFunc.sleep(1000);
        let windowClassFirst: window.Window | undefined = undefined;
        windowClassFirst = await window.getLastWindow(globalThis.abilityContext);
        let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
        console.info("[showInSubWindowBindSheet_0700] title: " + JSON.stringify(propertiesFirst.type));
        expect(propertiesFirst.type).assertEqual(1)
        let button2 = await driver.findComponent(ON.id('closeSheet'));
        await button2.click();
      }
      console.info('showInSubWindowBindSheet_0700 END');
      done();
    });

    /**
     * @tc.name   showInSubWindowBindSheet_0800
     * @tc.number SUB_ACE_showInSubWindowBindSheet_0800
     * @tc.desc   set preferType:SheetType.POPUP;showInSubWindow:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('showInSubWindowBindSheet_0800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('showInSubWindowBindSheet_0800 START');
      if (globalThis.winLeft > 0) {
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let button0 = await driver.findComponent(ON.id('popup'));
        await button0.click();
        await CommonFunc.sleep(1000);
        let button1 = await driver.findComponent(ON.id('showInSubWindowUnd'));
        await button1.click();
        await CommonFunc.sleep(1000);
        let button = await driver.findComponent(ON.id('openSheet'));
        await button.click();
        await CommonFunc.sleep(1000);
        let windowClassFirst: window.Window | undefined = undefined;
        windowClassFirst = await window.getLastWindow(globalThis.abilityContext);
        let propertiesFirst: window.WindowProperties = windowClassFirst.getWindowProperties();
        console.info("[showInSubWindowBindSheet_0800] title: " + JSON.stringify(propertiesFirst.type));
        expect(propertiesFirst.type).assertEqual(1)
        let button2 = await driver.findComponent(ON.id('closeSheet'));
        await button2.click();
      }
      console.info('showInSubWindowBindSheet_0800 END');
      done();
    });
  })
}