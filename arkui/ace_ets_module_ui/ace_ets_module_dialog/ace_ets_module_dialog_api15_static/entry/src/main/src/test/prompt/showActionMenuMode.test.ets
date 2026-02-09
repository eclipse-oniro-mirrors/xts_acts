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

export default function showActionMenuMode() {
  describe('showActionMenuMode', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.api15.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info("showActionMenuMode beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/prompt/showActionMenuMode",
      }
      try {
        const showActionMenuMode = AppStorage.get<Router>("router") as Router
        showActionMenuMode.clear();
        let pages:router.RouterState = showActionMenuMode.getState();
        console.info("get showActionMenuMode state pages: " + JSON.stringify(pages));
        if (!("showActionMenuMode" == pages.name)) {
          console.info("get showActionMenuMode state pages.name: " + JSON.stringify(pages.name));
          // let result = await showActionMenuMode.pushUrl(options);
          showActionMenuMode.replaceUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push showActionMenuMode success: " + JSON.stringify(result));
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push showActionMenuMode page error: " + err);
        expect().assertFail();
      }
    });



    
    

/**
     * @tc.number   showActionMenuMode_static_0100
     * @tc.name     showActionMenuMode_static_0100
     * @tc.desc     showActionMenuMode_static_0100
     * @tc.level    Level.LEVEL1
     */
it('showActionMenuMode_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('showActionMenuMode_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('levelMode: OVERLAY')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0100] overlay click');
      await CommonFunc.sleep(1000);

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      await ( btn0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1: Component = ( await driver.findComponent(ON.id('showAction')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[showActionMenuMode_static_0100] showAction click');

      let btn2: Component = ( await driver.findComponent(ON.text('取消')) ) as Component;
      expect(btn2 != null).assertTrue();
      console.info('[showActionMenuMode_static_0100] button1');

      await CommonFunc.sleep(1000);
      let btn3: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      await ( btn3?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0100] back');

      await CommonFunc.sleep(1000);
      let btn4: Component = ( await driver.findComponent(ON.text('取消')) ) as Component;
      expect(btn4 != null).assertTrue();
      await ( btn4?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0100] END');
      done();
    });

    
    

/**
     * @tc.number   showActionMenuMode_static_0200
     * @tc.name     showActionMenuMode_static_0200
     * @tc.desc     showActionMenuMode_static_0200
     * @tc.level    Level.LEVEL1
     */
it('showActionMenuMode_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('showActionMenuMode_static_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('levelMode: EMBEDDED')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0200] EMBEDDED click');
      await CommonFunc.sleep(1000);

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      await ( btn0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let btn1: Component = ( await driver.findComponent(ON.id('showAction')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[showActionMenuMode_static_0200] showAction click');

      let btn2: Component = ( await driver.findComponent(ON.text('取消')) ) as Component;
      expect(btn2 != null).assertTrue();
      console.info('[showActionMenuMode_static_0200] button1');

      await CommonFunc.sleep(1000);
      let btn3: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      await ( btn3?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0200] back');

      await CommonFunc.sleep(1000);
      let btn4 = ( await driver.findComponent(ON.text('取消')) );
      expect(btn4 != null).assertFalse();
      console.info('[showActionMenuMode_static_0200] END');
      done();
    });

    
    

/**
     * @tc.number   showActionMenuMode_static_0300
     * @tc.name     showActionMenuMode_static_0300
     * @tc.desc     showActionMenuMode_static_0300
     * @tc.level    Level.LEVEL1
     */
it('showActionMenuMode_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('showActionMenuMode_static_0300 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('levelMode: OVERLAY')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0300] OVERLAY click');
      await CommonFunc.sleep(1000);

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Abnormal value')) ) as Component;
      await ( btn0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let btn1: Component = ( await driver.findComponent(ON.id('showAction')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[showActionMenuMode_static_0300] showAction click');

      let btn2: Component = ( await driver.findComponent(ON.text('取消')) ) as Component;
      expect(btn2 != null).assertTrue();
      console.info('[showActionMenuMode_static_0300] button1');

      await CommonFunc.sleep(1000);
      let btn3: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      await ( btn3?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0300] back');

      await CommonFunc.sleep(1000);
      let btn4: Component = ( await driver.findComponent(ON.text('取消')) ) as Component;
      expect(btn4 != null).assertTrue();
      await ( btn4?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0300] END');
      done();
    });

    
    

/**
     * @tc.number   showActionMenuMode_static_0400
     * @tc.name     showActionMenuMode_static_0400
     * @tc.desc     showActionMenuMode_static_0400
     * @tc.level    Level.LEVEL1
     */
it('showActionMenuMode_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('showActionMenuMode_static_0400 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('levelMode: EMBEDDED')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0400] EMBEDDED click');
      await CommonFunc.sleep(1000);

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Abnormal value')) ) as Component;
      await ( btn0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let btn1: Component = ( await driver.findComponent(ON.id('showAction')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[showActionMenuMode_static_0400] showAction click');

      let btn2: Component = ( await driver.findComponent(ON.text('取消')) ) as Component;
      expect(btn2 != null).assertTrue();
      console.info('[showActionMenuMode_static_0400] button1');

      await CommonFunc.sleep(1000);
      let btn3: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      await ( btn3?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0400] back');

      await CommonFunc.sleep(1000);
      let btn4: Component = ( await driver.findComponent(ON.text('取消')) ) as Component;
      expect(btn4 != null).assertTrue();
      await ( btn4?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0400] END');
      done();
    });

    
    

/**
     * @tc.number   showActionMenuMode_static_0500
     * @tc.name     showActionMenuMode_static_0500
     * @tc.desc     showActionMenuMode_static_0500
     * @tc.level    Level.LEVEL1
     */
it('showActionMenuMode_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('showActionMenuMode_static_0500 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = (await driver.findComponent(ON.id('undefined'))) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0500] undefined click');
      await CommonFunc.sleep(1000);

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      await ( btn0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1: Component = ( await driver.findComponent(ON.id('showAction')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[showActionMenuMode_static_0500] showAction click');

      let btn2: Component = ( await driver.findComponent(ON.text('取消')) ) as Component;
      expect(btn2 != null).assertTrue();
      console.info('[showActionMenuMode_static_0500] button1');

      await CommonFunc.sleep(1000);
      let btn3: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      await ( btn3?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0500] back');

      await CommonFunc.sleep(1000);
      let btn4: Component = ( await driver.findComponent(ON.text('取消')) ) as Component;
      expect(btn4 != null).assertTrue();
      await ( btn4?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0500] END');
      done();
    });
    
    

/**
     * @tc.number   showActionMenuMode_static_0600
     * @tc.name     showActionMenuMode_static_0600
     * @tc.desc     showActionMenuMode_static_0600
     * @tc.level    Level.LEVEL1
     */
it('showActionMenuMode_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('showActionMenuMode_static_0600 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('null')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0600] undefined click');
      await CommonFunc.sleep(1000);

      let btn0: Component = ( await driver.findComponent(ON.id('uniqId: Normal value')) ) as Component;
      await ( btn0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1: Component = ( await driver.findComponent(ON.id('showAction')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[showActionMenuMode_static_0600] showAction click');

      let btn2: Component = ( await driver.findComponent(ON.text('取消')) ) as Component;
      expect(btn2 != null).assertTrue();
      console.info('[showActionMenuMode_static_0600] button1');

      await CommonFunc.sleep(1000);
      let btn3: Component = ( await driver.findComponent(ON.id('back')) ) as Component;
      await ( btn3?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0600] back');

      await CommonFunc.sleep(1000);
      let btn4: Component = ( await driver.findComponent(ON.text('取消')) ) as Component;
      expect(btn4 != null).assertTrue();
      await ( btn4?.click() as Promise<void>);
      console.info('[showActionMenuMode_static_0600] END');
      done();
    })
  })
}