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

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';

let backSet:number = 0;

export default class EntryAbility4 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam):void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 onCreate');
    globalThis.abilityAssist4 = this.context;
    commonEventManager.publish('entryAbility4_onCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000 publish EntryAbility4_onCreate');
    });
  }

  onDestroy():void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage):void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 onWindowStageCreate');
    commonEventManager.publish('entryAbility4_onWindowStageCreate', function () {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000 publish EntryAbility4_onWindowStageCreate');
    });
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy():void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 onWindowStageDestroy');
  }

  onForeground():void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 onForeground');
    let want: Want = {
      bundleName: 'com.example.mytest1',
      abilityName: 'startAbilityForResult03'
    };
    if (backSet === 0) {
      try {
        globalThis.abilityAssist4.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            // 处理业务逻辑错误
            hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbility4 startAbilityForResult failed, error.code: ${err.code}, error.message: ${err.message}`);
            return;
          }
          // 执行正常业务
          hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 startAbilityForResult success!');
          commonEventManager.publish('entryAbility4_onForeground_01', function () {
            hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000 publish entryAbility4_onForeground_01');
          });
        });
      } catch (err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbility4 startAbilityForResult failed, error.code: ${code}, error.message: ${message}`);
      }
    } else if (backSet === 1) {
      commonEventManager.publish('entryAbility4_onForeground_02', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000 publish entryAbility4_onForeground_02');
      });
      hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 execute router.back!');
      try {
        router.back();
        hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 router.back success!');
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbility4 router.back failed, error.code: ${code}, error.message: ${message}`);
      }
    }
    backSet++;
  }

  onBackground():void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility4 onBackground');
    if (backSet === 1) {
      commonEventManager.publish('entryAbility4_onBackground_01', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000 publish entryAbility4_onBackground_01');
      });
    } else if (backSet === 2) {
      commonEventManager.publish('entryAbility4_onBackground_02', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000 publish entryAbility4_onBackground_02');
      });
    }
  }
}
