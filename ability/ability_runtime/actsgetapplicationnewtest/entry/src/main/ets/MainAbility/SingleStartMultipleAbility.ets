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
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import { BusinessError } from '@ohos.base';

export default class SingleStartMultipleAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', 'SingleStartMultipleAbility onCreate');
    setTimeout(() => {
      this.context.startAbility({
        bundleName: 'com.example.contexttest',
        abilityName: 'MultipleAbility',
        moduleName: 'entry',
      }, (err: BusinessError) => {
        console.info('SingleStartMultipleAbility startAbility err:' + JSON.stringify(err));
      })
    }, 3000);
  }

  onDestroy() {
    hilog.info(0x0000, 'StartupTest SingleStartMultipleAbility ', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'StartupTest SingleStartMultipleAbility ', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/SingleStartMultipleAbility', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'StartupTest SingleStartMultipleAbility ', 'Failed to load the content. Cause: %{public}s',
          JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'StartupTest SingleStartMultipleAbility ',
        'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'StartupTest SingleStartMultipleAbility ', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'StartupTest SingleStartMultipleAbility ', '%{public}s', 'Ability onBackground');
  }
}
