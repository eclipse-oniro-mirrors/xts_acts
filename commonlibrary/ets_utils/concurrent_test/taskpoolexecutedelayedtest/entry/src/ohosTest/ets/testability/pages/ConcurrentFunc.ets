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

import { ArkTSUtils, MessageEvents, taskpool, worker } from '@kit.ArkTS';

@Concurrent
export function normalTask(args: string): void {
  console.log(`Task ${args} executed`);
}

@Concurrent
export function normalTask2(args: string) {
  console.log(`Task ${args} executed`);
  taskpool.Task.sendData(args);
  return args
}

@Concurrent
export function errorTask(args: string): void {
  console.log(`errorTask Task ${args} executed`);
  throw new Error(`Error in task ${args}`)
}

@Concurrent
export function asyncErrorTask(args: string) {
  let func = async (): Promise<void> => {
    console.log(`asyncErrorTask Task ${args} executed`);
    throw new Error(`Error in task ${args}`)
  }
  return func()
}

@Concurrent
export async function asyncLockNormalTask(lockName: string) {
  let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
  return await lock.lockAsync<void>(() => {
    console.log(`asyncLockNormalTask Task ${lockName} executed`);
  })
}

@Concurrent
export async function asyncLockErrorTask(lockName: string) {
  let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request(lockName);
  return await lock.lockAsync<void>(() => {
    console.log(`asyncLockErrorTask Task ${lockName} executed`);
    throw new Error(`Error in task ${lockName}`)
  })
}

@Concurrent
export async function promiseNormalTask(args: string) {
  return await new Promise<void>((resolve, reject) => {
    console.log(`promiseNormalTask Task ${args} executed`);
    resolve()
  })
}

@Concurrent
export async function promiseErrorTask(args: string) {
  return await new Promise<void>((resolve, reject) => {
    console.log(`promiseErrorTask Task ${args} executed`);
    throw new Error(`Error in task ${args}`)
  })
}

@Concurrent
export async function setTimeoutErrorTask(args: string) {
  console.log(`setTimeoutErrorTask Task ${args} executed`);
  setTimeout(() => {
    throw new Error(`Error in task ${args}`);
  }, 100);
}
