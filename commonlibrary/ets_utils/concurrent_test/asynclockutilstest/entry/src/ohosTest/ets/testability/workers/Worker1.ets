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
import { printArgs2, sleep } from '../pages/Utils';

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
  if (str == 'AsynclockSameAddTest0700') {
    let count: number = 0;
    let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    const promises: Promise<void>[] = [];
    for (let i = 0; i < 10; i++) {
      const promise = lock1.lockAsync(async () => {
        await new Promise<void>((reject) => {
          console.log('Asynchronous operation completed');
          reject();
          count++;
        });
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
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

  if (str == 'AsynclockSameAddTest1300') {
    let count: number = 0;
    let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    const promises: Promise<void>[] = [];
    const promise = lock1.lockAsync(async () => {
      lock2.lockAsync(async () => {
        try {
          count++;
          const error = new Error('Simulated asynchronous operation error');
          console.log('Caught an exception:', count);
          throw error;
        } catch (e) {
          console.log('e:' + JSON.stringify(e));
        }
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      console.log('Exit exclusive lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    while(count != 1){
      await sleep(300);
    }
    console.log('count:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }

  if (str == 'AsynclockSameAddTest1900') {
    let count: number = 0;
    let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    const promises: Promise<void>[] = [];
    const promise = lock1.lockAsync(async () => {
     lock2.lockAsync(async () => {
        await new Promise<void>((resolve, reject) => {
          setTimeout(() => {
            count++;
            console.log('count:' + count);
            reject();
          }, 200);
        });
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    promises.push(promise);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    while(count != 1){
      await sleep(300);
    }
    console.log('count1:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }


  if (str == 'AsynclockSameAddTest2800') {
    let count: number = 0;
    let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    const promises: Promise<void>[] = [];
    const promise = lock1.lockAsync(async () => {
      lock2.lockAsync(async () => {
        await new Promise<void>((resolve, reject) => {
          count++;
          reject();
        });
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    promises.push(promise);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    while(count != 1){
      await sleep(300);
    }
    console.log('count1:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }

  if (str == 'AsynclockSameAddTest3100') {
    let count: number = 0;
    let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    const promises: Promise<void>[] = [];
    const promise = lock1.lockAsync(async () => {
      console.log('Enter shared lock lock1');
      lock2.lockAsync(async () => {
        console.log('Enter shared lock lock2');
        let task: taskpool.Task = new taskpool.Task(printArgs2, 1);
        await taskpool.execute(task).then((result) => {
          count++;
        })
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    promises.push(promise);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    while(count != 1){
      await sleep(300);
    }
    console.log('count1:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }

  if (str == 'AsynclockSameAddTest3400') {
    let count: number = 42;
    console.log('value :' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }

  if (str == 'AsynclockSameAddTest3500') {
    let count: number = 42;
    console.log('value :' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }


  if (str == 'AsynclockSameAddTest3600') {
    let count: number = 42;
    console.log('value :' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }


  if (str == 'AsynclockSameAddTest3700') {
    let count: number = 42;
    console.log('value :' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }


  if (str == 'AsynclockSameAddTest3800') {
    let count: number = 42;
    console.log('value :' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }



  if (str == 'AsynclockSameAddTest3900') {
    let count: number = 42;
    console.log('value :' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }


  if (str == 'AsynclockSameAddTest4010') {
    let count: number = 42;
    console.log('value :' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }


  if (str == 'AsynclockSameAddTest4000') {
    let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    const promises: Promise<void>[] = [];
    let count: number = 0;
    const promise1 : Promise<void> = lock1.lockAsync(async () => {
      lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');
        console.log('Enter worker');
        let workThread: worker.ThreadWorker;
        workThread = new worker.ThreadWorker('./Worker1');
        workThread.onexit = () => {
          console.log('onexit');
        }
        workThread.postMessage('AsynclockSameAddTest4010');
        workThread.onmessage = (e: MessageEvents): void => {
          count = e.data ;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          workThread.terminate();
          console.log('Success execution count:' + count);
        }
        console.log('Exit worker');


      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    promises.push(promise1);
    try {
      await Promise.all(promises);
    } catch (e) {
      console.log('Caught an error in Promise.all:', JSON.stringify(e));
    }
    while (count != 42) {
      await sleep(300);
    }
    workerPort.postMessage(count);
    workerPort.close();
  }


  if (str == 'AsynclockSameAddTest4300') {
    let count: number = 0;
    let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    let lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    const promises: Promise<void>[] = [];
    const promise = lock1.lockAsync(async () => {
      console.log('Enter shared lock lock1');
      lock2.lockAsync(async () => {
        console.log('Enter shared lock lock2');
        lock3.lockAsync(async () => {
          console.log('Enter exclusive lock lock3');
          let task: taskpool.Task = new taskpool.Task(printArgs2, 1);
          await taskpool.execute(task).then((result) => {
            count++;
          })
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    promises.push(promise);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    while(count != 1){
      await sleep(300);
    }
    console.log('count1:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }



  if (str == 'AsynclockSameAddTest4900') {
    let count: number = 42;
    console.log('value:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }



  if (str == 'AsynclockSameAddTest5300') {
    let count: number = 0;
    let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    const promises: Promise<void>[] = [];
    const promise = lock1.lockAsync(async () => {
      setTimeout(() => {},1000)
      lock2.lockAsync(async () => {
        setTimeout(() => {},1000)
        await new Promise<void>((resolve, reject) => {
          setTimeout(() => {
            count++;
            resolve();
          }, 1000);
        });
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    promises.push(promise);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    while(count != 1){
      await sleep(300);
    }
    console.log('count1:' + count);
    workerPort.postMessage(count);
    workerPort.close();
  }


  if (str == 'AsynclockSameAddTest5600') {
    let count: number = 0;
    let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
    const promises: Promise<void>[] = [];
    const promise = lock1.lockAsync(async () => {
      setTimeout(() => {},1000)
      lock2.lockAsync(async () => {
        setTimeout(() => {},1000)
        setTimeout(() => {
          count++;
        }, 1000);
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    promises.push(promise);
    try {
      await Promise.all(promises);
    } catch (error) {
      console.log('Promise.all caught an error:', error);
    }
    while(count != 1){
      await sleep(300);
    }
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