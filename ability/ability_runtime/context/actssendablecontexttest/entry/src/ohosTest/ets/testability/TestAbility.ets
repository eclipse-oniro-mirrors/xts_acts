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
import { SendableContextObject, NormalContextObject } from '../common/SendableContextObject'
import common from '@ohos.app.ability.common';
import taskpool from '@ohos.taskpool';
import preferences from '@ohos.data.preferences';
import { BusinessError } from '@kit.BasicServicesKit';
import { relationalStore } from '@kit.ArkData'

let dataPreferences: preferences.Preferences | null = null;
let store: relationalStore.RdbStore | undefined = undefined;

let abilityWorker: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/Worker.ets');
let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/Worker1.ets');

@Concurrent
function printNormalContext(context: common.Context): boolean {
  hilog.info(0x0000, 'testTag', 'taskpool print: %{public}s ', JSON.stringify(context));
  return true;
}

@Concurrent
function printSendableContext(object: SendableContextObject): boolean {
  let context = sendableContextManager.convertToContext(object.sendableContext);
  hilog.info(0x0000, 'testTag', 'taskpool1 print: %{public}s ', JSON.stringify(context));
  return true;
}

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    AppStorage.setOrCreate('TestAbilityContext', this.context);

    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);

    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');

    // =====================================test for uiability context===========================================
    try {
      let sendableContext: sendableContextManager.SendableContext =
        sendableContextManager.convertFromContext(this.context);
      let object: SendableContextObject = new SendableContextObject(sendableContext, 'EntryAbilityContext');
      hilog.info(0x0000, 'testTag', '%{public}s', 'Ability post message uiabilitycontext');
      abilityWorker.postMessageWithSharedSendable(object);
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'Ability convertFromContext failed %{public}s', JSON.stringify(error));
    }

    // post to taskpool
    try {
      let sendableContext: sendableContextManager.SendableContext =
        sendableContextManager.convertFromContext(this.context);
      let object: SendableContextObject = new SendableContextObject(sendableContext, 'EntryAbilityContext');
      taskpool.execute(printSendableContext, object).then((value: Object) => {
        hilog.info(0x0000, 'testTag', 'taskpool result: %{public}s ', JSON.stringify(value));
      });
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'Ability convertFromContext failed %{public}s', JSON.stringify(error));
    }

    // convert uiability context and convert to normal context and post
    try {
      let context = this.context;
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
      let contextAfter: common.UIAbilityContext = sendableContextManager.convertToUIAbilityContext(sendableContext);
      hilog.info(0x0000, 'testTag', 'Ability context after convert: %{public}s', JSON.stringify(context));

      // Check it can be send to other api.
      let options: preferences.Options = {
        name: 'myStore'
      };
      preferences.getPreferences(contextAfter, options, (err: BusinessError, val: preferences.Preferences) => {
        if (err) {
          console.error('testTag ' + 'Failed to get preferences. code =' + err.code + ', message =' + err.message);
          return;
        }
        dataPreferences = val;
        console.info('testTag ' + 'Succeeded in getting preferences.');
      })

      const STORE_CONFIG: relationalStore.StoreConfig = {
        name: 'RdbTest.db',
        securityLevel: relationalStore.SecurityLevel.S1
      };
      let key1 = 'id';
      let key2 = 'name';
      let id: number = 111;
      let name: string = 'aaa';
      const valueBucket1: relationalStore.ValuesBucket = {
        key1: id,
        key2: name,
      };
      relationalStore.getRdbStore(contextAfter, STORE_CONFIG).then(async (rdbStore: relationalStore.RdbStore) => {
        store = rdbStore;
        hilog.info(0x0000, 'testTag', '%{public}s', 'Get RdbStore successfully.');
        const SQL_CREATE_TABLE =
          'CREATE TABLE IF NOT EXISTS contact(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)';
        if (store != undefined) {
          await (store as relationalStore.RdbStore).executeSql(SQL_CREATE_TABLE);
          let rowId: number = (store as relationalStore.RdbStore).insertSync('contact', valueBucket1,
            relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
          console.info(`testTag Insert is successful, rowId = ${rowId}`);
        }
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'testTag', 'Get RdbStore failed %{public}s.', JSON.stringify(err));
      })

      let key: string = '[NormalContext] UIAbilityContext convert in same thread';
      let value: string = 'succeed';
      hilog.info(0x0000, 'testTag', 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
      AppStorage.setOrCreate(key, value);

      let object: NormalContextObject = new NormalContextObject(contextAfter, 'EntryAbilityContext');
      hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage post message');
      worker1.postMessage(object);
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'AbilityStage convertFromContext failed %{public}s', JSON.stringify(error));

      let key: string = '[NormalContext] UIAbilityContext convert in same thread';
      let value: string = 'failed';
      hilog.info(0x0000, 'testTag', 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
      AppStorage.setOrCreate(key, value);
    }

    // post to taskpool
    try {
      let sendableContext: sendableContextManager.SendableContext =
        sendableContextManager.convertFromContext(this.context);
      let contextAfter: common.UIAbilityContext = sendableContextManager.convertToUIAbilityContext(sendableContext);
      taskpool.execute(printNormalContext, contextAfter).then((value: Object) => {
        hilog.info(0x0000, 'testTag', 'taskpool result: %{public}s ', JSON.stringify(value));
      });
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'AbilityStage convertFromContext failed %{public}s', JSON.stringify(error));
    }

    // =====================================test for application context===========================================
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

    // post to taskpool
    try {
      let applicationContext: common.ApplicationContext = this.context.getApplicationContext();
      let sendableContext: sendableContextManager.SendableContext =
        sendableContextManager.convertFromContext(applicationContext);
      let object: SendableContextObject = new SendableContextObject(sendableContext, 'ApplicationContext');
      taskpool.execute(printSendableContext, object).then((value: Object) => {
        hilog.info(0x0000, 'testTag', 'taskpool result: %{public}s ', JSON.stringify(value));
      });
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'Application convertFromContext failed %{public}s', JSON.stringify(error));
    }

    // convert application context and convert to normal context and post
    try {
      let applicationContext: common.ApplicationContext = this.context.getApplicationContext();
      let sendableContext: sendableContextManager.SendableContext =
        sendableContextManager.convertFromContext(applicationContext);
      let contextAfter: common.ApplicationContext = sendableContextManager.convertToApplicationContext(sendableContext);
      hilog.info(0x0000, 'testTag', 'Application context after convert: %{public}s', JSON.stringify(contextAfter));

      let key: string = '[NormalContext] ApplicationContext convert in same thread';
      let value: string = 'succeed';
      hilog.info(0x0000, 'testTag', 'Application key: %{public}s, value: %{public}s', key, value);
      AppStorage.setOrCreate(key, value);

      let object: NormalContextObject = new NormalContextObject(contextAfter, 'ApplicationContext');
      hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage post message');
      worker1.postMessage(object);
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'Application convertFromContext failed %{public}s', JSON.stringify(error));

      let key: string = '[NormalContext] ApplicationContext convert in same thread';
      let value: string = 'failed';
      hilog.info(0x0000, 'testTag', 'Application key: %{public}s, value: %{public}s', key, value);
      AppStorage.setOrCreate(key, value);
    }

    // post to taskpool
    try {
      let applicationContext: common.ApplicationContext = this.context.getApplicationContext();
      let sendableContext: sendableContextManager.SendableContext =
        sendableContextManager.convertFromContext(applicationContext);
      let contextAfter: common.ApplicationContext = sendableContextManager.convertToApplicationContext(sendableContext);
      taskpool.execute(printNormalContext, contextAfter).then((value: Object) => {
        hilog.info(0x0000, 'testTag', 'taskpool result: %{public}s ', JSON.stringify(value));
      });
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'Application convertFromContext failed %{public}s', JSON.stringify(error));
    }

    // =====================================test for context===========================================
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

    // post to taskpool
    try {
      let baseContext = this.context as common.Context;
      let sendableContext: sendableContextManager.SendableContext =
        sendableContextManager.convertFromContext(baseContext);
      let object: SendableContextObject = new SendableContextObject(sendableContext, 'BaseContext');
      taskpool.execute(printSendableContext, object).then((value: Object) => {
        hilog.info(0x0000, 'testTag', 'taskpool result: %{public}s ', JSON.stringify(value));
      });
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'Base convertFromContext failed %{public}s', JSON.stringify(error));
    }

    // convert context and convert to normal context and post
    try {
      let baseContext = this.context as common.Context;
      let sendableContext: sendableContextManager.SendableContext =
        sendableContextManager.convertFromContext(baseContext);
      let contextAfter: common.Context = sendableContextManager.convertToContext(sendableContext);
      hilog.info(0x0000, 'testTag', 'Base context after convert: %{public}s', JSON.stringify(contextAfter));

      let key: string = '[NormalContext] Context convert in same thread';
      let value: string = 'succeed';
      hilog.info(0x0000, 'testTag', 'Base key: %{public}s, value: %{public}s', key, value);
      AppStorage.setOrCreate(key, value);

      let object: NormalContextObject = new NormalContextObject(contextAfter, 'BaseContext');
      hilog.info(0x0000, 'testTag', '%{public}s', 'Base post message');
      worker1.postMessage(object);
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'Base convertFromContext failed %{public}s', JSON.stringify(error));

      let key: string = '[NormalContext] Context convert in same thread';
      let value: string = 'failed';
      hilog.info(0x0000, 'testTag', 'Base key: %{public}s, value: %{public}s', key, value);
      AppStorage.setOrCreate(key, value);
    }

    // post to taskpool
    try {
      let baseContext = this.context as common.Context;
      let sendableContext: sendableContextManager.SendableContext =
        sendableContextManager.convertFromContext(baseContext);
      let contextAfter: common.Context = sendableContextManager.convertToContext(sendableContext);
      taskpool.execute(printNormalContext, contextAfter).then((value: Object) => {
        hilog.info(0x0000, 'testTag', 'taskpool result: %{public}s ', JSON.stringify(value));
      });
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

worker1.onmessage = (event: MessageEvents): void => {
  let key: string = event.data.key;
  let value: string = event.data.value;
  hilog.info(0x0000, 'testTag', 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
  AppStorage.setOrCreate(key, value);
}

