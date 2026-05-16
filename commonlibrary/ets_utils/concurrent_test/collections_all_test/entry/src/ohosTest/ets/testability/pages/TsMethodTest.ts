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

export class ConcatArrayTest<T> {
  private arr: ConcatArray<T>;

  constructor(arr: ConcatArray<T>) {
    this.arr = arr;
  }

  public slice(start?, end?): any {
    return this.arr.slice(start, end);
  }

  public join(separator?): string {
    return this.arr.join(separator);
  }

  public length(): number {
    return this.arr.length;
  }

  public index(index): T {
    return this.arr[index];
  }

  public setLength(length): void {
    this.arr = {
      length: length,
      join: function (separator?: string | undefined): string {
        throw new Error('Function not implemented.');
      },
      slice: function (start?: number | undefined, end?: number | undefined): T[] {
        throw new Error('Function not implemented.');
      }
    };
  }
}

export class ArrayLikeTest<T> {
  private arr: ArrayLike<T>;

  constructor(arr: ArrayLike<T>) {
    this.arr = arr;
  }

  public length(): number {
    return this.arr.length;
  }

  public index(index): T {
    return this.arr[index];
  }
}

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export class ReadonlyArrayTest<T> {
  private arr: ReadonlyArray<T>;

  constructor(arr: ReadonlyArray<T>) {
    this.arr = arr;
  }

  public length(): number {
    return this.arr.length;
  }

  public index(index): T {
    return this.arr[index];
  }

  public toString(): string {
    return this.arr.toString();
  }

  public toLocaleString(): string {
    return this.arr.toLocaleString();
  }

  public forEach(a, b?): void {
    return this.arr.forEach(a, b);
  }
}
