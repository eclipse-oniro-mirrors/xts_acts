/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import  hilog  from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import access from '@ohos.bluetooth.access';
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation } from '@ohos.UiTest';

const abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'btUtilsTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
  export default class Utils{

  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async clickRequestPermission(mess: string) : Promise<void> {
    hilog.info(domain, tag, 'clickRequestPermission start');
    try {
      let driver = Driver.create();
      let button: Component | null = await driver.findComponent(ON.text('仅本次允许'));
      if (button) {
        let permissionButton1 = await driver.waitForComponent(ON.text('仅本次允许', MatchPattern.EQUALS), 10000);
        if (permissionButton1 != null) {
          await permissionButton1.click();
          hilog.info(domain, tag, 'clickRequestPermission end');
        }
      } else {
        let permissionButton = await driver.waitForComponent(ON.text(mess, MatchPattern.EQUALS), 10000);
        if (permissionButton != null) {
          await permissionButton.click();
          hilog.info(domain, tag, 'clickRequestPermission end');
        }
      }
    } catch (err) {
      hilog.info(domain, tag, 'clickRequestPermission get err:' + err);
    }
  }
}