/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import util from '@ohos.util';
import fs from '@ohos.file.fs';
import commonEventManager from '@ohos.commonEventManager';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onCreate ' + this.context.filesDir);
    let fileContent:string;
      try {
        let buf = new ArrayBuffer(4096);
        let array =new Uint8Array(buf);
        let readLen = fs.readSync(want?.fds?.fd, buf);
        let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true});
        fileContent = textDecoder.decodeWithStream(array, { stream: false})
        hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility ' + JSON.stringify(fileContent));
        commonEventManager.publish('OH_AbilityRuntime_StartSelfUIAbility_Result',{
          parameters:{
            'wantFd':want?.fds,
            'fileContent':fileContent.replace(/\+/g,'')
          }
        },()=>{
          hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility commonEventManager.publish success');
          setTimeout(()=>{
            this.context.terminateSelf()
          },2000)
        })
      } catch (err) {
        fileContent = JSON.stringify(err)
        commonEventManager.publish('OH_AbilityRuntime_StartSelfUIAbility_Result',{
          parameters:{
            'wantFd':want?.fds,
            'fileContent':fileContent
          }
        },()=>{
          hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility commonEventManager.publish success');
          setTimeout(()=>{
            this.context.terminateSelf()
          },2000)
        })
      }

  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onDestroy');
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
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onBackground');
  }

  async onPrepareToTerminateAsync(): Promise<boolean> {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onPrepareToTerminateAsync');
    return false;
  }
};
