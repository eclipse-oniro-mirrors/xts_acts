/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { window } from '@kit.ArkUI';

// AbilityE：配置了exported为false的ability，无返回结果
export default class AbilityE extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag AbilityE', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag AbilityE', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag AbilityE', '%{public}s', 'Ability onWindowStageCreate');

    //  ./pages/IndexA
    windowStage.loadContent('abilitye/pages/IndexE', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag AbilityE', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag AbilityE', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag AbilityE', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag AbilityE', '%{public}s', 'Ability onForeground');
    try {
      setTimeout(() => {
        this.context.terminateSelf((err: BusinessError) => {
          if (err.code) {
            console.error(`terminateSelf failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('terminateSelf succeed');
        });
      }, 500);
    } catch (err) {
      let code = (err as BusinessError).code;
      let message = (err as BusinessError).message;
      console.error(`terminateSelf failed, code is ${code}, message is ${message}`);
    }
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag AbilityE', '%{public}s', 'Ability onBackground');
  }
}
