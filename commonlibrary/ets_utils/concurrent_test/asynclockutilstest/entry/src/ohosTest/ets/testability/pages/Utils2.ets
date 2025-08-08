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
import { ArkTSUtils, MessageEvents, taskpool, worker } from '@kit.ArkTS';

@Concurrent
export function delay1(args: number): number {
  let t: number = Date.now();
  while ((Date.now() - t) < 1000) {
    continue;
  }
  return args;
}

@Concurrent
export function TaskFun1(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

@Concurrent
export async function TaskFun2(args: number): Promise<number> {
  let count:number = 0;
  count = args
  let LOCK1 = new ArkTSUtils.locks.AsyncLock();
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise1 = LOCK1.lockAsync(async () => {
      console.log('SHARED');
      try {
        throw new Error('Error occurred in asynchronous operation');
      } catch (error) {
        count++;
        console.error('Caught an exception:', error.message);
      }
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun4(args: number): Promise<number> {
  let count:number = 0;
  count = args
  let lock1 = new ArkTSUtils.locks.AsyncLock();
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter shared lock lock1');
      await new Promise<void>((resolve) => {
        console.log('Asynchronous operation completed');
        resolve();
        count++;
      });
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit shared lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun7(args: number): Promise<number> {
  let count:number = 0;
  count = args
  let lock1 = new ArkTSUtils.locks.AsyncLock();
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter shared lock lock1');
      await new Promise<void>((_,reject) => {
        console.log('Asynchronous operation completed');
        reject();
        count++;
      });
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit shared lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun10(args: number): Promise<number> {
  let count:number = 0;
  count = args
  let lock1 = new ArkTSUtils.locks.AsyncLock();
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter shared lock lock1');
      await new Promise<void>((_, reject) => {
        try {
          count++;
          const error = new Error('Simulated asynchronous operation error');
          console.error('Caught an exception:', error.message);
          throw error;
        } catch (e) {
          reject(e);
        }
      });
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit shared lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun12(args: number): Promise<number> {
  let count:number = 0;
  count = args
  const lock1 = new ArkTSUtils.locks.AsyncLock();
  const lock2 = new ArkTSUtils.locks.AsyncLock();
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter EXCLUSIVE lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter EXCLUSIVE lock lock2');
        await new Promise<void>((_, reject) => {
          try {
            count++;
            const error = new Error('Simulated asynchronous operation error');
            console.error('Caught an exception:', error.message);
            throw error;
          } catch (e) {
            reject(e);
          }
        });
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      console.log('Exit EXCLUSIVE lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun15(args: number): Promise<number> {
  let count:number = 0;
  count = args
  const lock1 = new ArkTSUtils.locks.AsyncLock();
  const lock2 = new ArkTSUtils.locks.AsyncLock();
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter EXCLUSIVE lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter EXCLUSIVE lock lock2');
        await new Promise<void>((resolve) => {
          count++;
          resolve();
        });
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      console.log('Exit EXCLUSIVE lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun16(args: number): Promise<number> {
  let count:number = 0;
  count = args
  const lock1 = new ArkTSUtils.locks.AsyncLock();
  const lock2 = new ArkTSUtils.locks.AsyncLock();
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter EXCLUSIVE lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter EXCLUSIVE lock lock2');
        await new Promise<void>((resolve) => {
          count++;
          resolve();
        });
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      console.log('Exit EXCLUSIVE lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun18(args: number): Promise<number> {
  let count:number = 0;
  count = args
  const lock1 = new ArkTSUtils.locks.AsyncLock();
  const lock2 = new ArkTSUtils.locks.AsyncLock();
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter EXCLUSIVE lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');
        await new Promise<void>((_, reject) => {
          count++;
          reject();
        });
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      console.log('Exit EXCLUSIVE lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun21(args: number): Promise<number> {
  let count:number = 0;
  count = args
  const lock1 = new ArkTSUtils.locks.AsyncLock();
  const lock2 = new ArkTSUtils.locks.AsyncLock();
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter EXCLUSIVE lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter SHARED lock lock2');
        await new Promise<void>((_, reject) => {
          setTimeout(() => {
            try {
              count++;
              const error = new Error('Simulated asynchronous operation error');
              console.error('Caught an exception:', error.message);
              throw error;
            } catch (e) {
              reject(e);
            }
          }, 200);
        });
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log('Exit SHARED lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun22(args: number): Promise<number> {
  let count:number = 0;
  count = args
  const lock1 = new ArkTSUtils.locks.AsyncLock();
  const lock2 = new ArkTSUtils.locks.AsyncLock();
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter shared lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter exclusive lock lock2');
        await new Promise<void>((_, reject) => {
          setTimeout(() => {
            try {
              count++;
              const error = new Error('Simulated asynchronous operation error');
              console.error('Caught an exception:', error.message);
              throw error;
            } catch (e) {
              reject(e);
            }
          }, 200);
        });
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log('Exit SHARED lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun24(args: number): Promise<number> {
  let count:number = 0;
  count = args
  const lock1 = new ArkTSUtils.locks.AsyncLock();
  const lock2 = new ArkTSUtils.locks.AsyncLock();
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter EXCLUSIVE lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter SHARED lock lock2');
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            count++;
            resolve();
          }, 200);
        });
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log('Exit SHARED lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun27(args: number): Promise<number> {
  let count:number = 0;
  count = args
  const lock1 = new ArkTSUtils.locks.AsyncLock();
  const lock2 = new ArkTSUtils.locks.AsyncLock();
  const promises: Promise<void>[] = [];
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter EXCLUSIVE lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter SHARED lock lock2');
        await new Promise<void>((_, reject) => {
          setTimeout(() => {
            count++;
            reject();
          }, 200);
        });
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log('Exit SHARED lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun30(args: number): Promise<number> {
  let count = 0;
  count = args;
  const promises: Promise<void>[] = [];
  const lock1 = new ArkTSUtils.locks.AsyncLock();
  const lock2 = new ArkTSUtils.locks.AsyncLock();
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter EXCLUSIVE lock lock1');
      await lock2.lockAsync(() => {
        console.log('Enter EXCLUSIVE lock lock2');
        count++;
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      console.log('Exit EXCLUSIVE lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun33(args: number): Promise<number> {
  let count = 0;
  count = args;
  const promises: Promise<void>[] = [];
  const lock1 = new ArkTSUtils.locks.AsyncLock();
  const lock2 = new ArkTSUtils.locks.AsyncLock();
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter EXCLUSIVE lock lock1');
      await lock2.lockAsync(() => {
        console.log('Enter SHARED lock lock2');
        count++;
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log('Exit SHARED lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun36(args: number): Promise<number> {
  let count = 0;
  count = args;
  const promises: Promise<void>[] = [];
  const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
  const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
  const lock3 = ArkTSUtils.locks.AsyncLock.request('lock3');
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter EXCLUSIVE lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter EXCLUSIVE lock lock2');
        await lock3.lockAsync(() => {
          console.log('Enter EXCLUSIVE lock lock3');
          count++;
          console.log('Exit EXCLUSIVE lock lock3');
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        console.log('Exit EXCLUSIVE lock lock2');
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      console.log('Exit EXCLUSIVE lock lock1');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun39(args: number): Promise<number> {
  let count = 0;
  count = args;
  const promises: Promise<void>[] = [];
  const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
  const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
  const lock3 = ArkTSUtils.locks.AsyncLock.request('lock3');
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter EXCLUSIVE lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter shared lock lock2');
        await lock3.lockAsync(async () => {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              console.log('Asynchronous operation completed');
              resolve();
              count++;
            }, 200);
          });
          console.log('Exit EXCLUSIVE lock lock3');
        }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
        console.log('Exit shared lock lock2');
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log('Exit EXCLUSIVE lock lock1');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function ConcurrentFunc1(num: number): Promise<number> {
  const promises: Promise<void>[] = [];
  let count: number = 0;
  count = num;
  const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
  const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
  const lock3 = ArkTSUtils.locks.AsyncLock.request('lock3');
  const promise = lock1.lockAsync(async () => {
    console.log('Enter EXCLUSIVE lock lock1');
    await lock2.lockAsync(async () => {
      console.log('Enter SHARED lock lock2');
      await lock3.lockAsync(async () => {
        console.log('Enter EXCLUSIVE lock lock3');
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            console.log('Asynchronous operation completed');
            count++;
            resolve();
          }, 1000);
        });
        console.log('Exit EXCLUSIVE lock lock3');
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      console.log('Exit SHARED lock lock2');
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
    console.log('Exit EXCLUSIVE lock lock1');
  }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  promises.push(promise);
  await Promise.all(promises).catch(()=>{})
  taskpool.Task.sendData(count);
  return count;
}

@Concurrent
export async function TaskFun42(args: number): Promise<number> {
  let count = 0;
  count = args;
  const promises: Promise<void>[] = [];
  const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
  const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
  const lock3 = ArkTSUtils.locks.AsyncLock.request('lock3');
  for (let i = 0; i < 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter EXCLUSIVE lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter EXCLUSIVE lock lock2');
        await lock3.lockAsync(async () => {
          setTimeout(() => {
            console.log('Asynchronous operation completed');
            count++;
          }, 200);
          console.log('Exit shared lock lock3');
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        console.log('Exit EXCLUSIVE lock lock2');
      }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
      console.log('Exit EXCLUSIVE lock lock1');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun44(args: number): Promise<number> {
  const caseName = 'TaskpoolUtilsAsynclockDifferentTest4400';
  let count = 0;
  count = args;
  const promises: Promise<void>[] = [];
  const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
  const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
  const lock3 = ArkTSUtils.locks.AsyncLock.request('lock3');
  for (let i = 0; i < 10; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('Enter EXCLUSIVE lock lock1');
      await lock2.lockAsync(async () => {
        console.log('Enter SHARED lock lock2');
        await lock3.lockAsync(async () => {
          let workThread: worker.ThreadWorker;
          workThread = new worker.ThreadWorker('../workers/Worker2');
          workThread.postMessage(caseName);
          workThread.onmessage = (e: MessageEvents): void => {
            count = e.data;
            console.log('e:' + JSON.stringify(e));
            console.info('main2 thread count is  ' + count);
            workThread.terminate();
          }
          console.log('Exit SHARED lock lock3');
        }, ArkTSUtils.locks.AsyncLockMode.SHARED);
        console.log('Exit SHARED lock lock2');
      }, ArkTSUtils.locks.AsyncLockMode.SHARED);
      console.log('Exit EXCLUSIVE lock lock1');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    console.log('Exit EXCLUSIVE lock lock1');
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun46(args: number): Promise<number> {
  let count = 0;
  count = args;
  const promises: Promise<void>[] = [];
  const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
  const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
  const options1 = new ArkTSUtils.locks.AsyncLockOptions<void>();
  options1.timeout = 1000;
  const options2 = new ArkTSUtils.locks.AsyncLockOptions<void>();
  options2.timeout = 1000;
  for (let i = 0; i <= 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('enter EXCLUSIVE lock1');
      try {
        await lock2.lockAsync(async () => {
          console.log('enter SHARED lock2');
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve();
            }, 100);
          });
          console.log('Exit SHARED lock');
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options2);
      } catch (e) {
        count++;
        console.log(`Promise execution completed in ${count} second`);
      }
      console.log('Exit EXCLUSIVE lock');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options1);
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}

@Concurrent
export async function TaskFun49(args: number): Promise<number> {
  let count = 0;
  count = args;
  const promises: Promise<void>[] = [];
  const lock1 = ArkTSUtils.locks.AsyncLock.request('lock1');
  const lock2 = ArkTSUtils.locks.AsyncLock.request('lock2');
  const options1 = new ArkTSUtils.locks.AsyncLockOptions<void>();
  options1.timeout = 1000;
  const options2 = new ArkTSUtils.locks.AsyncLockOptions<void>();
  options2.timeout = 1000;
  for (let i = 0; i <= 3; i++) {
    const promise1 = lock1.lockAsync(async () => {
      console.log('enter SHARE lock1');
      try {
        await lock2.lockAsync(async () => {
          console.log('enter EXCLUSIVE lock2');
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve();
            }, 100);
          });
          console.log('Exit SHARED lock');
        }, ArkTSUtils.locks.AsyncLockMode.SHARED, options2);
      } catch (e) {
        count++;
        console.log(`Promise execution completed in ${count} second`);
      }
      console.log('Exit EXCLUSIVE lock');
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options1);
    promises.push(promise1);
  }
  await Promise.all(promises).catch(()=>{})
  return count;
}
