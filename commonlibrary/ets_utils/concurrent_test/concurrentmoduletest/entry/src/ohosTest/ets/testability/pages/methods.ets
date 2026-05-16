import { sleep } from '../../test/UlitsTest.test';
import {
  createFaultyPromise,
  createFaultyPromise2,
  numberPromise,
  objectPromise,
  stringPromise
} from 'library1/src/main/ets/components/ConcurrencyModularImportPromiseTest';
import { ArkTSUtils, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import { numberfun, Person } from 'library1/src/main/ets/components/ConcurrencyModularImportsendableclasstest';
import { lock } from 'library1/src/main/ets/components/ConcurrencyModularImportAsyncLockTest';

export async function handleFaultyPromise(): Promise<string> {
  try {
    const result = await createFaultyPromise();
    return result;
  } catch (error) {
    throw new Error('wrong!');
  }
}

export async function handleFaultyPromise2(): Promise<string> {
  try {
    const result = await createFaultyPromise2();
    return result;
  } catch (error) {
    throw new Error('wrong!');
  }
}

export async function WorkerPromise3(): Promise<number> {
  try {
    let count: number = 0;
    let workThread: worker.ThreadWorker;
    workThread = new worker.ThreadWorker('../../../workers/ImportWorker');
    workThread.onexit = () => {
      console.log('onexit');
    }
    workThread.postMessage(3);
    workThread.onmessage = (e: MessageEvents): void => {
      count = e.data;
      workThread.terminate();
    }
    while (count != 42) {
      await sleep(300)
    }
    return count;
  } catch (e) {
    let error = e as Error;
    throw new Error('wrong!');
  }
}

@Concurrent
export async function printArgs1(args: number): Promise<string> {
  console.info('printArgs: ' + args);
  const result = await stringPromise;
  return result;
}

@Concurrent
export async function printArgs2(args: number): Promise<object> {
  console.info('printArgs: ' + args);
  const result = await objectPromise;
  return result;
}


@Concurrent
export async function printArgs3(args: number): Promise<number> {
  setTimeout(async () => {
    await stringPromise;
  }, 300)
  return args;
}
;

@Concurrent
export async function printArgs4(args: number):Promise<number> {
  setTimeout(async () => {
    await numberPromise;
  }, 300)
  return args;
}
;

@Concurrent
export async function printArgs5(args: number):Promise<number> {
  let count: number = 0;
  let workThread: worker.ThreadWorker;
  workThread = new worker.ThreadWorker('../../../workers/ImportWorker');
  workThread.onexit = () => {
    console.log('onexit');
  }
  workThread.postMessage(3);
  workThread.onmessage = (e: MessageEvents): void => {
    count = e.data;
    workThread.terminate();
  }
  while (count != 42) {
    await sleep(300)
  }
  return count;
}
;

@Concurrent
export async function person() {
  let p = new Person('John', 22);
  return p;
}
;

@Concurrent
export async function testfun() {
  return numberfun;
}
;

@Concurrent
export async function printArgsshared() {
  setTimeout(async () => {
    await lock.lockAsync(async () => {
      console.info('shared0');
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
  }, 100)

}


@Concurrent
function task2(): void {
  console.info('Task is executing');
}

let task1: taskpool.Task = new taskpool.Task(task2);

export const tasklock2 = async (): Promise<boolean> => {
  return new Promise<boolean>((resolve) => {
    lock.lockAsync(async () => {
      await taskpool.execute(task1);
      resolve(true);
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  });
};

let context: string = '1'

export const timelock2 = async (timeoutMs: number): Promise<boolean> => {
  return lock.lockAsync(async () => {
    console.log('Context data:', context);
    await new Promise<void>((resolve) => {
      setTimeout(() => {
        console.log(`Timeout after ${timeoutMs}ms with context:`, context);
        resolve();
      }, timeoutMs);
    });
    return true;
  }, ArkTSUtils.locks.AsyncLockMode.SHARED);
};