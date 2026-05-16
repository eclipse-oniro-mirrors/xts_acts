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
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import commonEventManager from '@ohos.commonEventManager';

const DOMAIN = 0x0000;
const TAG: string = 'testTag';
const EVENT_TERMINATE: string = 'terminate';

class TestEntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, 'TestEntryAbility onCreate');
    AppStorage.setOrCreate<Want>('TestAbilityWant', want);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, 'TestEntryAbility onWindowStageCreate');
    windowStage.loadContent('pages/TestIndex', (err: BusinessError<void> | null): void => {
        hilog.info(DOMAIN, TAG, 'TestEntryAbility loadContent entering');
        if (err?.code) {
          hilog.info(DOMAIN, TAG, 'TestEntryAbility loadContent error');
          return;
        }
        hilog.info(DOMAIN, TAG, 'TestEntryAbility loadContent ok');
      });
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(DOMAIN, TAG, 'TestEntryAbility onDestroy');
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(DOMAIN, TAG, 'TestEntryAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(DOMAIN, TAG, 'TestEntryAbility onForeground');
    AppStorage.setOrCreate<common.UIAbilityContext>('UIAbilityContext', this.context);
    let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
      events: [EVENT_TERMINATE]
    };
    commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
      commonEventManager.subscribe(subscriber, (err, commonEventData) => {
        this.context.terminateSelf(() => {});
        commonEventManager.unsubscribe(subscriber, (err, data) => {});
      });
    });
  }

  onBackground() {
    hilog.info(DOMAIN, TAG, 'TestEntryAbility onBackground');
  }
}