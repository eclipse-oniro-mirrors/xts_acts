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

import { AbilityConstant, common, UIAbility, Want } from '@kit.AbilityKit';
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
  private onForegroundNumber = 0;
  private TEST_CASE_NAME = '';

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', ' singleEntry Ability onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(want)}`);
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(this.onCreateFlag)}`);
    this.TEST_CASE_NAME = want.action as string;
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} singleEntry Ability onCreate`);
    this.onCreateFlag = true;
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME}Ability ohosTest onDestroy`);
    this.onDestroyFlag = true;
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(this.onWindowStageCreateFlag)}`);
    this.onWindowStageCreateFlag = true;
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag',
          `${this.TEST_CASE_NAME} Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '`);
        return;
      }
      hilog.info(0x0000, 'testTag', `${this.TEST_CASE_NAME} Succeeded in loading the content.`);
    });

  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} Ability onWindowStageDestroy`);
  }

  onNewWant(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} Ability onBackground`);

  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} Ability onForeground`);
    this.onForegroundFlag = true;
    this.onForegroundNumber = this.onForegroundNumber + 1

    let commonEventData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: {
          'onCreateFlag': this.onCreateFlag,
          'onWindowStageCreateFlag': this.onWindowStageCreateFlag,
          'onForegroundFlag': this.onForegroundFlag
        }
      }
    }

    hilog.info(0x0000, 'testTag', '%{public}s',
      `onConnect ${this.TEST_CASE_NAME}, onForegroundNumber: ${JSON.stringify(this.onForegroundNumber)}`);
    if (this.onForegroundNumber == 1) {
      commonEventManager.publish(`${this.TEST_CASE_NAME}_onForegroundHap_1`, commonEventData,
        (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `onConnect ${this.TEST_CASE_NAME}, 50==: ${JSON.stringify(result)}`);
        });
      let want: Want = {
        deviceId: '', // deviceId为空表示本设备
        bundleName: 'com.example.actsapplicationstartabilitytest',
        abilityName: 'EntryAbility_6',
        action: this.TEST_CASE_NAME,
        parameters: {
          instanceKey: this.TEST_CASE_NAME
        }
      };
      this.context.startAbility(want).then((data) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} Succeeded in starting  ${data}`);
      }).catch((err: BusinessError) => {
        hilog.info(0x0000, 'testTag', '%{public}s',
          `${this.TEST_CASE_NAME} Failed to start SpecifiedAbility. err.Code is ${err.code}  err.message is ${err.message}`);
      })
    } else if (this.onForegroundNumber == 2) {
      commonEventManager.publish(`${this.TEST_CASE_NAME}_onForegroundHap_3`, commonEventData,
        (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            `${this.TEST_CASE_NAME} publish : ${JSON.stringify(result)}`);
        });
      setTimeout(() => {
        this.context.terminateSelf();
      }, 2000)
    }
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} Ability ohosTest onBackground`);
    this.onBackgroundFlag = true;
    let commonEventData: commonEventManager.CommonEventPublishData = {
      parameters: {
        data: {
          'onBackgroundFlag': this.onBackgroundFlag
        }
      }
    }
    commonEventManager.publish(`${this.TEST_CASE_NAME}_onBackgroundHap_1`, commonEventData, (result) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `${this.TEST_CASE_NAME} onConnect, 50==: ${JSON.stringify(result)}`);
    });
  }

  sleep(ms: number): Promise<void> {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
}