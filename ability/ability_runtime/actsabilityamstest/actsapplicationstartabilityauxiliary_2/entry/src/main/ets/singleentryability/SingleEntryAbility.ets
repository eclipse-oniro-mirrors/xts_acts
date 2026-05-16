/*
  * Copyright (C) 2024 HiHope Open Source Organization.
  * Licensed under the Apache License, Version 2.0 (the "License");
  * you may not use this file except in compliance with the License.
  * You may obtain a copy of the License at
  *
  *    http://www.apache.org/licenses/LICENSE-2.0
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
import commonEventManager from '@ohos.commonEventManager';

export default class EntryAbility extends UIAbility {
  private onCreateFlag = false;
  private onWindowStageCreateFlag = false;
  private onForegroundFlag = false;
  private onBackgroundFlag = false;
  private onNewWantFlag = false;
  private TEST_CASE_NAME = '';

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'singleEntry Ability onCreate');
    this.TEST_CASE_NAME = want.action as string
    hilog.info(0x0000, 'testTag', '%{public}s', `singleEntry want action ${want.action}`);

    this.onCreateFlag = true;
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    this.onWindowStageCreateFlag = true;

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    // 释放与UI相关的资源
  }

  onNewWant(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onNewWant');
    this.onNewWantFlag = true;
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    this.onForegroundFlag = true;
    if (this.TEST_CASE_NAME === 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1200') {
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          data: {
            'onCreateFlag': this.onCreateFlag,
            'onWindowStageCreateFlag': this.onWindowStageCreateFlag,
            'onForegroundFlag': this.onForegroundFlag
          }
        }
      };
      commonEventManager.publish(`${this.TEST_CASE_NAME}_onForegroundHap_2`, commonEventData, (result) => {
        hilog.info(0x0000, 'testTag', '%{public}s',
          `onConnect SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1200, 50==: ${JSON.stringify(result)}`);
      });

      let want: Want = {
        deviceId: '', // deviceId为空表示本设备
        bundleName: 'com.example.actsapplicationstartabilityauxiliary',
        abilityName: 'SingleEntryAbility',
        moduleName: 'entry', // moduleName非必选
        action: 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1200',
        parameters: {
          instanceKey: this.TEST_CASE_NAME
        }
      };
      try {
        this.context.startAbility(want);
        hilog.info(0x0000, 'testTag', '%{public}s', `Succeeded in starting SpecifiedAbility`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          `Failed to start SpecifiedAbility. Code is ${error.code}, message is ${error.message}`);
      }
    }
    this.sleep(1000);
    this.context.terminateSelf();
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    this.onBackgroundFlag = true;
    let commonEventData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: {
          'onBackgroundFlag': this.onBackgroundFlag
        }
      }
    };
    if (this.TEST_CASE_NAME === 'SingleEntryAbility2') {
      commonEventManager.publish('SingleEntryAbility2', commonEventData, (result) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
      });
    } else if (this.TEST_CASE_NAME === 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1200') {
      commonEventManager.publish(`${this.TEST_CASE_NAME}_onBackgroundHap_2`, commonEventData, (result) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
      });
    }
  }

  sleep(ms: number): Promise<void> {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
}