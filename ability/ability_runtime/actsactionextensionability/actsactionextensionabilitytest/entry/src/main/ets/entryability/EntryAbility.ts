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

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    const TIMEOUT = 50;
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    globalThis.terminate = (str) => {
      setTimeout(() => {
        this.context.terminateSelf().then(() => {
          console.info('====>terminateSelf' + JSON.stringify(str) + ' end');
        }).catch((err) => {
          console.info('====>terminateSelf ' + JSON.stringify(str) + ' err:' + JSON.stringify(err));
        });
      }, TIMEOUT);
    };

    if (want.action === 'Acts_ActionExtensionAbility_0100') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_0100');
      AppStorage.SetOrCreate('want', {
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'ActsActionExtensionAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_0300') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_0300');
      AppStorage.SetOrCreate('want', {
        bundleName: 'com.example.actsactionextensionabilityrely',
        abilityName: 'ActsActionExtensionAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_0400') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_0400');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_0400',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'FeatureActionExtensionAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_0500') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_0500');
      AppStorage.SetOrCreate('want', {
        bundleName: '',
        abilityName: 'ActsActionExtensionAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_0600') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_0600');
      AppStorage.SetOrCreate('want', {
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: '',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_0700') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_0700');
      AppStorage.SetOrCreate('want', {
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'ActsActionExtensionAbility',
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_DEFAULT') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_DEFAULT');
      AppStorage.SetOrCreate('want', {
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_1000') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_1000');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_1000',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_1100') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_1100');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_1100',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_1200') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_1200');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_1200',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_1300') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_1300');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_1300',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_1400') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_1400');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_1400',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_1500') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_1500');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_1500',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_1600') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_1600');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_1600',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }


    if (want.action === 'Acts_ActionExtensionAbility_1700') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_1700');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_1700',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_1800') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_1800');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_1800',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_context') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_context');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_context',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_2200') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_2200');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_2200',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_2300') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_2300');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_2300',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_2400') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_2400');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_2400',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_2500') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_2500');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_2500',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_2600') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_2600');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_2600',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_2700') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_2700');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_2700',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_2800') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_2800');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_2800',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_2900') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_2900');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_2900',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_3000') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_3000');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_3000',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_3100') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_3100');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_3100',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_3200') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_3200');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_3200',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_3300') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_3300');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_3300',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_3400') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_3400');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_3400',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Acts_ActionExtensionAbility_3500') {
      console.info('====>EntryAbility want.action == Acts_ActionExtensionAbility_3500');
      AppStorage.SetOrCreate('want', {
        action: 'Acts_ActionExtensionAbility_3500',
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }
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
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');

  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
