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

const TERMIN_TIMEOUT = 1000;
const START_TIMEOUT = 500;
let param;

export default class SecondAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    param = want.parameters.parameter;
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
    if (param === 'AbilityStage_OnDestroy_0500_EntryAbility') {
      setTimeout(() => {
        this.context.startAbility({
          bundleName: 'com.example.abilitystageondestroytest',
          moduleName: 'entry',
          abilityName: 'OtherAbility',
          parameters: {
            parameter: 'AbilityStage_OnDestroy_0500_SecondAbility'
          }
        }).then(() => {
          console.info(param, 'SecondAbility startAbility success');
        }).catch((err) => {
          console.error(param, `SecondAbility startAbility failed, err is: ${JSON.stringify(err)}`);
        })
      }, START_TIMEOUT)
    }
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    if (param === 'AbilityStage_OnDestroy_0200') {
      setTimeout(() => {
        this.context.terminateSelf().then(() => {
          console.info(param, 'SecondAbility terminateSelf success');
        }).catch((err) => {
          console.error(param, `SecondAbility terminateSelf failed, err is: ${JSON.stringify(err)}`);
        })
      }, TERMIN_TIMEOUT)
    }
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}