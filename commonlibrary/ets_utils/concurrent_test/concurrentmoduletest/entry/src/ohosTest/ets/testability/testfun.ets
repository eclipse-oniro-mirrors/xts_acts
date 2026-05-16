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
  test1,
  test10,
  test16,
  test18,
  test19,
  test20,
  test25,
  test26,
  test28,
  test30,
  test31,
  test34,
  test7,
} from 'library1/src/main/ets/components/ConcurrencyModularImportAndExportTest';
import { sleep } from '../test/UlitsTest.test';

export async function testfunc1(name?: string) {
  await test18();
}
;

export async function testfunc2(name?: string) {
  await test19();
}
;

export async function testfunc3(name?: string) {
  let p = await test20();
  throw p;
}
;

@Concurrent
export async function testfunc4(name?: string) {
  let p = await test34();
  return p;
}
;

@Concurrent
export async function testfunc5(name?: string) {
  let q = await test16();
  let p = q();
  return p;
}
;

@Concurrent
export async function testfunc6(name?: string) {
  let p = 0;
  try {
    await test25();
  } catch (e) {
    p = 42
  }
  return p;
}
;


@Concurrent
export async function testfunc7(name?: string) {
  let p = 0
  setTimeout(async () => {
    p = await test34();
  }, 300)
  while (p != 24) {
    await sleep(300)
  }
  return p;
}
;


@Concurrent
export async function testfunc8(name?: string) {
  let p = '';
  setTimeout(async () => {
    let q = await test16();
    p = q();

  }, 300)
  while (p != 'Hello, World!') {
    await sleep(300)
  }
  return p;
}
;


@Concurrent
export async function testfunc9(name?: string) {
  let p = 0;
  setTimeout(async () => {
    try {
      await test25();
    } catch (e) {
      p = 42
    }
  }, 300)
  while (p != 42) {
    await sleep(300)
  }
  return p;
}
;


@Concurrent
export async function testfunc10(name?: string) {
  let p = 0;
  setTimeout(async () => {
    try {
      await test7(null);
    } catch (e) {
      p = 42
    }
  }, 300)
  while (p != 42) {
    await sleep(300)
  }
  return p;
}
;


type parafunc11 = () => Promise<number>;

@Concurrent
export async function testfunc11(operation: parafunc11) {
  let p = await operation();
  while (p != 42) {
    await sleep(300)
  }
  return p;
}
;


type parafunc12 = () => Promise<number>;

@Concurrent
export async function testfunc12(operation: parafunc12) {
  let p = await operation();
  while (p != 42) {
    await sleep(300)
  }
  return p;
}
;


type parafunc13 = () => Promise<bigint>;

@Concurrent
export async function testfunc13(operation: parafunc13) {
  let p = await operation();
  while (p != 42n) {
    await sleep(300)
  }
  return p;
}
;


type parafunc14 = () => Promise<void>;

@Concurrent
export async function testfunc14(operation: parafunc14) {
  let p = 0;
  try {
    await operation()
  } catch (e) {
    p = 42
  }
  while (p != 42) {
    await sleep(300)
  }
  return p;
}
;


export class ClassForTest1 {
  private test: () => Promise<number>;

  constructor() {
    this.test = test1;
  }
}

export class ClassForTest2 {
  private test: () => Promise<number>;

  constructor() {
    this.test = test10;
  }
}

export class ClassForTest3 {
  private test: () => Promise<number>;

  constructor() {
    this.test = test28;
  }
}

export class ClassForTest4 {
  private test: () => Promise<number>;

  constructor() {
    this.test = test31;
  }
}







