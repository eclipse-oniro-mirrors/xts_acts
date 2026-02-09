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
let context: common.UIAbilityContext;
let event9: string = 'com.example.eventhubinterthreadtest.event9';
let event10: string = 'com.example.eventhubinterthreadtest.event10';
let event11: string = 'com.example.eventhubinterthreadtest.event11';
let event12: string = 'com.example.eventhubinterthreadtest.event12';

function event9Callback1(data: string): void {
  context.eventHub.emit('event9_callback1', data);
  context.eventHub.off(event9, event9Callback1);
  hilog.info(0x0000, 'testTag', '%{public}s', `Worker event9Callback1 triggered: ${data}`);
}

function event9Callback2(data: string): void {
  context.eventHub.emit('event9_callback2', data);
  context.eventHub.off(event9, event9Callback2);
  hilog.info(0x0000, 'testTag', '%{public}s', `Worker event9Callback2 triggered:  ${data}`);
}

function event10Callback1(data: string): void {
  context.eventHub.emit('event10_callback1', data);
  context.eventHub.off(event10, event10Callback1);
  hilog.info(0x0000, 'testTag', '%{public}s', `Worker event10Callback1 triggered: ${data}`);
}

function event10Callback2(data: string): void {
  context.eventHub.emit('event10_callback2', data);
  context.eventHub.off(event10, event10Callback2);
  hilog.info(0x0000, 'testTag', '%{public}s', `Worker event10Callback2 triggered:  ${data}`);
}

function event11Callback1(data: string): void {
  context.eventHub.emit('event11_callback1', data);
  context.eventHub.off(event11, event11Callback1);
  hilog.info(0x0000, 'testTag', '%{public}s', `Worker event11Callback1 triggered: ${data}`);
}

function event11Callback2(data: string): void {
  context.eventHub.emit('event11_callback2', data);
  context.eventHub.off(event11, event11Callback2);
  hilog.info(0x0000, 'testTag', '%{public}s', `Worker event11Callback2 triggered:  ${data}`);
}

function event12Callback1(data: string): void {
    context.eventHub.emit('event12_callback1', data);
    context.eventHub.off(event12, event12Callback1);
    hilog.info(0x0000, 'testTag', '%{public}s', `Worker event12Callback1 triggered: ${data}`);
  }
  
function event12Callback2(data: string): void {
    context.eventHub.emit('event12_callback2', data);
    context.eventHub.off(event12, event12Callback2);
    hilog.info(0x0000, 'testTag', '%{public}s', `Worker event12Callback2 triggered:  ${data}`);
}

function handleUIAbilityContext(object: SendableObject): void {
  if (object.operation == 'emit') {
    if ( context == null || context == undefined ) {
      hilog.info(0x0000, 'testTag', '%{public}s', `Worker: UIAbilityContext not exist`);
      return;
    }
    context.eventHub.emit(object.eventName, `${object.contextName}_worker_emit_${object.eventName}`);
    hilog.info(0x0000, 'testTag', '%{public}s', 
      `Worker triggered ${object.eventName} by ${object.contextName}`);
  } else if (object.operation == 'emit_multi_data') {
    if ( context == null || context == undefined) {
      return;
    }
    context.eventHub.emit(object.eventName, `data1`, `data2`);
    hilog.info(0x0000, 'testTag', '%{public}s', `UIAbilityWorker通过${object.contextName}触发了${object.eventName}`);
  } else if (object.operation == 'on') {
    if ( context == null || context == undefined ) {
      hilog.info(0x0000, 'testTag', '%{public}s', `Worker: UIAbilityContext not exist`);
      return;
    }
    if (object.callback == 'event9_callback1') {
      context.eventHub.on(object.eventName, event9Callback1);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    } else if (object.callback == 'event9_callback2') {
      context.eventHub.on(object.eventName, event9Callback2);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    } else if (object.callback == 'event10_callback1') {
      context.eventHub.on(object.eventName, event10Callback1);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    } else if (object.callback == 'event10_callback2') {
      context.eventHub.on(object.eventName, event10Callback2);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    } else if (object.callback == 'event11_callback1') {
      context.eventHub.on(object.eventName, event11Callback1);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    } else if (object.callback == 'event11_callback2') {
      context.eventHub.on(object.eventName, event11Callback2);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    } else if (object.callback == 'event12_callback1') {
        context.eventHub.on(object.eventName, event12Callback1);
        hilog.info(0x0000, 'testTag', '%{public}s',
          `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    } else if (object.callback == 'event12_callback2') {
        context.eventHub.on(object.eventName, event12Callback2);
        hilog.info(0x0000, 'testTag', '%{public}s',
        `${object.contextName} Worker on ${object.eventName}(${object.callback})`);
    }
  } else if (object.operation == 'off') {
    if ( context == null || context == undefined ) {
      hilog.info(0x0000, 'testTag', '%{public}s', `Worker: UIAbilityContext not exist`);
      return;
    }
    if (object.callback == 'event9_callback1') {
      context.eventHub.off(object.eventName, event9Callback1);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == 'event9_callback2') {
      context.eventHub.off(object.eventName, event9Callback2);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == 'event10_callback1') {
      context.eventHub.off(object.eventName, event10Callback1);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == 'event10_callback2') {
      context.eventHub.off(object.eventName, event10Callback2);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == '' || object.callback == undefined) {
      context.eventHub.off(object.eventName);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == 'event11_callback1') {
      context.eventHub.off(object.eventName, event11Callback1);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == 'event11_callback2') {
      context.eventHub.off(object.eventName, event11Callback2);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == 'event12_callback1') {
        context.eventHub.off(object.eventName, event12Callback1);
        hilog.info(0x0000, 'testTag', '%{public}s',
          `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    } else if (object.callback == 'event12_callback2') {
        context.eventHub.off(object.eventName, event12Callback2);
        hilog.info(0x0000, 'testTag', '%{public}s',
            `Worker unsubscribe ${object.eventName}(${object.callback}) by ${object.contextName}`);
    }
  } else if (object.operation == 'setTrue') {
    if ( context == null || context == undefined ) {
      hilog.info(0x0000, 'testTag', '%{public}s', `UIAbilityWorker: UIAbilityContext not exist`);
      return;
    }
    sendableContextManager.setEventHubMultithreadingEnabled(context, true);
    hilog.info(0x0000, 'testTag', '%{public}s', 
      `UIAbilityWorker.setEventHubMultithreadingEnabled(${object.contextName}, true)`);
  } else if (object.operation == 'setFalse') {
    if ( context == null || context == undefined ) {
      hilog.info(0x0000, 'testTag', '%{public}s', `UIAbilityWorker: UIAbilityContext not exist`);
      return;
    }
    sendableContextManager.setEventHubMultithreadingEnabled(context, false);
    hilog.info(0x0000, 'testTag', '%{public}s',
      `UIAbilityWorker.setEventHubMultithreadingEnabled(${object.contextName}, false)`);
  } else if (object.operation == 'sendContext') {
    let sendableContext: sendableContextManager.SendableContext = object.sendableContext;
    context = sendableContextManager.convertToUIAbilityContext(sendableContext);
    hilog.info(0x0000, 'testTag', '%{public}s',
      `UIAbilityWorker received UIAbilityContext(${JSON.stringify(context)})`);
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
  if (object.contextName == 'UIAbilityContext') {
    handleUIAbilityContext(object);
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