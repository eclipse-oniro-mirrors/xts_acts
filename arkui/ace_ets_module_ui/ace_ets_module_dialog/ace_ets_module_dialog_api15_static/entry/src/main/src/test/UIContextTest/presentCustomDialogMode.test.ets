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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
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
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function presentCustomDialogMode() {
  describe('presentCustomDialogMode', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.api15.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info("presentCustomDialogMode beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/presentCustomDialogMode",
      }
      try {
        const presentCustomDialogMode = AppStorage.get<Router>("router") as Router
        presentCustomDialogMode.clear();
        let pages:router.RouterState = presentCustomDialogMode.getState();
        console.info("get presentCustomDialogMode state pages: " + JSON.stringify(pages));
        if (!("presentCustomDialogMode" == pages.name)) {
          console.info("get presentCustomDialogMode state pages.name: " + JSON.stringify(pages.name));
          // let result = await presentCustomDialogMode.pushUrl(options);
          presentCustomDialogMode.replaceUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push presentCustomDialogMode success: " + JSON.stringify(result));
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push presentCustomDialogMode page error: " + err);
        expect().assertFail();
      }
    });





/**
     * @tc.number   presentCustomDialogMode_static_0100
     * @tc.name     presentCustomDialogMode_static_0100
     * @tc.desc     presentCustomDialogMode_static_0100
     * @tc.level    Level.LEVEL1
     */
it('presentCustomDialogMode_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('presentCustomDialogMode_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('levelMode: OVERLAY')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0100] overlay click');
      await CommonFunc.sleep(1000);

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      await ( btn0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let btn1: Component = ( await driver.findComponent(ON.id('presentCustomDialog')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0100] openCustomDialog click');

      let btn2: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn2 != null).assertTrue();
      await ( btn2?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0100] router');
      await CommonFunc.sleep(1000);

      let btn3: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn3 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn4: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      await ( btn4?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0100] back');

      let btn5: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn5 != null).assertTrue();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0100] router');

      let btn6: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
      await ( btn6?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0100] END');
      done();
    });




// /**
//      * @tc.number   presentCustomDialogMode_static_0200
//      * @tc.name     presentCustomDialogMode_static_0200
//      * @tc.desc     presentCustomDialogMode_static_0200
//      * @tc.level    Level.LEVEL1
//      */
// it('presentCustomDialogMode_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
//       console.info('presentCustomDialogMode_static_0200 START');
//       await CommonFunc.sleep(1000);
//       let driver: Driver = Driver.create();
//       let btn: Component = ( await driver.findComponent(ON.id('levelMode: EMBEDDED')) ) as Component;
//       await ( btn?.click() as Promise<void>);
//       console.info('[presentCustomDialogMode_static_0200] EMBEDDED click');
//       await CommonFunc.sleep(1000);
//
//       let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
//       await ( btn0?.click() as Promise<void>);
//       await CommonFunc.sleep(1000);
//
//       let btn1: Component = ( await driver.findComponent(ON.id('presentCustomDialog')) ) as Component;
//       await ( btn1?.click() as Promise<void>);
//       await CommonFunc.sleep(1000);
//       console.info('[presentCustomDialogMode_static_0200] openCustomDialog click');
//
//       let btn2: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
//       expect(btn2 != null).assertTrue();
//       await ( btn2?.click() as Promise<void>);
//       console.info('[presentCustomDialogMode_static_0200] router');
//       await CommonFunc.sleep(1000);
//
//       let btn3: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
//       expect(btn3 != null).assertFalse();
//       await CommonFunc.sleep(1000);
//
//       let btn4: Component = ( await driver.findComponent(ON.id('back1')) ) as Component;
//       await ( btn4?.click() as Promise<void>);
//       console.info('[presentCustomDialogMode_static_0200] back');
//
//       let btn5: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
//       expect(btn5 != null).assertTrue();
//       await CommonFunc.sleep(1000);
//
//       let btn6: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
//       await ( btn6?.click() as Promise<void>);
//       await CommonFunc.sleep(1000);
//       console.info('[presentCustomDialogMode_static_0200] END');
//       done();
//     });




/**
     * @tc.number   presentCustomDialogMode_static_0300
     * @tc.name     presentCustomDialogMode_static_0300
     * @tc.desc     presentCustomDialogMode_static_0300
     * @tc.level    Level.LEVEL1
     */
it('presentCustomDialogMode_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('presentCustomDialogMode_static_0300 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('levelMode: OVERLAY')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0300] OVERLAY click');
      await CommonFunc.sleep(1000);

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Abnormal value')) ) as Component;
      await ( btn0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let btn1: Component = ( await driver.findComponent(ON.id('presentCustomDialog')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0300] openCustomDialog click');

      let btn2: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn2 != null).assertTrue();
      await ( btn2?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0300] router');
      await CommonFunc.sleep(1000);

      let btn3: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn3 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn4: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      await ( btn4?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0300] back');

      let btn5: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn5 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn6: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
      await ( btn6?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0300] END');
      done();
    });




/**
     * @tc.number   presentCustomDialogMode_static_0400
     * @tc.name     presentCustomDialogMode_static_0400
     * @tc.desc     presentCustomDialogMode_static_0400
     * @tc.level    Level.LEVEL1
     */
it('presentCustomDialogMode_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('presentCustomDialogMode_static_0400 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('levelMode: EMBEDDED')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0400] EMBEDDED click');
      await CommonFunc.sleep(1000);

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Abnormal value')) ) as Component;
      await ( btn0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let btn1: Component = ( await driver.findComponent(ON.id('presentCustomDialog')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0400] openCustomDialog click');

      let btn2: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn2 != null).assertTrue();
      await ( btn2?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0400] router');
      await CommonFunc.sleep(1000);

      let btn3: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn3 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn4: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      await ( btn4?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0400] back');

      let btn5: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn5 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn6: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
      await ( btn6?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0400] END');
      done();
    });





/**
     * @tc.number   presentCustomDialogMode_static_0500
     * @tc.name     presentCustomDialogMode_static_0500
     * @tc.desc     presentCustomDialogMode_static_0500
     * @tc.level    Level.LEVEL1
     */
it('presentCustomDialogMode_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('presentCustomDialogMode_static_0500 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('levelMode: EMBEDDED')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0400] EMBEDDED click');
      await CommonFunc.sleep(1000);

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      await ( btn0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let button: Component = (await driver.findComponent(ON.id('imMode: extend'))) as Component;
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let btn1: Component = ( await driver.findComponent(ON.id('presentCustomDialog')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0500] openCustomDialog click');

      let btn2: Component = ( await driver.findComponent(ON.text('router')) ) as Component;
      expect(btn2 != null).assertTrue();
      let btn3: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
      await ( btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0500] END');
      done();
    });





/**
     * @tc.number   presentCustomDialogMode_static_0600
     * @tc.name     presentCustomDialogMode_static_0600
     * @tc.desc     presentCustomDialogMode_static_0600
     * @tc.level    Level.LEVEL1
     */
it('presentCustomDialogMode_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('presentCustomDialogMode_static_0600 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
     let btn: Component = ( await driver.findComponent(ON.id('levelMode: EMBEDDED')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0600] EMBEDDED click');
      await CommonFunc.sleep(1000);

       let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      await ( btn0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let button: Component = ( await driver.findComponent(ON.id('imMode: default')) ) as Component;
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let btn1: Component = ( await driver.findComponent(ON.id('presentCustomDialog')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0600] openCustomDialog click');

      let btn2: Component = ( await driver.findComponent(ON.text('router')) ) as Component;
      expect(btn2 != null).assertTrue();
      let btn3: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
      await ( btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0600] END');
      done();
    });





/**
     * @tc.number   presentCustomDialogMode_static_0700
     * @tc.name     presentCustomDialogMode_static_0700
     * @tc.desc     presentCustomDialogMode_static_0700
     * @tc.level    Level.LEVEL1
     */
it('presentCustomDialogMode_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('presentCustomDialogMode_static_0700 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = (await driver.findComponent(ON.id('undefined'))) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0700] undefined click');
      await CommonFunc.sleep(1000);

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      await ( btn0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let btn1: Component = ( await driver.findComponent(ON.id('presentCustomDialog')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0700] openCustomDialog click');

      let btn2: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn2 != null).assertTrue();
      await ( btn2?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0700] router');
      await CommonFunc.sleep(1000);

      let btn3: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn3 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn4: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      await ( btn4?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0700] back');

      let btn5: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn5 != null).assertTrue();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0700] router');

      let btn6: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
      await ( btn6?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0700] END');
      done();
    });




/**
     * @tc.number   presentCustomDialogMode_static_0800
     * @tc.name     presentCustomDialogMode_static_0800
     * @tc.desc     presentCustomDialogMode_static_0800
     * @tc.level    Level.LEVEL1
     */
it('presentCustomDialogMode_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('presentCustomDialogMode_static_0800 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('null')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0800] undefined click');
      await CommonFunc.sleep(1000);

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      await ( btn0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let btn1: Component = ( await driver.findComponent(ON.id('presentCustomDialog')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0800] openCustomDialog click');

      let btn2: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn2 != null).assertTrue();
      await ( btn2?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0800] router');
      await CommonFunc.sleep(1000);

      let btn3: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn3 != null).assertTrue();
      await CommonFunc.sleep(1000);

      let btn4: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      await ( btn4?.click() as Promise<void>);
      console.info('[presentCustomDialogMode_static_0800] back');

      let btn5: Component = ( await driver.findComponent(ON.id('router')) ) as Component;
      expect(btn5 != null).assertTrue();
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0800] router');

      let btn6: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
      await ( btn6?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[presentCustomDialogMode_static_0800] END');
      done();
    });

  })
}