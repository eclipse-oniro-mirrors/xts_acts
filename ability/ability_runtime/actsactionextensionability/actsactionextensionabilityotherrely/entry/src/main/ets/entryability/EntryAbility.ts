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
import window from '@ohos.window';

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    console.info('====>another EntryAbility');

    if (want.action === 'ActionExtensionAbility_0100') {
      this.context.startAbility({
        bundleName: 'com.example.actsactionextensionabilityrely',
        abilityName: 'ActsActionExtensionAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      }).catch((err)=>{
        console.info('====>ActionExtensionAbility_0100 err:' + JSON.stringify(err));
      });
    }

    if (want.action === 'AsyncCallback_0200') {
      console.info("====>EntryAbility want.action == 'AsyncCallback_0200':");
      AppStorage.SetOrCreate('want', {
        action: 'AsyncCallback_0200',
        bundleName: 'com.example.actsactionextensionabilityrely',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'AsyncCallback_0300') {
      console.info("====>EntryAbility want.action == 'AsyncCallback_0300':");
      AppStorage.SetOrCreate('want', {
        action: 'AsyncCallback_0300',
        bundleName: 'com.example.actsactionextensionabilityrely',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }

    if (want.action === 'Promise_0200') {
      console.info("====>EntryAbility want.action == 'Promise_0200':");
      AppStorage.SetOrCreate('want', {
        action: 'Promise_0200',
        bundleName: 'com.example.actsactionextensionabilityrely',
        abilityName: 'UIExtAbility',
        parameters: {
          'ability.want.params.uiExtensionType': 'action'
        }
      });
    }
    if (want.action === 'Promise_0300') {
      console.info("====>EntryAbility want.action == 'Promise_0300':");
      AppStorage.SetOrCreate('want', {
        action: 'Promise_0300',
        bundleName: 'com.example.actsactionextensionabilityrely',
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

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
