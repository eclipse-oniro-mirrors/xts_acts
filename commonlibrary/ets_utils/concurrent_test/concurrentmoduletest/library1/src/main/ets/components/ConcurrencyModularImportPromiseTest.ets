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
export const stringPromise: Promise<string> = new Promise((resolve) => {
  setTimeout(() => resolve('Hello from string Promise'), 100);
});

export const numberPromise: Promise<number> = new Promise((resolve) => {
  setTimeout(() => resolve(42), 100);
});

interface Interface_1 {
  name: string;
  age: number;
}

export const objectPromise: Promise<Interface_1> = new Promise((resolve) => {
  setTimeout(() => resolve({ name: 'Alice', age: 30 }), 100);
});

export const arrayPromise: Promise<string[]> = new Promise((resolve) => {
  setTimeout(() => resolve(['apple', 'banana', 'cherry']), 150);
});

export const undefinedPromise: Promise<undefined> = new Promise((resolve) => {
  setTimeout(() => resolve(undefined), 30);
});

export const functionPromise: Promise<() => number> = new Promise((resolve) => {
  setTimeout(() => resolve(() => 42), 120);
});

export const nullPromise: Promise<null> = new Promise((resolve) => {
  setTimeout(() => resolve(null), 50);
});

export const errorPromise: Promise<never> = new Promise((_, reject) => {
  setTimeout(() => reject(new Error('Standard error occurred')), 100);
});

//resolve中使用上下文中的class对象/sendableClass对象/class(引用sendableClass)对象

export class SendableClass {
  public id: number;
  public name: string;
  public tags: string[];

  constructor(
    id: number,
    name: string,
    tags: string[] = []
  ) {
    this.id = id;
    this.name = name;
    this.tags = tags;
  }

  addTag(tag: string): void {
    this.tags.push(tag);
  }

  serialize(): string {
    return JSON.stringify({
      id: this.id,
      name: this.name,
      tags: this.tags
    });
  }
}

export const existingSendablePromise = new Promise<SendableClass>((resolve) => {
  setTimeout(() => {
    const instance = new SendableClass(1, 'ExistingInstance', ['initial']);
    resolve(instance);
  }, 100);
});

//resolve中抛出异常
export function createProblematicPromise(): Promise<string> {
  return new Promise((resolve, _) => {
    resolve(
      (() => {
        throw new Error('Error thrown during resolution');
      })()
    );
  });
}

//resolve中使用setTimeout
export function createDelayedPromise(value: number): Promise<number> {
  return new Promise((resolve) => {
    setTimeout(() => {
      console.log(`Resolved with value: ${value}`);
      resolve(value);
    }, 200);
  });
}

export function createFaultyPromise(): Promise<string> {
  return new Promise((_, reject) => {
    setTimeout(() => {
      try {
        throw new Error('Something went wrong!');
      } catch (error) {
        reject(error);
      }
    }, 100);
  });
}

//reject中使用上下文变量
export function createFaultyPromise2(): Promise<string> {
  return new Promise((_, reject) => {
    const errorMessage = 'Something went wrong!';
    setTimeout(() => {
      reject(new Error(errorMessage));
    }, 100);
  });
}

//reject中使用setTimeout
export function createDelayedRejectPromise(): Promise<string> {
  return new Promise((_, reject) => {
    setTimeout(() => {
      setTimeout(() => {
        reject(new Error('Something went wrong!'));
      }, 100);
    }, 200);
  });
}

//导出Promise.all中使用setTimeout
export function createPromiseAllWithContext(values: number[]): Promise<number[]> {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      const promises = values.map((value) => createDelayedPromise(value));
      Promise.all(promises).then((result) => resolve(result))
        .catch((error: Error) => reject(error))
        .finally(() => {
          console.info('end');
        })
    }, 200);
  });
}


export async function fetchData(input: string): Promise<string> {
  return 'a';
}

@Sendable
export class SendableClass2 {
  private value: string;

  constructor(value: string) {
    this.value = value;
  }

  getValue(): string {
    return this.value;
  }

  setValue(value: string): void {
    this.value = value;
  }
}

@Sendable
export function Sendablefun(num: number) {
  return num
}
;
