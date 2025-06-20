/**
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
 
import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

const domain = 0x0000;

export default class StartTestAbility4 extends UIAbility {
  public onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(domain, 'testTag', '%{public}s', 'Ability onCreate');
    if (want.abilityName !== undefined) {
      hilog.info(domain, launchParam.launchReason.toString(), '%{public}s', 'Ability onCreate');
    }
    AppStorage.setOrCreate('bundleName',want.bundleName);
  }

  public onDestroy(): void {
    hilog.info(domain, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  public onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(domain, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    AppStorage.setOrCreate('windowStageStartTest4',windowStage);
    AppStorage.setOrCreate('contextTest4', this.context)
  }

  public onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(domain, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  public onForeground(): void {
    // Ability has brought to foreground
    hilog.info(domain, 'testTag', '%{public}s', 'Ability onForeground');
  }

  public onBackground(): void {
    // Ability has back to background
    hilog.info(domain, 'testTag', '%{public}s', 'Ability onBackground');
  }
}