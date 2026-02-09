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

export default function FocusScopeId11() {
  describe('FocusScopeId11', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("FocusScopeId11 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopeId/FocusScopeId11',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusScopeId11 state success " + JSON.stringify(pages));
        if (!("FocusScopeId11" == pages.name)) {
          console.info("get FocusScopeId11 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FocusScopeId11 page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopeId11 after each called");
    });

    /**
     * @tc.number    FocusScopeId11_static_0100
     * @tc.name      FocusScopeId11_static_0100
     * @tc.desc      Support cross group and circular focusing with tab keys in focus groups
     * @tc.level     Level 2
     */
    it('FocusScopeId11_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FocusScopeId11_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_2 = await (driver.findComponent(ON.id('FocusScopeId1_btn1_2')) as Promise<Component>);
      let btn1_2_isFocusedValue = await btn1_2.isFocused()
      expect(btn1_2_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId11_static_0100] btn1_2 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_1 = await (driver.findComponent(ON.id('FocusScopeId1_btn1_1')) as Promise<Component>);
      let btn1_1_isFocusedValue = await btn1_1.isFocused()
      expect(btn1_1_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId11_static_0100] btn1_1 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_3 = await (driver.findComponent(ON.id('FocusScopeId1_btn1_3')) as Promise<Component>);
      let btn1_3_isFocusedValue = await btn1_3.isFocused()
      expect(btn1_3_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId11_static_0100] btn1_3 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_2_isFocusedValue2 = await btn1_2.isFocused()
      expect(btn1_2_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId11_static_0100] btn1_2 isFocused 2');

      let btn2_3 = await (driver.findComponent(ON.id('FocusScopeId1_btn2_3')) as Promise<Component>);
      await btn2_3.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId11_static_0100] btn2_3 click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_3_isFocusedValue = await btn2_3.isFocused()
      expect(btn2_3_isFocusedValue).assertEqual(true);
      console.info('[FocusScopeId11_static_0100] btn2_3 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_2_isFocusedValue3 = await btn1_2.isFocused()
      expect(btn1_2_isFocusedValue3).assertEqual(true);
      console.info('[FocusScopeId11_static_0100] btn1_2 isFocused 3');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_1_isFocusedValue2 = await btn1_1.isFocused()
      expect(btn1_1_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId11_static_0100] btn1_1 isFocused 2');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_3_isFocusedValue2 = await btn2_3.isFocused()
      expect(btn2_3_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopeId11_static_0100] btn2_3 isFocused 2');

      await btn1_1.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopeId11_static_0100] clearFocus click');

      console.info('[FocusScopeId11_static_0100] END');
      done();
    });
  })
}

