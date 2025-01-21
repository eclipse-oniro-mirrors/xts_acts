/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import sendableContextManager from '@ohos.app.ability.sendableContextManager';
import { worker, MessageEvents } from '@kit.ArkTS';
import { SendableContextObject } from '../common/SendableContextObject'
import common from '@ohos.app.ability.common';

let abilityWorker: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/Worker.ets');

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);

    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    try {
      let sendableContext: sendableContextManager.SendableContext =
        sendableContextManager.convertFromContext(this.context);
      let object: SendableContextObject = new SendableContextObject(sendableContext, 'EntryAbilityContext');
      hilog.info(0x0000, 'testTag', '%{public}s', 'Ability post message uiabilitycontext');
      abilityWorker.postMessageWithSharedSendable(object);
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'Ability convertFromContext failed %{public}s', JSON.stringify(error));
    }

    try {
      let applicationContext: common.ApplicationContext = this.context.getApplicationContext();
      let sendableContext: sendableContextManager.SendableContext =
        sendableContextManager.convertFromContext(applicationContext);
      let object: SendableContextObject = new SendableContextObject(sendableContext, 'ApplicationContext');
      hilog.info(0x0000, 'testTag', '%{public}s', 'Application post message application context');
      abilityWorker.postMessageWithSharedSendable(object);
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'Application convertFromContext failed %{public}s', JSON.stringify(error));
    }

    try {
      let baseContext = this.context as common.Context;
      let sendableContext: sendableContextManager.SendableContext =
        sendableContextManager.convertFromContext(baseContext);
      let object: SendableContextObject = new SendableContextObject(sendableContext, 'BaseContext');
      hilog.info(0x0000, 'testTag', '%{public}s', 'Base post message base context');
      abilityWorker.postMessageWithSharedSendable(object);
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'Base convertFromContext failed %{public}s', JSON.stringify(error));
    }
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onBackground');
  }
}

abilityWorker.onmessage = (event: MessageEvents): void => {
  let key: string = event.data.key;
  let value: string = event.data.value;
  hilog.info(0x0000, 'testTag', 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
  AppStorage.setOrCreate(key, value);
}
