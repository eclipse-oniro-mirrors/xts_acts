/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { collections } from "@kit.ArkTS";

export const sleep = (ms: number | undefined) => {
  return new Promise <void>(resolve => setTimeout(resolve, ms));
}

@Concurrent
export function testUint32ArrayTaskPool0001(): string {
  let uint32Array: collections.Uint32Array = new collections.Uint32Array(10);
  let expectedValues: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  uint32Array.set(expectedValues);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0002(): string {
  let uint32Array: collections.Uint32Array = new collections.Uint32Array(10);
  const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  uint32Array.set(expectedValues);
  const normalArray: number[] = [...uint32Array];
  return normalArray.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0003(): boolean {
  let uint32Array: collections.Uint32Array = new collections.Uint32Array();
  return uint32Array instanceof collections.Uint32Array;
}

@Concurrent
export function testUint32ArrayTaskPool0004(): string {
  let errorMessage = "";
  try {
    new collections.Uint32Array(-1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint32ArrayTaskPool0005(): number {
  let uint32Array: collections.Uint32Array = new collections.Uint32Array(0);
  return uint32Array.length;
}

@Concurrent
export function testUint32ArrayTaskPool0006(): number {
  let uint32Array: collections.Uint32Array = new collections.Uint32Array(10);
  return uint32Array.length;
}

@Concurrent
export function testUint32ArrayTaskPool0007(): number {
  let uint32Array: collections.Uint32Array = new collections.Uint32Array(100000);
  return uint32Array.length;
}

@Concurrent
export function testUint32ArrayTaskPool0008(): boolean {
  let arrayLike = [1, 3, 5];
  let array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
  return array instanceof collections.Uint32Array;
}

@Concurrent
export function testUint32ArrayTaskPool0009(): boolean {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
  let array: collections.Uint32Array = new collections.Uint32Array(arrayBuffer);
  return array instanceof collections.Uint32Array;
}

@Concurrent
export function testUint32ArrayTaskPool0010(): boolean {
  let arrayLike = [1, 3, 5];
  let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
  let array: collections.Uint32Array = new collections.Uint32Array(uint32Array);
  return array instanceof collections.Uint32Array;
}

@Concurrent
export function testUint32ArrayTaskPool0011(): string {
  let uint32Array: collections.Uint32Array = collections.Uint32Array.from([]);
  let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 0, 0);
  return array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0012(): string {
  let errorMessage = "";
  try {
    let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint32Array(uint32Array.buffer, -1, 0);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint32ArrayTaskPool0013(): string {
  let errorMessage = "";
  try {
    let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint32Array(uint32Array.buffer, -1, -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint32ArrayTaskPool0014(): string {
  let errorMessage = "";
  try {
    let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint32Array(uint32Array.buffer, -1, 2);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint32ArrayTaskPool0015(): string {
  let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
  let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 0, 0);
  return array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0016(): string {
  let errorMessage = "";
  try {
    let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint32Array(uint32Array.buffer, 0, -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint32ArrayTaskPool0017(): string {
  let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
  let array: collections.Uint32Array = new collections.Uint32Array(uint32Array.buffer, 0, 2);
  return array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0018(): string {
  let errorMessage = "";
  try {
    let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint32Array(uint32Array.buffer, 2, 0);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint32ArrayTaskPool0019(): string {
  let errorMessage = "";
  try {
    let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint32Array(uint32Array.buffer, 2, -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint32ArrayTaskPool0020(): string {
  let errorMessage = "";
  try {
    let uint32Array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint32Array(uint32Array.buffer, 2, 2);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint32ArrayTaskPool0021(): string {
  let arrayLike = [1, 3, 5];
  let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
  return array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0022(): string {
  let arrayLike = [];
  let array: collections.Uint32Array = collections.Uint32Array.from(arrayLike);
  return array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0023(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from<number>(
    { length: 5 },
    (v: Object, k: number) => k
  );
  return array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0024(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from<string>(
    ["1", "3", "5"],
    (v: string, k: number) => parseInt(v)
  );
  return array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0025(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from<string>(
    "12345",
    (v: string, k: number) => parseInt(v)
  );
  return array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0026(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from<number>(
    [1, 3, 5],
    (v: number, k: number) => v
  );
  return array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0027(): string {
  let nestedArray: number[][] = [[1, 2], [3, 4], [5, 6]];
  let array: collections.Uint32Array = collections.Uint32Array.from<number>(
    ([] as number[]).concat(...nestedArray),
    (v: number) => v
  );
  return array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0028(): string {
  let set: Set<number> = new Set<number>([1, 2, 3]);
  let array: collections.Uint32Array = collections.Uint32Array.from(set);
  return array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0029(): string {
  let set: Set<number> = new Set<number>([1, 2, 3]);
  let array: collections.Uint32Array = collections.Uint32Array.from(
    set,
    (v: number, k: number) => v + k
  );
  return array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0030(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(3, 1, 3);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0031(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(-1, -1, -1);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0032(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(-1, 0, -1);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0033(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(-1, 0, 0);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0034(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(-1, 0, 2);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0035(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(-1, 0, 10);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0036(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(-1, 2, -1);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0037(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(-1, 2, 0);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0038(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(-1, 2, 2);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0039(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(-1, 2, 10);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0040(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(-1, 10, 10);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0041(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(0, -1, -1);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0042(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(0, 0, -1);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0043(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(0, 0, 0);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0044(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(0, 0, 2);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0045(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(0, 0, 10);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0046(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(0, 2, -1);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0047(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(0, 2, 0);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0048(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(0, 2, 2);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0049(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(0, 2, 10);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0050(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(0, 10, 10);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0051(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(2, -1, -1);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0052(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(2, 0, -1);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0053(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(2, 0, 0);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0054(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(2, 0, 2);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0055(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(2, 0, 10);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0056(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(2, 2, -1);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0057(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(2, 2, 0);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0058(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(2, 2, 2);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0059(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(2, 2, 10);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0060(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(2, 10, 10);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0061(): string {
  let array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint32Array = array.copyWithin(10, 10, 10);
  return copied.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0062(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
  return uint32Array.some((element: number) => element == 4294967286);
}

@Concurrent
export function testUint32ArrayTaskPool0063(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
  return uint32Array.some((element: number) => element < 0);
}

@Concurrent
export function testUint32ArrayTaskPool0064(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
  return uint32Array.some((element: number) => element >= 0);
}

@Concurrent
export function testUint32ArrayTaskPool0065(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
  return uint32Array.every((element: number) => element >= 20);
}

@Concurrent
export function testUint32ArrayTaskPool0066(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
  return uint32Array.every((element: number) => element < 30);
}

@Concurrent
export function testUint32ArrayTaskPool0067(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike);
  return uint32Array.every((element: number) => element < 20);
}

@Concurrent
export function testUint32ArrayTaskPool0068(): string {
  let arrayLike = [1, 2, 3];
  let uint32Array1: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4);
  let uint32Array2: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 1);
  let uint32Array3: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, 1, 2);
  return uint32Array1.toString()+","+uint32Array2.toString()+","+uint32Array3.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0069(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, -1, -1);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0070(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array: collections.Uint32Array = new collections.Uint32Array(arrayLike).fill(4, -1, 0);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0071(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array = new collections.Uint32Array(arrayLike).fill(4, -1, 2);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0072(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array = new collections.Uint32Array(arrayLike).fill(4, -1, 10);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0073(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array = new collections.Uint32Array(arrayLike).fill(4, 0, -1);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0074(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array = new collections.Uint32Array(arrayLike).fill(4, 0, 0);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0075(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array = new collections.Uint32Array(arrayLike).fill(4, 0, 2);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0076(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array = new collections.Uint32Array(arrayLike).fill(4, 0, 10);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0077(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array = new collections.Uint32Array(arrayLike).fill(4, 2, -1);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0078(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array = new collections.Uint32Array(arrayLike).fill(4, 2, 0);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0079(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array = new collections.Uint32Array(arrayLike).fill(4, 2, 2);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0080(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array = new collections.Uint32Array(arrayLike).fill(4, 2, 10);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0081(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array = new collections.Uint32Array(arrayLike).fill(4, 10, -1);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0082(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array = new collections.Uint32Array(arrayLike).fill(4, 10, 0);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0083(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array = new collections.Uint32Array(arrayLike).fill(4, 10, 2);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0084(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint32Array = new collections.Uint32Array(arrayLike).fill(4, 10, 10);
  return uint32Array.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0085(): string {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint32Array.from(arrayLike);
  let filtered = array.filter((element: number) => element % 2 == 0);
  return filtered.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0086(): number {
  let arrayLike: number[] = [];
  let array = collections.Uint32Array.from(arrayLike);
  let filtered = array.filter((element: number) => element % 2 == 0);
  return filtered.length;
}

@Concurrent
export function testUint32ArrayTaskPool0087(): string {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint32Array.from(arrayLike);
  let filtered1 = array.filter((element: number) => element > 4);
  array.set([5, 6], 2);
  let filtered2 = array.filter((element: number) => element > 4);
  return filtered1.toString()+' after set is '+filtered2.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0088(): number | undefined {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint32Array.from(arrayLike);
  return array.find((element: number) => element > 2);
}

@Concurrent
export function testUint32ArrayTaskPool0089(): number | undefined {
  let arrayLike: number[] = [];
  let array = collections.Uint32Array.from(arrayLike);
  return array.find((element: number) => element > 2);
}

@Concurrent
export function testUint32ArrayTaskPool0090(): string {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint32Array.from(arrayLike);
  let res1 = array.find((element: number) => element > 4);
  array.set([5, 6], 2);
  let res2 = array.find((element: number) => element > 4);
  let arrayResult = [typeof res1,res2];
  return  arrayResult.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0091(): undefined | number {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint32Array.from(arrayLike);
  return array.find((index: number) => index == -1);
}

@Concurrent
export function testUint32ArrayTaskPool0092(): undefined | number {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint32Array.from(arrayLike);
  return array.find((index: number) => index == 0);
}

@Concurrent
export function testUint32ArrayTaskPool0093(): undefined | number {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint32Array.from(arrayLike);
  return array.find((index: number) => index == 10);
}

@Concurrent
export function testUint32ArrayTaskPool0094(): boolean {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint32Array.from(arrayLike);
  let condition = (element: number) => element > 0;
  let filtered = array.filter(condition);
  let found = array.find(condition);
  return found == filtered[0];
}

@Concurrent
export function testUint32ArrayTaskPool0095(): number {
  let array: collections.Uint32Array = collections.Uint32Array.from([]);
  return array.findIndex((element: number) => element % 2 === 0);
}

@Concurrent
export function testUint32ArrayTaskPool0096(): number {
  const array: collections.Uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
  return array.findIndex((element: number) => element % 2 === 0);
}

@Concurrent
export function testUint32ArrayTaskPool0097(): number {
  const array: collections.Uint32Array = collections.Uint32Array.from([1, 3, 5]);
  return array.findIndex((element: number) => element % 2 === 0);
}

@Concurrent
export function testUint32ArrayTaskPool0098(): boolean {
  let uint32Array = collections.Uint32Array.from([]);
  let res = false;
  uint32Array.forEach(() => {
    res = true;
  });
  let res1 = uint32Array.length === 0;
  let res2 = res === false;
  return res1 && res2;
}

@Concurrent
export function testUint32ArrayTaskPool0099(): boolean {
  let uint32Array = collections.Uint32Array.from([1, 2, 3]);
  let res = false;
  uint32Array.forEach((value, index, array) => {
    res = true;
  });
  console.error(`${uint32Array.length} failed, error: ${uint32Array.toString()},${res}`);
  let res1 = uint32Array.length === 3;
  let  res2 = uint32Array.toString() === '1,2,3';
  return res1 && res2 && res;
}

@Concurrent
export function testUint32ArrayTaskPool0100(): boolean {
  let uint32Array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
  uint32Array.set([5, 6], 2);
  let res = false;
  uint32Array.forEach((value, index, array) => {
    res = true;
  });
  let res1 = uint32Array.length === 5;
  let  res2 = uint32Array.toString() === '1,2,5,6,5';
  return res1 && res2 && res;
}

@Concurrent
export function testUint32ArrayTaskPool0101(): number {
  let array = collections.Uint32Array.from([]);
  return array.indexOf(3);
}

@Concurrent
export function testUint32ArrayTaskPool0102(): number {
  let array = collections.Uint32Array.from([1, 2, 3]);
  return array.indexOf(4);
}

@Concurrent
export function testUint32ArrayTaskPool0103(): number {
  let array = collections.Uint32Array.from([1, 2, 3]);
  array.set([4, 5], 1);
  return array.indexOf(4);
}

@Concurrent
export function testUint32ArrayTaskPool0104(): number {
  let array = collections.Uint32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, -1);
}

@Concurrent
export function testUint32ArrayTaskPool0105(): number {
  let array = collections.Uint32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, 5);
}

@Concurrent
export function testUint32ArrayTaskPool0106(): number {
  let array = collections.Uint32Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3);
}

@Concurrent
export function testUint32ArrayTaskPool0107(): number {
  let array = collections.Uint32Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, 3);
}

@Concurrent
export function testUint32ArrayTaskPool0108(): number {
  let array = collections.Uint32Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, 9);
}

@Concurrent
export function testUint32ArrayTaskPool0109(): string {
  let array = collections.Uint32Array.from([]);
  return array.join('');
}

@Concurrent
export function testUint32ArrayTaskPool0110(): string {
  let array = collections.Uint32Array.from([]);
  return array.join('-');
}

@Concurrent
export function testUint32ArrayTaskPool0111(): string {
  let array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
  return array.join();
}

@Concurrent
export function testUint32ArrayTaskPool0112(): string {
  let array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
  return array.join('');
}

@Concurrent
export function testUint32ArrayTaskPool0113(): string {
  let array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
  return array.join(undefined);
}

@Concurrent
export function testUint32ArrayTaskPool0114(): string {
  let array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
  return array.join('/');
}

@Concurrent
export function testUint32ArrayTaskPool0115(): string {
  let array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
  return array.join(',。￥·');
}

@Concurrent
export function testUint32ArrayTaskPool0116(): string {
  let array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
  return array.join('녕하こんйте');
}

@Concurrent
export function testUint32ArrayTaskPool0117(): string {
  let array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
  return array.join('，');
}

@Concurrent
export function testUint32ArrayTaskPool0118(): string {
  let array = new collections.Uint32Array([]);
  const mapped = array.map(Math.sqrt);
  return mapped.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0119(): boolean {
  let array = new collections.Uint32Array([25, 36, 49]);
  const mapped = array.map(Math.sqrt);
  let res1 = mapped.toString() === "5,6,7";
  let res2 = mapped.length === 3;
  return res1 && res2;
}

@Concurrent
export function testUint32ArrayTaskPool0120(): boolean {
  let array = new collections.Uint32Array([25, 36, 49, 100, 256]);
  array.set([81, 64], 2);
  const mapped = array.map(Math.sqrt);
  let res1 = mapped.toString() === "5,6,9,8,16";
  let res2 = mapped.length === 5;
  return res1 && res2;
}

@Concurrent
export function testUint32ArrayTaskPool0121(): string {
  let errorMessage = "";
  try {
    let array = collections.Uint32Array.from([]);
    array.reduce((accumulator: number, value: number) => accumulator + value);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint32ArrayTaskPool0122(): number {
  let array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
  return array.reduce((accumulator: number, value: number, index: number) => {
    let newAccumulator = accumulator + value;
    return newAccumulator;
  });
}

@Concurrent
export function testUint32ArrayTaskPool0123(): number {
  const array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
  const initialAccumulator = 8;
  return array.reduce((accumulator: number, value: number, index: number) => {
    const newAccumulator = accumulator + value;
    return newAccumulator;
  }, initialAccumulator);
}

@Concurrent
export function testUint32ArrayTaskPool0124(): string {
  let array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
  let initialValue = "initialValue";
  return array.reduce((accumulator: string, value: number) => accumulator + value, initialValue);
}

@Concurrent
export function testUint32ArrayTaskPool0125(): string {
  let array = collections.Uint32Array.from([]);
  return array.reverse().toString();
}

@Concurrent
export function testUint32ArrayTaskPool0126(): string {
  let array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
  return array.reverse().toString();
}

@Concurrent
export function testUint32ArrayTaskPool0127(): boolean {
  let array = collections.Uint32Array.from([1, 2, 3, 4, 5]);
  let reversed = array.reverse();
  const expectedValues = [5, 4, 3, 2, 1];
  let res = false;
  reversed.forEach((value, index) => {
    res = value === expectedValues[index];
  });
  return res;
}

@Concurrent
export function testUint32ArrayTaskPool0128(): string {
  let buf = new collections.ArrayBuffer(32);
  let arrList = new collections.Uint32Array(buf);
  arrList.set([1, 3, 5]);
  return arrList.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0129(): boolean {
  let buf = new collections.ArrayBuffer(32);
  let arrList = new collections.Uint32Array(buf);
  arrList.set([1, 3, 5]);
  let res = false;
  arrList.forEach((value, index, array) => {
    res = array.toString() === "1,3,5,0,0,0,0,0";
  });
  return res;
}

@Concurrent
export function testUint32ArrayTaskPool0130(): string {
  let errorMessage = "";
  try {
    let buf = new collections.ArrayBuffer(32);
    let arrList = new collections.Uint32Array(buf);
    arrList.set([1, 3, 5], -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint32ArrayTaskPool0131(): string {
  let buf = new collections.ArrayBuffer(32);
  let arrList = new collections.Uint32Array(buf);
  arrList.set([1, 3, 5], 0);
  return arrList.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0132(): boolean {
  let buf = new collections.ArrayBuffer(32);
  let arrList = new collections.Uint32Array(buf);
  arrList.set([1, 3, 5], 0);
  let rst = false;
  arrList.forEach((value, index, array) => {
    rst = true;
  });
  let res1 = arrList.toString() === "1,3,5,0,0,0,0,0";
  return res1 && rst ;
}

@Concurrent
export function testUint32ArrayTaskPool0133(): string {
  let buf = new collections.ArrayBuffer(32);
  let arrList = new collections.Uint32Array(buf);
  arrList.set([1, 3, 5], 2);
  return arrList.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0134(): boolean {
  let buf = new collections.ArrayBuffer(32);
  let arrList = new collections.Uint32Array(buf);
  arrList.set([1, 3, 5], 2);
  let rst = false;
  arrList.forEach((value, index, array) => {
    rst = true;
  });
  let res1 = arrList.toString() === "0,0,1,3,5,0,0,0";
  return res1 && rst ;
}

@Concurrent
export function testUint32ArrayTaskPool0135(): string {
  let errorMessage = "";
  try {
    let buf = new collections.ArrayBuffer(32);
    let arrList = new collections.Uint32Array(buf);
    arrList.set([1, 3, 5], 10);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint32ArrayTaskPool0136(): string {
  let arrList = new collections.Uint32Array();
  return arrList.slice(1, 3).toString();
}

@Concurrent
export function testUint32ArrayTaskPool0137(): string {
  let arrList = new collections.Uint32Array();
  return arrList.slice().toString();
}

@Concurrent
export function testUint32ArrayTaskPool0138(): string {
  let arrList = new collections.Uint32Array([1, 2, 3, 4, 5]);
  return arrList.slice().toString();
}

@Concurrent
export function testUint32ArrayTaskPool0139(): string {
  let arrList = new collections.Uint32Array([1, 2, 3, 4, 5]);
  return arrList.slice(undefined, undefined).toString();
}

@Concurrent
export function testUint32ArrayTaskPool0140(): string {
  let arrList = new collections.Uint32Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(-1);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0141(): string {
  let arrList = new collections.Uint32Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(-1, -1);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0142(): string {
  let arrList = new collections.Uint32Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(-1, 0);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0143(): string {
  let arrList = new collections.Uint32Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(0, -1);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0144(): string {
  let arrList = new collections.Uint32Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(2);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0145(): string {
  let arrList = new collections.Uint32Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(10);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0146(): string {
  let arrList = new collections.Uint32Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(2, 2);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0147(): string {
  let arrList = new collections.Uint32Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(2, 0);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0148(): string {
  let arrList = new collections.Uint32Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(2, 4);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0149(): string {
  let arrList = new collections.Uint32Array();
  let arrListNew = arrList.sort();
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0150(): string {
  let arrList = new collections.Uint32Array();
  let arrListNew = arrList.sort((a: number, b: number) => a - b);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0151(): string {
  let arrList = new collections.Uint32Array([5, 2, 3, 4, 1]);
  let arrListNew = arrList.sort();
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0152(): string {
  let arrList = new collections.Uint32Array([5, 2, 3, 4, 1]);
  let arrListNew = arrList.sort(undefined);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0153(): string {
  let arrList = new collections.Uint32Array([5, 2, 3, 4, 1]);
  let arrListNew = arrList.sort((a: number, b: number) => b - a);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0154(): string {
  let arrList = new collections.Uint32Array([5, 2, 3, 4, 1]);
  arrList.set([7, 9, 8], 2);
  let arrListNew = arrList.sort();
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0155(): string {
  let arrList = new collections.Uint32Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray();
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0156(): string {
  let arrList = new collections.Uint32Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(-1);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0157(): string {
  let arrList = new collections.Uint32Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(-1, -1);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0158(): string {
  let arrList = new collections.Uint32Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(-1, 2);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0159(): string {
  let arrList = new collections.Uint32Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(-1, 7);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0160(): string {
  let arrList = new collections.Uint32Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(2);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0161(): string {
  let arrList = new collections.Uint32Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(2, -1);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0162(): string {
  let arrList = new collections.Uint32Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(2, 2);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0163(): string {
  let arrList = new collections.Uint32Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(2, 10);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0164(): string {
  let arrList = new collections.Uint32Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(7, 10);
  return arrListNew.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0165(): string {
  let array = collections.Uint32Array.from([]);
  let res = typeof array.at(1);
  return res;
}

@Concurrent
export function testUint32ArrayTaskPool0166(): string {
  let array = collections.Uint32Array.from([1, 2, 3]);
  let res = typeof array.at(3);
  return res;
}

@Concurrent
export function testUint32ArrayTaskPool0167(): number | undefined {
  let array = collections.Uint32Array.from([1, 2, 3]);
  let res = array.at(-1);
  return res;
}

@Concurrent
export function testUint32ArrayTaskPool0168(): string {
  let array = collections.Uint32Array.from([1, 2, 3]);
  let res = typeof array.at(5);
  return res;
}

@Concurrent
export function testUint32ArrayTaskPool0169(): number | undefined {
  let array = collections.Uint32Array.from([1, 2, 3]);
  let res = array.at(0);
  return res;
}

@Concurrent
export function testUint32ArrayTaskPool0170(): boolean {
  let array = collections.Uint32Array.from([]);
  return array.includes(2);
}

@Concurrent
export function testUint32ArrayTaskPool0171(): boolean {
  let array = collections.Uint32Array.from([1, 2, 3]);
  return array.includes(5, -1);
}

@Concurrent
export function testUint32ArrayTaskPool0172(): boolean {
  let array = collections.Uint32Array.from([1, 2, 3]);
  return array.includes(3, -1);
}

@Concurrent
export function testUint32ArrayTaskPool0173(): boolean {
  let array = collections.Uint32Array.from([1, 2, 3]);
  return array.includes(10);
}

@Concurrent
export function testUint32ArrayTaskPool0174(): boolean {
  let array = collections.Uint32Array.from([1, 2, 3]);
  return array.includes(1);
}

@Concurrent
export function testUint32ArrayTaskPool0175(): boolean {
  let array = collections.Uint32Array.from([1, 2, 3]);
  return array.includes(1, 5);
}

@Concurrent
export function testUint32ArrayTaskPool0176(): string {
  let array = collections.Uint32Array.from([]);
  let iterator: IterableIterator<[number, number]> = array.entries();
  let rst = typeof iterator.next().value;
  return rst;
}

@Concurrent
export function testUint32ArrayTaskPool0177(): string {
  let array = collections.Uint32Array.from([1, 2, 3]);
  let iterator: IterableIterator<[number, number]> = array.entries();
  return iterator.next().value.toString();
}

@Concurrent
export function testUint32ArrayTaskPool0178(): number {
  let array = collections.Uint32Array.from([]);
  let iterator: IterableIterator<number> = array.keys();
  let tempNum: number = 0;
  for (const key of iterator) {
    tempNum++
  }
  return tempNum;
}

@Concurrent
export function testUint32ArrayTaskPool0179(): string {
  let array = collections.Uint32Array.from([-1, 2, 3]);
  let iterator: IterableIterator<number> = array.keys();
  let rst = [iterator.next().value, iterator.next().value, iterator.next().value].toString();
  return rst;
}

@Concurrent
export function testUint32ArrayTaskPool0180(): boolean {
  let array = collections.Uint32Array.from([1, 2, 3]);
  let iterator: IterableIterator<number> = array.keys();
  let tempNum: number = 0;
  for (const key of iterator) {
    console.info("iterator key:" + key);
    if (key !== tempNum) {
      return false;
    }
    tempNum = tempNum + 1;
  }
  return true;
}

@Concurrent
export function testUint32ArrayTaskPool0181(): boolean {
  let array = collections.Uint32Array.from([]);
  let iterator: IterableIterator<number> = array.values();
  console.info("iterator values:" + iterator);
  return iterator.next().done === true;
}

@Concurrent
export function testUint32ArrayTaskPool0182(): boolean {
  let array = collections.Uint32Array.from([1, 2, 3]);
  let iterator: IterableIterator<number> = array.values();
  console.info("iterator values:" + iterator);
  return iterator.next().value === 1 && iterator.next().value === 2 && iterator.next().value === 3;
}

@Concurrent
export function testUint32ArrayTaskPool0183(): boolean {
  let array = collections.Uint32Array.from([1, 2, 3]);
  let iterator: IterableIterator<number> = array.values();
  console.info("iterator values:" + iterator);
  let tempNum: number = 1;
  for (const value of iterator) {
    console.info("iterator value:" + value);
    if (value !== tempNum) {
      return false;
    }
    tempNum = tempNum + 1;
  }
  return true;
}

@Concurrent
export function testUint32ArrayTaskPool0184(): boolean {
  let array = collections.Uint32Array.from([1, 2, 3]);
  array.set([4, 5, 6]);
  let iterator: IterableIterator<number> = array.values();
  console.info("iterator values:" + iterator);
  let tempNum: number = 4;
  for (const value of iterator) {
    console.info("iterator value:" + value);
    if (value !== tempNum) {
      return false;
    }
    tempNum = tempNum + 1;
  }
  return true;
}

@Concurrent
export function testUint32ArrayTaskPool0185(): boolean {
  let array = collections.Uint32Array.from([1, 2, 3]);
  console.info("array is:" + array);
  return array[-1] === undefined;
}

@Concurrent
export function testUint32ArrayTaskPool0186(): boolean {
  let array = collections.Uint32Array.from([1, 2, 3]);
  console.info("array is:" + array);
  return array[5] === undefined;
}

@Concurrent
export function testUint32ArrayTaskPool0187(): boolean {
  let array = collections.Uint32Array.from([1, 2, 3]);
  console.info("array is:" + array);
  return array[1] === 2;
}