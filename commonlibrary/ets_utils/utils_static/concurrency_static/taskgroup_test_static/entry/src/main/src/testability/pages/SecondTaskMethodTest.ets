/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Count1, Count2, Count3, Count4,
  AsyncLocks
} from './DataFlg';


export async function foo1(asynclock: AsyncLocks) {
  asynclock.setCount(10)
  let num1: Number = await asynclock.getCount();
  console.info('AsyncLock getCount is', num1)
}

export async function foo2(asynclock: AsyncLocks) {
  asynclock.setCount(10)
  let num1: Number = await asynclock.getCount();
  console.info('AsyncLock getCount is', num1)
}

export function cancelTask(taskGroup: taskpool.TaskGroup): boolean {
  console.log(` Cancelling task: ${taskGroup.name}`);
  taskpool.cancel(taskGroup);
  let isCanceled: boolean = true;
  return isCanceled;
}

export async function asyncMethod(index: Number): Promise<Number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      console.info(`async test sucessfully: ${index}`);
      resolve(1);
    }, 200);
  });
}



