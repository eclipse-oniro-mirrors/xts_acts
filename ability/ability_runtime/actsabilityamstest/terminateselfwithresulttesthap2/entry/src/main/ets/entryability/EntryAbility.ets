/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { AbilityConstant, common, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import commonEventManger from '@ohos.commonEventManager';
import ParamManager from '../common/Param';

let param = new ParamManager();

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    param.setTextNme(want.action);
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    let events = param.getTextNme();

    let isStart = AppStorage.get<boolean>('isStart');
    if (isStart) {
      return;
    }
    AppStorage.SetOrCreate<boolean>('isStart', true);
    let want: Want = {
      bundleName: 'com.example.terminateselfwithresulttesthap2',
      abilityName: 'SecondAbility',
      action: events + '_2'
    };

    try {
      setTimeout(() => {
        this.context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          hilog.info(0x0000, 'testTag', `startAbilityForResult ok, result==: ${JSON.stringify(result)}`);
          let commonEventData: commonEventManger.CommonEventPublishData = {
            parameters: {
              data: {
                result: result
              }
            }
          };
          commonEventManger.publish(events, commonEventData, (result) => {
            hilog.info(0x0000, 'testTag', `startAbilityForResult ok, 50 == ${JSON.stringify(result)}`);
          });
          setTimeout(async () => {
            await this.context.terminateSelf();
          }, 1500);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', `startAbilityForResult err, 50 == ${JSON.stringify(err)}`);
        });
      }, 1500);
    } catch (error) {
      hilog.info(0x0000, 'testTag', `startAbilityForResult err, 50 == ${JSON.stringify(error)}`);
    }
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
