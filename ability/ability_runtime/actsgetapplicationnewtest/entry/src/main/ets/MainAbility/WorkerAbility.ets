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

import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import commonEventManager from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import { worker, MessageEvents } from '@kit.ArkTS';
import { bundleManager } from '@kit.AbilityKit';

interface MessageInfo {
  applicationInfo: bundleManager.ApplicationInfo;
  cacheDir: string;
  tempDir: string;
  filesDir: string;
  databaseDir: string;
  preferencesDir: string;
  bundleCodeDir: string;
  distributedFilesDir: string;
  resourceDir: string;
  cloudFileDir: string;
}

export function getContextEntry(): common.UIAbilityContext {
  let context = AppStorage.get('context') as common.UIAbilityContext;
  console.info('getContext is ' + context);
  return context;
}

export default class WorkerAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag ', 'WorkerAbility onCreate');
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag ', 'WorkerAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', 'WorkerAbility onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s',
          JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', 'WorkerAbility onForeground');
    let context2 = this.context.getApplicationContext();
    let threadWorker: worker.ThreadWorker;
      threadWorker = new worker.ThreadWorker('entry/ets/workers/worker.ets');
      threadWorker.onmessage = (evt: MessageEvents) => {
        console.log('Worker_Main_Thread, onmessage: ', JSON.stringify(evt.data));
        try {
          let data: MessageInfo = {
            applicationInfo: context2.applicationInfo,
            cacheDir: context2.cacheDir,
            tempDir: context2.tempDir,
            filesDir: context2.filesDir,
            databaseDir: context2.databaseDir,
            preferencesDir: context2.preferencesDir,
            bundleCodeDir: context2.bundleCodeDir,
            distributedFilesDir: context2.distributedFilesDir,
            resourceDir: context2.resourceDir,
            cloudFileDir: context2.cloudFileDir
          }
          let parameters: commonEventManager.CommonEventPublishData = {
          parameters: {
            data1: evt.data,
            data2: data,
          }
        }
        commonEventManager.publish('0400', parameters, (err, data) => {
          if (err) {
            hilog.info(0x0000, 'testTag', 'publish error: %{public}s', JSON.stringify(err));
          }
        })
      } catch (err) {
        hilog.info(0x0000, 'testTag', 'error: %{public}s', JSON.stringify(err));
      }
      }
      threadWorker.postMessage('InTest host to worker');
    hilog.info(0x0000, 'testTag', 'worker get');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', 'StartAbility onBackground');
  }
}
