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

import { testUISec, testUISec1 } from './MultipleTask';

// export class WorkThread {
//   public workerStageModel = new worker.ThreadWorker('./workers/WorkerTaskGroup.ets');
// }

export function test(): void {
  let s: string[] = []
  s[0].split('')[1].toString()
}

export function test1(): void {
}

export function test2(): Promise<string> {
  return new Promise<string>((re, je): void => {
    re('')
  })
}

export async function testUI(): Promise<string> {
  return new Promise<string>((re, je) => {
    await testUISec()

    re('')
  })
}

export async function testUI1(): Promise<string> {
  return new Promise<string>((re, je) => {
    await testUISec1()

    re('')
  })
}

export class Contexts {
  // static contexts: Context
  // static path: string = '';
}

export function sleep(time: int): Promise<number> {
  return new Promise<number>((re, je): void => {
    setTimeout(() => {
      re(1)
    }, time)
  })
}

export declare class ArkTools {
  static forceFullGC(): void;
}