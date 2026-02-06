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
  TSpromiseTest2,
  TSpromiseTest4,
  TSpromiseTest8,
  TSpromiseTest12,
  TSpromiseTest17,
  TSpromiseTest18,
  TSpromiseTest19,
  TSpromiseTest24,
} from 'library1/src/main/ets/components/TSProjectPromiseMethod';

import { sleep } from '../test/UlitsTest.test';

export async function TSpromiseTestFunc2(name?: string) {
  await TSpromiseTest18;
}
;

export async function TSpromiseTestFunc3(name?: string) {
  await TSpromiseTest19;
}
;

@Concurrent
export async function TSpromiseTestFunc4(name?: string) {
  let p = await TSpromiseTest24(1);
  return p;
}
;

@Concurrent
export async function TSpromiseTestFunc5(name?: string) {
  let p = await TSpromiseTest4;
  return p;
}
;

@Concurrent
export async function TSpromiseTestFunc6(name?: string) {
  let p = await TSpromiseTest8;
  let q = p();
  return q;
}
;

@Concurrent
export async function TSpromiseTestFunc7(name?: string) {
  let p = 0;
  setTimeout(async () => {
    try {
      await TSpromiseTest17;
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

@Concurrent
export async function TSpromiseTestFunc8(name?: string) {
  let p = 0;
  setTimeout(async () => {
    try {
      await TSpromiseTest12;
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

@Concurrent
export async function TSpromiseTestFunc9(name?: string) {
  let p: number = 0;
  setTimeout(async () => {
    p = await TSpromiseTest2;
  }, 300)
  while (p != 66) {
    await sleep(300)
  }
  return p;
}
;