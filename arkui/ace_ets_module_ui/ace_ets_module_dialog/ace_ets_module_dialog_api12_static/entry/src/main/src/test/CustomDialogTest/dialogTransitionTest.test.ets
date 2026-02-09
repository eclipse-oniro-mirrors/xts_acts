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
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;



export default function dialogTransitionTest() {
  describe('dialogTransitionTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })

    beforeEach(async () => {
      console.info("dialogTransitionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomDialog/dialogTransitionTest',
      }
      try {
        const dialogTransitionTest = AppStorage.get<Router>("router") as Router
        dialogTransitionTest.clear();
        let pages:router.RouterState = dialogTransitionTest.getState();
        console.info("get dialogTransitionTest state pages: " + JSON.stringify(pages));
        if (!("dialogTransitionTest" == pages.name)) {
          console.info("get dialogTransitionTest state pages.name: " + JSON.stringify(pages.name));
          
          dialogTransitionTest.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push dialogTransitionTest page error: " + err);
        expect().assertFail();
      }
    });



    afterEach(async () => {
      if(AppStorage.get<string>('text')!= undefined){
        AppStorage.delete('text')
      }
      await CommonFunc.sleep(1000);
      console.info("dialogTransitionTest after each called");
    });

    
    
/**
     * @tc.number   dialogTransitionTest_static_0100
     * @tc.name     dialogTransitionTest_static_0100
     * @tc.desc     dialogTransitionTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('dialogTransitionTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dialogTransitionTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('open')) as Component;
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let text: string = AppStorage.get<string>('text')!
      expect(text).assertEqual('onWillAppear');
      await driver.triggerKey(2070);
      await CommonFunc.sleep(2000);
      let text1: string = AppStorage.get<string>('text')!
      expect(text1).assertEqual('onDidDisappear');
      console.info('dialogTransitionTest_static_0100 END');
      done();
    });
  })
}