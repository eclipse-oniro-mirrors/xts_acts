/*
* Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import TestRunner from '@ohos.application.testRunner';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';

async function onAbilityCreateCallback() {
  hilog.info(0x0000, 'testTag', '%{public}s', 'onAbilityCreateCallback');
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() { }

  onPrepare(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner OnPrepare ');
  }

  async onRun() {
    try {
      hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner onRun run');
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      const testAbilityName = 'TestAbility';
      let lMonitor: AbilityDelegatorRegistry.AbilityMonitor = {
        abilityName: testAbilityName,
        onAbilityCreate: onAbilityCreateCallback,
      };
      await abilityDelegator.addAbilityMonitor(lMonitor);

      let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
      const bundleName = abilityDelegatorArguments.bundleName;
      const want: Want = {
        bundleName: bundleName,
        abilityName: testAbilityName
      };
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility(want);
    } catch (err) {
      hilog.error(0x0000, 'testTag', ' err : %{public}s', JSON.stringify(err));
    }
    hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}
