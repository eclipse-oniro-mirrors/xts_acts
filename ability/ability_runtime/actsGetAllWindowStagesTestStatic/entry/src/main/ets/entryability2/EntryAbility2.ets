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

class EntryAbility2 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility2 onCreate');
    AppStorage.setOrCreate<common.UIAbilityContext>('EntryAbility2_UIAbilityContext', this.context)
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility2 onWindowStageCreate');
    windowStage.loadContent('pages/Index1', (err: BusinessError<void> | null): void => {
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
      if (err?.code) {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
        return;
      }
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
    });
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[onWindowStageCreate] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[onWindowStageCreate] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('onWindowStageCreate_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[onWindowStageCreate] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[onWindowStageCreate] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'EntryAbility2 onDestroy');
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[onDestroy] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[onDestroy] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('onDestroy_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[onDestroy] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[onDestroy] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'EntryAbility2 onWindowStageDestroy');
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[onWindowStageDestroy] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[onWindowStageDestroy] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('onWindowStageDestroy_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[onWindowStageDestroy] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[onWindowStageDestroy] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'EntryAbility2 onForeground');
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[onForeground] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[onForeground] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('onForeground_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[onForeground] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[onForeground] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
  }

  onBackground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'EntryAbility2 onBackground');
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
  onWindowStageWillDestroy(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility2 onWindowStageWillDestroy');
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[onWindowStageWillDestroy] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[onWindowStageWillDestroy] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate<Array<window.WindowStage>>('onWindowStageWillDestroy_WindowStage', data)
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[onWindowStageWillDestroy] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[onWindowStageWillDestroy] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
  }



















}