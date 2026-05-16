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
// import { worker } from '@kit.ArkTS';
import { Driver } from '@kit.TestKit';

// import { testUISec, testUISec1 } from './MultipleTask';
import common from '@ohos.app.ability.common';

// @Concurrent
export function test() {
  let s: string[] = []
  s[0].split('')[1].toString()
}


export function test1() {
}

export function test2(): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    resolve('');
  });
}

export async function sleep(time: int): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}


export class Contexts {
  public static contexts: common.Context | null = null;
  public static path: string = '';
}

export class Drivers {
  public static drivers: Driver | null = null;
}


export declare class ArkTools {
  static forceFullGC(): void;
}

export function promiseCase(): Promise<void> {
  const delay: int = 100 as int;
  const p = new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve(undefined);
    }, delay)
  }) .then(() => {  })
    .catch((error: Error) => {
      console.info('promiseCase',error.message)
    });
  return p
}