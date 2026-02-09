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

export default class UiAbility01 extends UIAbility {
  onCreate(want, launchParam):void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility01 onCreate');
    globalThis.uiAbilityContext1 = this.context
    hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility01 JSON.stringify(want) is: ${JSON.stringify(want)}`);
    if (want.action == 'abc'){
      commonEventManager.publish('ability01_onCreate', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500 publish ability01_onCreate');
      });
      hilog.info(0x0000, 'testTag', '%{public}s', `SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500 action = abc`);
    }
  }

  onDestroy():void {
    commonEventManager.publish('ability01_onDestroy', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500 publish ability01_onDestroy');
    });
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility01 onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage):void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility01 onWindowStageCreate');
    commonEventManager.publish('ability01_onWindowStageCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500 publish ability01_onWindowStageCreate');
    });
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy():void {
    commonEventManager.publish('ability01_onWindowStageDestroy', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500 publish ability01_onWindowStageDestroy');
    });
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility01 onWindowStageDestroy');
  }

  onForeground():void {
    commonEventManager.publish('ability01_onForeground', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500 publish ability01_onForeground');
    });
    setTimeout(() => {
      commonEventManager.publish('ACTS_TEST_DESTROY', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500 publish ACTS_TEST_DESTROY');
      });
    }, 500);
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility01 onForeground');
  }

  onBackground():void {
    // Ability has back to background
    commonEventManager.publish('ability01_onBackground', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_0500 publish ability01_onBackground');
    });
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility01 onBackground');
  }
}
