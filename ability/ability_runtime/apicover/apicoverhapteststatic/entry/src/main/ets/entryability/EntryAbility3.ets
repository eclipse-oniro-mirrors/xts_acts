/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import { AppStorage } from '@ohos.arkui.stateManagement'

class EntryAbility3 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onWindowStageCreate');
      windowStage.loadContent('pages/Index',  (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag', 'loadContent entering');
        if (err?.code) {
          hilog.info(0x0000, 'testTag', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag', 'loadContent ok');
      });
  }
  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility3', 'EntryAbility3 onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility3', 'EntryAbility3 onForeground');
    hilog.info(0x0000, 'testTag EntryAbility3', 'EntryAbility3 specifiedId' + this.specifiedId);
    AppStorage.setOrCreate<string>('specifiedId', this.specifiedId + '')
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag  EntryAbility3', 'EntryAbility3 onDestroy');
    return undefined;
  }

  onBackground() {
    hilog.info(0x0000, 'testTag  EntryAbility3', 'EntryAbility3 onBackground');
  }

  onWindowStageWillDestroy() {
    hilog.info(0x0000, 'testTag  EntryAbility3', 'EntryAbility3 onWindowStageWillDestroy');
  }

  onWindowStageRestore() {
    hilog.info(0x0000, 'testTag  EntryAbility3', 'EntryAbility3 onWindowStageRestore');
  }

  onNewWant() {
    hilog.info(0x0000, 'testTag  EntryAbility3', 'EntryAbility3 onNewWant');
  }

  onDump() {
    hilog.info(0x0000, 'testTag  EntryAbility3', 'EntryAbility3 onDump');
  }

  onShare() {
    hilog.info(0x0000, 'testTag  EntryAbility3', 'EntryAbility3 onShare');
  }

  onBackPressed() {
    hilog.info(0x0000, 'testTag  EntryAbility3', 'EntryAbility3 onBackPressed');
    return true;
  }

  onDestroyAsync(): Promise<void> {
    hilog.info(0x0000, 'testTag  EntryAbility3', 'onDestroyAsync');
    return new Promise<void>((resolve: (a: undefined)=>void, reject: (err: Error)=>void): void => {
      hilog.info(0x0000, 'testTag  EntryAbility3', 'onDestroyAsync resolve 1');
      resolve(undefined);
      hilog.info(0x0000, 'testTag  EntryAbility3', 'onDestroyAsync resolve 2');
    });
  }
}