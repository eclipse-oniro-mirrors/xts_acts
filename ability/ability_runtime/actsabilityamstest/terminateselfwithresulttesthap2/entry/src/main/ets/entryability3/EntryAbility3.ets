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

export default class EntryAbility3 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'EntryAbility3', '%{public}s', 'Ability onCreate');
    hilog.info(0x0000, 'EntryAbility3', `want, 50 == ${JSON.stringify(want)}`);
    AppStorage.SetOrCreate<boolean>('onCreate', true);
    param.setTextNme(want.action);
  }

  onDestroy(): void {
    hilog.info(0x0000, 'EntryAbility3', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'EntryAbility3', '%{public}s', 'Ability onWindowStageCreate');
    AppStorage.SetOrCreate<boolean>('onWindowStageCreate', true);
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'EntryAbility3', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'EntryAbility3', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'EntryAbility3', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'EntryAbility3', '%{public}s', 'Ability onForeground');
    let events = param.getTextNme();
    if (events == '') {
      return;
    }
    param.setTextNme('');
    let want: Want = {
      bundleName: 'com.example.terminateselfwithresulttesthap',
      abilityName: 'EntryAbility4',
      action: 'EntryAbility3'
    };
    try {
      setTimeout(() => {
        this.context.startAbilityForResult(want).then((result: common.AbilityResult) => {
          let onCreate = AppStorage.get<boolean>('onCreate');
          let onWindowStageCreate = AppStorage.get<boolean>('onWindowStageCreate');
          let onForeground = true;
          let commonEventData: commonEventManger.CommonEventPublishData = {
            parameters: {
              data: {
                onCreate: onCreate,
                onWindowStageCreate: onWindowStageCreate,
                onForeground: onForeground,
                result: result
              }
            }
          };
          commonEventManger.publish(events, commonEventData, (result) => {
            hilog.info(0x0000, 'EntryAbility3', `startAbilityForResult ok, 50 == ${JSON.stringify(result)}`);
            setTimeout(() => {
              this.context.terminateSelf();
            }, 1500);
          });
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'EntryAbility3', `startAbilityForResult err, 50 == ${JSON.stringify(err)}`);
        });
      }, 1500)
    } catch (error) {
      hilog.info(0x0000, 'EntryAbility3', `startAbilityForResult err, 50 == ${JSON.stringify(error)}`);
    }
  }

  onBackground(): void {
    hilog.info(0x0000, 'EntryAbility3', '%{public}s', 'Ability onBackground');
  }
}
