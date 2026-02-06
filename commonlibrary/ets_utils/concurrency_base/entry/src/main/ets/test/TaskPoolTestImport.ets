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
import { taskpoolExecuteChained } from './TaskPoolTestImport2';

export function createUint32Array(size: number): Uint32Array {
  let sab = new SharedArrayBuffer(size * 4);
  return new Uint32Array(sab);
}

@Concurrent
export function indexSetter(data: Uint32Array, index: number): Uint32Array {
  data[index] = index;
  return data;
}

@Concurrent
export async function indexSetterWithTimeout(data: Uint32Array, index: number, millis: number): Promise<Uint32Array> {
  let waitPromise: Promise<Object> = new Promise(f => setTimeout(f, millis));
  await waitPromise;
  data[index] = index;
  return data;
}

@Concurrent
export async function taskpoolExecuteChainedRecursive(data: Uint32Array, index: number, limit: number) {
  // NOTE this is workaround for "Concurrent function should only use import variable or local variable"
  return taskpoolExecuteChained(data, index, limit);
}
