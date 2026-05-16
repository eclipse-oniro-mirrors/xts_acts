/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { AsyncLockTest, AsyncLockTest1, AsyncLockTest2, BaseClass, DeriveClass } from './SendableWays';
import { postError, postRight } from './OtherUtils';
import { BusinessError } from '@ohos.base';
import { asyncTask, asyncTaskAwait, asyncTaskCatch } from './Ways';

export function printArgs1(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}


/**
 * error
 * @param args
 * @returns
 */
export function printArgs4(args: number): number {
  console.info('printArgs: ' + args);
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}


/**
 * sendData
 * @param args
 * @returns
 */
export function printArgs7(args: number): number {
  console.info('printArgs: ' + args);
  taskpool.Task.sendData(args);
  return args;
}

/**
 * worker线程
 * @param args
 * @returns
 */
export function printArgs10(args: number): number {
  console.info('printArgs: ' + args);
  // WorkThread.workerStageModel.postMessage('worker线程')
  return args;
}


export async function asyncLock(a: AsyncLockTest): Promise<void> {
  await a.setCount(10)
}

export async function asyncLock1(a: AsyncLockTest1): Promise<void> {
  await a.setCount(10).then((): void => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
}

export async function asyncLock2(a: AsyncLockTest1): Promise<void> {
  try {
    await a.setCount(10).then((): void => {
      let s: string[] = []
      s[0].split('')[1].toString()
    })
  } catch(e) {
    e = e as BusinessError;
    let s: string[] = []
    s[0].split('')[1].toString()
  }
}

export async function asyncLock3(a: AsyncLockTest1): Promise<void> {
  await a.setCount(10).then((): void => {

  }).finally((): void => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
}

export async function printArgsPromise1(): Promise<void> {
  console.log('Executing task...');

  await new Promise<number>((resolve, reject): void => {
    setTimeout((): void => {
      if (Math.random() < 1) {
        reject(new Error('error'));
      } else {
        resolve(1);
      }
    }, 100);
  });
  console.log('Task completed successfully.');
}


export async function printArgsPromise2(): Promise<void> {
  console.log('Executing task...');

  await new Promise<number>((resolve, reject): void => {
    setTimeout((): void => {
      if (Math.random() < 1) {
        reject(new Error('2error'));
      } else {
        resolve(1);
      }
    }, 100);
  });
  console.log('Task completed successfully.');
}

export async function printArgsSetTime1(): Promise<void> {
  console.log('Executing task...');

  await new Promise<number>((resolve, reject): void => {
    setTimeout((): void => {
      if (Math.random() < 1) {
        reject(new Error('setTime error'));
      } else {
        resolve(1);
      }
    }, 100);
  });
  console.log('Task completed successfully.');
}


export async function printArgsSetTime2(): Promise<void> {
  console.log('Executing task...');

  await new Promise<number>((resolve, reject): void => {
    setTimeout((): void => {
      if (Math.random() < 1) {
        reject(new Error('setTime error2'));
      } else {
        resolve(1);
      }
    }, 100);
  });
  console.log('Task completed successfully.');
}

export async function printArgsPromise3(): Promise<void> {
  await asyncTask()
    .then((): void => {
      throw Error('then error')
    })
}

export async function printArgsPromise4(): Promise<void> {
  await asyncTask()
    .then((): void => {
      throw Error('then error2')
    })
}

export async function printArgsPromise5(): Promise<void> {
  try {
    await asyncTaskCatch()
  } catch(error) {
      error = error as BusinessError;
      throw Error('catch error')
  }
}

export async function printArgsPromise6(): Promise<void> {
  try {
    await asyncTaskCatch()
  } catch(error) {
    error = error as BusinessError;
    throw Error('catch error2')
  }
}

export async function printArgsPromise7(): Promise<void> {
  await asyncTask()

    .finally((): void => {
      throw Error('finally error')
    })
}

export async function printArgsPromise8(): Promise<void> {
  await asyncTask()

    .finally((): void => {
      throw Error('finally error2')
    })
}

export async function asyncWays1(): Promise<void> {
  console.log('Executing task...');

  await new Promise<number>((resolve, reject): void => {
    setTimeout((): void => {
      if (Math.random() < 1) {
        reject(new Error('asyncWays1 error'));
      } else {
        resolve(1);
      }
    }, 100);
  });
  console.log('Task completed successfully.');
}

export async function asyncWays2(): Promise<void> {
  console.log('Executing task...');

  await new Promise<number>((resolve, reject): void => {
    setTimeout((): void => {
      if (Math.random() < 1) {
        reject(new Error('asyncWays2 error'));
      } else {
        resolve(1);
      }
    }, 100);
  });
  console.log('Task completed successfully.');
}


export async function printArgsWaitA(a: AsyncLockTest): Promise<void> {
  await a.setCount(10)
}

export async function printArgsWaitB(a: AsyncLockTest1): Promise<void> {
  await a.setCount(10)
}


export async function printArgsWaitC(a: AsyncLockTest2): Promise<void> {
  await a.setCount(10).then((): void => {
    if (Math.random() < 1) {
      throw new Error('await error')
    }
  })
}

export async function printArgsWaitD(a: AsyncLockTest2): Promise<void> {
  await a.setCount(10).then((): void => {
    if (Math.random() < 1) {
      throw new Error('await error')
    }
  })
}

export async function printArgsWaitE(a: AsyncLockTest2): Promise<void> {
  try {
    await a.setCount(10).then((): void => {
      if (Math.random() < 1) {
        throw new Error('await error')
      }
    })
  } catch(e) {
    e = e as BusinessError;
    if (Math.random() < 1) {
      throw new Error('await error')
    }
  }
}

export async function printArgsWaitF(a: AsyncLockTest2): Promise<void> {
  try {
    await a.setCount(10).then((): void => {
      if (Math.random() < 1) {
        throw new Error('await error')
      }
    })
  } catch(e) {
    e = e as BusinessError;
    if (Math.random() < 1) {
      throw new Error('await error')
    }
  }
}

export async function printArgsWaitG(a: AsyncLockTest2): Promise<void> {
  try {
    await a.setCount(10).then((): void => {
    })
  } catch(e) {
e = e as BusinessError;

  } finally {
  }
  if (Math.random() < 1) {
    throw new Error('await error')
  }
}

export async function printArgsWaitH(a: AsyncLockTest2): Promise<void> {
  try {
    await a.setCount(10).then((): void => {
    })
  } catch(e) {
  e = e as BusinessError;
  } finally {
  }
  if (Math.random() < 1) {
    throw new Error('await error')
  }
}


export async function printArgsNested(args: number): Promise<number> {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(postError);
  await taskpool.execute(task)
  return args;
}

export async function printArgsNested2(args: number): Promise<number> {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(postRight);
  await taskpool.execute(task)
    .then((): void => {
      throw Error('nested error')
    })
  return args;
}

export async function printArgsNested3(args: number): Promise<number> {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(postRight);
  await taskpool.execute(task)
    .then((): void => {
      throw Error('nested error')
    })
    .catch(():void => {
      throw Error('nested error')
    })
  return args;
}

export async function printArgsNested4(args: number): Promise<number> {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(postRight);
  await taskpool.execute(task)
    .then((): void => {
      throw Error('nested error')
    })
    .catch(():void => {
      throw Error('nested error')
    })
    .finally((): void => {
      throw Error('nested error')
    })
  return args;
}