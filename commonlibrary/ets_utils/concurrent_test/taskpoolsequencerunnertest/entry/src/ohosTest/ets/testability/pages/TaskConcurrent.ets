/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { taskpool } from '@kit.ArkTS';
import { postError, postRight } from './OtherUtils';
import { BusinessError } from '@kit.BasicServicesKit';
import { asyncTask, asyncTaskAwait, asyncTaskCatch } from './Ways';

@Concurrent
export function printArgs1(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}


/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
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
@Concurrent
export function printArgs10(args: number): number {
  console.info('printArgs: ' + args);
  // WorkThread.workerStageModel.postMessage('worker线程')
  return args;
}


@Concurrent
export async function asyncLock(a: AsyncLockTest) {
  await a.setCount(10)
}

@Concurrent
export async function asyncLock1(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
}

@Concurrent
export async function asyncLock2(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  }).catch(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
}

@Concurrent
export async function asyncLock3(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {

  }).finally(() => {
    let s: string[] = []
    s[0].split('')[1].toString()
  })
}

@Concurrent
export async function printArgsPromise1() {
  console.log('Executing task...');
  
  await new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() < 1) { 
        reject(new Error('error'));
      } else {
        resolve();
      }
    }, 100); 
  });
  console.log('Task completed successfully.');
}


@Concurrent
export async function printArgsPromise2() {
  console.log('Executing task...');
  
  await new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() < 1) { 
        reject(new Error('2error'));
      } else {
        resolve();
      }
    }, 100); 
  });
  console.log('Task completed successfully.');
}

@Concurrent
export async function printArgsSetTime1() {
  console.log('Executing task...');
  
  await new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() < 1) { 
        reject(new Error('setTime error'));
      } else {
        resolve();
      }
    }, 100); 
  });
  console.log('Task completed successfully.');
}


@Concurrent
export async function printArgsSetTime2() {
  console.log('Executing task...');
  
  await new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() < 1) { 
        reject(new Error('setTime error2'));
      } else {
        resolve();
      }
    }, 100); 
  });
  console.log('Task completed successfully.');
}

@Concurrent
export async function printArgsPromise3() {
  await asyncTask()
    .then(() => {
      throw Error('then error')
    })
}

@Concurrent
export async function printArgsPromise4() {
  await asyncTask()
    .then(() => {
      throw Error('then error2')
    })

}

@Concurrent
export async function printArgsPromise5() {
  await asyncTaskCatch()
    .catch((error: BusinessError) => {
      throw Error('catch error')
    })

}

@Concurrent
export async function printArgsPromise6() {
  await asyncTaskCatch()
    .catch((error: BusinessError) => {
      throw Error('catch error2')
    })
}

@Concurrent
export async function printArgsPromise7() {
  await asyncTask()

    .finally(() => {
      throw Error('finally error')
    })
}

@Concurrent
export async function printArgsPromise8() {
  await asyncTask()

    .finally(() => {
      throw Error('finally error2')
    })
}

@Concurrent
export async function asyncWays1() {
  console.log('Executing task...');
  
  await new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() < 1) { 
        reject(new Error('asyncWays1 error'));
      } else {
        resolve();
      }
    }, 100); 
  });
  console.log('Task completed successfully.');
}

@Concurrent
export async function asyncWays2() {
  console.log('Executing task...');
  
  await new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() < 1) { 
        reject(new Error('asyncWays2 error'));
      } else {
        resolve();
      }
    }, 100); 
  });
  console.log('Task completed successfully.');
}


@Concurrent
export async function printArgsWaitA(a: AsyncLockTest) {
  await a.setCount(10)
}

@Concurrent
export async function printArgsWaitB(a: AsyncLockTest1) {
  await a.setCount(10)
}


@Concurrent
export async function printArgsWaitC(a: AsyncLockTest2) {
  await a.setCount(10).then(() => {
    if (Math.random() < 1) {
      throw new Error('await error')
    }
  })
}

@Concurrent
export async function printArgsWaitD(a: AsyncLockTest2) {
  await a.setCount(10).then(() => {
    if (Math.random() < 1) {
      throw new Error('await error')
    }
  })
}

@Concurrent
export async function printArgsWaitE(a: AsyncLockTest2) {
  await a.setCount(10).then(() => {
    if (Math.random() < 1) {
      throw new Error('await error')
    }
  }).catch(() => {
    if (Math.random() < 1) {
      throw new Error('await error')
    }
  })
}

@Concurrent
export async function printArgsWaitF(a: AsyncLockTest2) {
  await a.setCount(10).then(() => {
    if (Math.random() < 1) {
      throw new Error('await error')
    }
  }).catch(() => {
    if (Math.random() < 1) {
      throw new Error('await error')
    }
  })
}

@Concurrent
export async function printArgsWaitG(a: AsyncLockTest2) {
  await a.setCount(10).then(() => {


  }).catch(() => {

  }).finally(() => {
    if (Math.random() < 1) {
      throw new Error('await error')
    }
  })
}

@Concurrent
export async function printArgsWaitH(a: AsyncLockTest2) {
  await a.setCount(10).then(() => {

  }).catch(() => {

  }).finally(() => {
    if (Math.random() < 1) {
      throw new Error('await error')
    }
  })
}


@Concurrent
export async function printArgsNested(args: number) {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(postError);
  await taskpool.execute(task)
  return args;
}

@Concurrent
export async function printArgsNested2(args: number) {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(postRight);
  await taskpool.execute(task)
    .then(() => {
      throw Error('nested error')
    })
  return args;
}

@Concurrent
export async function printArgsNested3(args: number) {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(postRight);
  await taskpool.execute(task)
    .then(() => {
      throw Error('nested error')
    })
    .catch(() => {
      throw Error('nested error')
    })
  return args;
}

@Concurrent
export async function printArgsNested4(args: number) {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(postRight);
  await taskpool.execute(task)
    .then(() => {
      throw Error('nested error')
    })
    .catch(() => {
      throw Error('nested error')
    })
    .finally(() => {
      throw Error('nested error')
    })
  return args;
}