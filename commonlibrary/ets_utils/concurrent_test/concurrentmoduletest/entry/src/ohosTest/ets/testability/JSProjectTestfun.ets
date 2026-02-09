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
  JSasyncTest4,
  JSasyncTest7,
  JSasyncTest8,
  JSasyncTest11,
  JSasyncTest16,
  JSasyncTest17,
  JSasyncTest21,
  JSasyncTest24,
  JSasyncTest25,
} from 'library1/src/main/ets/components/JSProjectAsyncMethod';
import { sleep } from '../test/UlitsTest.test';

export async function JSasyncTestFunc1(name?: string) {
  await JSasyncTest16();
}
;

export async function JSasyncTestFunc2(name?: string) {
  await JSasyncTest17();
}
;

export async function JSasyncTestFunc3(name?: string) {
  await JSasyncTest4();
}
;

@Concurrent
export async function JSasyncTestFunc4(name?: string) {
  let p: number = await JSasyncTest24();
  return p;
}
;

@Concurrent
export async function JSasyncTestFunc5(name?: string) {
  let p: bigint = await JSasyncTest11();
  return p;
}
;

@Concurrent
export async function JSasyncTestFunc6(name?: string) {
  let p: string = await JSasyncTest7();
  return p;
}
;

@Concurrent
export async function JSasyncTestFunc7(name?: string) {
  let p = '';
  setTimeout(async () => {
    p = await JSasyncTest8();
  }, 300)
  while (p != '66') {
    await sleep(300)
  }
  return p;
}
;

@Concurrent
export async function JSasyncTestFunc8(name?: string) {
  let p = 0;
  setTimeout(async () => {
    try {
      await JSasyncTest21();
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
export async function JSasyncTestFunc9(name?: string) {
  let p = 0;
  setTimeout(async () => {
    p = await JSasyncTest25();
  }, 300)
  while (p != 66) {
    await sleep(300)
  }
  return p;
}
;