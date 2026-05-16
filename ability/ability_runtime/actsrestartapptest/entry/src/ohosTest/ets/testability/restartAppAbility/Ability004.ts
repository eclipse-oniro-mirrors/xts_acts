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
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

const caseName = 'SUB_Ability_AbilityRuntime_restartApp_0400';

export default class Ability004 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', caseName + 'Ability004 onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', caseName + 'Ability004 onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', caseName + 'Ability004 onWindowStageCreate');

    windowStage.loadContent('testability/pages/Ability004', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', caseName + 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', caseName + 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', caseName + 'Ability004 onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', caseName + 'Ability004 onForeground');
    let applicationContext = this.context.getApplicationContext();
    let want: Want = {
      bundleName: 'com.test.actsrestartapptest',
      abilityName: undefined
    };
    try {
      applicationContext.restartApp(want);
      console.info(`${caseName} Succeed to restart App.`);
    } catch (e) {
      console.info(`${caseName} Failed to restart App.Code: ${e.code}, message: ${e.message}`);
      let options: commonEventManager.CommonEventPublishData = {
        code: 0,
        data: e.code.toString()
      };
      commonEventManager.publish('restartapp0400', options, (err: BusinessError) => {
        if (err) {
          hilog.error(0xFF00, 'testTag', caseName + 'PublishCallBack err = ' + JSON.stringify(err));
        } else {
          hilog.info(0xFF00, 'testTag', caseName + 'Publish success');
        }
      });
    }
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', caseName + 'Ability004 onBackground');
  }
}
