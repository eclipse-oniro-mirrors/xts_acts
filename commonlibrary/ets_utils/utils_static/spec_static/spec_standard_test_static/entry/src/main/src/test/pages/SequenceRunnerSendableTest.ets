/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
export function addNumbers(a: number, b: number): number {
  return a + b;
}

export function isOdd(num: number): boolean {
  return num % 2 !== 0;
}

export function filterOddNumbers(arr: number[]): Array<number> {
  const oddNumbers = new Array<number>();
  for (let i = 0; i < arr.length; i++) {
    if (isOdd(arr[i])) {
      oddNumbers.push(arr[i]);
    }
  }
  return oddNumbers;
}

export function filterOddNumbersWithNestedLoop(arr: number[]): Array<number> {
  const oddNumbers = new Array<number>();
  for (let i = 0; i < arr.length; i++) {
    for (let j = 0; j < 1; j++) {
      if (isOdd(arr[i])) {
        oddNumbers.push(arr[i]);
      }
    }
  }
  return oddNumbers;
}

export function filterOddOrZero(num: number): number {
  if (num % 2 !== 0) {
    return num;
  } else {
    return 0;
  }
}

// export function anyReturn(num: number): number {
//   let thisName: number = num + 10;
//   console.log('====' + thisName)
//   return thisName;
//   return 0;
// }

export class MyClass {
  public value: number;

  constructor(value: number) {
    this.value = value;
    return
  }
}

export class MyClass1 {
  public value: number = 42;

  constructor() {
    return
  }
}

export function returnVoid(num: number): void {
  let thisName: number = num + 10;
  return;
}

export function filterOddNumbersVoid(arr: number[]): void {
  const oddNumbers = new Array<number>();
  for (let i = 0; i < arr.length; i++) {
    if (isOdd(arr[i])) {
      oddNumbers.push(arr[i]);
    }
  }
  return
}

export function filterOddNumbersWithNestedLoopVoid(arr: number[]): void {
  const oddNumbers = new Array<number>();
  for (let i = 0; i < arr.length; i++) {
    for (let j = 0; j < 1; j++) {
      if (isOdd(arr[i])) {
        oddNumbers.push(arr[i]);
      }
    }
  }
  return;
}

export function filterOddOrZeroVoid(num: number): void {
  if (num % 2 !== 0) {
    return;
  } else {
    return;
  }
}

export class TestClass {
  public value: number = 0;

  public setValueAndReturn(value: number): number {
    this.value = value;
    return value;
  }

  public getValue(): number {
    return this.value;
  }
}

export const createAddFunction = (a: number, b: number): () => number => {
  return () => a + b;
};