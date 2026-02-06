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
import { ApplicationContextObject, AbilityStageObject, ContextObject, UIAbilityContextObject } from '../common/SendableContextObject'

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  hilog.info(0x0000, 'testTag', '%{public}s', 'workerPort start.');
  let object: UIAbilityContextObject | ContextObject | AbilityStageObject | ApplicationContextObject = e.data;

  if (object.contextName === 'SUB_Ability_AbilityRuntime_Worker_Stage_1900') {
    let context: common.UIAbilityContext = object.sendableContext as common.UIAbilityContext ;
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

  if (object.contextName === 'SUB_Ability_AbilityRuntime_Worker_Stage_2000') {
    let context: common.ApplicationContext = object.sendableContext as common.ApplicationContext ;
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

  if (object.contextName === 'SUB_Ability_AbilityRuntime_Worker_Stage_2700') {
    let context: common.AbilityStageContext = object.sendableContext as common.AbilityStageContext ;
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

  
  if (object.contextName === 'SUB_Ability_AbilityRuntime_Worker_Stage_2100') {
    let context: common.Context = object.sendableContext as common.Context ;
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