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
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function promptActionKeyboardAvoidDistance() {
  describe('promptActionKeyboardAvoidDistance', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.api15.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info("promptActionKeyboardAvoidDistance beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/prompt/promptActionKeyboardAvoidDistance",
      }
      try {
        const promptActionKeyboardAvoidDistance = AppStorage.get<Router>("router") as Router
        // promptActionKeyboardAvoidDistance.clear();
        let pages:router.RouterState = promptActionKeyboardAvoidDistance.getState();
        console.info("get promptActionKeyboardAvoidDistance state pages: " + JSON.stringify(pages));
        if (!("promptActionKeyboardAvoidDistance" == pages.name)) {
          console.info("get promptActionKeyboardAvoidDistance state pages.name: " + JSON.stringify(pages.name));
          // let result = await promptActionKeyboardAvoidDistance.pushUrl(options);
          promptActionKeyboardAvoidDistance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push promptActionKeyboardAvoidDistance success: " + JSON.stringify(result));
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push promptActionKeyboardAvoidDistance page error: " + err);
        expect().assertFail();
      }
    });


    
    

/**
     * @tc.number   PromptActionKeyboardAvoidDistance_static_0100
     * @tc.name     PromptActionKeyboardAvoidDistance_static_0100
     * @tc.desc     PromptActionKeyboardAvoidDistance_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('PromptActionKeyboardAvoidDistance_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PromptActionKeyboardAvoidDistance_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1 = (await driver.findComponent(ON.id('btn1'))) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let input = (await driver.findComponent(ON.id('input1'))) as Component;
      await input.click();
      await CommonFunc.sleep(2000);
      let column:Component =( await driver.findComponent(ON.type('Column').isAfter(ON.type('Dialog')))) as Component;
      let rect = await column.getBounds();
      let top = rect.top
      let bottom = rect.bottom
      let right = rect.right
      let left = rect.left
      console.info('[PromptAction_001_dialog] left: ' + rect.left + ', top: ' + rect.top +
        ', right:' + rect.right + ', bottom:' + rect.bottom );
      let Keyboard:Component = ( await driver.findComponent(ON.type('Keyboard')) ) as Component;
      let rect1 = await Keyboard.getBounds();
      let top1 = rect1.top
      let bottom1 = rect1.bottom
      let right1 = rect1.right
      let left1 = rect1.left
      console.info('[PromptAction_001_keyboard] left: ' + rect1.left + ', top: ' + rect1.top +
        ', right:' + rect1.right + ', bottom:' + rect1.bottom );
      let keyboardAvoidDistance = top1 - bottom;
      let str = UIContext.resolveUIContext()!.vp2px(20);
      let str1 = Math.ceil(str)
      let cancelButton1: Component = ( await driver.findComponent(ON.text('取消')) ) as Component;
       CommonFunc.sleep(300) ;
       (cancelButton1?.click()) ;
      expect(keyboardAvoidDistance >= str1 - 2 && keyboardAvoidDistance <= str1 + 2 ).assertEqual(true);
      console.info('PromptActiongKeyboardAvoidDistance_0100 END');
      done();
    });

    
    

/**
     * @tc.number   PromptActionKeyboardAvoidDistance_static_0200
     * @tc.name     PromptActionKeyboardAvoidDistance_static_0200
     * @tc.desc     PromptActionKeyboardAvoidDistance_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('PromptActionKeyboardAvoidDistance_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PromptActionKeyboardAvoidDistance_static_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn2 = ( await driver.findComponent(ON.id('btn2')) ) as Component;
      await ( btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let input = (await driver.findComponent(ON.id('input1'))) as Component;
      await (input?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let column:Component =( await driver.findComponent(ON.type('Column').isAfter(ON.type('Dialog')))) as Component;
      let rect = await column.getBounds();
      let top = rect.top
      let bottom = rect.bottom
      let right = rect.right
      let left = rect.left
      console.info('[PromptAction_003_dialog] left: ' + rect.left + ', top: ' + rect.top +
        ', right:' + rect.right + ', bottom:' + rect.bottom );
      let Keyboard:Component = ( await driver.findComponent(ON.type('Keyboard')) ) as Component;
      let rect1 = await Keyboard.getBounds();
      let top1 = rect1.top
      let bottom1 = rect1.bottom
      let right1 = rect1.right
      let left1 = rect1.left
      console.info('[PromptAction_004_keyboard] left: ' + rect1.left + ', top: ' + rect1.top +
        ', right:' + rect1.right + ', bottom:' + rect1.bottom );
      let keyboardAvoidDistance = top1 - bottom;
      let str2 = UIContext.resolveUIContext()!.vp2px(16);
      let str3 = Math.ceil(str2)
      let cancelButton1: Component = ( await driver.findComponent(ON.text('取消')) ) as Component;
       CommonFunc.sleep(300);
       (cancelButton1?.click());
      expect(keyboardAvoidDistance >= str3 - 2 && keyboardAvoidDistance <= str3 + 2 ).assertEqual(true);
      console.info('PromptActiongKeyboardAvoidDistance_0200 END');
      done();
    });

    
     

/**
     * @tc.number   PromptActionKeyboardAvoidDistance_static_0300
     * @tc.name     PromptActionKeyboardAvoidDistance_static_0300
     * @tc.desc     PromptActionKeyboardAvoidDistance_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('PromptActionKeyboardAvoidDistance_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PromptActionKeyboardAvoidDistance_static_0300 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn3 = await driver.findComponent(ON.id('btn3'));
      await ( btn3?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let input = (await driver.findComponent(ON.id('input1'))) as Component;
      await input.click();
      await CommonFunc.sleep(2000);
      let column:Component =( await driver.findComponent(ON.type('Column').isAfter(ON.type('Dialog')))) as Component;
      let rect = await column.getBounds();
      let top = rect.top
      let bottom = rect.bottom
      let right = rect.right
      let left = rect.left
      console.info('[PromptAction_005_dialog] left: ' + rect.left + ', top: ' + rect.top +
        ', right:' + rect.right + ', bottom:' + rect.bottom );
      let Keyboard:Component = ( await driver.findComponent(ON.type('Keyboard')) ) as Component;
      let rect1 = await Keyboard.getBounds();
      let top1 = rect1.top
      let bottom1 = rect1.bottom
      let right1 = rect1.right
      let left1 = rect1.left
      console.info('[PromptAction_006_keyboard] left: ' + rect1.left + ', top: ' + rect1.top +
        ', right:' + rect1.right + ', bottom:' + rect1.bottom );
      let keyboardAvoidDistance = top1 - bottom;
      let str4 = UIContext.resolveUIContext()!.vp2px(16);
      let str5 = Math.ceil(str4)
      let cancelButton1: Component = ( await driver.findComponent(ON.text('取消')) ) as Component;
       CommonFunc.sleep(300);
       (cancelButton1?.click());
      expect(keyboardAvoidDistance >= str5 - 2 && keyboardAvoidDistance <= str5 + 2 ).assertEqual(true);
      console.info('PromptActionKeyboardAvoidDistance_static_0300 END');
      done();
    });

  })
}