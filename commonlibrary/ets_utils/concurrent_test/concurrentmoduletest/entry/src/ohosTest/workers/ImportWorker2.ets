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
import { ArkTSUtils, ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { numberPromise } from 'library1';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessage = async (event: MessageEvents) => {
  if (event.data === '1') {
    workerPort.postMessage(event.data)
  } else if (event.data === '2') {
    let s: string[] = []
    s[0].split('')[1].toString()
    workerPort.postMessage(event.data)
  }
  if (event.data === '3') {
    setTimeout(async () => {
      await workerPort.postMessage(event.data);
    }, 100);
  }
  if (event.data === 1) {
    const numberResult = await numberPromise;
    console.log('String result:', numberResult);
    workerPort.postMessage(numberResult);
    workerPort.close();
  }
  if (event.data === 2) {
    let lock1: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
    await lock1.lockAsync(async () => {
      await workerPort.postMessage(42);
      console.info('Lock section executed');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
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