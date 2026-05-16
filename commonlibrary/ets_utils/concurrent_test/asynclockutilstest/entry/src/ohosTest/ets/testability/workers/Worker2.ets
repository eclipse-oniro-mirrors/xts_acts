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
import { printArgs1, sleep } from '../pages/Utils';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessage = async (event: MessageEvents) => {
  let str: string = event.data;
  console.log('str:' + str);
  if (str == 'AsynclockDifferentTest0700') {
    let count: number = 0;
    const lock1 = new ArkTSUtils.locks.AsyncLock();
    const promises: Promise<void>[] = [];
    for (let i = 0; i < 10; i++) {
      const promise = lock1.lockAsync(async () => {
        console.log('Enter shared lock lock1');
        count++;
        console.log('count:' + count);
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      promises.push(promise);
    }
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    console.log('count1:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }

  if (str == 'AsynclockDifferentTest1000') {
    let count: number = 0;
    const lock1 = new ArkTSUtils.locks.AsyncLock();
    const promises: Promise<void>[] = [];
    const promise = lock1.lockAsync(async () => {
      console.log('Enter shared lock lock1');
      await new Promise<void>((resolve, reject) => {
        setTimeout(() => {
          try {
            count++;
            const error = new Error('Simulated asynchronous operation error');
            console.log('Caught an exception:', count);
            throw error;
          } catch (e) {
            console.log('e:' + JSON.stringify(e));
            resolve(e);
          }
        }, 200);
      });
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    console.log('count:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }

  if (str == 'AsynclockDifferentTest1300') {
    let count: number = 0;
    const lock1 = new ArkTSUtils.locks.AsyncLock();
    const lock2 = new ArkTSUtils.locks.AsyncLock();
    const promises: Promise<void>[] = [];
    const promise = lock1.lockAsync(async () => {
      console.log('Enter shared lock lock1');
      await lock2.lockAsync(async () => {
        await new Promise<void>((resolve, reject) => {
          setTimeout(() => {
            try {
              count++;
              const error = new Error('Simulated asynchronous operation error');
              console.log('Caught an exception:', count);
              throw error;
            } catch (e) {
              console.log('e:' + JSON.stringify(e));
              resolve(e);
            }
          }, 200);
        });
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log('Exit exclusive lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    console.log('count:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }

  if (str == 'AsynclockDifferentTest1800') {
    let count: number = 0;
    const lock1 = new ArkTSUtils.locks.AsyncLock();
    const lock2 = new ArkTSUtils.locks.AsyncLock();
    const promises: Promise<void>[] = [];
    const promise = lock1.lockAsync(async () => {
      console.log('Enter shared lock lock1');
      await lock2.lockAsync(async () => {
        await new Promise<void>((resolve, reject) => {
          setTimeout(() => {
            count++;
            console.log('count:' + count);
            reject();
          }, 200);
        });
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log('Exit exclusive lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    console.log('count1:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }


  if (str == 'AsynclockDifferentTest2600') {
    let count: number = 0;
    const lock1 = new ArkTSUtils.locks.AsyncLock();
    const lock2 = new ArkTSUtils.locks.AsyncLock();
    const promises: Promise<void>[] = [];
    const promise = lock1.lockAsync(async () => {
      console.log('Enter shared lock lock1');
      await lock2.lockAsync(async () => {
        await new Promise<void>((resolve, reject) => {
          setTimeout(() => {
            count++;
            console.log('count:' + count);
            reject();
          }, 200);
        });
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      console.log('Exit exclusive lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    console.log('count1:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }


  if (str == 'AsynclockDifferentTest2900') {
    let count = 0;
    const promises: Promise<void>[] = [];
    const lock1 = new ArkTSUtils.locks.AsyncLock();
    const lock2 = new ArkTSUtils.locks.AsyncLock();
    let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter shared lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');
        await taskpool.execute(task).then(() => {
          count++;
          console.log('taskpool success');
        })
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log('Exit exclusive lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    console.log('Exit shared lock lock1');
    promises.push(promise1);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    console.log('count:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }

  if (str == 'AsynclockDifferentTest3500') {
    let count = 0;
    const promises: Promise<void>[] = [];
    let task: taskpool.Task = new taskpool.Task(printArgs1, 1);
    const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
    const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
    const lock3 = ArkTSUtils.locks.AsyncLock.request('lock3');
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter shared lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter shared lock lock2');
        await lock3.lockAsync(async () => {
          console.log('Enter shared lock lock3');
          await taskpool.execute(task).then(() => {
            count++;
            console.log('taskpool success');
          })
          console.log('Exit shared lock lock3');
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        console.log('Exit shared lock lock2');
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log('Exit shared lock lock1');
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    console.log('Exit shared lock lock1');
    promises.push(promise1);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    console.log('count:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }

  if (str == 'AsynclockDifferentTest4200') {
    let count = 0;
    count++;
    console.log('count:' + count)
    workerPort.postMessage(count);
    workerPort.close();
  }

  if (str == 'AsynclockDifferentTest4300') {
    let count = 0;
    count++;
    console.log('count:' + count)
    workerPort.postMessage(count);
    workerPort.close();
  }

  if (str == 'AsynclockDifferentTest4400') {
    let count = 0;
    count++;
    console.log('count:' + count)
    workerPort.postMessage(count);
    workerPort.close();
  }

  if (str == 'AsynclockDifferentTest4700') {
    const promises: Promise<void>[] = [];
    let count = 0;
    const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
    const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
    const options1 = new ArkTSUtils.locks.AsyncLockOptions<void>();
    options1.timeout = 1000;
    const options2 = new ArkTSUtils.locks.AsyncLockOptions<void>();
    options2.timeout = 1000;
    const promise1 = lock1.lockAsync(async () => {
      console.log('enter SHARE lock1');
      try {
        await lock2.lockAsync(async () => {
          console.log('enter EXCLUSIVE lock2');
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              count++;
              resolve();
            }, 500);
          });
          console.log('Exit EXCLUSIVE lock');
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options2);
      } catch (e) {
        console.log(`Promise execution completed in ${count} second`);
      }
      console.log('Exit SHARED lock');
    }, ArkTSUtils.locks.AsyncLockMode.SHARED, options1);
    promises.push(promise1);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    while (count != 1) {
      await sleep(300);
    }
    console.log('count:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }


  if (str == 'AsynclockDifferentTest5000') {
    const promises: Promise<void>[] = [];
    let count = 0;
    const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
    const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
    const options1 = new ArkTSUtils.locks.AsyncLockOptions<void>();
    options1.timeout = 1000;
    const options2 = new ArkTSUtils.locks.AsyncLockOptions<void>();
    options2.timeout = 1000;
    const promise1 = lock1.lockAsync(async () => {
      console.log('enter SHARE lock1');
      try {
        await lock2.lockAsync(async () => {
          console.log('enter SHARED lock2');
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              count++;
              resolve();
            }, 500);
          });
          console.log('Exit SHARED lock');
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options2);
      } catch (e) {
        console.log(`Promise execution completed in ${count} second`);
      }
      console.log('Exit SHARED lock');
    }, ArkTSUtils.locks.AsyncLockMode.SHARED, options1);
    promises.push(promise1);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    while (count != 1) {
      await sleep(300);
    }
    console.log('count:' + count);
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