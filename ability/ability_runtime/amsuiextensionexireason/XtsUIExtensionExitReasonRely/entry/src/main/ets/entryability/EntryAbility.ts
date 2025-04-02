/*
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
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let setWantParameters = (actionIn: String, bundelNameIn: String, abilityNameIn: String, uiExtensionTypeIn: String) => {
  AppStorage.setOrCreate('want', {
    action: actionIn,
    bundleName: bundelNameIn,
    abilityName: abilityNameIn,
    parameters: {
      'ability.want.params.uiExtensionType': uiExtensionTypeIn
    }
  });
}

let setWant = (want) => {
  let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
  let bundleName = abilityDelegatorArguments.bundleName;
  let abilityName = want.parameters?.UIExtensionAbilityName;
  let uiExtensionType = want.parameters?.UIExtensionType;
  if (want.action === 'StartAbilityForResultAsCaller_0100') {
    setWantParameters(want.action, bundleName, abilityName, uiExtensionType);
  }
}

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    console.info('====> [UIExtensionForResultAsCallerRely] onCreate._0100——0008：%{public}s',
      want.parameters?.UIExtensionAbilityName);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate' + '_0100——0009');
    setWant(want);
  }

  onNewWant(want, launchParam) {
    console.info('====> [UIExtensionForResultAsCallerRely] onNewWant._0100——0010：%{public}s',
      want.parameters?.UIExtensionAbilityName);
    setWant(want);
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. _0100——0011 Cause: %{public}s',
          JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. _0100——0012 Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
