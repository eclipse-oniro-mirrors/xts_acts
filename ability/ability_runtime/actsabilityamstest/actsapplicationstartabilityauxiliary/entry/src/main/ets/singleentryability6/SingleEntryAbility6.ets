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
  private onForegroundFlagNumber = 0;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'singleEntry Ability onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(want)}`);
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(this.onCreateFlag)}`);
    this.TEST_CASE_NAME = want.action as string;
    this.onCreateFlag = true;
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    hilog.info(0x0000, 'testTag', '%{public}s',
      `${this.TEST_CASE_NAME} Wantyy: ${JSON.stringify(this.onWindowStageCreateFlag)}`);
    this.onWindowStageCreateFlag = true;

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });

    if (this.TEST_CASE_NAME == 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1400') {
      return;
    }
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onNewWant(): void {
    this.onNewWantFlag = true;
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onNewWantFlag onBackground');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability 1400 onForeground');
    hilog.info(0x0000, 'testTag', '%{public}s', `Ability TEST_CASE_NAME ${this.TEST_CASE_NAME}`);
    this.onForegroundFlag = true;
    this.onForegroundFlagNumber = this.onForegroundFlagNumber + 1;
    hilog.info(0x0000, 'testTag', '%{public}s', `Ability TEST_CASE_NAME is true ${this.TEST_CASE_NAME}`);
    hilog.info(0x0000, 'testTag', '%{public}s',
      ` ${this.TEST_CASE_NAME} Ability TonForegroundFlagNumber ${this.onForegroundFlagNumber}`);
    let commonEventData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: {
          'onCreateFlag': this.onCreateFlag,
          'onWindowStageCreateFlag': this.onWindowStageCreateFlag,
          'onForegroundFlag': this.onForegroundFlag
        }
      }
    }
    if (this.onForegroundFlagNumber == 1) {
      commonEventManager.publish(this.TEST_CASE_NAME, commonEventData, (result) => {
        hilog.info(0x0000, 'testTag', '%{public}s',
          `onConnect SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1400, 50==: ${JSON.stringify(result)}`);
        this.onCreateFlag = false;
        this.onWindowStageCreateFlag = false;
        this.onForegroundFlag = false;
        this.context.moveAbilityToBackground()
      })
    } else if (this.onForegroundFlagNumber == 2) {
      commonEventManager.publish('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1400_1', commonEventData,
        (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `onConnect SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1400_1, 50==: ${JSON.stringify(result)}`);
          setTimeout(() => {
            this.context.terminateSelf();
          }, 1000)
        });
    }
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    this.onBackgroundFlag = true;
  }

  sleep(ms: number): Promise<void> {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
}