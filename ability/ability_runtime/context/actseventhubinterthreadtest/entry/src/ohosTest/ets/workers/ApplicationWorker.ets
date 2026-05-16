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
import { common, sendableContextManager } from '@kit.AbilityKit';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
let context: common.ApplicationContext;
let event1: string = 'com.example.eventhubinterthreadtest.event1';
let event2: string = 'com.example.eventhubinterthreadtest.event2';
let event3: string = 'com.example.eventhubinterthreadtest.event3';
let event4: string = 'com.example.eventhubinterthreadtest.event4';

function event1Callback1(data: string): void {
  context.eventHub.emit('event1_callback1', data);
  context.eventHub.off(event1, event1Callback1);
  hilog.info(0x0000, 'testTag', '%{public}s', `Worker event1Callback1 triggered: ${data}`);
}

function event1Callback2(data: string): void {
  context.eventHub.emit('event1_callback2', data);
  context.eventHub.off(event1, event1Callback2);
  hilog.info(0x0000, 'testTag', '%{public}s', `Worker event1Callback2 triggered:  ${data}`);
}

function event2Callback1(data: string): void {
  context.eventHub.emit('event2_callback1', data);
  context.eventHub.off(event2, event2Callback1);
  hilog.info(0x0000, 'testTag', '%{public}s', `Worker event2Callback1 triggered: ${data}`);
}

function event2Callback2(data: string): void {
  context.eventHub.emit('event2_callback2', data);
  context.eventHub.off(event2, event2Callback2);
  hilog.info(0x0000, 'testTag', '%{public}s', `Worker event2Callback2 triggered:  ${data}`);
}

function event3Callback1(data: string): void {
  context.eventHub.emit('event3_callback1', data);
  context.eventHub.off(event3, event3Callback1);
  hilog.info(0x0000, 'testTag', '%{public}s', `Worker event3Callback1 triggered: ${data}`);
}

function event3Callback2(data: string): void {
  context.eventHub.emit('event3_callback2', data);
  context.eventHub.off(event3, event3Callback2);
  hilog.info(0x0000, 'testTag', '%{public}s', `Worker event3Callback2 triggered:  ${data}`);
}

function event4Callback1(data: string): void {
    context.eventHub.emit('event4_callback1', data);
    context.eventHub.off(event4, event4Callback1);
    hilog.info(0x0000, 'testTag', '%{public}s', `Worker event4Callback1 triggered: ${data}`);
  }
  
function event4Callback2(data: string): void {
    context.eventHub.emit('event4_callback2', data);
    context.eventHub.off(event4, event4Callback2);
    hilog.info(0x0000, 'testTag', '%{public}s', `Worker event4Callback2 triggered:  ${data}`);
}

function handleApplicationContext(object: SendableObject): void {
  if (object.operation == 'emit') {
    if ( context == null || context == undefined ) {
      hilog.info(0x0000, 'testTag', '%{public}s', `Worker: ApplicationContext not exist`);
      return;
    }
    context.eventHub.emit(object.eventName, `${object.contextName}_worker_emit_${object.eventName}`);
    hilog.info(0x0000, 'testTag', '%{public}s', 
      `Worker triggered ${object.eventName} by ${object.contextName}`);
  } else if (object.operation == 'on') {
    if ( context == null || context == undefined ) {
      hilog.info(0x0000, 'testTag', '%{public}s', `Worker: ApplicationContext not exist`);
      return;
    }
    if (object.callback == 'event1_callback1') {
      context.eventHub.on(object.eventName, event1Callback1);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    } else if (object.callback == 'event1_callback2') {
      context.eventHub.on(object.eventName, event1Callback2);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    } else if (object.callback == 'event2_callback1') {
      context.eventHub.on(object.eventName, event2Callback1);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    } else if (object.callback == 'event2_callback2') {
      context.eventHub.on(object.eventName, event2Callback2);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    } else if (object.callback == 'event3_callback1') {
      context.eventHub.on(object.eventName, event3Callback1);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    } else if (object.callback == 'event3_callback2') {
      context.eventHub.on(object.eventName, event3Callback2);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    } else if (object.callback == 'event4_callback1') {
        context.eventHub.on(object.eventName, event4Callback1);
        hilog.info(0x0000, 'testTag', '%{public}s',
          `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    } else if (object.callback == 'event4_callback2') {
        context.eventHub.on(object.eventName, event4Callback2);
        hilog.info(0x0000, 'testTag', '%{public}s',
        `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    }
  } else if (object.operation == 'off') {
    if ( context == null || context == undefined ) {
      hilog.info(0x0000, 'testTag', '%{public}s', `Worker: ApplicationContext not exist`);
      return;
    }
    if (object.callback == 'event1_callback1') {
      context.eventHub.off(object.eventName, event1Callback1);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == 'event1_callback2') {
      context.eventHub.off(object.eventName, event1Callback2);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == 'event2_callback1') {
      context.eventHub.off(object.eventName, event2Callback1);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == 'event2_callback2') {
      context.eventHub.off(object.eventName, event2Callback2);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == '' || object.callback == undefined) {
      context.eventHub.off(object.eventName);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == 'event3_callback1') {
      context.eventHub.off(object.eventName, event3Callback1);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == 'event3_callback2') {
      context.eventHub.off(object.eventName, event3Callback2);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == 'event4_callback1') {
        context.eventHub.off(object.eventName, event4Callback1);
        hilog.info(0x0000, 'testTag', '%{public}s',
          `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == 'event4_callback2') {
        context.eventHub.off(object.eventName, event4Callback2);
        hilog.info(0x0000, 'testTag', '%{public}s',
            `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    }
  } else if (object.operation == 'setTrue') {
    if ( context == null || context == undefined ) {
      hilog.info(0x0000, 'testTag', '%{public}s', `ApplicationWorker: ApplicationContext not exist`);
      return;
    }
    sendableContextManager.setEventHubMultithreadingEnabled(context, true);
    hilog.info(0x0000, 'testTag', '%{public}s', 
      `ApplicationWorker.setEventHubMultithreadingEnabled(${object.contextName}, true)`);
  } else if (object.operation == 'setFalse') {
    if ( context == null || context == undefined ) {
      hilog.info(0x0000, 'testTag', '%{public}s', `ApplicationWorker: ApplicationContext not exist`);
      return;
    }
    sendableContextManager.setEventHubMultithreadingEnabled(context, false);
    hilog.info(0x0000, 'testTag', '%{public}s',
      `ApplicationWorker.setEventHubMultithreadingEnabled(${object.contextName}, false)`);
  } else if (object.operation == 'sendContext') {
    let sendableContext: sendableContextManager.SendableContext = object.sendableContext;
    context = sendableContextManager.convertToApplicationContext(sendableContext);
    hilog.info(0x0000, 'testTag', '%{public}s',
      `ApplicationWorker received ApplicationContext(${JSON.stringify(context)})`);
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
  if (object.contextName == 'ApplicationContext') {
    handleApplicationContext(object);
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