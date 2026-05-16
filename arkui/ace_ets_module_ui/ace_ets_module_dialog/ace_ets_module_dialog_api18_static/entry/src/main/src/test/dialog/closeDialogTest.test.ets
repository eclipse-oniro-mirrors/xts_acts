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

export default function closeDialogTest() {
  describe('closeDialogTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info("closeDialogTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/closeDialogTest',
      }
      try {
        const DialogOptions = AppStorage.get<Router>("router") as Router
        DialogOptions.clear();
        let pages = DialogOptions.getState();
        console.info("get closeDialogTest state pages: " + JSON.stringify(pages));
        if (!("closeDialogTest" == pages.name)) {
          console.info("get closeDialogTest state pages.name: " + JSON.stringify(pages.name));
          DialogOptions.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push closeDialogTest success: ");
        }
      } catch (err) {
        console.error("push closeDialogTest page error: " + err);
        expect().assertFail();
      }
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("closeDialogTest after each called");
    });

    
    
/**
     * @tc.number   closeDialogTest_static_0100
     * @tc.name     closeDialogTest_static_0100
     * @tc.desc     closeDialogTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
it('closeDialogTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('closeDialogTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('customDialog'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let toast = await driver.findComponent(ON.text('确认'));
      expect(toast != null).assertTrue()
      console.info('closeDialogTest_static_0100 0  ok');
      await CommonFunc.sleep(1500);
      toast = await driver.findComponent(ON.text('确认'));
      expect(toast != null).assertTrue()
      console.info('closeDialogTest_static_0100 null  ok');
      await CommonFunc.sleep(1500);
      toast = await driver.findComponent(ON.text('确认'));
      expect(toast != null).assertTrue()
      console.info('closeDialogTest_static_0100 undefined  ok');
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('ok'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      console.info('closeDialogTest_static_0100 END');
      done();
    });
  })
}