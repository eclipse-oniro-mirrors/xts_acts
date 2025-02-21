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
import commonEvent from '@ohos.commonEventManager';

let ACTS_CallFunction: commonEvent.CommonEventSubscribeInfo = {
  events: ['0100', '0200', '0300', '0400', '0500', '0600', '0700', '0800', '0900', '1000', '1100', '1200', '1300']
};

let setWant = (want) => {
  if (want.parameters.parameter === 'StartAbilityForResultAsCaller_0700') {
    console.info("====>[backGroundAbility] Entry want.parameters.parameter == 'StartAbilityForResultAsCaller_0700':");
    AppStorage.SetOrCreate('want', {
      bundleName: 'com.example.uiextensionforresultascallerbackground',
      abilityName: 'UIExtAbility',
      parameters: {
        'ability.want.params.uiExtensionType': 'share',
        parameter: 'StartAbilityForResultAsCaller_0700'
      }
    });
  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1200') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_1200':");
    AppStorage.SetOrCreate('want', {
      bundleName: 'com.example.uiextensionforresultascallerbackground',
      abilityName: 'UIExtAbility',
      parameters: {
        'ability.want.params.uiExtensionType': 'share',
        parameter: 'StartAbilityForResultAsCaller_1200'
      }
    });
  } else if (want.parameters.parameter == 'StartAbilityForResultAsCaller_2100') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_2100':");
    AppStorage.SetOrCreate('want', {
      bundleName: 'com.example.uiextensionforresultascallerbackground',
      abilityName: 'UIExtAbility',
      parameters: {
        'ability.want.params.uiExtensionType': 'share',
        parameter: 'StartAbilityForResultAsCaller_2100'
      }
    });
  } else if (want.parameters.parameter === 'StartAbilityForResultAsCaller_1300') {
    console.info("====>[UIExtensionForResultAsCallerRely] want.parameters.parameter == 'StartAbilityForResultAsCaller_1300':");
    AppStorage.SetOrCreate('want', {
      bundleName: 'com.example.uiextensionforresultascallerbackground',
      abilityName: 'UIExtAbility',
      parameters: {
        'ability.want.params.uiExtensionType': 'share',
        parameter: 'StartAbilityForResultAsCaller_1300'
      }
    });
  }
}

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    setWant(want);
  }

  onNewWant(want, launchParam) {
    console.info('===> [backGroundAbility] Entry onNewWant')
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
    console.info('====> EntryAbility BackGround');
  }
}
