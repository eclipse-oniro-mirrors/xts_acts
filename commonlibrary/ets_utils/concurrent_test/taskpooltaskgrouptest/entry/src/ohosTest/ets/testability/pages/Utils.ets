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

import { worker } from '@kit.ArkTS';
import { Driver } from '@kit.TestKit';
import { testUISec, testUISec1 } from './MultipleTask';

export class WorkThread {
  workerStageModel = new worker.ThreadWorker('./workers/WorkerTaskGroup.ets');
}

@Concurrent
export function test() {
  let s: string[] = []
  s[0].split('')[1].toString()
}

@Concurrent
export function test1() {
}

export function test2(): Promise<string> {
  return new Promise((re, je) => {
    re('')
  })
}


export function testUI(): Promise<string> {
  return new Promise(async (re, je) => {
    await testUISec()

    re('')
  })
}


export function testUI1(): Promise<string> {
  return new Promise(async (re, je) => {
    await testUISec1()

    re('')
  })
}

export class Contexts {
  static contexts: Context
  static path: string
}

export class Drivers {
  static drivers: Driver
}

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export declare class ArkTools {
  static forceFullGC(): void;
}

export function promiseCase(): Promise<void> {
  let p = new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, 100)
  }).then(undefined, (error: Error) => {
  })
  return p
}