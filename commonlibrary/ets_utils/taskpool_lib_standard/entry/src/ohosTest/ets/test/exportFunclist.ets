/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { taskpool } from '@kit.ArkTS'

export function StrCat(value1: string, value2: string): string {
  "use concurrent"
  return value1 + value2;
}

export class A {
  a: number;
  b: number;
  constructor() {
    this.a = 1;
    this.b = 2;
  }
}

export class B {
  a: number;
  b: number;
  constructor() {
    this.a = 3;
    this.b = 4;
  }
}

export function printStrArgs(args: string): string {
  "use concurrent"
  return args;
}

export function printArgs(args: number): number {
  "use concurrent"
  return args;
}

export function fun(args: string): string {
  "use concurrent"
  let t = Date.now();
  while (Date.now() - t < 3000) {
    continue;
  }
  if (taskpool.Task.isCanceled()) {
    args = 'canceled';
    return args;
  }
  return 'finish';
}

export function cancelById(taskId: number) {
  "use concurrent"
  taskpool.cancel(taskId);
}

export function multiplyFunc(args: number): number {
  return args * 2;
}

export function getLongString(): string {
  let res = "";
  let size = 100 * 1024;
  for (let i = 0; i < size; i++) {
    res += "a";
  }
  return res;
}

@Concurrent
export function getTaskResult(taskId: number):boolean {
  let task: taskpool.Task | undefined = taskpool.getTask(taskId);
  if (task == undefined) {
    return false;
  }
  return true;
}

export function asyncSleep(time: number) {
  let p: Promise<void> = new Promise<void>((resolve: Function, reject: Function) => {
    setTimeout(() => {
      resolve(1)
    }, time)
  })
  return p
}