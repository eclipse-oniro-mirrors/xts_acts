/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { AbilityConstant, UIAbility,common, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

// AbilityD：配置了Promission权限的测试用ability，有返回结果
export default class AbilityD extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag AbilityD', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag AbilityD', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag AbilityD', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('abilityd/pages/IndexD', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag AbilityD', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag AbilityD', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag AbilityD', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag AbilityD', '%{public}s', 'Ability onForeground');
    let resultCode = 100;
    let want: Want = {
      bundleName: 'com.test.actsabilityerrcodequerytest',
      abilityName: 'AbilityD'
    }
    let abilityResult: common.AbilityResult = {
      want,
      resultCode
    };
    try {
      setTimeout(() => {
        this.context.terminateSelfWithResult(abilityResult, (err: BusinessError) => {
          if (err.code) {
            console.error(`terminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('terminateSelfWithResult succeed');
        });
      }, 500);
    } catch (err) {
      let code = (err as BusinessError).code;
      let message = (err as BusinessError).message;
      console.error(`terminateSelfWithResult failed, code is ${code}, message is ${message}`);
    }
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag AbilityD', '%{public}s', 'Ability onBackground');
  }
}
