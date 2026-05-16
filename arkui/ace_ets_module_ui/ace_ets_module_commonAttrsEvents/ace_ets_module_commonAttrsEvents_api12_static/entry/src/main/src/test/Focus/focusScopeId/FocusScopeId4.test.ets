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
import { UtilsTest } from '../../Util.test'
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../../hypium/index';
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

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function FocusScopeId4() {
  describe('FocusScopeId4', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("FocusScopeId4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId4',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusScopeId4 state success " + JSON.stringify(pages));
        if (!("FocusScopeId4" == pages.name)) {
          console.info("get FocusScopeId4 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push FocusScopeId4 page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId4 after each called");
    });

    /**
     * @tc.number FocusScopeId4_static_0100
     * @tc.name FocusScopeId4_static_0100
     * @tc.desc Test support for directional key focus group penetration ability
     * @tc.level Level 2
     */
    it('FocusScopeId4_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FocusScopeId4_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await (driver.findComponent(ON.id('FocusScopeId4_ug')) as Promise<Component>);
      await btn.click()
      console.info("[FocusScopeId4_static_0100] btn click");
      await CommonFunc.sleep(2000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3_6 = await (driver.findComponent(ON.id('FocusScopeId4_btn3_6')) as Promise<Component>);
      let btn3_6_isFocusedValue = await btn3_6.isFocused()
      expect(btn3_6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId4_static_0100] btn3_6 isFocused');

      await driver.triggerKey(2012);
      await CommonFunc.sleep(1000);

      let btn2_6 = await (driver.findComponent(ON.id('FocusScopeId4_btn2_6')) as Promise<Component>);
      let btn2_6_isFocusedValue = await btn2_6.isFocused()
      expect(btn2_6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId4_static_0100] btn2_6 isFocused');

      await driver.triggerKey(2012);
      await CommonFunc.sleep(1000);

      let btn1_6 = await (driver.findComponent(ON.id('FocusScopeId4_btn1_6')) as Promise<Component>);
      let btn1_6_isFocusedValue = await btn1_6.isFocused()
      expect(btn1_6_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId4_static_0100] btn1_6 isFocused');

      await driver.triggerKey(2012);
      await CommonFunc.sleep(1000);

      let btn1_5 = await (driver.findComponent(ON.id('FocusScopeId4_btn1_5')) as Promise<Component>);
      let btn1_5_isFocusedValue = await btn1_5.isFocused()
      expect(btn1_5_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId4_static_0100] btn1_5 isFocused');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn2_5 = await (driver.findComponent(ON.id('FocusScopeId4_btn2_5')) as Promise<Component>);
      let btn2_5_isFocusedValue = await btn2_5.isFocused()
      expect(btn2_5_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId4_static_0100] btn2_5 isFocused');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn3_5 = await (driver.findComponent(ON.id('FocusScopeId4_btn3_5')) as Promise<Component>);
      let btn3_5_isFocusedValue = await btn3_5.isFocused()
      expect(btn3_5_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId4_static_0100] btn3_5 isFocused');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn1_6_isFocusedValue2 = await btn1_6.isFocused()
      expect(btn1_6_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId4_static_0100] btn1_6 isFocused');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn2_6_isFocusedValue2 = await btn2_6.isFocused()
      expect(btn2_6_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId4_static_0100] btn2_6 isFocused');

      await driver.triggerKey(2013);
      await CommonFunc.sleep(1000);

      let btn3_6_isFocusedValue2 = await btn3_6.isFocused()
      expect(btn3_6_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId4_static_0100] btn3_6 isFocused 2');

      let btn2 = await (driver.findComponent(ON.id('FocusScopeId4_zh')) as Promise<Component>);
      await btn2.click()
      console.info("[FocusScopeId4_static_0100] btn2 click");
      await CommonFunc.sleep(2000);

      let clearFocus = await (driver.findComponent(ON.id('FocusScopeId4_clearFocus')) as Promise<Component>);
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId4_static_0100] clearFocus click');

      console.info('[FocusScopeId4_static_0100] END');
      done();
    });
  })
}

