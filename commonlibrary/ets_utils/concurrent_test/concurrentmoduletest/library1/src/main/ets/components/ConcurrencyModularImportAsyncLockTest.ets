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

export let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock;

export let lock1: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_1');

let lock2: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

export const workerlock = async (): Promise<boolean> => {
  return new Promise<boolean>((resolve) => {
    lock2.lockAsync(async () => {
      let flag = false;
      const workThread = new worker.ThreadWorker('../components/workers/ImportWorker');
      workThread.onexit = () => {
        console.log('onexit');
      };
      workThread.postMessage(1);
      workThread.onmessage = (e: MessageEvents): void => {
        console.info(e.data);
        flag = true;
        resolve(flag);
        workThread.terminate();
      };
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
  });
};


@Concurrent
function task(): void {
  console.info('Task is executing');
}

let task1: taskpool.Task = new taskpool.Task(task);
let lock3: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

export const tasklock = async (): Promise<boolean> => {
  return new Promise<boolean>((resolve) => {
    lock3.lockAsync(async () => {
      await taskpool.execute(task1);
      resolve(true);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
  });
};

let context: string = '1'
let lock4: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

export const timelock = async (timeoutMs: number): Promise<boolean> => {
  return lock4.lockAsync(async () => {
    console.log('Context data:', context);
    await new Promise<void>((resolve) => {
      setTimeout(() => {
        console.log(`Timeout after ${timeoutMs}ms with context:`, context);
        resolve();
      }, timeoutMs);
    });
    return true;
  }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
};

let lock5: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_5');;

export const timelockshared = async (timeoutMs: number): Promise<boolean> => {
  return lock5.lockAsync(async () => {
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


let lock6: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_6');

export const tasklockrequest = async (): Promise<boolean> => {
  return new Promise<boolean>((resolve) => {
    lock6.lockAsync(async () => {
      await taskpool.execute(task1);
      resolve(true);
    }, ArkTSUtils.locks.AsyncLockMode.SHARED);
  });
};

let lock7: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_7');

export const tasklockexclusive = async (): Promise<boolean> => {
  return new Promise<boolean>((resolve) => {
    lock7.lockAsync(async () => {
      await taskpool.execute(task1);
      resolve(true);
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  });
};

let lock8: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('lock_8');

export const workerlockexclusive = async (): Promise<boolean> => {
  return new Promise<boolean>((resolve) => {
    lock8.lockAsync(async () => {
      let flag = false;
      const workThread = new worker.ThreadWorker('../components//workers/ImportWorker');
      workThread.onexit = () => {
        console.log('onexit');
      };
      workThread.postMessage(1);
      workThread.onmessage = (e: MessageEvents): void => {
        console.info(e.data);
        flag = true;
        resolve(flag);
        workThread.terminate();
      };
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  });
};
