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
import { taskpool } from '@kit.ArkTS';
import { printArgs1001, printArgs1002, } from '../../testability/pages/TaskMethodTest';
import { Count1, Count2, Count3, Count4, Worker1, Worker2, AsyncLock } from '../pages/DataFlg';

@Concurrent
export function printArgs1003(args: number): number {
  console.info('printArgs: ' + args);
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  taskGroup.addTask(printArgs1001, 1);
  return args;
}

@Concurrent
export function printArgs1004(args: number): number {
  console.info('printArgs: ' + args);
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  taskGroup.addTask(printArgs1002, 1);
  return args;
}

@Concurrent
export async function foo1(asynclock: AsyncLock) {
  asynclock.setCount(10)
  let num1: number = await asynclock.getCount();
  console.info('AsyncLock getCount is', num1)
}

@Concurrent
export async function foo2(asynclock: AsyncLock) {
  asynclock.setCount(10)
  let num1: number = await asynclock.getCount();
  console.info('AsyncLock getCount is', num1)
}

@Concurrent
export function cancelTask(taskGroup: taskpool.TaskGroup): boolean {
  console.log(` Cancelling task: ${taskGroup.name}`);
  taskpool.cancel(taskGroup);
  let isCanceled: boolean = true;
  return isCanceled;
}

@Concurrent
export async function asyncMethod(index: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      console.info(`async test sucessfully: ${index}`);
      resolve();
    }, 200);
  });
}



