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
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { commonEventManager } from '@kit.BasicServicesKit';

export default class UiAbility02 extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility02 onCreate');
    globalThis.uiAbilityContext2 = this.context;
    hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility02 want is, ${JSON.stringify(want)}`);
    commonEventManager.publish('UiAbility02_onCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0100 publish UiAbility02_onCreate');
    });
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility02 onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility02 onWindowStageCreate');
    commonEventManager.publish('UiAbility02_onWindowStageCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0100 publish UiAbility02_onWindowStageCreate');
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
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility02 onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility02 onForeground');
    commonEventManager.publish('UiAbility02_onForeground', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0100 publish UiAbility02_onForeground');
    });
    setTimeout(() => {
      // destroy uiAbilityContext2
      globalThis.uiAbilityContext2.terminateSelf();
    }, 6000);
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility02 onBackground');
  }
}
