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
import { commonEventManager } from '@kit.BasicServicesKit';
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import app, { AppResponse } from '@system.app';

let testNum: number = 0;

export default class AbilityTest01 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityTest01 onCreate');
    globalThis.abilityAssist01 = this.context;
    commonEventManager.publish('AbilityTest01_onCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityTest01 publish AbilityTest01_onCreate');
    });
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityTest01 onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityTest01 onWindowStageCreate');
    commonEventManager.publish('AbilityTest01_onWindowStageCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityTest01 publish AbilityTest01_onWindowStageCreate');
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
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityTest01 onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityTest01 onForeground');
    commonEventManager.publish('AbilityTest01_onForeground', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityTest01 publish AbilityTest01_onForeground');
    });
    testNum++;
    if (testNum !== 1) {
      return;
    } 
    try {
      globalThis.abilityAssist01.startAbility(
        {
          bundleName: 'com.test.actsstartandterminatetest',
          abilityName: 'UiAbility08'
        }).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'start test hap UiAbility08');
        }).catch(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'fail test hap UiAbility08');
        });
      setTimeout(() => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility01 setTimeout inner');
        globalThis.abilityAssist01.terminateSelf();
      }, 1000);
    } catch (err) {
      hilog.info(0x0000, 'testTag', '%{public}s', `startAbility fail ${err}`);
    }
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityTest01 onBackground');
    commonEventManager.publish('AbilityTest01_onBackground', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityTest01 publish AbilityTest01_onBackground');
    });
  }
}
