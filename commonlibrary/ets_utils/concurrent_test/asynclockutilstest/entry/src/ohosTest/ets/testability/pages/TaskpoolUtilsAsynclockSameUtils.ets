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
import { ArkTSUtils, HashMap, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import { expect } from '@ohos/hypium';
import { sleep , printArgs2 } from './Utils';

@Concurrent
export function printArgs1(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

@Concurrent
export function test(args:number) {
  let t = Date.now()
  while ((Date.now() - t) < 100) {
    continue;
  }
  let hashMap1: HashMap<string, number> = new HashMap();
  hashMap1.set('a', args);
  return hashMap1;
}

@Concurrent
export async function taskFunctionTest0200(): Promise<number> {
  let count = 0;
  let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync( async () => {
      try {
        throw new Error('Error occurred in asynchronous operation');
      } catch (error) {
        count++;
        console.error('Caught an exception:', error.message);
      }
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}



@Concurrent
export async function taskFunctionTest0400(): Promise<number> {
  let count = 0;
  let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync( async () => {
      await new Promise<void>((resolve) => {
        console.log('Asynchronous operation completed');
        resolve();
        count++;
      });
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}



@Concurrent
export async function taskFunctionTest0600(): Promise<number> {
  let count = 0;
  let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync( async () => {
      await new Promise<void>((reject) => {
        console.log('Asynchronous operation completed');
        reject();
        count++;
      });
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}


@Concurrent
export async function taskFunctionTest0900(): Promise<number> {
  let count = 0;
  let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync( async () => {
      await new Promise<void>((reject) => {
        try {
          const error = new Error('Simulated asynchronous operation error');
          console.error('Caught an exception:', error.message);
          throw error;
        } catch (e) {
          count++;
          reject(e);
        }
      })
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}


@Concurrent
export async function taskFunctionTest1200(): Promise<number> {
  let count = 0;
  let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync(async () => {
      await lock2.lockAsync(async () => {
        try {
          const error = new Error('Simulated asynchronous operation error');
          console.error('Caught an exception:', error.message);
          throw error;
        } catch (e) {
          count++;
        }
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}



@Concurrent
export async function taskFunctionTest1500(): Promise<number> {
  let count = 0;
  let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  let lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync(async () => {
      console.log('Enter shared lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');
        await new Promise<void>((resolve, reject) => {
          count++;
          resolve();
        });
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log('Exit exclusive lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}




@Concurrent
export async function taskFunctionTest1800(): Promise<number> {
  let count = 0;
  let lock1: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
  let lock2: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];

  for (let i = 0; i < 3; i++) {
    const promise = lock1.lockAsync(async () => {
      console.log(`Entered lock1 (SHARED) in iteration ${i}`);
      await lock2.lockAsync(async () => {
        console.log(`Entered lock2 (SHARED) in iteration ${i}`);
        await new Promise<void>((resolve, reject) => {
          count++;
          console.log(`Count incremented to ${count} in iteration ${i}`);
          reject(new Error(`Simulated error in iteration ${i}`));
        }).catch((error:Error) => {
          console.warn(`Caught error in iteration ${i}:`, error.message);
        });
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log(`Exited lock2 (SHARED) in iteration ${i}`);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);

    promises.push(promise);
  }

  await Promise.allSettled(promises);
  return count;
}



@Concurrent
export async function taskFunctionTest2100() {
  const lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  let count = 0;
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync(async () => {
      lock2.lockAsync(async () => {
        try {
          const error = new Error('Simulated asynchronous operation error');
          console.error('Caught an exception:', error.message);
          throw error;
        } catch (e) {
          count++;
        }
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}







@Concurrent
export async function taskFunctionTest2400() {
  const lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  let count = 0;
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync(async () => {
      lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');
        new Promise<void>((resolve, reject) => {
          count++;
          resolve();
        });
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}


@Concurrent
export async function taskFunctionTest2700() {
  const lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  let count = 0;
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync(async () => {
      lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');
        new Promise<void>((resolve, reject) => {
          count++;
          reject();
        });
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}


@Concurrent
export async function taskFunctionTest3000() {
  const lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  let count = 0;
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync(async () => {
      lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');
        let task: taskpool.Task = new taskpool.Task(printArgs2, 1);
        await taskpool.execute(task).then((result) => {
          count++;
        })
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}


@Concurrent
export async function taskFunctionTest3300() {
  const lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  let count = 0;
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync(async () => {
      lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');
        let task: taskpool.Task = new taskpool.Task(printArgs2, 1);
        await taskpool.execute(task).then((result) => {
          count++;
        })
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}


@Concurrent
export async function taskFunctionTest3600() {
  const caseName = 'AsynclockSameTest3600';
  const lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  let count = 0;
  let returnCount = 0
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync(async () => {
      lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');

        console.log('Enter worker');
        let workThread: worker.ThreadWorker;
        workThread = new worker.ThreadWorker('../workers/Worker');
        workThread.onexit = () => {
          console.log('onexit');
        }
        workThread.postMessage(caseName);
        workThread.onmessage = (e: MessageEvents): void => {
          returnCount = e.data;
          count++;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          console.info('main2 returnCount  is  ' + returnCount);
          workThread.terminate();
          console.log('Success execution count:' + count);
          console.info(`${caseName} test end`);
        }
        console.log('Exit worker');

      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}

@Concurrent
export async function taskFunctionTest3900() {
  const caseName = 'AsynclockSameTest3900';
  const lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  let count = 0;
  let returnCount = 0
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync(async () => {
      lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');

        console.log('Enter worker');
        let workThread: worker.ThreadWorker;
        workThread = new worker.ThreadWorker('../workers/Worker');
        workThread.onexit = () => {
          console.log('onexit');
        }
        workThread.postMessage(caseName);
        workThread.onmessage = (e: MessageEvents): void => {
          returnCount = e.data;
          count++;
          console.log('e:' + JSON.stringify(e));
          console.info('main2 thread count is  ' + count);
          console.info('main2 returnCount  is  ' + returnCount);
          workThread.terminate();
          console.log('Success execution count:' + count);
          console.info(`${caseName} test end`);
        }
        console.log('Exit worker');

      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}





@Concurrent
export async function taskFunctionTest4200() {
  const lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  let count = 0;
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync(async () => {
      lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');
        lock3.lockAsync(async () => {
          console.log('Enter exclusive lock lock3');
          let task: taskpool.Task = new taskpool.Task(printArgs2, 1);
          await taskpool.execute(task).then((result) => {
            count++;
          })
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}


@Concurrent
export async function taskFunctionTest4500() {
  const lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  let count = 0;
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync(async () => {
      lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');
        lock3.lockAsync(async () => {
          console.log('Enter exclusive lock lock3');
          new Promise<void>((resolve, reject) => {
            count++;
            resolve();
          });
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}



@Concurrent
export async function taskFunctionTest4700() {
  const lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  let count = 0;
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync(async () => {
      lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');
        lock3.lockAsync(async () => {
          console.log('Enter exclusive lock lock3');
          setTimeout( async () => {
            console.log('Enter exclusive lock lock3');
            count++
          },300);
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}



@Concurrent
export async function taskFunctionTest4900() {
  const caseName = 'AsynclockSameTest4900';
  const lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  let count = 0;
  let returnCount = 0
  for (let i = 0; i < 3; i++) {
    const promise : Promise<void> = lock1.lockAsync(async () => {
      lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');
        lock3.lockAsync(async () => {
          console.log('Enter exclusive lock lock3');
          console.log('Enter worker');
          let workThread: worker.ThreadWorker;
          workThread = new worker.ThreadWorker('../workers/Worker');
          workThread.onexit = () => {
            console.log('onexit');
          }
          workThread.postMessage(caseName);
          workThread.onmessage = (e: MessageEvents): void => {
            returnCount = e.data;
            count++;
            console.log('e:' + JSON.stringify(e));
            console.info('main2 thread count is  ' + count);
            console.info('main2 returnCount  is  ' + returnCount);
            workThread.terminate();
            console.log('Success execution count:' + count);
            console.info(`${caseName} test end`);
          }
          console.log('Exit worker');

        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}


@Concurrent
export function taskFunctionTest5010(args: number): number {
  console.info('printArgs: ' + args);
  taskpool.Task.sendData(args);
  return args;
}


@Concurrent
export async function taskFunctionTest5000(args : number) {
  const caseName = 'AsynclockSameTest5000';
  const lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock3 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  let count = 0;
  lock1.lockAsync(async () => {
    lock2.lockAsync(async () => {
      lock3.lockAsync(async () => {
        let workThread: worker.ThreadWorker;
        workThread = new worker.ThreadWorker('../workers/Worker');
        workThread.postMessage(caseName);
        workThread.onmessage = (): void => {
          count++;
          workThread.terminate();
        }
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  }, ArkTSUtils.locks.AsyncLockMode.SHARED);
  while(count != 1){
    await sleep(300)
  }
  expect(count).assertEqual(1);
  return count
}


@Concurrent
export async function taskFunctionTest5200() {
  const lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  let count = 0;
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      setTimeout(() => {},1000)
      console.log('Enter shared lock lock1');
      lock2.lockAsync(async () => {
        setTimeout(() => {},1000)
        console.log('Enter exclusive lock lock2');
        await new Promise<void>((resolve, reject) => {
          setTimeout(() => {
            count++;
            resolve();
          }, 1000);
        });
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      console.log('Exit exclusive lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise1);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}



@Concurrent
export async function taskFunctionTest5500() {
  const lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const lock2 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  let count = 0;
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      setTimeout(() => {},1000)
      console.log('Enter shared lock lock1');
      lock2.lockAsync(async () => {
        setTimeout(() => {},1000)
        console.log('Enter exclusive lock lock2');
          setTimeout(() => {
            count++;
          }, 1000);
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log('Exit exclusive lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    promises.push(promise1);
  }
  await Promise.all(promises);
  while (count != 3){
    await sleep(300);
  }
  return count
}


@Concurrent
export function taskFunctionAddTest1010(args: number): number {
  console.info('printArgs: ' + args);
  taskpool.Task.sendData(args);
  return args;
}


@Concurrent
export async function taskFunctionAddTest1000(args : number) {
  let lock1 :ArkTSUtils.locks.AsyncLock =  ArkTSUtils.locks.AsyncLock.request('lock_1');
  const promises: Promise<void>[] = [];
  let count = 0;
  const promise1  = lock1.lockAsync(async () => {
    console.log('Enter shared lock lock1');
    new Promise<void>((_, reject) => {
      try {
        const error = new Error('Simulated asynchronous operation error');
        console.error('Caught an exception:', error.message);
        throw error;
      } catch (e) {
        count++;
        reject(e);
      }
    });
  }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  promises.push(promise1);
  await Promise.all(promises);
  while(count != 1){
    await sleep(300);
  }
  console.log('Success execution count:' + count);
  expect(count).assertEqual(1);
  return count;
}









