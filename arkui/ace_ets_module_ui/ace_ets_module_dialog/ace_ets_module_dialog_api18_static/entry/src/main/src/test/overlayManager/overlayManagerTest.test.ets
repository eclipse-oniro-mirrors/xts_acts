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


export default function overlayManagerTest() {
  describe('overlayManagerTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")
    })

    beforeEach(async () => {
      console.info("overlayManagerTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/overlayManager/overlayManagerTest',
      }
      try {
        const overlayManagerTest = AppStorage.get<Router>("router") as Router
        overlayManagerTest.clear();
        let pages:router.RouterState = overlayManagerTest.getState();
        console.info("get overlayManagerTest state pages: " + JSON.stringify(pages));
        if (!("overlayManagerTest" == pages.name)) {
          console.info("get overlayManagerTest state pages.name: " + JSON.stringify(pages.name));
          // let result = await overlayManagerTest.pushUrl(options);
          overlayManagerTest.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push overlayManagerTest success: ");
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push overlayManagerTest page error: " + err);
        expect().assertFail();
      }
    });


    afterEach(async () => {
      if (AppStorage.get<number>('myTop') != undefined || AppStorage.get<number>('myBottom') != undefined) {
        AppStorage.delete('myTop')
        AppStorage.delete('myBottom')
      }
      await CommonFunc.sleep(1000);
      console.info("customDialogLevelOrder after each called");
    });

    
    
/**
     * @tc.number   overlayManagerTest_static_0100
     * @tc.name     overlayManagerTest_static_0100
     * @tc.desc     overlayManagerTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 
     */
it('overlayManagerTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: () => void): Promise<void> => {
      console.info('overlayManagerTest_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('-100001'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let button4 = await driver.findComponent(ON.id('myTop'));
      await ( button4?.click() as Promise<void>);
      // await CommonFunc.sleep(500);
      let button5 = await driver.findComponent(ON.id('myBottom'));
      await ( button5?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let top = AppStorage.get<number>('myTop')
      let bottom = AppStorage.get<number>('myBottom')

      expect(top).assertEqual(-100000)
      expect(bottom).assertEqual(-100000)
      await CommonFunc.sleep(500);


      let button2 = await driver.findComponent(ON.id('undefined'));
      await ( button2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await ( button4?.click() as Promise<void>);
      // await CommonFunc.sleep(500);
      await ( button5?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      top = AppStorage.get<number>('myTop')
      bottom = AppStorage.get<number>('myBottom')

      expect(top).assertEqual(0)
      expect(bottom).assertEqual(-100000)
      await CommonFunc.sleep(500);


      let button3 = await driver.findComponent(ON.id('0.111'));
      await ( button3?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      await ( button4?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await ( button5?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      top = AppStorage.get<number>('myTop')
      bottom = AppStorage.get<number>('myBottom')

      expect(top).assertEqual(0.111)
      expect(bottom).assertEqual(-100000)
      await CommonFunc.sleep(500);


      let button1 = await driver.findComponent(ON.id('100001'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await ( button4?.click() as Promise<void>);
      // await CommonFunc.sleep(500);
      await ( button5?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      top = AppStorage.get<number>('myTop')
      bottom = AppStorage.get<number>('myBottom')

      expect(top).assertEqual(100000)
      expect(bottom).assertEqual(-100000)
      await CommonFunc.sleep(500);

      let button6 = await driver.findComponent(ON.id('remove'));
      await ( button6?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await ( button6?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await ( button6?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await ( button6?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      console.info('overlayManagerTest_static_0100 END');
      done();
    });

  })
}
