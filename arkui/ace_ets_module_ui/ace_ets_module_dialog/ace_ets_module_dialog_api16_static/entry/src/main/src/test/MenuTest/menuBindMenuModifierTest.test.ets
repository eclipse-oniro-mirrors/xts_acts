'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
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
let testAbilityContext: common.UIAbilityContext;

export default function menuBindMenuModifierTest() {
  describe('menuBindMenuModifierTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api16.static", "EntryAbility")
    })

    beforeEach(async () => {
      console.info("menuBindMenuModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/menuBindMenuModifier',
      }
      try {
        const menuBindMenuModifierTest = AppStorage.get<Router>("router") as Router
        menuBindMenuModifierTest.clear();
        let pages: router.RouterState = menuBindMenuModifierTest.getState();
        console.info("get menuBindMenuModifierTest state pages: " + JSON.stringify(pages));
        if (!("menuBindMenuModifierTest" == pages.name)) {
          console.info("get menuBindMenuModifierTest state pages.name: " + JSON.stringify(pages.name));
          menuBindMenuModifierTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push menuBindMenuModifierTest page error: " + err);
      }
    });


    
    /**
     * @tc.number   MenuBindMenu_static_0001
     * @tc.name     MenuBindMenu_static_0001
     * @tc.desc     MenuBindMenu_static_0001
     * @tc.level    Level.LEVEL2
     */
it('MenuBindMenu_static_0001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('MenuBindMenu_static_0001 START');
      let driver: Driver = Driver.create();
      let btn1 = (await driver.findComponent(ON.id('btnModifier1')));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn22 = (await driver.findComponent(ON.id('btnModifier2')));
      await (btn22?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (btn22?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn33 = (await driver.findComponent(ON.id('btnModifier3')));
      await (btn33?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (btn33?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn44 = (await driver.findComponent(ON.id('btnModifier4')));
      await (btn44?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
