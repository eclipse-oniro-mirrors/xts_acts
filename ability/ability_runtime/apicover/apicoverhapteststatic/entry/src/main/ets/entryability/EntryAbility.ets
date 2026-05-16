/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { Configuration } from '@ohos.app.ability.Configuration';

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onCreate');
    AppStorage.setOrCreate<common.UIAbilityContext>("UIAbilityContext", this.context)
    hilog.info(0x0000, 'testTag EntryAbility', `EntryAbility onCreate fds: ${JSON.stringify(want.fds)}}`)
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
      if (err?.code) {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
        return;
      }
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
      hilog.info(0x0000, 'testTag EntryAbility', 'onWindowStageCreate ok');
    });
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onDestroy');
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onForeground');
    AppStorage.setOrCreate<common.UIAbilityContext>("UIAbilityContext", this.context)
    if (this.context.cacheDir) {
      hilog.info(0x0000, 'testTag EntryAbility2', 'context.cacheDir: ' + this.context.cacheDir);
      AppStorage.setOrCreate<string>("dir", this.context.cacheDir);
    } else {
      hilog.info(0x0000, 'testTag EntryAbility2', 'context.cacheDir is undefined');
      AppStorage.setOrCreate<string>("dir", "");
    }
  }

  onBackground() {
    hilog.info(0x0000, 'testTag  EntryAbility', 'EntryAbility onBackground');
  }

  onConfigurationUpdate(config: Configuration) {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'EntryAbility onConfigurationUpdate');
  }

  onMemoryLevel(level: AbilityConstant.MemoryLevel) {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', `EntryAbility onMemoryLevel level: ${level}`);
  }
  onContinue(wantParams: Record<string, Object>) {
    console.info('onContinue');
    wantParams['myData'] = 'my1234567';
    return AbilityConstant.OnContinueResult.AGREE;
  }

  async onSaveStateAsync(reason: AbilityConstant.StateType,
    wantParam: Record<string, Object>): Promise<AbilityConstant.OnSaveResult> {
    await new Promise<string>((res, rej) => {
      setTimeout(res, 1000);
    });
    return AbilityConstant.OnSaveResult.RECOVERY_AGREE;
  }

  onPrepareToTerminate() {
    return true;
  }
  async onPrepareToTerminateAsync(): Promise<boolean> {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onPrepareToTerminateAsync');
    return true;
  }
}
