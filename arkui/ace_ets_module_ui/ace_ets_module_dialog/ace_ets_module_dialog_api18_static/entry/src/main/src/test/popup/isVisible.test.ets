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
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function isVisible() {
  describe('isVisible', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info("isVisible beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/isVisible',
      }
      try {
        const isVisible = AppStorage.get<Router>("router") as Router
        isVisible.clear();
        let pages:router.RouterState = isVisible.getState();
        console.info("get isVisible state pages: " + JSON.stringify(pages));
        if (!("isVisible" == pages.name)) {
          console.info("get isVisible state pages.name: " + JSON.stringify(pages.name));
          // let result = await isVisible.pushUrl(options);
          isVisible.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push isVisible success: ");
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push isVisible page error: " + err);
        expect().assertFail();
      }
    });


    afterEach(async () => {
      if (AppStorage.get<Boolean>('isVisible') != undefined) {
        AppStorage.delete('isVisible')
      }
      await CommonFunc.sleep(1000);
      console.info("customDialogLevelOrder after each called");
    });

    
    
/**
     * @tc.number   isVisible_static_0100
     * @tc.name     isVisible_static_0100
     * @tc.desc     isVisible_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('isVisible_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('isVisible_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('popup'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let isVisible:boolean =  AppStorage.get<Boolean>('isVisible')!
      console.log(isVisible + 'event.isVisible')
      expect(isVisible).assertTrue()
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      isVisible =  AppStorage.get<Boolean>('isVisible')!
      expect(isVisible).assertFalse()
      console.info('isVisible_static_0100 END');
      done();
    });
  })
}