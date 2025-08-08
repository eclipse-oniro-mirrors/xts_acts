/*
 * Copyright (C) 2024 HiHope Open Source Organization.
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
import commonEvent from '@ohos.commonEventManager';

let actsEntryOnDestroyBegin = 'Acts_EntryOnDestroyBegin';
let actsEntryOnDestroyEnd = 'Acts_EntryOnDestroyEnd';
let tag = '[ACTS_StartAbility EntryAbilityStage]';

export default class EntryAbility1 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void{
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbilityStage onDestroy begin');
    let startTime = new Date().getTime();
    let commonEventDataStart: commonEvent.CommonEventPublishData = {
      parameters: {
        time: startTime,
      }
    };
    commonEvent.publish(actsEntryOnDestroyBegin, commonEventDataStart, (err) => {
      hilog.info(0x0000, tag, '%{public}s', `Acts_EntryOnDestroyBegin publish err:  ${JSON.stringify(err)}`);
    })
    this.sleep(1000);
    let endTime = new Date().getTime();
    let commonEventDataEnd: commonEvent.CommonEventPublishData = {
      parameters: {
        time: endTime,
      }
    };
    commonEvent.publish(actsEntryOnDestroyEnd, commonEventDataEnd, (err) => {
      hilog.info(0x0000, tag, '%{public}s', `Acts_EntryOnDestroyEnd publish err:  ${JSON.stringify(err)}`);
    })

  }

  onWindowStageCreate(windowStage: window.WindowStage): void{
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void{
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    this.context.terminateSelf()
  }

  sleep(ms: number): Promise<void>{
    return new Promise((resolve, reject) => {
      setTimeout(resolve, ms);
    })
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
