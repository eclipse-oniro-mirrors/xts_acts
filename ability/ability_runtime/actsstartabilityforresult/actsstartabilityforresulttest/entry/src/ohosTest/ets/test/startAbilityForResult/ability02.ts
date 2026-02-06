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
import { common } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { Want } from '@kit.AbilityKit';

let backSet:number = 0;

export default class UiAbility02 extends UIAbility {
  onCreate(want, launchParam):void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility02 onCreate');
    globalThis.uiAbilityContext2 = this.context
    hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility02 JSON.stringify(want) is: ${JSON.stringify(want)}`);
  }

  onDestroy():void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility02 onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage):void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility02 onWindowStageCreate');

    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy():void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility02 onWindowStageDestroy');
  }

  onForeground():void {
    let want: Want = {
      bundleName: 'com.acts.actsstartandterminateassisttest02',
      abilityName: 'EntryAbility4'
    };
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility02 onForeground');
    hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility02 backSet is: ${backSet}`);
    if (backSet === 0) {
      backSet++;
      hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility02 backSet.. is: ${backSet}`);
      try {
        globalThis.uiAbilityContext2.startAbilityForResult(want, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            // 处理业务逻辑错误
            hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult failed, error.code: ${err.code}, error.message: ${err.message}`);
            return;
          }
          // 执行正常业务
          hilog.info(0x0000, 'testTag', '%{public}s', 'startAbilityForResult success UiAbility02!');

        });
      } catch (err) {
        // 处理入参错误异常
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        hilog.info(0x0000, 'testTag', '%{public}s', `startAbilityForResult failed, error.code: ${code}, error.message: ${message}`);
      }
    } else if (backSet === 1) {
      commonEventManager.publish('ability02_onForeground', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_5000 publish ability02_onForeground');
      });
      commonEventManager.publish('ACTS_TEST_DESTROY', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'commonEventManager UiAbility02 publish ACTS_TEST_DESTROY');
      });
    }
  }

  onBackground():void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility02 onBackground');
  }
}
