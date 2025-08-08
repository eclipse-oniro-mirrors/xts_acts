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

export default class MainAbility2 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'MainAbility2', '%{public}s', 'Ability onCreate');
    hilog.info(0x0000, 'MainAbility2', `want, 50 == ${JSON.stringify(want)}`);
    AppStorage.SetOrCreate<boolean>('onCreate', true);
    param.setTextNme(want.action);
  }

  onDestroy(): void {
    hilog.info(0x0000, 'MainAbility2', '%{public}s', 'Ability onDestroy');
    let events = param.getTextNme();
    let onCreate = AppStorage.get<boolean>('onCreate');
    let onWindowStageCreate = AppStorage.get<boolean>('onWindowStageCreate');
    let onForeground = AppStorage.get<boolean>('onForeground');
    let onWindowStageDestroy = AppStorage.get<boolean>('onWindowStageDestroy');
    let onBackground = AppStorage.get<boolean>('onBackground');
    let onDestroy = true;
    let commonEventData: commonEventManger.CommonEventPublishData = {
      parameters: {
        data: {
          onCreate: onCreate,
          onWindowStageCreate: onWindowStageCreate,
          onForeground: onForeground,
          onWindowStageDestroy: onWindowStageDestroy,
          onBackground: onBackground,
          onDestroy: onDestroy
        }
      }
    };
    commonEventManger.publish(events, commonEventData, (result) => {
      hilog.info(0x0000, 'MainAbility2', `startAbilityForResult ok, 50 == ${JSON.stringify(result)}`);
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'MainAbility2', '%{public}s', 'Ability onWindowStageCreate');

    AppStorage.SetOrCreate<boolean>('onWindowStageCreate', true);
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'MainAbility2', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'MainAbility2', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'MainAbility2', '%{public}s', 'Ability onWindowStageDestroy');
    AppStorage.SetOrCreate<boolean>('onWindowStageDestroy', true);
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'MainAbility2', '%{public}s', 'Ability onForeground');
    AppStorage.SetOrCreate<boolean>('onForeground', true);

    try {
      setTimeout(async () => {
        let resultCode = param.getResultCode();
        let want: Want = {
          bundleName: 'com.example.terminateselfwithresulttesthap',
          abilityName: 'MainAbility2'
        };
        // 返回给接口调用方AbilityResult信息
        let abilityResult: common.AbilityResult = {
          want,
          resultCode
        };
        await this.context.terminateSelfWithResult(abilityResult).then((data) => {
          hilog.info(0x0000, 'MainAbility2', '%{public}s', 'MainAbility2 terminateSelf sucess' + JSON.stringify(data));
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'MainAbility2', '%{public}s', 'MainAbility2 terminateSelf errCode:' + JSON.stringify(err.code) +
            'errMessage:' + JSON.stringify(err.message));
        });
      }, 1500);
    } catch (error) {
      hilog.info(0x0000, 'MainAbility2', `startAbilityForResult err, 50 == ${JSON.stringify(error)}`);
    }
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'MainAbility2', '%{public}s', 'Ability onBackground');
    AppStorage.SetOrCreate<boolean>('onBackground', true);
  }
}
