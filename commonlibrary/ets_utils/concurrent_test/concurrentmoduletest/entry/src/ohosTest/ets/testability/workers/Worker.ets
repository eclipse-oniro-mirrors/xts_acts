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
import { ArkTSUtils, ErrorEvent, MessageEvents, taskpool, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { lock, tasklock, tasklockrequest, timelockshared } from 'library1/src/main/ets/components/ConcurrencyModularImportAsyncLockTest';
import { numberPromise, stringPromise } from 'library1/src/main/ets/components/ConcurrencyModularImportPromiseTest';
import { longTask, task } from 'library1/src/main/ets/components/ConcurrencyModularImportTaskTest';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessage = async (event: MessageEvents) => {
  let str: number|string = event.data;
  console.log('str:' + str);
  if (str === 1) {
    const numberResult = await numberPromise;
    console.log('String result:', numberResult);
    workerPort.postMessage(numberResult);
    workerPort.close();
  }
  if (str === 2) {
    const result = await stringPromise;
    console.log('String result:', result);
    workerPort.postMessage(result);
    workerPort.close();
  }
  if (str === 3) {
    await taskpool.execute(task).catch((e: Error) => {
      workerPort.postMessage(42);
    })
    workerPort.close();
  }
  if (str === 4) {
    await lock.lockAsync(async () => {
      const p = await tasklock();
      workerPort.postMessage(p);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    workerPort.close();
  }
  if (str === 5) {
    await lock.lockAsync(async () => {
      await taskpool.execute(task).catch(() => {
        workerPort.postMessage(5);
      })
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    workerPort.close();
  }
  if (str === 6) {
    await lock.lockAsync(async () => {
      const p = await timelockshared(100);
      workerPort.postMessage(p);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    workerPort.close();
  }

  if (str === 7) {
    setTimeout(async () => {
      await lock.lockAsync(async () => {
        const p = await timelockshared(100);
        workerPort.postMessage(p);
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      workerPort.close();
    }, 100);
  }
  if (str === 8) {
    await lock.lockAsync(async () => {
      const p = await tasklockrequest();
      workerPort.postMessage(p);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    workerPort.close();
  }
  if (str === 9) {
    setTimeout(async () => {
      await lock.lockAsync(async () => {
        await taskpool.execute(task).catch((e: Error) => {
          workerPort.postMessage(42);
        })
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      workerPort.close();
    }, 100);
  }
  if (str == 'ConcurrencyModularImportAndExportTest2900') {
    let count: number = 42;
    console.log('count1:' + count);
    workerPort.postMessage(count);
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