/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import cryptoFramework from '@ohos.security.cryptoFramework';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';

export default class PermissionUtils {
  static async getPermission(abilityContext: Context, permissions: Array<Permissions>) {
    try {
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      atManager.requestPermissionsFromUser(abilityContext, permissions)
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to requestPermissionsFromUser. error: ${JSON.stringify(err)}`)
    }
  }

  static delegator = abilityDelegatorRegistry.getAbilityDelegator();

  static async grantPermission() {
    let driver = Driver.create();
    await driver.delayMs(2000)
    let button = await driver.findComponent(ON.text('允许'));
    if (button == null) {
      let cmd = "hidumper -s WindowManagerService -a'-a'"
      await PermissionUtils.delegator.executeShellCommand(cmd);
    }
    while (button) {
      await button.click();
      await driver.delayMs(500)
      button = await driver.findComponent(ON.text('允许'));
    }
  }
}