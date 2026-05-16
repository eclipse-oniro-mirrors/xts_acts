/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
import hilog from '@ohos.hilog';
import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';



const domain:int = 0x0000;

export default class StartAbility extends UIAbility {
  public onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    hilog.info(domain, 'testTag', '%{public}s', 'Ability onCreate');
    if (want.abilityName !== undefined) {
      hilog.info(domain, launchParam.launchReason.toString(), '%{public}s', 'Ability onCreate');
    }
  }

  public onDestroy(): Promise<void> | undefined {
    hilog.info(domain, 'testTag', '%{public}s', 'Ability onDestroy');
    return undefined;
  }

  public onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(domain, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/index2', (err: BusinessError<void> | null): void => {
      if (err!.code) {
        hilog.error(domain, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(domain, 'testTag', 'Succeeded in loading the content.');
      AppStorage.setOrCreate<window.WindowStage>('windowStageStart',windowStage);
      AppStorage.setOrCreate('pageContext', this.context);
    });
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