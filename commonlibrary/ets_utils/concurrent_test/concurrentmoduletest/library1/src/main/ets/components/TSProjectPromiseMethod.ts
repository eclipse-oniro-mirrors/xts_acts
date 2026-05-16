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
};


export const TSpromiseTest1: Promise<string> = new Promise((resolve) => {
  setTimeout(() => resolve('66'), 100);
});

export const TSpromiseTest2: Promise<number> = new Promise((resolve) => {
  setTimeout(() => resolve(66), 100);
});

export const TSpromiseTest3: Promise<boolean> = new Promise((resolve) => {
  setTimeout(() => resolve(true), 100);
});

export const TSpromiseTest4: Promise<bigint> = new Promise((resolve) => {
  setTimeout(() => resolve(66n), 100);
});


interface testObject {
  age: number;
};

export const TSpromiseTest5: Promise<testObject> = new Promise((resolve) => {
  setTimeout(() => resolve({
    age: 30
  }), 100);
});

export const TSpromiseTest6: Promise<testObject> = new Promise((resolve) => {
  setTimeout(() => resolve({
    age: 30
  }), 100);
});

export const TSpromiseTest7: Promise<number[]> = new Promise((resolve) => {
  setTimeout(() => resolve([65, 66, 67]), 100);
});

export const TSpromiseTest8: Promise<() => string> = new Promise((resolve) => {
  setTimeout(() => resolve(() => 'Hello World!'), 100);
});

export const TSpromiseTest9: Promise<void> = new Promise((resolve) => {
  setTimeout(() => resolve(), 100);
});

export const TSpromiseTest10: Promise<null> = new Promise((resolve) => {
  setTimeout(() => resolve(null), 100);
});

export const TSpromiseTest11: Promise<undefined> = new Promise((resolve) => {
  setTimeout(() => resolve(undefined), 100);
});

export const TSpromiseTest12: Promise<never> = new Promise((_, reject) => {
  setTimeout(() => reject(new Error('For test')), 100);
});


class Person {
  name: string = '';
  surname: string = '';

  constructor(n: string, sn: string) {
    this.name = n;
    this.surname = sn;
  };

  fullName(): string {
    return this.name + ' ' + this.surname;
  }
};

export const TSpromiseTest13: Promise<Person> = new Promise((resolve) => {
  setTimeout(() => resolve(
    new Person('John', 'Smith')
  ), 100);
});


class For14TSpromiseTest {
  name: string = '';
  age: number = 0;

  constructor(n: string, age: number) {
    this.name = n;
    this.age = age;
  };

  fullName(): string {
    return this.name;
  };

  getAge(): number {
    return this.age;
  };
};

export const TSpromiseTest14: Promise<number> = new Promise((resolve) => {
  const p = new For14TSpromiseTest('John', 66);
  setTimeout(() => resolve(
    p.getAge()
  ), 100);
});


export const TSpromiseTest16: Promise<number> = new Promise((resolve) => {
  setTimeout(() => resolve(66), 100);
});

export const TSpromiseTest17: Promise<never> = new Promise((_, reject) => {
  setTimeout(() => reject(new Error('For test')), 100);
});

export const TSpromiseTest18: Promise<never> = new Promise((_, reject) => {
  const errorMessage = 'For test';
  setTimeout(() => reject(new Error(errorMessage)), 100);
});

export const TSpromiseTest19: Promise<never> = new Promise((_, reject) => {
  setTimeout(() => reject(new Error('For test')), 100);
});



export function TSpromiseTest24(num: number): Promise<number> {
  const promise1 = new Promise<number>(resolve => setTimeout(() => resolve(num * 2), 100));
  const promise2 = new Promise<number>(resolve => setTimeout(() => resolve(num * 3), 100));
  const promise3 = new Promise<number>((resolve, reject) => setTimeout(() => reject(new Error('For test')), 100));

  return Promise.race([promise1, promise2, promise3]);
};


export function TSpromiseTest25(num: number): Promise<PromiseSettledResult<number>[]> {
  const promise1 = new Promise<number>(resolve => setTimeout(() => resolve(num * 2), 100));
  const promise2 = new Promise<number>(resolve => setTimeout(() => resolve(num * 3), 100));
  const promise3 = new Promise<number>((resolve, reject) => setTimeout(() => reject(new Error('For test')), 100));

  return Promise.allSettled([promise1, promise2, promise3]);
};


export function TSpromiseTest26(num: number): Promise<number> {
  const promise1 = new Promise<number>(resolve => setTimeout(() => resolve(num * 2), 100));
  const promise2 = new Promise<number>(resolve => setTimeout(() => resolve(num * 3), 100));
  const promise3 = new Promise<number>((resolve, reject) => setTimeout(() => reject(new Error('For test')), 100));

  return Promise.any([promise1, promise2, promise3]);
};

export const TSpromiseTest27: Promise<number> = new Promise((resolve) => {
  resolve(1);
})
  .then((value: number) => value + 1)
  .then((value: number) => value + 2)
  .then((value: number) => value + 3)
  .then((value: number) => value + 4)
  .then((value: number) => value + 5);

export const TSpromiseTest28: Promise<number> = new Promise((resolve) => {
  resolve(1);
})
  .then((value: number) => value + 1)
  .then((value: number) => value + 2)
  .then((value: number) => value + 3)
  .catch((error: unknown) => {
    console.error('First catch:', error);
    return 0;
  })
  .catch((error: unknown) => {
    console.error('Second catch:', error);
    return -1;
  });

export const TSpromiseTest29 = new Promise((resolve) => {
  resolve(1);
})
  .then((value: number) => value + 1)
  .then((value: number) => value + 2)
  .catch((error: unknown) => {
    console.log('First catch:', error);
    return 0;
  })
  .catch((error: unknown) => {
    console.log('Second catch:', error);
    return -1;
  })
  .finally(() => {
    console.log('end');
  });