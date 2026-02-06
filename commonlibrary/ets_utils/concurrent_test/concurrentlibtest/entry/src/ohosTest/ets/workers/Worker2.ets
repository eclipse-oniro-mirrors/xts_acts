import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessage = (e: MessageEvents) => {
  const buffer = new ArrayBuffer(10);
  workerPort.postMessage(null)
  workerPort.postMessage(undefined)
  workerPort.postMessage(1, null)
  workerPort.postMessage(1, undefined)
  workerPort.postMessage(1, [])
  workerPort.postMessage(2, { transfer: [] })
  workerPort.postMessage(2, { transfer: [buffer] })
  workerPort.postMessage(null, { transfer: [] })
  workerPort.postMessage(undefined, { transfer: [] })
  workerPort.postMessage(1, null)
  workerPort.postMessage(1, undefined)
  workerPort.postMessageWithSharedSendable(null)
  workerPort.postMessageWithSharedSendable(undefined)
  workerPort.postMessageWithSharedSendable(1, null)
  workerPort.postMessageWithSharedSendable(1, undefined)
  workerPort.postMessageWithSharedSendable(1, [])
  // 第1个参数缺少空值""//null/undefined覆盖;第2个参数缺少空值""//null/undefined覆盖;第3个参数缺少null/undefined覆盖;第4个参数缺少null/undefined覆盖;
  workerPort.callGlobalCallObjectMethod('', 'func1', 1000, 1)
  workerPort.callGlobalCallObjectMethod(null, 'func1', 1000, 1)
  workerPort.callGlobalCallObjectMethod(undefined, 'func1', 1000, 1)
  workerPort.callGlobalCallObjectMethod('test', '', 1000, 1)
  workerPort.callGlobalCallObjectMethod('test', null, 1000, 1)
  workerPort.callGlobalCallObjectMethod('test', undefined, 1000, 1)
  workerPort.callGlobalCallObjectMethod('test', 'func1', null, 1)
  workerPort.callGlobalCallObjectMethod('test', 'func1', undefined, 1)
  workerPort.callGlobalCallObjectMethod('test', 'func1', 1000, null)
  workerPort.callGlobalCallObjectMethod('test', 'func1', 1000, undefined)
}

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessageerror = (e: MessageEvents) => {
}

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param e error message
 */
workerPort.onerror = (e: ErrorEvent) => {
}