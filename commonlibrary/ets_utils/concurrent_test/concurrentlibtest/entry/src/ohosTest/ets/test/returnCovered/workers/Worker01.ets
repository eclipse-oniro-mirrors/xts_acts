import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessage = (event: MessageEvents) => {
  workerPort.addEventListener("alert", () => {
    console.info("alert listener callback");
  })
  let result: Array<boolean> = [];
  const result0 = workerPort.dispatchEvent({ type: "alert", timeStamp: 0 });
  const result1 = workerPort.dispatchEvent({ type: "alert11", timeStamp: 0 });
  result.push(result0)
  result.push(result1)
  workerPort.postMessage(result)
};

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessageerror = (event: MessageEvents) => {
};

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param event error message
 */
workerPort.onerror = (event: ErrorEvent) => {
};