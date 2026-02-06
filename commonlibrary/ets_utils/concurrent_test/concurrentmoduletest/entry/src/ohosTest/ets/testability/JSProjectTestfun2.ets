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
import {
  JSpromiseTest3,
  JSpromiseTest4,
  JSpromiseTest7,
  JSpromiseTest6,
  JSpromiseTest8,
  JSpromiseTest10,
  JSpromiseTest11,
  JSpromiseTest12,
  JSpromiseTest16,
  JSpromiseTest17,
  JSpromiseTest18,
  JSpromiseTest19,
  JSpromiseTest24,
  JSpromiseTest25,
  JSpromiseTest27,
} from 'library1/src/main/ets/components/JSProjectPromiseMethod';
import { sleep } from '../test/UlitsTest.test';

export async function JSpromiseTestFunc1(name?: string) {
  await JSpromiseTest18();
}
;

export async function JSpromiseTestFunc2(name?: string) {
  await JSpromiseTest19();
}
;

export async function JSpromiseTestFunc3(name?: string) {
  await JSpromiseTest17();
}
;

@Concurrent
export async function JSpromiseTestFunc4(name?: string) {
  let p: () => string = await JSpromiseTest8;
  let q: string = p()
  return q;
}
;

@Concurrent
export async function JSpromiseTestFunc5(name?: string) {
  let p: null = await JSpromiseTest10;
  return p;
}
;

@Concurrent
export async function JSpromiseTestFunc6(name?: string) {
  let p: boolean = await JSpromiseTest3;
  return p;
}
;

@Concurrent
export async function JSpromiseTestFunc7(name?: string) {
  let p = 0n;
  setTimeout(async () => {
    p = await JSpromiseTest4;
  }, 300)
  while (p != 66n) {
    await sleep(300)
  }
  return p;
}
;

@Concurrent
export async function JSpromiseTestFunc8(name?: string) {
  let p = 0;
  setTimeout(async () => {
    p = await JSpromiseTest27;
  }, 300)
  while (p != 16) {
    await sleep(300)
  }
  return p;
}
;

@Concurrent
export async function JSpromiseTestFunc9(name?: string) {
  let p = 0;
  setTimeout(async () => {
    try {
      await JSpromiseTest17();
    } catch (e) {
      p = 66;
    }
  }, 300)
  while (p != 66) {
    await sleep(300)
  }
  return p;
}
;