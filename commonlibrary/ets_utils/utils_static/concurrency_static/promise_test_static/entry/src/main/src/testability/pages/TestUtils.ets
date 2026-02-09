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

export interface TestObject {
  name: string;
  value: number;
}

export async function sleep(time: int): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}


interface CustomIteratorResult<T> {
  value: T;
  done: boolean;
}


interface  CustomIterator<T> {
  next(): CustomIteratorResult<T>;
}


export class StringIterator {
  private errorMessage: string;

  constructor(errorMessage: string) {
    this.errorMessage = errorMessage;
  }

  next(): IteratorResult<string> {
    throw new Error(this.errorMessage);
  }
}

export class ThrowingIterable {
  private errorMessage: string;

  constructor(errorMessage: string) {
    this.errorMessage = errorMessage;
  }

}

export class ArrayItemIterator<T> {
  private items: Array<T>;
  private index: int = 0;

  constructor(items: Array<T>) {
    this.items = items;
  }

  next(): IteratorResult<T> {
    if (this.index < this.items.length) {
      return {
        value: this.items[this.index++],
        done: false
      };
    } else {
      return {
        value: this.items.length > 0 ? this.items[0] : undefined,
        done: true
      };
    }
  }
}


export class CustomIterableArray<T> {
  private items: Array<T>;

  constructor(items: Array<T>) {
    this.items = items;
  }


  // [Symbol.iterator](): Iterator<T> {
  //   return new ArrayItemIterator<T>(this.items);
  // }
}
//
// export function createIterableArray<T>(items: Array<T>): Iterable<T> {
//   return new CustomIterableArray<T>(items);
// }


// export interface PromiseFulfilledResult<T> {
//     status: 'fulfilled';
//     value: T;
// }
//
// export interface PromiseRejectedResult {
//     status: 'rejected';
//     reason: Error;
// }
//
// export type PromiseSettledResult<T> = PromiseFulfilledResult<T> | PromiseRejectedResult;

export function simulateRaceSettled<T>(promises: Array<Promise<T>>): Promise<Array<PromiseSettledResult<T>>> {
  const settledPromises = promises.map((p: Promise<T>): Promise<PromiseSettledResult<T>> =>
    p.then(

      (value: T): PromiseFulfilledResult<T> => (new PromiseFulfilledResult<T>(value)),
      (reason: Error): PromiseRejectedResult => (new PromiseRejectedResult(reason))

  ))
  return Promise.all<PromiseSettledResult<T>>(settledPromises);
}


export async function taskFunction(): Promise<number> {
  return await new Promise<number>((resolve) => {
    setTimeout(() => {
      resolve(42);
    }, 1000);
  });
}



export async function taskFunction1(): Promise<number> {
  return await new Promise<number>((resolve,reject) => {
    setTimeout(() => {
      reject(new Error('42'));
    }, 1000);
  });
}




export async function taskSuccess() : Promise<string>{
  return await new Promise<string>((resolve):void => {
    setTimeout(() => {
      resolve('success task');
    }, 1000);
  });
}


export async function taskFail(): Promise<string> {
  return await new Promise<string>((_,reject):void => {
    setTimeout(() => {
      reject(new Error('fail task'));
    }, 1000);
  });
}
