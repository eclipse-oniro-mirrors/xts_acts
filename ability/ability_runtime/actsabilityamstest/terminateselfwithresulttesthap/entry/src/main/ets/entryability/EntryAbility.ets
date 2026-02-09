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
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    hilog.info(0x0000, 'testTag', `want, 50 == ${JSON.stringify(want)}`);
    param.setTextNme(want.action);
    let events = want.action;
    if (events) {
      let commonEventData: commonEventManger.CommonEventPublishData = {
        parameters: {
          data: want
        }
      };
      commonEventManger.publish(events, commonEventData, (result) => {
        hilog.info(0x0000, 'testTag', `onConnect, 50 == ${JSON.stringify(result)}`);
      });
    }
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    setTimeout(async () => {
      let parameters = param.getParam();
      let resultCode = param.getResultCode();
      let want: Want = {
        bundleName: 'com.example.terminateselfwithresulttesthap',
        abilityName: 'EntryAbility',
        parameters: parameters
      };
      // 返回给接口调用方AbilityResult信息
      let abilityResult: common.AbilityResult = {
        want,
        resultCode
      };
      await this.context.terminateSelfWithResult(abilityResult).then((data) => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'secondAbility terminateSelf sucess' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'secondAbility terminateSelf errCode:' + JSON.stringify(err.code) +
          'errMessage:' + JSON.stringify(err.message));
      });
    }, 1500);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
