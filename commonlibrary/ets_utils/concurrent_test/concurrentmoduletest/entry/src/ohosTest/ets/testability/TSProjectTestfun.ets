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
  exportTest4,
  exportTest5,
  exportTest10,
  exportTest15,
  exportTest16,
  exportTest17,
  exportTest20,
  exportTest21,
  exportTest25,
} from 'library1/src/main/ets/components/TSProjectAsyncMethod';

import { sleep } from '../test/UlitsTest.test';

export async function testfunction1(name?: string) {
  await exportTest15();
}
;

export async function testfunction2(name?: string) {
  await exportTest16();
}
;

export async function testfunction3(name?: string) {
  await exportTest17();
}
;

@Concurrent
export async function testfunction4(name?: string) {
  let p = await exportTest25();
  return p;
}
;

@Concurrent
export async function testfunction5(name?: string) {
  let p = 0;
  try {
    await exportTest5(null);
  } catch (e) {
    p = 66;
  }
  return p;
}
;

@Concurrent
export async function testfunction6(name?: string) {
  let p = await exportTest10();
  return p;
}
;

@Concurrent
export async function testfunction7(name?: string) {
  let p = 0
  setTimeout(async () => {
    p = await exportTest21();
  }, 300)
  while (p != 66) {
    await sleep(300)
  }
  return p;
}
;

@Concurrent
export async function testfunction8(name?: string) {
  let p = 0;
  setTimeout(async () => {
    try {
      await exportTest4();
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
export async function testfunction9(name?: string) {
  let p = 0;
  setTimeout(async () => {
    try {
      await exportTest20();
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