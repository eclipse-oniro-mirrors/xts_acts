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

export default class EntryAbility4 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'EntryAbility4', '%{public}s', 'Ability onCreate');
    hilog.info(0x0000, 'EntryAbility4', `want, 50 == ${JSON.stringify(want)}`);
    AppStorage.SetOrCreate<boolean>('onCreate', true);
    param.setTextNme(want.action);
  }
  sleep(ms: number): Promise<void> {
    return new Promise((resolve, reject) => {
      setTimeout(resolve, ms)
    });
  }
  async onDestroy(): Promise<void> {
    hilog.info(0x0000, 'EntryAbility4', '%{public}s', 'Ability onDestroy');
    let onBackground = AppStorage.get<boolean>('onBackground');
    let onWindowStageDestroy = AppStorage.get<boolean>('onWindowStageDestroy');
    let onDestroy = true;
    let events = param.getTextNme();
    if (events == 'EntryAbility3') {
      let commonEventData: commonEventManger.CommonEventPublishData = {
        parameters: {
          data: {
            onBackground: onBackground,
            onDestroy: onDestroy,
            onWindowStageDestroy: onWindowStageDestroy
          }
        }
      };
      commonEventManger.publish(events, commonEventData, (result) => {
        hilog.info(0x0000, 'EntryAbility4', `onConnect, 50 == ${JSON.stringify(result)}`);
      });
    }
    await this.sleep(1000);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'EntryAbility4', '%{public}s', 'Ability onWindowStageCreate');

    AppStorage.SetOrCreate<boolean>('onWindowStageCreate', true);
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'EntryAbility4', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'EntryAbility4', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'EntryAbility4', '%{public}s', 'Ability onWindowStageDestroy');
    AppStorage.SetOrCreate<boolean>('onWindowStageDestroy', true);
  }

  onForeground(): void {
    hilog.info(0x0000, 'EntryAbility4', '%{public}s', 'Ability onForeground');
    let onCreate = AppStorage.get<boolean>('onCreate');
    let onWindowStageCreate = AppStorage.get<boolean>('onWindowStageCreate');
    let onForeground = true;
    let events = param.getTextNme();
    if (events == 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbilityForResult_4300_2') {
      param.setTextNme('EntryAbility3');
      let commonEventData: commonEventManger.CommonEventPublishData = {
        parameters: {
          data: {
            onCreate: onCreate,
            onWindowStageCreate: onWindowStageCreate,
            onForeground: onForeground
          }
        }
      };
      commonEventManger.publish(events, commonEventData, (result) => {
        hilog.info(0x0000, 'EntryAbility4', `onConnect, 50 == ${JSON.stringify(result)}`);
      });
    }
    if (events == 'EntryAbility3') {
      setTimeout(async () => {
        let resultCode = param.getResultCode();
        let want: Want = {
          bundleName: 'com.example.terminateselfwithresulttesthap',
          abilityName: 'EntryAbility4'
        };
        // 返回给接口调用方AbilityResult信息
        let abilityResult: common.AbilityResult = {
          want,
          resultCode
        };
        await this.context.terminateSelfWithResult(abilityResult).then((data) => {
          hilog.info(0x0000, 'EntryAbility4', '%{public}s', 'EntryAbility3 terminateSelf sucess' + JSON.stringify(data));
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'EntryAbility4', '%{public}s', 'EntryAbility3 terminateSelf errCode:' + JSON.stringify(err.code) +
            'errMessage:' + JSON.stringify(err.message));
        });
      }, 1500);
    }
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    AppStorage.SetOrCreate<boolean>('onBackground', true);
  }
}
