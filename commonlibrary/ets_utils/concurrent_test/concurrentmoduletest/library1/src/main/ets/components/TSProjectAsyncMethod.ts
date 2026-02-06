/*
* Copyright (C) 2025 HiHope Open Source Organization.
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
export async function sleep(time: number): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}

export async function exportTest1(): Promise<number> {
  const num = 66;
  return num;
}
;

export let exportTest2 = async (): Promise<number> => {
  const num = 66;
  return num;
};

export async function exportTest3(): Promise<void> {
  throw new Error('For test');
}
;

export async function exportTest4(): Promise<void> {
  throw new Error('For test');
}
;

export async function exportTest5(param: null): Promise<void> {
  throw new Error('For test');
}
;

export async function exportTest6(): Promise<string> {
  const num = '66';
  return num;
}
;

export async function exportTest7(name?: string): Promise<string> {
  const num = '66';
  return num;
}
;

export async function exportTest8(name?: string): Promise<number> {
  const num = 66;
  return num;
}
;

export async function exportTest9(name?: string): Promise<boolean> {
  const num = true;
  return num;
}
;

export async function exportTest10(name?: string): Promise<bigint> {
  const num: bigint = 66n;
  return num;
}
;


interface testObject {
  age: number;
};

export async function exportTest11(name?: string): Promise<testObject> {
  return {
    age: 30
  };
}
;

export async function exportTest12(name?: string): Promise<testObject> {
  return {
    age: 30
  };
}
;

export async function exportTest13(name?: string): Promise<number[]> {
  const arr = [65, 66, 67];
  return arr;
}
;

export async function exportTest14(name?: string): Promise<() => string> {
  return () => 'Hello World!';
}
;

export async function exportTest15(name?: string): Promise<void> {
  throw new Error('For test');
  return;
}
;

export async function exportTest16(name?: string): Promise<null> {
  throw new Error('For test');
  return null;
}
;

export async function exportTest17(name?: string): Promise<undefined> {
  throw new Error('For test');
  return undefined;
}
;

export async function exportTest18(name?: string): Promise<Error> {
  return new Error('For test');
}
;


class Person {
  name: string = '';
  surname: string = '';

  constructor(n: string, sn: string) {
    this.name = n;
    this.surname = sn;
  }

  fullName(): string {
    return this.name + ' ' + this.surname;
  }
};

export async function exportTest19(name?: string): Promise<Person> {
  let p = new Person('John', 'Smith');
  return p;
}
;

export async function exportTest20(): Promise<never> {
  throw new Error('For test');
}
;

async function for21exportTest(): Promise<number> {
  console.log('For test');
  return 66;
};

export async function exportTest21(): Promise<number> {
  const result = for21exportTest();
  return result;
}
;

async function for22exportTest(): Promise<number> {
  console.log('For test');
  return 66;
};

export async function exportTest22(): Promise<number> {
  const result = await for22exportTest();
  return result;
}
;

export async function exportTest23(): Promise<number> {
  let num = 0;
  setTimeout(() => {
    num = 66;
  }, 1000);
  while (num !== 66) {
    await sleep(300);
  }
  return num;
}
;

export async function exportTest24(): Promise<number> {
  let num = 0;
  await new Promise<void>((resolve, reject) => {
    num = 66;
    resolve();
  });
  return num;
}
;

class For25ExportTest {
  name: string = '';
  age: number = 0;

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
};

export async function exportTest25(): Promise<number> {
  let p = new For25ExportTest('John', 66);
  let result = p.getAge();
  return result;
}
;