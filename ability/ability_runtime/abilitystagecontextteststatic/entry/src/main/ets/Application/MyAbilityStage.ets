/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import AbilityStage from '@ohos.app.ability.AbilityStage'
import { Configuration } from  '@ohos.app.ability.Configuration'
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog'
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';

export default class MyAbilityStage extends AbilityStage {

  onCreate() {
    let abilityStageContext = this.context;
    hilog.info(0x0000, 'testTag EntryAbility',`onCreate, abilityStageContext: ${abilityStageContext}`);
    AppStorage.setOrCreate<common.AbilityStageContext>('AbilityStageContext', this.context)
  }

  onConfigurationUpdate(config: Configuration) {
    hilog.info(0x0000, 'testTag EntryAbility',`onConfigurationUpdate, language: ${config.language}`);
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility','EntryAbility.onDestroy is called');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onForeground');
  }

  onAcceptWant(want: Want) {
    hilog.info(0x0000, 'testTag EntryAbility', `onAcceptWant, want: ${want}`);
    return 'com.example.test';
  }

  onAcceptWantAsync(want: Want): Promise<string> {
    hilog.info(0x0000, 'testTag', '%{public}s',
      `entry_test.MyAbilityStage onAcceptWantAsync. want: ${JSON.stringify(want)}`);
    return new Promise<string>((resolve, reject) => {
      resolve('entry_test.MyAbilityStage.onAcceptWantAsync');
    });
  }

  onNewProcessRequest(want: Want) {
    hilog.info(0x0000, 'testTag EntryAbility', `onNewProcessRequest, want: ${want}`);
    return 'com.example.test';
  }

  onNewProcessRequestAsync(want: Want): Promise<string> {
    hilog.info(0x0000, 'testTag', '%{public}s',
      `entry_test.MyAbilityStage onNewProcessRequestAsync. want: ${JSON.stringify(want)}`);

    return new Promise<string>((resolve, reject) => {
      resolve('entry_test.MyAbilityStage.onNewProcessRequestAsync');
    });
  }

  onMemoryLevel(level: AbilityConstant.MemoryLevel) {
    hilog.info(0x0000, 'testTag EntryAbility', `onMemoryLevel`);
  }

  onPrepareTermination(): AbilityConstant.PrepareTermination {
    hilog.info(0x0000, 'testTag EntryAbility', `MyAbilityStage.onPrepareTermination is called`);
    return AbilityConstant.PrepareTermination.CANCEL;
  }

  async onPrepareTerminationAsync(): Promise<AbilityConstant.PrepareTermination> {
    await new Promise<AbilityConstant.PrepareTermination>((res, rej) => {
      setTimeout(res, 3000);
    });
    return AbilityConstant.PrepareTermination.CANCEL;
  }
}