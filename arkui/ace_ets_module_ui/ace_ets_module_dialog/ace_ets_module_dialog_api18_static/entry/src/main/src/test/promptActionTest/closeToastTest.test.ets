'use static';
/*
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

export default function closeToastTest() {
  describe('closeToastTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info("closeToastTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/closeToastTest',
      }
      try {
        const DialogOptions = AppStorage.get<Router>("router") as Router
        DialogOptions.clear();
        let pages = DialogOptions.getState();
        console.info("get closeToastTest state pages: " + JSON.stringify(pages));
        if (!("closeToastTest" == pages.name)) {
          console.info("get closeToastTest state pages.name: " + JSON.stringify(pages.name));
          DialogOptions.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push closeToastTest success: ");
        }
      } catch (err) {
        console.error("push closeToastTest page error: " + err);
        expect().assertFail();
      }
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("closeToastTest after each called");
    });

    
    
/**
     * @tc.number   closeToastTest_static_0100
     * @tc.name     closeToastTest_static_0100
     * @tc.desc     closeToastTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('closeToastTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('closeToastTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('open'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let toast = await driver.findComponent(ON.text('Toast Massage'));
      expect(toast != null).assertTrue()
      console.info('closeDialogTest_static_0100 0  ok');
      await CommonFunc.sleep(1500);
      toast = await driver.findComponent(ON.text('Toast Massage'));
      expect(toast != null).assertTrue()
      console.info('closeDialogTest_static_0100 undefined  ok');
      await CommonFunc.sleep(2000);
      toast = await driver.findComponent(ON.text('Toast Massage'));
      expect(toast != null).assertTrue()
      console.info('closeDialogTest_static_0100 null  ok');
      await CommonFunc.sleep(500);
      console.info('closeToastTest_static_0100 END');
      done();
    });
  })
}