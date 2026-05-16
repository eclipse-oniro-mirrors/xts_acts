/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onCreate');
    AppStorage.setOrCreate<common.UIAbilityContext>("UIAbilityContext", this.context)
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[onCreate] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[onCreate] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('onCreate_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[onCreate] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[onCreate] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
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
      });
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'EntryAbility onDestroy');
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'EntryAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'EntryAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'EntryAbility onBackground');
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[onBackground] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[onBackground] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('onBackground_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[onBackground] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[onBackground] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
  }
}