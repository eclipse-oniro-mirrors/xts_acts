/*
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
import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { commonEventManager } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;

let exitTime = 500;

export default class EntryAbility extends UIAbility {
  private exitTask: number = 0;
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'rely2 EntryAbility onCreate');

    if (want?.parameters?.exitTime) {
      exitTime = want.parameters.exitTime as number;
    }
    commonEventManager.publish('demo2_entry_onCreate', {}, () => {});
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'rely2 EntryAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'rely2 EntryAbility onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'rely2 EntryAbility onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'demo2 entry onForeground');
    if (this.exitTask !== 0) {
      return;
    }
    this.exitTask = setTimeout(() => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'rely2 EntryAbility demo2 publish exit');
      commonEventManager.publish('StartSpecifiedAbility_Exit', {}, () => {
        hilog.info(DOMAIN, 'testTag', '%{public}s', 'demo2 exit');
        this.context.terminateSelf();
      });
    }, exitTime);
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'rely2 EntryAbility onBackground');
  }
}