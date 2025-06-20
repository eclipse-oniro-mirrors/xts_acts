/*
 * Copyright (C) 2024 HiHope Device Co., Ltd.
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

import { AbilityConstant, Caller, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { commonEventManager } from '@kit.BasicServicesKit';

export default class MainAbility24 extends UIAbility{
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void{
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void{
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void{
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) =>{
      if (err.code){
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void{
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  async onForeground(): Promise<void>{
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground111');

    let commonEventPublishData: commonEventManager.CommonEventPublishData = {};
    try{
      await sleep(1000);
      let want: Want ={
        deviceId: '',
        bundleName: 'com.acts.systemappa',
        abilityName: 'ThirdAbility24'
      }
      await this.context.startAbilityByCall(want).then((caller: Caller) =>{
        hilog.info(0x0000, 'testTag', '%{public}s', `start MainAbility success : ${JSON.stringify(caller)}`);
        commonEventPublishData = {
          parameters: {
            success: JSON.stringify(caller)
          }
        }
      })
    } catch (error){
      hilog.info(0x0000, 'testTag', '%{public}s', `start MainAbility fail : ${error}`);
      commonEventPublishData = {
        parameters: {
          error: JSON.stringify(error.code)
        }
      }
    }

    await sleep(500);
    commonEventManager.publish('MainAbility_onForegroundCallBack', commonEventPublishData, async (error) =>{
      hilog.info(0x0000, 'testTag', '%{public}s',
        `onForeground publish: ${JSON.stringify(error)}__commonEventPublishData：${JSON.stringify(commonEventPublishData)}`);
    })
    await sleep(1000);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void{
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}

function sleep(time: number){
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}
