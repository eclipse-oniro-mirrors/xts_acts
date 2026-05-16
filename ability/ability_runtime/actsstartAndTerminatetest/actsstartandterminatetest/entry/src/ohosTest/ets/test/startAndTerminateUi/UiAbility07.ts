/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import { commonEventManager } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

export default class UiAbility07 extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility07 onCreate');
    commonEventManager.publish('UiAbility07_onCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility07 publish UiAbility07_onCreate');
    });
    globalThis.uiAbilityContext7 = this.context;
    hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility07 want is, ${JSON.stringify(want)}`);
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility07 onDestroy');
    commonEventManager.publish('ACTS_TEST_DESTROY', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility07 publish ACTS_TEST_DESTROY');
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility07 onWindowStageCreate');
    commonEventManager.publish('UiAbility07_onWindowStageCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility07 publish UiAbility07_onWindowStageCreate');
    });
    windowStage.loadContent('testability/pages/UiAbility/UiAbility01', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });

  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility07 onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility07 onForeground');
    commonEventManager.publish('UiAbility07_onForeground', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility07 publish UiAbility07_onForeground');
    });
    setTimeout(()=>{
      globalThis.uiAbilityContext7.terminateSelf();
    }, 500)
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility07 onBackground');
  }
}
