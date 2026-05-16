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
import { ArkTSUtils, HashMap, MessageEvents, taskpool, worker } from '@kit.ArkTS';
// import { add } from 'sharelibrary';
import { sleep, printArgs2 } from './Ulits';

export async function test1() {
  const count = 42;
  return count;
}
;

export let test2 = async () => {
  const count = 42;
  return count;
}

@Concurrent
export async function test3() {
  const count = 42;
  return count;
}
;

@Sendable
export async function test4() {
  const count = 42;
  return count;
}
;


export async function test5() {
  throw new Error('For test');
}
;

export async function test6() {
  throw new Error('For test');
}
;

export async function test7(param: null) {
  throw new Error('For test');
}
;

export async function test8() {
  const count = '42';
  return count;
}
;

export async function test9(name?: string) {
  const count = '42';
  return count;
}
;

export async function test10(name?: string) {
  const count = 42;
  return count;
}
;

export async function test11(name?: string) {
  const count = true;
  return count;
}
;

export async function test12(name?: string) {
  const count: bigint = 42n;
  return count;
}
;


interface testObject {
  age: number;
}

export async function test13(name?: string): Promise<testObject> {
  return {
    age: 30
  };
}

export async function test14(name?: string): Promise<testObject> {
  return {
    age: 30
  };
}

export async function test15(name?: string) {
  const arr = [41, 42, 43]
  return arr;
}

export async function test16(name?: string): Promise<() => string> {
  return () => 'Hello, World!';
}

export async function test17(name?: string) {
  throw new Error('For test');
  return;
}
;

export async function test18(name?: string) {
  throw new Error('For test');
  return null;
}
;

export async function test19(name?: string) {
  throw new Error('For test');
  return undefined;
}
;

export async function test20(name?: string) {
  return new Error('For test');
}
;


class Person {
  private name: string = '';
  private surname: string = '';

  constructor(n: string, sn: string) {
    this.name = n;
    this.surname = sn;
  }

  fullName(): string {
    return this.name + ' ' + this.surname;
  }
}

export async function test21(name?: string) {
  let p = new Person('John', 'Smith');
  return p;
}
;


@Sendable
class Person1 {
  private name: string = '';
  private surname: string = '';

  constructor(n: string, sn: string) {
    this.name = n;
    this.surname = sn;
  }

  fullName(): string {
    return this.name + ' ' + this.surname;
  }
}

export async function test22(name?: string) {
  let p = new Person1('John', 'Smith');
  return p;
}
;


@Sendable
function for23test(name?: string) {
  return 42;
};


export async function test23(name?: string) {
  return for23test;
}
;

class Person2 {
  private name: string = '';
  private surname: string = '';

  constructor(n: string, sn: string) {
    this.name = n;
    this.surname = sn;
  }

  fullName(): string {
    return this.name + ' ' + this.surname;
  }

  test() {
    return new Person1('John1', 'Smith1');
  }
}

export async function test24(name?: string) {
  let p = new Person2('John2', 'Smith2');
  return p;
}
;


export async function test25() {
  throw new Error('For test');
}
;

@Concurrent
function for26test() {
  console.log('for test');
  return 42;
};


export async function test26() {
  let task: taskpool.Task = new taskpool.Task(for26test);
  const result = await taskpool.execute(task);
  return result;
}
;


async function for27test() {
  console.log('for test');
  return 42;
};

export async function test27() {
  const result = for27test();
  return result;
}
;

async function for28test() {
  console.log('for test');
  return 42;
};

export async function test28() {
  const result = await for28test();
  return result;
}
;

export async function test29() {
  const caseName = 'ConcurrencyModularImportAndExportTest2900';
  let returnCount = 0;
  let workThread: worker.ThreadWorker;
  workThread = new worker.ThreadWorker('../components/workers/Worker');
  workThread.onexit = () => {
    console.log('onexit');
  }
  workThread.postMessage(caseName);
  workThread.onmessage = (e: MessageEvents): void => {
    returnCount = e.data;
    console.info(`${caseName} test end`);
  }
  console.log('Exit worker');
  while (returnCount != 42) {
    await sleep(300);
  }
  return returnCount;
}
;

export async function test30() {
  let count = 0;
  setTimeout(() => {
    count = 42;
  }, 1000);
  while (count != 42) {
    await sleep(300);
  }
  return count;
}
;

export async function test31() {
  let count = 0;
  await new Promise<void>((resolve, reject) => {
    count = 42;
    resolve();
  });
  return count;
}
;

class For32Test {
  private name: string = '';
  private age: number = 0;

  constructor(n: string, age: number) {
    this.name = n;
    this.age = age;
  }

  fullName(): string {
    return this.name;
  }

  getAge(): number {
    return this.age;
  }
}

export async function test32() {
  let p = new For32Test('John', 24);
  let result = p.getAge();
  return result;
}
;


@Sendable
class For33test {
  private name: string = '';
  private age: number = 0;

  constructor(n: string, age: number) {
    this.name = n;
    this.age = age;
  }

  fullName(): string {
    return this.name;
  }

  getAge(): number {
    return this.age;
  }
}

export async function test33() {
  let p = new For33test('John', 24);
  let result = p.getAge();
  return result;
}
;


class For34Test {
  private name: string = '';
  private age: number = 0;

  constructor(n: string, age: number) {
    this.name = n;
    this.age = age;
  }

  fullName(): string {
    return this.name;
  }

  getAge(): number {
    new For33test('John', 42)
    return this.age;
  }
}

export async function test34() {
  let p = new For34Test('John', 24);
  let result = p.getAge();
  return result;
}
;
