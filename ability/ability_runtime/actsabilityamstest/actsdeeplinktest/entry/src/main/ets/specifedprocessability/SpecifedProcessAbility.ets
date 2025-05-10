/*
 * Copyright (C) 2024 HiHope Open Source Organization.
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
import { commonEventManager } from '@kit.BasicServicesKit';


const tag:string='SpecifedProcess'
export default class SpecifedProcessAbility extends UIAbility {

  //创建ability时
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, tag, '%{public}s', 'SpecifedProcessAbility onCreate');


  }

  //销毁ability时
  onDestroy(): void {
    hilog.info(0x0000, tag, '%{public}s', 'SpecifedProcessAbility onDestroy');
  }


  //创建舞台（页面）时
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, tag, '%{public}s', 'SpecifedProcessAbility onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, tag, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, tag, 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, tag, '%{public}s', 'SpecifedProcessAbility onWindowStageDestroy');
  }


  //切换到前台时
  onForeground(): void {
    // Ability has brought to foreground
    let applicationContext = this.context.getApplicationContext();
    applicationContext.getRunningProcessInformation((err, data) => {
      if (err) {
        console.error(`getRunningProcessInformation fail, error: ${JSON.stringify(err)}`);


      } else {
        console.log(`The process running information is: ${JSON.stringify(data)}`);
        for (let i = 0; i < data.length; i++) {
          const processInfo = data[i];
          console.log('Process state:', processInfo.state);
        }

      }
    });
    hilog.info(0x0000, tag, '%{public}s', 'SpecifedProcessAbility onForeground');
  }


  //切换到后台时
  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, tag, '%{public}s', 'SpecifedProcessAbility onBackground');
    hilog.info(0x0000, 'testTag', `onBackground`)
    let commonEventPublishData: commonEventManager.CommonEventPublishData ={
      parameters:{
        data: '111'
      }
    }
    commonEventManager.publish('AbilityOnBackgroundA', commonEventPublishData, async (error) =>{
      hilog.info(0x0000, 'testTag1', '%{public}s', `onForeground publish: ${JSON.stringify(error)}`);
    })
  }
}
