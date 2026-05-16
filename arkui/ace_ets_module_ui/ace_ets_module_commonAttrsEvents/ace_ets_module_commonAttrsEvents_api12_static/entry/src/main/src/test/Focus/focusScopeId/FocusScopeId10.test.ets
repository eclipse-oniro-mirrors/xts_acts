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

export default function FocusScopeId10() {
  describe('FocusScopeId10', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("FocusScopeId10 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId10',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusScopeId10 state success " + JSON.stringify(pages));
        if (!("FocusScopeId10" == pages.name)) {
          console.info("get FocusScopeId10 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push FocusScopeId10 page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId10 after each called");
    });

    /**
     * @tc.number    FocusScopeId10_static_0100
     * @tc.name      FocusScopeId10_static_0100
     * @tc.desc      Support cross group and circular focusing with tab keys in focus groups
     * @tc.level     Level 2
     */
    it('FocusScopeId10_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FocusScopeId10_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3 = await (driver.findComponent(ON.id('FocusScopeId10_btn3')) as Promise<Component>);
      let btn3_isFocusedValue = await btn3.isFocused()
      expect(btn3_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn3 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn4 = await (driver.findComponent(ON.id('FocusScopeId10_btn4')) as Promise<Component>);
      let btn4_isFocusedValue = await btn4.isFocused()
      expect(btn4_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn4 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn6 = await (driver.findComponent(ON.id('FocusScopeId10_btn6')) as Promise<Component>);
      let btn6_isFocusedValue = await btn6.isFocused()
      expect(btn6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn6 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn7 = await (driver.findComponent(ON.id('FocusScopeId10_btn7')) as Promise<Component>);
      let btn7_isFocusedValue = await btn7.isFocused()
      expect(btn7_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn7 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3_isFocusedValue2 = await btn3.isFocused()
      expect(btn3_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn3 isFocused 2');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn4_isFocusedValue2 = await btn4.isFocused()
      expect(btn4_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn4 isFocused 2');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn5 = await (driver.findComponent(ON.id('FocusScopeId10_btn5')) as Promise<Component>);
      let btn5_isFocusedValue = await btn5.isFocused()
      expect(btn5_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn5 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn6_isFocusedValue2 = await btn6.isFocused()
      expect(btn6_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn6 isFocused 2');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn7_isFocusedValue2 = await btn7.isFocused()
      expect(btn7_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId10_static_0100] btn7 isFocused 2');

      let clearFocus = await (driver.findComponent(ON.id('FocusScopeId10_btn5')) as Promise<Component>);
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId10_static_0100] clearFocus click');

      console.info('[FocusScopeId10_static_0100] END');
      done();
    });
  })
}

