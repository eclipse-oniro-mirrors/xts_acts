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
import { AbilityConstant, appManager, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { commonEventManager } from '@kit.BasicServicesKit';
import { JSON, process } from '@kit.ArkTS';

const DOMAIN = 0x0000;
let exitTime = 500;

export default class IsolationAbility extends UIAbility {
  private exitTask: number = 0;
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate ' + JSON.stringify(want));

    let flag: string = want.parameters?.flag as string;
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'IsolationAbility flag: ' + flag);
    if (flag === 'delayExit') {
      exitTime = 1400;
    }

    appManager.getRunningProcessInformation().then((result) => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'RunningProcessInfo ' + JSON.stringify(result));
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'RunningProcessInfo ' + JSON.stringify(process.pid));
      for (let item of result) {
        if (item.pid === process.pid) {
          commonEventManager.publish('IsolationAbility_onCreate', {data: item.processName}, () => {});
        }
      }
    });
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onNewWant' + JSON.stringify(want));
    commonEventManager.publish('IsolationAbility_onNewWant', {}, () => {});
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Isolation', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground: ' + exitTime);
    if (this.exitTask !== 0) {
      return;
    }
    this.exitTask = setTimeout(() => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'IsolationAbility terminateSelf');
      commonEventManager.publish('IsolationAbility_Exit', {}, () => {
        this.context.terminateSelf();
      });
    }, exitTime);
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
