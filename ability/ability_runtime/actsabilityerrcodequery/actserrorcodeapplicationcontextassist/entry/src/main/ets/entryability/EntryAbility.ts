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
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import app, { AppResponse } from '@system.app'
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}
export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.info('EntryAbility onCreate');
    globalThis.abilityAssist = this.context
  }

  async onDestroy() {
    console.info('EntryAbility onDestroy');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    commonEventManager.publish('ACTS_TEST_DESTROY_ASSIST', function () {
      console.info('====>SUB_ChildProcessManager_sendableContextManager_0800 publish ACTS_TEST_DESTROY_ASSIST');
    });
    await sleep(500);
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    console.info('EntryAbility onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
    setTimeout(() => {
      // destroy assistHap
      globalThis.abilityAssist.terminateSelf()
    }, 3500);
  }

  onWindowStageDestroy() {
    console.info('EntryAbility onWindowStageDestroy');
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    console.info('EntryAbility onForeground');
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    console.info('EntryAbility onBackground');
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
