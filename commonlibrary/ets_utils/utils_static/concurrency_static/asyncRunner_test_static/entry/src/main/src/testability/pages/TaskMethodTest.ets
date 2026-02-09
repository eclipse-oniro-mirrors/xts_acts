/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
// import { MessageEvents, taskpool, worker } from '@kit.ArkTS';
import {
  // AsyncLock,
  AsyncLockTest,
  AsyncLockTest1,
  AsyncLockTest2,
  asyncMethod,
  asyncOperation,
  asyncTask,
  BaseClass,
  // foo1,
  // foo2,
  lock,
  printArgs01,
  printArgs02
} from './SendableTest';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep, test, test1 } from './Utils';

//@Concurrent
export function printArgs(args: number): number {
  let t: number = Date.now();
  while (Date.now() - t < 100) {
    continue;
  }
  if (taskpool.Task.isCanceled()) {
    console.info('task has been canceled after 2s sleep.');
    return args + 1;
  }
  console.info('printArgs: ' + args);
  return args;
}


export function idCancel(task: taskpool.Task) {
  try {
    taskpool.cancel(task);
  } catch (e) {
    let err =e as Error;
    console.error(`taskpool: cancel error code: ${err.code}, info: ${err.message}`);
  }
}


//@Concurrent
export function printArgs1(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

//@Concurrent
export function printArgs2(args: number, delay: number): number {
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
  return args;
}


/**
 * error
 * @param args
 * @returns
 */
//@Concurrent
export function printArgs3(args: number): number {
  console.info('printArgs: ' + args);
  let s: string[] = [];
  if (s[0]) { // 先判断s[0]是否存在
    s[0].split('')[1].toString();
  }else{
    console.log('printArgs3===============error')
  }

  return args;
}

/**
 * error
 * @param args
 * @returns
 */
//@Concurrent
export function printArgs4(args: number, delay: number): number {
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
  let s: string[] = [];
  if (s[0]) { // 先判断s[0]是否存在
    s[0].split('')[1].toString();
  }else{
    console.log('printArgs4===============error')
  }

  return args;
}

//@Concurrent
export function testTransfer(arg1: ArrayBuffer, arg2: ArrayBuffer): number {
  console.info('testTransfer arg1 byteLength: ' + arg1.byteLength);
  console.info('testTransfer arg2 byteLength: ' + arg2.byteLength);
  return 100;
}

//@Concurrent
export function testFunc(arr: Array<BaseClass>, num: number): number {
  let baseInstance1 = arr[0];
  console.info('sendable: str1 is: ' + baseInstance1.str1);
  baseInstance1.SetNum = 100;
  console.info('sendable: num1 is: ' + baseInstance1.GetNum);
  console.info('sendable: isDone1 is: ' + baseInstance1.isDone1);
  // 获取斐波那契数列第num项的结果
  let res: number = baseInstance1.publicFunc(num);
  return res;
}

/**
 * sendData
 * @param args
 * @returns
 */
//@Concurrent
export function sendData1(args: number): number {
  console.info('printArgs: ' + args);
  taskpool.Task.sendData(args);
  return args;
}

/**
 * sendData
 * @param args
 * @returns
 */
//@Concurrent
export function sendData2(args: number, delay: number): number {
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < delay) {
    continue;
  }
  console.info('printArgs: ' + args);
  taskpool.Task.sendData(args);
  return args;
}


//@Concurrent
export async function printArgsLock1() {
  try {
    // 获取锁
    await lock.acquire();
    console.log('Lock is held.');
    console.log('Executing task...');
    console.log('Task completed successfully.');
  } finally {
    // 无论是否发生异常，确保锁被释放
    lock.release();
    console.log('Lock has been released.');
  }
}


//@Concurrent
export async function printArgsLock3() {
  try {
    // 获取锁
    await lock.acquire1().then(() => {
      console.log('Lock is held.');
      console.log('Executing task...');
      if (Math.random() < 1) { // 抛出异常
        throw new Error('Simulated error in task execution.');
      }
      console.log('Task completed successfully.');
    })
    console.log('Task completed successfully.');
  } finally {
    // 无论是否发生异常，确保锁被释放
    lock.release();
    console.log('Lock has been released.');
  }
}

export async function printArgsLock5(): Promise<void> {
  try {

    lock.acquire1();

    console.log('Lock is held.');
    console.log('Executing task...');

    if (Math.random() < 1) {
      throw new Error('Simulated error in task execution.');
    }

    console.log('Task completed successfully.');
  } catch (e) {
    const err = e as Error;
    console.error('Error during task execution:', err.message);

    if (Math.random() < 1) {
      throw new Error('Simulated error in task execution.');
    }
  } finally {
    // 无论是否发生异常，确保锁被释放
    lock.release();
    console.log('Lock has been released.');
  }
}


export async function printArgsLock7(): Promise<void> {
  try {

    lock.acquire1();

    console.log('Lock is held.');
    console.log('Executing task...');
    console.log('Task completed successfully.');
  } catch (e) {
    const err = e as Error;
    console.error('Error during task execution:', err.message);
  } finally {

    lock.release();


    if (Math.random() < 1) {
      let s: string[] = [];
      s[0].split('')[1].toString();
    }
    console.log('Lock has been released.');
  }
}



//@Concurrent
export async function printArgsPromise1() {
  console.log('Executing task...');
  // 模拟一个包含异步操作的任务
  await new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() < 1) { // 抛出异常
        reject(new Error('Simulated error in task execution.'));
      } else {
        resolve(undefined);
      }
    }, 100); // 模拟耗时操作
  });

  console.log('Task completed successfully.');

}


//@Concurrent
export async function printArgsPromise3() {
  await asyncTask()
    .then(() => {
      // 在.then回调中模拟抛出异常
      if (Math.random() < 1) {
        throw new Error('Simulated error in then callback.');
      }
      console.log('Task completed successfully');
    })
}


//@Concurrent
export async function printArgsPromise5(): Promise<void> {
  try {
    await asyncTask();

    if (Math.random() < 1) {
      throw new Error('Simulated error in then callback.');
    }
    console.log('Task completed successfully');
  } catch (e) {
    const err = e as Error;
    console.error('caught error in then callback:', err.message);

    if (Math.random() < 1) {
      throw new Error('Simulated error in then callback.');
    }
  }
}



//@Concurrent
export async function printArgsPromise7(): Promise<void> {
  try {
    await asyncTask();
    console.log('Task completed successfully');
  } catch (e) {
    const err = e as Error;
    console.error('caught error in then callback:', err.message);
  } finally {
    if (Math.random() < 1) {
     console.error('Simulated error condition in finally callback.');

    }
  }
}



//@Concurrent
export async function printArgsSettimeout1() {
  await new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() < 1) { // 这里可以调整条件以模拟不同情况
        console.error('Simulated error in setTimeout callback.');
        reject(new Error('Simulated error in setTimeout callback.'));
      } else {
        console.log('Task completed successfully');
        resolve(undefined);
      }
    }, 100);
  });
}


//@Concurrent
export async function printArgsSettimeout3(): Promise<void> {
  try {
    await asyncOperation();
    console.log('Task completed successfully');
  } catch (error) {
    let err = error as Error;
    console.error('caught error in task execution:', err.message);
    throw new Error('Simulated error in async operation.');
  }
}


//@Concurrent
export async function printArgsWait(a: AsyncLockTest2) {
  await a.setCount(10)
}

//@Concurrent
export async function printArgsWait1(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {
    if (Math.random() < 1) {
      throw new Error('Simulated error in then callback.');
    }
  })
}

//@Concurrent
export async function printArgsWait2(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {
    if (Math.random() < 1) {
      throw new Error('Simulated error in then callback.');
    }
  }).catch(() => {
    if (Math.random() < 1) {
      throw new Error('Simulated error in catch callback.');
    }
  })
}

//@Concurrent
export async function printArgsWait3(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {
  }).finally(() => {
    if (Math.random() < 1) {
      throw new Error('Simulated error in finally callback.');
    }
  })
}



//@Concurrent
export async function printArgsTaskpool(args: number): Promise<number> {
  let task: taskpool.Task = new taskpool.Task(printArgs01, args);
  await taskpool.execute(task);
  return args;
}

//@Concurrent
export async function printArgsTaskpool1(args: number): Promise<number> {
  let task: taskpool.Task = new taskpool.Task(printArgs02, args);
  await taskpool.execute(task).then(() => {
    throw new Error('Simulated error in then execution.');
  })
  return args;
}

//@Concurrent
export async function printArgsTaskpool2(args: number): Promise<number> {
  let task: taskpool.Task = new taskpool.Task(printArgs01, 1);
  await taskpool.execute(task).catch(() => {
    throw new Error('Simulated error in catch execution.');
  })
  return args;
}

//@Concurrent
export async function printArgsTaskpool3(args: number): Promise<number> {
  let task: taskpool.Task = new taskpool.Task(printArgs02, 1);
  await taskpool.execute(task).finally(() => {
    throw new Error('Simulated error in finally execution.');
  })
  return args;
}

/**
 * 延时
 * @param args
 * @returns
 */
//@Concurrent
export function printArgs5(arg: number): number {
  console.info('printArgs: ' + arg);

  // 延时2s
  let t: number = Date.now();
  while (Date.now() - t < 2000) {
    continue;
  }

  if (taskpool.Task.isCanceled()) {
    console.info('==== task has been canceled after 2s sleep.');
    return arg + 1;
  }

  return arg;
}

/**
 * setTimeout-error
 * @param args
 * @returns
 */
//@Concurrent
export async function printArgs9(args: number): Promise<number> {
  console.info('printArgs: ' + args);
  await new Promise<Error>((_, re) => {
    setTimeout(() => {
      re(new Error('Simulated error in setTimeout callback.'))
    }, 100)
  });
  return args;
}

/**
 * task-二级
 * @param args
 * @returns
 */
//@Concurrent
export async function printArgs11(args: number) : Promise<number>{
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(test);
  await taskpool.execute(task);
  return args;
}

/**
 * task-二级
 * @param args
 * @returns
 */
//@Concurrent
export async function printArgs12(args: number) : Promise<number> {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(test1);
  await taskpool.execute(task).then(() => {
    let s: string[] = [];
    s[0].split('')[1].toString();
  })
  return args;
}

/**
 * task-二级
 * @param args
 * @returns
 */
//@Concurrent
export async function printArgs13(args: number) : Promise<number> {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(test1);
  await taskpool.execute(task).then(() => {
    let s: string[] = [];
    s[0].split('')[1].toString();
  }).catch(() => {
    let s: string[] = [];
    s[0].split('')[1].toString();
  })
  return args;
}

/**
 * task-二级
 * @param args
 * @returns
 */
//@Concurrent
export async function printArgs14(args: number) : Promise<number> {
  console.info('printArgs: ' + args);
  let task: taskpool.Task = new taskpool.Task(test1);
  await taskpool.execute(task).finally(() => {
    let s: string[] = [];
    s[0].split('')[1].toString();
  })
  return args;
}

//@Concurrent
export async function asyncLock(a: AsyncLockTest) {
  await a.setCount(10)
}

//@Concurrent
export async function asyncLock1(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {
    let s: string[] = [];
    s[0].split('')[1].toString();
  })
}

//@Concurrent
export async function asyncLock2(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {
    let s: string[] = [];
    s[0].split('')[1].toString();
  }).catch(() => {
    let s: string[] = [];
    s[0].split('')[1].toString();
  })
}

//@Concurrent
export async function asyncLock3(a: AsyncLockTest1) {
  await a.setCount(10).then(() => {

  }).finally(() => {
    let s: string[] = [];
    s[0].split('')[1].toString();
  })
}



//@Concurrent
export function printArgs1007(args: number): number {
  console.info('printArgs: ' + args);
  new Promise<number>((resolve: (v: number) => void, reject: (e: Error) => void) => {
    setTimeout(() => {
      const randomNumber: number = Math.random();
      if (randomNumber > 0.5) {
        resolve(randomNumber);
      } else {
        reject(new Error('Random number1 is too small'));
      }
    }, 1000);
  }).then((result: number) => {
    console.info(`Random number1 is ${result}`);
  }).catch((error: Error) => {
    console.error(error.message);
  });
  return args;
}

//@Concurrent
export function printArgs1008(args: number): number {
  console.info('printArgs: ' + args);
  new Promise<number>((resolve: (v: number) => void, reject: (e: Error) => void) => {
    setTimeout(() => {
      const randomNumber: number = Math.random();
      if (randomNumber > 0.5) {
        resolve(randomNumber);
      } else {
        reject(new Error('Random number2 is too small'));
      }
    }, 500);
  }).then((result: number) => {
    console.info(`Random number2 is ${result}`);
  }).catch((error: Error) => {
    console.error(error.message);
  });
  return args;
}

//@Concurrent
export async function cancelTask(task: taskpool.Task): Promise<string> {
  return await new Promise<string>((resolve) => {
    taskpool.cancel(task)
    resolve('cancel task')
  });
}

//@Concurrent
export function printArgs1011(args: number): number {
  console.info('printArgs: ' + args);
  setTimeout(() => {
    console.info('set time out1')
  }, 500)
  return args;
}

//@Concurrent
export function printArgs1012(args: number): number {
  console.info('printArgs: ' + args);
  setTimeout(() => {
    console.info('set time out2')
  }, 500)
  return args;
}

//@Concurrent
export function printArgs1013(args: number): number {
  console.info('printArgs: ' + args);
  asyncMethod(1);
  return args;
}

//@Concurrent
export function printArgs1014(args: number): number {
  console.info('printArgs: ' + args);
  asyncMethod(2);
  return args;
}

