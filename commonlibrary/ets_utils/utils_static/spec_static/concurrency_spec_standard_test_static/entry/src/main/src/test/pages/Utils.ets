/*
* Copyright (C) 2024 HiHope Open Source Organization.
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

export interface MyObjects {
  a: number
}

// export function sleep(time: number): Promise<void> {
//   return new Promise((re, je) => {
//     setTimeout(() => {
//       re();
//     }, time);
//   });
// }

export class Person {
  public name: string = 'zhang'
}

export function task(): number {
  return 1 + 1
}

export function animal<T>(arg: T): T {
  return arg
}

// export function object(arg: string): object {
//   return Object(arg)
// }

export function update(x: number): number {
  return x + 5;
}

let count = 0;

export function shouldContinue() {
  count++;
  return count <= 3;
}

/**
 * Thread-safe ContinueChecker object
 * Encapsulates shouldContinue logic, supports high concurrency
 */
export class ContinueChecker {
  private count: number = 0;
  private maxCount: number = 3;

  constructor(maxCount: number = 3) {
    this.maxCount = maxCount;
  }

  /**
   * Check if should continue
   * @returns true when call count <= maxCount, otherwise false
   */
  check(): boolean {
    this.count++;
    return this.count <= this.maxCount;
  }

  /**
   * Reset the counter
   */
  reset(): void {
    this.count = 0;
  }

  /**
   * Get current call count
   */
  getCount(): number {
    return this.count;
  }

  /**
   * Get max call count
   */
  getMaxCount(): number {
    return this.maxCount;
  }
}

/**
 * Create a thread-safe ContinueChecker instance
 * @param maxCount max call count, default is 3
 * @returns ContinueChecker instance
 */
export function createContinueChecker(maxCount: number = 3): ContinueChecker {
  return new ContinueChecker(maxCount);
}

export interface MyObject {
  a: number;
  b: number;
  c: number;
}

export class MyClass {
  public prop1: number = 10;
  public prop2: number = 20;
  public prop3: number = 30;
}

export enum MyColor {
  RED = 1,
  GREEN = 2,
  BLUE = 3,
}

export function getNumber() {
  let num = 5;
  return () => {
    if (num > 0) {
      return num--;
    }
    return 0;
  };
}
