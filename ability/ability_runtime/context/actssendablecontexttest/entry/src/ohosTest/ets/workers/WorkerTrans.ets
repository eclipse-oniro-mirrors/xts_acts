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

import worker, { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope } from '@ohos.worker';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import sendableContextManager from '@ohos.app.ability.sendableContextManager';
import contextConstant from '@ohos.app.ability.contextConstant';
import hilog from '@ohos.hilog';
import resourceManager from '@ohos.resourceManager';
import { SendableContextObject } from '../common/SendableContextObject'

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  let object: SendableContextObject = e.data;
  if (object.contextName === 'SUB_Ability_AbilityRuntime_Worker_Stage_1100') {
    let sendableContext: sendableContextManager.SendableContext = object.sendableContext;
    let context: common.UIAbilityContext = sendableContextManager.convertToUIAbilityContext(sendableContext);
    hilog.info(0x0000, 'testTag', '%{public}s', object.contextName + '[WorkerTrans1] uiability context convert to uiability context.');
    try {
      hilog.info(0x0000, 'testTag', object.contextName + '[WorkerTrans1] Worker uiability context.cacheDir: %{public}s', context.cacheDir);
      workerPort.postMessage({'key': '[WorkerTrans1] succes', 'value': context});
    } catch (error) {
      hilog.error(0x0000, 'testTag', object.contextName + '[WorkerTrans1]  failed %{public}s',
        JSON.stringify(error));
      workerPort.postMessage({'key': '[WorkerTrans1] fail', 'value': 'failed'});
    }
  }

  if (object.contextName === 'SUB_Ability_AbilityRuntime_Worker_Stage_1200') {
    let sendableContext: sendableContextManager.SendableContext = object.sendableContext;
    let context: common.ApplicationContext = sendableContextManager.convertToApplicationContext(sendableContext);
    hilog.info(0x0000, 'testTag', '%{public}s', 'uiability context convert to uiability context.');
    try {
      hilog.info(0x0000, 'testTag', '[WorkerTrans1] Worker uiability context.cacheDir: %{public}s', context.cacheDir);
      workerPort.postMessage({'key': '[WorkerTrans1] succes', 'value': context});
    } catch (error) {
      hilog.error(0x0000, 'testTag', object.contextName + '[WorkerTrans1]  failed %{public}s',
        JSON.stringify(error));
      workerPort.postMessage({'key': '[WorkerTrans1] fail ', 'value': 'failed'});
    }
  }

  if (object.contextName === 'SUB_Ability_AbilityRuntime_Worker_Stage_1300') {
    let sendableContext: sendableContextManager.SendableContext = object.sendableContext;
    let context: common.AbilityStageContext = sendableContextManager.convertToAbilityStageContext(sendableContext);
    hilog.info(0x0000, 'testTag', '%{public}s', 'uiability context convert to uiability context.');
    try {
      hilog.info(0x0000, 'testTag', '[WorkerTrans1] Worker uiability context.cacheDir: %{public}s', context.cacheDir);
      workerPort.postMessage({'key': '[WorkerTrans1] succes', 'value': context});
    } catch (error) {
      hilog.error(0x0000, 'testTag', object.contextName + '[WorkerTrans1]  failed %{public}s',
        JSON.stringify(error));
      workerPort.postMessage({'key': '[WorkerTrans1] fail ', 'value': 'failed'});
    }
  }

  if (object.contextName === 'SUB_Ability_AbilityRuntime_Worker_Stage_1400') {
    let sendableContext: sendableContextManager.SendableContext = object.sendableContext;
    let context: common.Context = sendableContextManager.convertToContext(sendableContext);
    hilog.info(0x0000, 'testTag', '%{public}s', 'uiability context convert to uiability context.');
    try {
      hilog.info(0x0000, 'testTag', '[WorkerTrans1] Worker context.cacheDir: %{public}s', context.cacheDir);
      workerPort.postMessage({'key': '[WorkerTrans1] succes', 'value': context});
    } catch (error) {
      hilog.error(0x0000, 'testTag', object.contextName + '[WorkerTrans1]  failed %{public}s',
        JSON.stringify(error));
      workerPort.postMessage({'key': '[WorkerTrans1] fail ', 'value': 'failed'});
    }
  }

  
  if (object.contextName === 'SUB_Ability_AbilityRuntime_Worker_Stage_1500') {
    let sendableContext: sendableContextManager.SendableContext = object.sendableContext;
    let context: common.Context = sendableContextManager.convertToContext(sendableContext);
    hilog.info(0x0000, 'testTag', '%{public}s', 'uiability context convert to uiability context.');
    try {
      hilog.info(0x0000, 'testTag', '[WorkerTrans1] Worker context.cacheDir: %{public}s', context.cacheDir);
      workerPort.postMessage({'key': '[WorkerTrans1] succes', 'value': context});
    } catch (error) {
      hilog.error(0x0000, 'testTag', object.contextName + '[WorkerTrans1]  failed %{public}s',
        JSON.stringify(error));
      workerPort.postMessage({'key': '[WorkerTrans1] fail ', 'value': 'failed'});
    }
  }

  if (object.contextName === 'SUB_Ability_AbilityRuntime_Worker_Stage_1700') {
    let sendableContext: sendableContextManager.SendableContext = object.sendableContext;
    let context: common.Context = sendableContextManager.convertToContext(sendableContext);
    hilog.info(0x0000, 'testTag', '%{public}s', 'uiability context convert to uiability context.');
    try {
      hilog.info(0x0000, 'testTag', '[WorkerTrans1] Worker context.cacheDir: %{public}s', context.cacheDir);
      workerPort.postMessage({'key': '[WorkerTrans1] succes', 'value': context});
    } catch (error) {
      hilog.error(0x0000, 'testTag', object.contextName + '[WorkerTrans1]  failed %{public}s',
        JSON.stringify(error));
      workerPort.postMessage({'key': '[WorkerTrans1] fail ', 'value': 'failed'});
    }
  }

  if (object.contextName === 'SUB_Ability_AbilityRuntime_Worker_Stage_1800') {
    let sendableContext: sendableContextManager.SendableContext = object.sendableContext;
    let context: common.Context = sendableContextManager.convertToContext(sendableContext);
    hilog.info(0x0000, 'testTag', '%{public}s', 'uiability context convert to uiability context.');
    try {
      hilog.info(0x0000, 'testTag', '[WorkerTrans1] Worker context.cacheDir: %{public}s', context.cacheDir);
      workerPort.postMessage({'key': '[WorkerTrans1] succes', 'value': context});
    } catch (error) {
      hilog.error(0x0000, 'testTag', object.contextName + '[WorkerTrans1]  failed %{public}s',
        JSON.stringify(error));
      workerPort.postMessage({'key': '[WorkerTrans1] fail ', 'value': 'failed'});
    }
  }
}

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessageerror = (e: MessageEvents) => {
  hilog.info(0x0000, 'testTag', '%{public}s', 'onmessageerror');
}

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param e error message
 */
workerPort.onerror = (e: ErrorEvent) => {
  hilog.info(0x0000, 'testTag', '%{public}s', 'onerror');
}