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

import AbilityStage from '@ohos.app.ability.AbilityStage';
import Want from '@ohos.app.ability.Want';
import sendableContextManager from '@ohos.app.ability.sendableContextManager';
import hilog from '@ohos.hilog';
import { worker, MessageEvents } from '@kit.ArkTS';
import { SendableContextObject } from '../common/SendableContextObject'

let abilityStageWorker: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/Worker.ets');

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage onCreate');
    // 应用的HAP在首次加载的时，为该Module初始化操作
    // convert ability stage context and post
    try {
      let context = this.context;
      hilog.info(0x0000, 'testTag', 'AbilityStage context: %{public}s', JSON.stringify(context));
      // 基类
      hilog.info(0x0000, 'testTag', 'AbilityStage context.resourceManager: %{public}s', JSON.stringify(context.resourceManager));
      hilog.info(0x0000, 'testTag', 'AbilityStage context.applicationInfo: %{public}s', JSON.stringify(context.applicationInfo));
      hilog.info(0x0000, 'testTag', 'AbilityStage context.cacheDir: %{public}s', context.cacheDir);
      hilog.info(0x0000, 'testTag', 'AbilityStage context.tempDir: %{public}s', context.tempDir);
      hilog.info(0x0000, 'testTag', 'AbilityStage context.filesDir: %{public}s', context.filesDir);
      hilog.info(0x0000, 'testTag', 'AbilityStage context.databaseDir: %{public}s', context.databaseDir);
      hilog.info(0x0000, 'testTag', 'AbilityStage context.preferencesDir: %{public}s', context.preferencesDir);
      hilog.info(0x0000, 'testTag', 'AbilityStage context.bundleCodeDir: %{public}s', context.bundleCodeDir);
      hilog.info(0x0000, 'testTag', 'AbilityStage context.distributedFilesDir: %{public}s', context.distributedFilesDir);
      hilog.info(0x0000, 'testTag', 'AbilityStage context.resourceDir: %{public}s', context.resourceDir);
      hilog.info(0x0000, 'testTag', 'AbilityStage context.area: %{public}d', context.area);
      // eventhub
      // switch area
      // other func
      // 独有的属性
      // currentHapModuleInfo
      hilog.info(0x0000, 'testTag', 'AbilityStage context.currentHapModuleInfo: %{public}s', JSON.stringify(context.currentHapModuleInfo));
      // config
      hilog.info(0x0000, 'testTag', 'AbilityStage context.config: %{public}s', JSON.stringify(context.config));
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
      let object: SendableContextObject = new SendableContextObject(sendableContext, 'AbilityStageContext');
      hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage post message');
      abilityStageWorker.postMessageWithSharedSendable(object);
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'AbilityStage convertFromContext failed %{public}s', JSON.stringify(error));
    }
  }

  onAcceptWant(want: Want): string {
    // 仅specified模式下触发
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage onAcceptWant');
    return 'MyAbilityStage';
  }
}

abilityStageWorker.onmessage = (event: MessageEvents): void => {
  let key: string = event.data.key;
  let value: string = event.data.value;
  hilog.info(0x0000, 'testTag', 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
  AppStorage.setOrCreate(key, value);
}
