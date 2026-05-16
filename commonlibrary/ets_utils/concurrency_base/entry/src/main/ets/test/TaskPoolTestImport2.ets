/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import taskpool from '@ohos.taskpool'
import { indexSetter, taskpoolExecuteChainedRecursive } from './TaskPoolTestImport';

@Concurrent
export async function taskpoolExecuteChained(data: Uint32Array, index: number, limit: number): Promise<Uint32Array> {
  let task: taskpool.Task = new taskpool.Task(indexSetter, data, index);
  let promise: Promise<Object> = taskpool.execute(task) as Promise<Object>;
  if (index < limit + 1) {
    await taskpoolExecuteChainedRecursive(data, index + 1, limit)
  }
  let ret: Uint32Array = await (promise) as Uint32Array;
  return ret;
}
