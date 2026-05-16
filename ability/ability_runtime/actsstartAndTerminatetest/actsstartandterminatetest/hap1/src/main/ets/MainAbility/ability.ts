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
import app, { AppResponse } from '@system.app';
import { commonEventManager } from '@kit.BasicServicesKit';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onDestroy');
    commonEventManager.publish('EntryAbility_hap2_onCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility publish EntryAbility_hap2_onCreate');
    });
    globalThis.abilityAssistEntry02 = this.context;
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onWindowStageCreate');
    commonEventManager.publish('EntryAbility_hap2_onWindowStageCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility publish EntryAbility_hap2_onWindowStageCreate');
    });
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onForeground');
    commonEventManager.publish('EntryAbility_hap2_onForeground', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility publish EntryAbility_hap2_onForeground');
    });
    try {
      globalThis.abilityAssistEntry02.startAbility(
        {
          bundleName: 'com.test.actsstartandterminatetest',
          moduleName: 'hap2',
          abilityName: 'Ability02'
        }).then(() => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'startAbility com.acts.actsstartandterminateassisttest03');
      });
    } catch (err) {
      hilog.info(0x0000, 'testTag', '%{public}s', `startAbility fail ${err}`);
    }
    setTimeout(() => {
      // destroy assistHap
      globalThis.abilityAssistEntry02.terminateSelf();
    }, 2500);
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onBackground');
    commonEventManager.publish('EntryAbility_hap2_onBackground', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility publish EntryAbility_hap2_onBackground');
    });
    let options = {
      parameters: {
        result: 'onBackground'
      }
    };
    commonEventManager.publish('ACTS_TEST_ONBACKGROUND', options, function () {
      console.info('UiAbility05 publish ACTS_TEST_ONBACKGROUND');
    });
  }
}
