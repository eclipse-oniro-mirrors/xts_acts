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
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
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

    if (want.action === 'AsyncCallback_0100') {
      console.info("====>EntryAbility want.action == 'AsyncCallback_0100':");
      AppStorage.SetOrCreate('want', {
        action: 'AsyncCallback_0100',
        bundleName: 'com.example.mainhap',
        abilityName: 'UIExtAbility'
      });
    } else if (want.action === 'AsyncCallback_0300') {
      console.info("====>EntryAbility want.action == 'AsyncCallback_0300':");
      AppStorage.SetOrCreate('want', {
        action: 'AsyncCallback_0300',
        bundleName: 'com.example.mainhap',
        abilityName: 'UIExtAbility'
      });
    } else if (want.action === 'AsyncCallback_0400') {
      console.info("====>EntryAbility want.action == 'AsyncCallback_0400':");
      AppStorage.SetOrCreate('want', {
        action: 'AsyncCallback_0400',
        bundleName: 'com.example.mainhap',
        abilityName: 'UIExtAbility'
      });
    } else if (want.action === 'AsyncCallback_0500') {
      console.info("====>EntryAbility want.action == 'AsyncCallback_0500':");
      AppStorage.SetOrCreate('want', {
        action: 'AsyncCallback_0500',
        bundleName: 'com.example.mainhap',
        abilityName: 'UIExtAbility'
      });
    }

    if (want.action === 'Promise_0100') {
      console.info("====>EntryAbility want.action == 'Promise_0100':");
      AppStorage.SetOrCreate('want', {
        action: 'Promise_0100',
        bundleName: 'com.example.mainhap',
        abilityName: 'UIExtAbility'
      });
    } else if (want.action === 'Promise_0300') {
      console.info("====>EntryAbility want.action == 'Promise_0300':");
      AppStorage.SetOrCreate('want', {
        action: 'Promise_0300',
        bundleName: 'com.example.mainhap',
        abilityName: 'UIExtAbility'
      });
    } else if (want.action === 'Promise_0400') {
      console.info("====>EntryAbility want.action == 'Promise_0400':");
      AppStorage.SetOrCreate('want', {
        action: 'Promise_0400',
        bundleName: 'com.example.mainhap',
        abilityName: 'UIExtAbility'
      });
    } else if (want.action === 'Promise_0500') {
      console.info("====>EntryAbility want.action == 'Promise_0500':");
      AppStorage.SetOrCreate('want', {
        action: 'Promise_0500',
        bundleName: 'com.example.mainhap',
        abilityName: 'UIExtAbility'
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
    globalThis.StartAbilityForResult = () => {
      this.context.startAbilityForResult({
        bundleName: 'com.example.mainhap',
        abilityName: 'CalledAbility',
        //moduleName: 'entry'
      }, (error, data) => {
        console.log('=======>startAbilityForResult error.code ======>' + error.code);
        console.log('=======>startAbilityForResult data.resultCode ======>' + data.resultCode);
        console.log('=======>startAbilityForResult data.action ======>' + data.want.parameters.action);
      });
    };

    globalThis.startUIExtension = () => {
      this.context.startAbility({
        bundleName: 'com.example.mainhap',
        abilityName: 'UIExtAbility',
      }, (err) => {
        console.info('====>startAbility err:' + JSON.stringify(err));
      });
    };
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
