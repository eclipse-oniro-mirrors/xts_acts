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
  try {
    workerPort.postMessage(null)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessage(1, null)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessage(1, undefined)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessage(1, [])
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessage(2, { transfer: [] })
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessage(2, { transfer: [buffer] })
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessage(null, { transfer: [] })
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessage(undefined, { transfer: [] })
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessage(1, null)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessage(1, undefined)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessage(1, [])
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessageWithSharedSendable(null)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessageWithSharedSendable(undefined)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessageWithSharedSendable(1, null)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessageWithSharedSendable(1, undefined)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.postMessageWithSharedSendable(1, [])
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.callGlobalCallObjectMethod('', 'func1', 1000, 1)
    workerPort.postMessage(3)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.callGlobalCallObjectMethod(null, 'func1', 1000, 1)
    workerPort.postMessage(3)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.callGlobalCallObjectMethod(undefined, 'func1', 1000, 1)
    workerPort.postMessage(3)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.callGlobalCallObjectMethod('test', '', 1000, 1)
    workerPort.postMessage(3)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.callGlobalCallObjectMethod('test', null, 1000, 1)
    workerPort.postMessage(3)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.callGlobalCallObjectMethod('test', undefined, 1000, 1)
    workerPort.postMessage(3)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.callGlobalCallObjectMethod('test', 'func1', null, 1)
    workerPort.postMessage(3)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.callGlobalCallObjectMethod('test', 'func1', undefined, 1)
    workerPort.postMessage(3)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.callGlobalCallObjectMethod('test', 'func1', 1000, null)
    workerPort.postMessage(3)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
  
  try {
    workerPort.callGlobalCallObjectMethod('test', 'func1', 1000, undefined)
    workerPort.postMessage(3)
  } catch (error) {
    workerPort.postMessage(error.code)
  }
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