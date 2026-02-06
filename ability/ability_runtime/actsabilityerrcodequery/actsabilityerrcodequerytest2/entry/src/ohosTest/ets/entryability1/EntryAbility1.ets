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

import { AbilityConstant, AtomicServiceOptions, common, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;
let timeout : number = 1000;
let sub2 : commonEventManager.CommonEventSubscriber;
export default class EntryAbility1 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'EntryAbility1 onCreate');
    AppStorage.setOrCreate<Want>('TestAbilityWant', want);
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'EntryAbility1 onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'EntryAbility1 onWindowStageCreate');

    windowStage.loadContent('testability/pages/Index2', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'EntryAbility1 onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'EntryAbility1 onForeground');
    let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
      events: ['terminateEntryAbility1']
    };
    commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
      sub2 = subscriber;
      commonEventManager.subscribe(sub2, (err, commonEventData) => {
        this.context.terminateSelf(() => {});
        commonEventManager.unsubscribe(subscriber, (err, data) => {});
      });
    });
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'EntryAbility1 onBackground');
  }
}
