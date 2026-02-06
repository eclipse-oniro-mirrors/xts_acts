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
import { AbilityLifecycleCallback } from '@kit.AbilityKit';
import common from '@ohos.app.ability.common';
import commonEventManager from '@ohos.commonEventManager';

export default class MainAbility2 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag MainAbility2', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag MainAbility2', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag MainAbility2', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index2', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag MainAbility2', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag MainAbility2', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag MainAbility2', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag MainAbility2', '%{public}s', 'Ability onForeground');
    let lifeCallback:AbilityLifecycleCallback = {
      onAbilityCreate:(ability)=>{
      },
      onAbilityWillCreate:(ability)=>{
      },
      onWindowStageCreate:(ability, window)=>{
      },
      onWindowStageWillCreate:(ability, window)=>{
      },
      onWillNewWant:(ability)=>{
      },
      onNewWant:(ability)=>{
      },
      onWindowStageActive:(ability, window)=>{
      },
      onWindowStageInactive:(ability, window)=>{
      },
      onWindowStageDestroy:(ability, window)=>{
      },
      onWindowStageWillDestroy:(ability, window)=>{
      },
      onAbilityDestroy:(ability)=>{
      },
      onAbilityWillDestroy:(ability)=>{
      },
      onAbilityForeground:(ability)=>{
      },
      onAbilityWillForeground:(ability)=>{
      },
      onAbilityBackground:(ability)=>{
      },
      onAbilityWillBackground:(ability)=>{
      },
      onAbilityContinue:(ability)=>{
      },
      onAbilityWillContinue:(ability)=>{
      },
      onWindowStageWillRestore:(ability, window)=>{
      },
      onWindowStageRestore:(ability, window)=>{
      },
      onAbilityWillSaveState:(ability)=>{
      },
      onAbilitySaveState:(ability)=>{
      }
    }
    let appContext: common.ApplicationContext = this.context.getApplicationContext().getApplicationContext();
    let id: number = appContext.on('abilityLifecycle', lifeCallback);
    setTimeout(()=>{
      appContext.off('abilityLifecycle', id, (error, data)=>{
        
        if (error) {
          let parameters: commonEventManager.CommonEventPublishData = {
            parameters: {
              offResult: false,
            }
          }
          commonEventManager.publish("AbilityLifecycle_Message", parameters, (err, data) => {
            hilog.info(0x0000, 'testTag MainAbility2', '%{public}s', 'AbilityLifecycle_Message publish success with off failed');
          })
        } else {
          let parameters: commonEventManager.CommonEventPublishData = {
            parameters: {
              offResult: true,
            }
          }
          commonEventManager.publish("AbilityLifecycle_Message", parameters, (err, data) => {
            hilog.info(0x0000, 'testTag MainAbility2', '%{public}s', 'AbilityLifecycle_Message publish success with off success');
          })
        }
      })
    }, 1000)
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag MainAbility2', '%{public}s', 'Ability onBackground');
  }
}
