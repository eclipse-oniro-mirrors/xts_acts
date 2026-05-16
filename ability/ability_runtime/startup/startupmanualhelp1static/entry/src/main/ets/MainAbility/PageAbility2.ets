/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
'use static';

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import { AbilityConstant } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';

export default class PageAbility2 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'StartupTest PageAbility2', '%{public}s', 'PageAbility2 onCreate');
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'StartupTest PageAbility2 ', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'StartupTest PageAbility2 ', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/index', (err: BusinessError<void> | null): void => {
      if (err?.code) {
        hilog.info(0x0000, 'testTag', 'PageAbility2 loadContent error');
        return;
      }
      hilog.info(0x0000, 'testTag', 'PageAbility2 loadContent ok');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'StartupTest PageAbility2 ', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'StartupTest PageAbility2 ', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'StartupTest PageAbility2 ', '%{public}s', 'Ability onBackground');
  }
}
