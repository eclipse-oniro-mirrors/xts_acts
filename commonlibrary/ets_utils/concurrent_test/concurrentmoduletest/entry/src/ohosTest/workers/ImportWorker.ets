/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { ErrorEvent, MessageEvents, taskpool, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { task } from 'library1';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

export async function sleep(time: number): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessage = async (event: MessageEvents) => {
  let str: number = event.data;
  console.log('str:' + str);
  if (str === 1) {
    try {
      throw new Error('error in then worker.');
    } catch (e) {
      workerPort.postMessage({ error: e.message });
    }
  }
  if (str === 2) {
    let count: string = '0';
    let workThread1: worker.ThreadWorker;
    workThread1 = new worker.ThreadWorker('../workers/ImportWorker2');
    workThread1.onexit = () => {
      console.log('onexit2');
    }
    workThread1.postMessage('1');
    workThread1.onmessage = async (e: MessageEvents): Promise<void> => {
      count = e.data;
      workThread1.terminate();
    }
    while (count != '1') {
      await sleep(300)
    }
    workerPort.postMessage(count);
  }
  if (str === 3) {
    await taskpool.execute(task).catch((e: Error) => {
      workerPort.postMessage(42);
    })
    workerPort.close();
  }
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