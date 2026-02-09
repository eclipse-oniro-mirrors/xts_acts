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



export default function showDialogLevelOrder() {
  describe('showDialogLevelOrder', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info("showDialogLevelOrder beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/showDialogLevelOrder',
      }
      try {
        const showDialogLevelOrder = AppStorage.get<Router>("router") as Router
        showDialogLevelOrder.clear();
        let pages:router.RouterState = showDialogLevelOrder.getState();
        console.info("get showDialogLevelOrder state pages: " + JSON.stringify(pages));
        if (!("showDialogLevelOrder" == pages.name)) {
          console.info("get showDialogLevelOrder state pages.name: " + JSON.stringify(pages.name));
          // let result = await showDialogLevelOrder.pushUrl(options);
          showDialogLevelOrder.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push showDialogLevelOrder success: ");
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push showDialogLevelOrder page error: " + err);
        expect().assertFail();
      }
    });


    afterEach(async () => {
      if (AppStorage.get<number>('showDialogOrder') != undefined) {
        AppStorage.delete('showDialogOrder')
      }
      await CommonFunc.sleep(1000);
      console.info("showDialogLevelOrder after each called");
    });

    
    
/**
     * @tc.number   showDialogLevelOrder_static_0100
     * @tc.name     showDialogLevelOrder_static_0100
     * @tc.desc     showDialogLevelOrder_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 
     */
it('showDialogLevelOrder_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: () => void): Promise<void> => {
      console.info('showDialogLevelOrder_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('100'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('myOrder'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let top = AppStorage.get<number>('showDialogOrder')
      expect(top).assertEqual(100)
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.text('button1'));
      await ( button2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      console.info('showDialogLevelOrder_static_0100 END');
      done();
    });

    
    
/**
     * @tc.number   showDialogLevelOrder_static_0200
     * @tc.name     showDialogLevelOrder_static_0200
     * @tc.desc     showDialogLevelOrder_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 
     */
it('showDialogLevelOrder_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: () => void): Promise<void> => {
      console.info('showDialogLevelOrder_static_0200 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('100001'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('myOrder'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let top = AppStorage.get<number>('showDialogOrder')
      expect(top).assertEqual(100000)
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.text('button1'));
      await ( button2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      console.info('showDialogLevelOrder_static_0200 END');
      done();
    });

    
    
/**
     * @tc.number   showDialogLevelOrder_static_0300
     * @tc.name     showDialogLevelOrder_static_0300
     * @tc.desc     showDialogLevelOrder_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 
     */
it('showDialogLevelOrder_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: () => void): Promise<void> => {
      console.info('showDialogLevelOrder_static_0300 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('-100001'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('myOrder'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let top = AppStorage.get<number>('showDialogOrder')
      expect(top).assertEqual(-100000)
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.text('button1'));
      await ( button2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      console.info('showDialogLevelOrder_static_0300 END');
      done();
    });
    
    
/**
     * @tc.number   showDialogLevelOrder_static_0400
     * @tc.name     showDialogLevelOrder_static_0400
     * @tc.desc     showDialogLevelOrder_static_0400
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 
     */
it('showDialogLevelOrder_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: () => void): Promise<void> => {
      console.info('showDialogLevelOrder_static_0400 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('undefined'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('myOrder'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let top = AppStorage.get<number>('showDialogOrder')
      expect(top).assertEqual(0)
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.text('button1'));
      await ( button2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      console.info('showDialogLevelOrder_static_0400 END');
      done();
    });
  })
}