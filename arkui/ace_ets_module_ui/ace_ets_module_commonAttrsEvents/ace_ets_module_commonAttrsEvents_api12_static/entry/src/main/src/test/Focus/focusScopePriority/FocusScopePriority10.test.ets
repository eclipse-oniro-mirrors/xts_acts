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

export default function FocusScopePriority10() {
  describe('FocusScopePriority10', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("FocusScopePriority10 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Focus/focusScopePriority/FocusScopePriority10',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusScopePriority10 state success " + JSON.stringify(pages));
        if (!("FocusScopePriority10" == pages.name)) {
          console.info("get FocusScopePriority10 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FocusScopePriority10 page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("FocusScopePriority10 after each called");
    });

    /**
     * @tc.number    FocusScopePriority10_static_0100
     * @tc.name      FocusScopePriority10_static_0100
     * @tc.desc      Test FocusScopePriority
     * @tc.level     Level 2
     */
    it('FocusScopePriority10_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[FocusScopePriority10_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_12 = await (driver.findComponent(ON.id('FocusScopePriority10_btn2_12')) as Promise<Component>);
      let btn2_12_isFocusedValue = await btn2_12.isFocused()
      expect(btn2_12_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority10_static_0100] btn2_12 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3_12 = await (driver.findComponent(ON.id('FocusScopePriority10_btn3_12')) as Promise<Component>);
      let btn3_12_isFocusedValue = await btn3_12.isFocused()
      expect(btn3_12_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority10_static_0100] btn3_12 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1_12 = await (driver.findComponent(ON.id('FocusScopePriority10_btn1_12')) as Promise<Component>);
      let btn1_12_isFocusedValue = await btn1_12.isFocused()
      expect(btn1_12_isFocusedValue).assertEqual(true);
      console.info('[FocusScopePriority10_static_0100] btn1_12 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2_12_isFocusedValue2 = await btn2_12.isFocused()
      expect(btn2_12_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopePriority10_static_0100] btn2_12 isFocused 2');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3_12_isFocusedValue2 = await btn3_12.isFocused()
      expect(btn3_12_isFocusedValue2).assertEqual(true);
      console.info('[FocusScopePriority10_static_0100] btn3_12 isFocused 2');

      let scrollBar = await (driver.findComponent(ON.id('FocusScopePriority10_scroll')) as Promise<Component>);
      let clearFocus = await (scrollBar.scrollSearch(ON.id('FocusScopePriority10_clearFocus')) as Promise<Component>);
      await clearFocus.click()
      await CommonFunc.sleep(1000);
      console.info('[FocusScopePriority10_static_0100] clearFocus click');

      console.info('[FocusScopePriority10_static_0100] END');
      done();
    });
  })
}

