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
import { DeepEquals } from '../pages/DeepEquals';


interface KeyForObject {
  keyForObjectString: string;
  keyForObjectInt: number;
  keyForObjectDouble: number;
  keyForObjectBool: boolean;
}


export default class EntryAbility extends UIAbility {
  private onCreateFlag = false;
  private onWindowStageCreateFlag = false;
  private onForegroundFlag = false;
  private TEST_CASE_NAME = '';
  private startAbility_5200 = false;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(want)}`);
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(this.onCreateFlag)}`);
    this.TEST_CASE_NAME = want.action as string;
    this.onCreateFlag = true
    if (this.TEST_CASE_NAME == 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5200') {
      if (want.parameters?.keyForString === 'str' &&
        want.parameters?.keyForInt === 100 &&
        want.parameters?.keyForDouble === 99.99 &&
        want.parameters?.keyForBool === true &&
      DeepEquals.deepEqual(want.parameters.keyForObject, {
        keyForObjectString: 'str',
        keyForObjectInt: -200,
        keyForObjectDouble: 35.5,
        keyForObjectBool: false,
      }) &&
        JSON.stringify(want.parameters?.keyForArrayString) == JSON.stringify(['str1', 'str2', 'str3']) &&
        JSON.stringify(want.parameters?.keyForArrayInt) == JSON.stringify([100, 200, 300, 400]) &&
        JSON.stringify(want.parameters?.keyForArrayDouble) == JSON.stringify([0.1, 0.2]) &&
        JSON.stringify(want.parameters?.keyForArrayObject) == JSON.stringify([{
          obj1: 'aaa'
        }, {
          obj2: 100
        }])
      ) {
        this.startAbility_5200 = true;
        hilog.info(0x0000, 'testTag', '%{public}s', ' StartAbility_5200');
      } else {
        this.startAbility_5200 = false;
        hilog.info(0x0000, 'testTag', '%{public}s', ' 222222222222');
      }
    }
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', `Wantyy: ${JSON.stringify(this.onWindowStageCreateFlag)}`);
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
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    this.onForegroundFlag = true;
    if (this.TEST_CASE_NAME == 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5200') {
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          data: {
            'startAbility_5200': this.startAbility_5200,
          }
        }
      }
      commonEventManager.publish(this.TEST_CASE_NAME, commonEventData, (result) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
      });
    } else if (this.TEST_CASE_NAME == 'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3800') {
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          data: {
            'onCreateFlag': this.onCreateFlag,
            'onWindowStageCreateFlag': this.onWindowStageCreateFlag,
            'onForegroundFlag': this.onForegroundFlag
          }
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s', `commonEventData, 50==: ${JSON.stringify(commonEventData)}`);
      commonEventManager.publish(`${this.TEST_CASE_NAME}_onForegroundHap_1`, commonEventData, (result) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 5011==: ${JSON.stringify(result)}`);
      });
    } else {
      let commonEventData: commonEventManager.CommonEventPublishData = {
        parameters: {
          data: {
            'onCreateFlag': this.onCreateFlag,
            'onWindowStageCreateFlag': this.onWindowStageCreateFlag,
            'onForegroundFlag': this.onForegroundFlag
          }
        }
      }
      hilog.info(0x0000, 'testTag', '%{public}s', `commonEventData, 50==: ${JSON.stringify(commonEventData)}`);
      commonEventManager.publish(this.TEST_CASE_NAME, commonEventData, (result) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 5011==: ${JSON.stringify(result)}`);
      });
    }
    this.sleep(2000);
    this.context.terminateSelf();
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  sleep(ms: number): Promise<void> {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
}



