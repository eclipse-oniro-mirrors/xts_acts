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
import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { SendableObject } from '../model/sendableObject';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { sendableContextManager } from '@kit.AbilityKit';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
let context: Context;

function handleContext(object: SendableObject): void {
  if (object.operation == 'emit') {
    if ( context == null || context == undefined ) {
      hilog.info(0x0000, 'testTag', '%{public}s', `worker2: context not exist`);
      return;
    }
    context.eventHub.emit(object.eventName, object.callback);
    hilog.info(0x0000, 'testTag', '%{public}s', `worker2通过${object.contextName}触发了${object.eventName}`);
  } else if (object.operation == 'setTrue') {
    if ( context == null || context == undefined ) {
      hilog.info(0x0000, 'testTag', '%{public}s', `worker2: context not exist`);
      return;
    }
    sendableContextManager.setEventHubMultithreadingEnabled(context, true);
    hilog.info(0x0000, 'testTag', '%{public}s', `worker2.setEventHubMultithreadingEnabled(${object.contextName}, true)`);
  } else if (object.operation == 'sendContext') {
    let sendableContext: sendableContextManager.SendableContext = object.sendableContext;
    context = sendableContextManager.convertToContext(sendableContext);
    hilog.info(0x0000, 'testTag', '%{public}s',
      `worker2 received Context(${JSON.stringify(context)})`);
  }
}

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessage = (event: MessageEvents) => {
  hilog.info(0x0000, 'testTag', '%{public}s', `workerPort.onmessage. event:${JSON.stringify(event)}`);
  let object: SendableObject = event.data;
  if (object.contextName == 'Context') {
    handleContext(object);
  }
};

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessageerror = (event: MessageEvents) => {
  hilog.info(0x0000, 'testTag', '%{public}s', `workerPort.onmessageerror. event:${JSON.stringify(event)}`);
};

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param event error message
 */
workerPort.onerror = (event: ErrorEvent) => {
  hilog.info(0x0000, 'testTag', '%{public}s', `workerPort.onerror. event:${JSON.stringify(event)}`);
};