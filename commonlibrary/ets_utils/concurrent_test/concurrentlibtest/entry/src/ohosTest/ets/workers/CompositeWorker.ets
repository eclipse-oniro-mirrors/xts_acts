import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { Sleep } from '../test/utils/utils';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

const mWorkerInstance = new worker.ThreadWorker('./postMessage/WorkerPostMessage.ets');
/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessage = async (e: MessageEvents) => {
  let data = e.data as string;
  let value = 0;
  let state: boolean = false;
  try {
    if (data == 'testComposite0001') {
      let workerInstance = new worker.ThreadWorker('./postMessage/WorkerPostMessage.ets');
      workerInstance.onmessage = async (e) => {
        console.log(`testComposite0001 worker onmessage: ` + JSON.stringify(e));
        value = e.data as number;
        state = true;
        workerInstance.terminate();
      }
      workerInstance.postMessage(1);
    } else if (data == 'testComposite0002') {
      mWorkerInstance.onmessage = async (e) => {
        console.log(`testComposite0002 worker onmessage: ` + JSON.stringify(e));
        value = e.data as number;
        state = true;
        mWorkerInstance.terminate();
      }
      mWorkerInstance.postMessage(2);
    } else {
      state = true;
    }
    while (!state) {
      await Sleep(100);
    }
  } catch (error) {
    console.error(`error CompositeWorker`);
  }
  workerPort.postMessage(value);
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