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

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import type window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

AppStorage.setOrCreate<Function>("StartServiceAbility", () => {
  let want: Want = {
    'deviceId': '',
    'bundleName': 'com.acts.attachdebugextensiontest',
    'abilityName': 'ServiceExtAbility'
  }
  AppStorage.get<common.UIAbilityContext>("abilityContext").startServiceExtensionAbility(want, (error: BusinessError) => {
    console.log('Start service extension ability:  ' + JSON.stringify(error));
  })
})

AppStorage.setOrCreate<Function>("StartServiceAbilityAbnormally", () => {
  let want: Want = {
    'deviceId': '',
    'bundleName': 'com.acts.attachdebugextensiontest',
    'abilityName': 'ServiceExtAbility',
    'action': 'abnormal'
  }
  AppStorage.get<common.UIAbilityContext>("abilityContext").startServiceExtensionAbility(want, (error: BusinessError) => {
    console.log('Start service extension ability abnormally:  ' + JSON.stringify(error));
  })
})

AppStorage.setOrCreate<Function>("StopServiceAbility", () => {
  let want: Want = {
    'deviceId': '',
    'bundleName': 'com.acts.attachdebugextensiontest',
    'abilityName': 'ServiceExtAbility'
  }
  AppStorage.get<common.UIAbilityContext>("abilityContext").stopServiceExtensionAbility(want, (error: BusinessError) => {
    console.log('Stop service extension ability:  ' + JSON.stringify(error));
  })
})

AppStorage.setOrCreate<Function>("StartAbility", () => {
  let want: Want = {
    'deviceId': '',
    'bundleName': 'com.acts.attachdebugextensiontest',
    'abilityName': 'EntryAbility'
  }
  AppStorage.get<common.UIAbilityContext>("abilityContext").startAbility(want, (error: BusinessError) => {
    console.log('Start UIAbility: ' + JSON.stringify(error));
  })
})

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    AppStorage.setOrCreate<common.UIAbilityContext>("abilityContext", this.context);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
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
