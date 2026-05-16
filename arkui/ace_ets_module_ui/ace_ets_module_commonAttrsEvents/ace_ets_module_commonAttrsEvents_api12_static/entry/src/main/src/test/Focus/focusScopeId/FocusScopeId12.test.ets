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

import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../../hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function FocusScopeId12() {
  describe('FocusScopeId12', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("FocusScopeId12 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId12',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusScopeId12 state success " + JSON.stringify(pages));
        if (!("FocusScopeId12" == pages.name)) {
          console.info("get FocusScopeId12 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FocusScopeId12 page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId12 after each called");
    });

    /**
     * @tc.number    FocusScopeId12_static_0100
     * @tc.name      FocusScopeId12_static_0100
     * @tc.desc      Support cross group and circular focusing with tab keys in focus groups
     * @tc.level     Level 2
     */
    it('FocusScopeId12_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FocusScopeId12_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btnOpen = await (driver.findComponent(ON.id('FocusScopeId12_open')) as Promise<Component>);
      await btnOpen.click()
      await CommonFunc.sleep(2000);
      console.info('[FocusScopeId12_static_0100] btnOpen click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_1 = await (driver.findComponent(ON.id('FocusScopeId12_btn1_1')) as Promise<Component>);
      let btn1_1_isFocusedValue = await btn1_1.isFocused()
      expect(btn1_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId12_static_0100] btn1_1 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let textInput = await (driver.findComponent(ON.id('FocusScopeId12_TextInput')) as Promise<Component>);
      let textInput_isFocusedValue = await textInput.isFocused()
      expect(textInput_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId12_static_0100] textInput isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn_close = await (driver.findComponent(ON.id('FocusScopeId12_close')) as Promise<Component>);
      let btn_close_isFocusedValue = await btn_close.isFocused()
      expect(btn_close_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId12_static_0100] btn_close isFocused');

      await btn_close.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId12_static_0100] close click');

      console.info('[FocusScopeId12_static_0100] END');
      done();
    });
  })
}

