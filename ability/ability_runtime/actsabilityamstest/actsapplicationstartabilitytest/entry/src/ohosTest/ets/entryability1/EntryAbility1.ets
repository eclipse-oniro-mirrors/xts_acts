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
import { BusinessError } from '@kit.BasicServicesKit';

export default class EntryAbility extends UIAbility {
  private onCreateFlag = false;
  private onWindowStageCreateFlag = false;
  private onForegroundFlag = false;
  private onBackgroundFlag = false;
  private onNewWantFlag = false;
  private onDestroyFlag = false;
  private TEST_CASE_NAME = '';

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'singleEntry Ability onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(want)}`);
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(this.onCreateFlag)}`);
    this.TEST_CASE_NAME = want.action as string;
    this.onCreateFlag = true
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    this.onDestroyFlag = true
    let commonEventData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: {
          'onDestroyFlag': this.onDestroyFlag
        }
      }
    }
    commonEventManager.publish('SingleEntryAbility3', commonEventData, (result) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(this.onWindowStageCreateFlag)}`);
    this.onWindowStageCreateFlag = true

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });

    let wants: Want = {
      deviceId: '', // deviceId为空表示本设备
      bundleName: 'com.example.actsapplicationstartabilityauxiliary2',
      abilityName: 'singleentryability2',
      moduleName: 'entry', // moduleName非必选
      action: this.TEST_CASE_NAME,
      parameters: {
        instanceKey: this.TEST_CASE_NAME
      }
    };
    this.context.startAbility(wants).then((data) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `Succeeded in starting SpecifiedAbility辅助hap2 ${data}`);
    }).catch((err: BusinessError) => {
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Failed to start SpecifiedAbility. err.Code is ${err.code},SpecifiedAbility辅助hap2  err.message is ${err.message}`);
    })
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onNewWant(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');

  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    this.onForegroundFlag = true;

    let commonEventData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: {
          'onCreateFlag': this.onCreateFlag,
          'onWindowStageCreateFlag': this.onWindowStageCreateFlag,
          'onForegroundFlag': this.onForegroundFlag
        }
      }
    }
    if (this.TEST_CASE_NAME === 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0400') {
      commonEventManager.publish('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0400', commonEventData,
        (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `onConnect SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0400, 50==: ${JSON.stringify(result)}`);
        });
    } else if (this.TEST_CASE_NAME === 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0500') {
      commonEventManager.publish('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0500', commonEventData,
        (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `onConnect SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0500, 50==: ${JSON.stringify(result)}`);
        });
    }
    if (this.TEST_CASE_NAME === 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0400') {
      this.sleep(3000)
      this.context.terminateSelf()
    }
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    this.onBackgroundFlag = true
    let commonEventData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: {
          'onBackgroundFlag': this.onBackgroundFlag
        }
      }
    }
    commonEventManager.publish('entryability1', commonEventData, (result) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
    });
  }

  sleep(ms: number): Promise<void> {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
}