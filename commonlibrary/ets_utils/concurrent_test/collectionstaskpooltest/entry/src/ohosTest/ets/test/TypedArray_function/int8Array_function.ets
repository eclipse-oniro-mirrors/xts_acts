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
export function testInt8ArrayTaskPool0001(): string {
  let int8Array: collections.Int8Array = new collections.Int8Array(10);
  let expectedValues: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int8Array.set(expectedValues);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0002(): string {
  let int8Array: collections.Int8Array = new collections.Int8Array(10);
  const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int8Array.set(expectedValues);
  const normalArray: number[] = [...int8Array];
  return normalArray.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0003(): boolean {
  let int8Array: collections.Int8Array = new collections.Int8Array();
  return int8Array instanceof collections.Int8Array;
}

@Concurrent
export function testInt8ArrayTaskPool0004(): string {
  let errorMessage = "";
  try {
    new collections.Int8Array(-1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testInt8ArrayTaskPool0005(): number {
  let int8Array: collections.Int8Array = new collections.Int8Array(0);
  return int8Array.length;
}

@Concurrent
export function testInt8ArrayTaskPool0006(): number {
  let int8Array: collections.Int8Array = new collections.Int8Array(10);
  return int8Array.length;
}

@Concurrent
export function testInt8ArrayTaskPool0007(): number {
  let int8Array: collections.Int8Array = new collections.Int8Array(100000);
  return int8Array.length;
}

@Concurrent
export function testInt8ArrayTaskPool0008(): boolean {
  let arrayLike = [1, 3, 5];
  let array: collections.Int8Array = new collections.Int8Array(arrayLike);
  return array instanceof collections.Int8Array;
}

@Concurrent
export function testInt8ArrayTaskPool0009(): boolean {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
  let array: collections.Int8Array = new collections.Int8Array(arrayBuffer);
  return array instanceof collections.Int8Array;
}

@Concurrent
export function testInt8ArrayTaskPool0010(): boolean {
  let arrayLike = [1, 3, 5];
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike);
  let array: collections.Int8Array = new collections.Int8Array(uint8Array);
  return array instanceof collections.Int8Array;
}

@Concurrent
export function testInt8ArrayTaskPool0011(): string {
  let int32Array: collections.Int32Array = collections.Int32Array.from([]);
  let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 0, 0);
  return array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0012(): string {
  let errorMessage = "";
  try {
    let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Int8Array(int32Array.buffer, -1, 0);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testInt8ArrayTaskPool0013(): string {
  let errorMessage = "";
  try {
    let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Int8Array(int32Array.buffer, -1, -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testInt8ArrayTaskPool0014(): string {
  let errorMessage = "";
  try {
    let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Int8Array(int32Array.buffer, -1, 2);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testInt8ArrayTaskPool0015(): string {
  let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
  let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 0, 0);
  return array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0016(): string {
  let errorMessage = "";
  try {
    let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Int8Array(int32Array.buffer, 0, -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testInt8ArrayTaskPool0017(): string {
  let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
  let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 0, 2);
  return array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0018(): string {
  let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
  let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 2, 0);
  return array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0019(): string {
  let errorMessage = "";
  try {
    let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Int8Array(int32Array.buffer, 2, -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testInt8ArrayTaskPool0020(): string {
  let int32Array: collections.Int32Array = collections.Int32Array.from([1, 2, 3, 4, 5, 6]);
  let array: collections.Int8Array = new collections.Int8Array(int32Array.buffer, 2, 2);
  return array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0021(): string {
  let arrayLike = [1, 3, 5];
  let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
  return array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0022(): string {
  let arrayLike = [];
  let array: collections.Int8Array = collections.Int8Array.from(arrayLike);
  return array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0023(): string {
  let array: collections.Int8Array = collections.Int8Array.from<number>(
    { length: 5 },
    (v: Object, k: number) => k
  );
  return array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0024(): string {
  let array: collections.Int8Array = collections.Int8Array.from<string>(
    ["1", "3", "5"],
    (v: string, k: number) => parseInt(v)
  );
  return array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0025(): string {
  let array: collections.Int8Array = collections.Int8Array.from<string>(
    "12345",
    (v: string, k: number) => parseInt(v)
  );
  return array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0026(): string {
  let array: collections.Int8Array = collections.Int8Array.from<number>(
    [1, 3, 5],
    (v: number, k: number) => v
  );
  return array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0027(): string {
  let nestedArray: number[][] = [[1, 2], [3, 4], [5, 6]];
  let array: collections.Int8Array = collections.Int8Array.from<number>(
    ([] as number[]).concat(...nestedArray),
    (v: number) => v
  );
  return array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0028(): string {
  let set: Set<number> = new Set<number>([1, 2, 3]);
  let array: collections.Int8Array = collections.Int8Array.from(set);
  return array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0029(): string {
  let set: Set<number> = new Set<number>([1, 2, 3]);
  let array: collections.Int8Array = collections.Int8Array.from(
    set,
    (v: number, k: number) => v + k
  );
  return array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0030(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(3, 1, 3);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0031(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(-1, -1, -1);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0032(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(-1, 0, -1);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0033(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(-1, 0, 0);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0034(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(-1, 0, 2);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0035(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(-1, 0, 10);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0036(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(-1, 2, -1);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0037(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(-1, 2, 0);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0038(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(-1, 2, 2);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0039(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(-1, 2, 10);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0040(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(-1, 10, 10);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0041(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(0, -1, -1);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0042(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(0, 0, -1);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0043(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(0, 0, 0);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0044(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(0, 0, 2);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0045(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(0, 0, 10);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0046(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(0, 2, -1);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0047(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(0, 2, 0);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0048(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(0, 2, 2);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0049(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(0, 2, 10);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0050(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(0, 10, 10);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0051(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(2, -1, -1);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0052(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(2, 0, -1);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0053(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(2, 0, 0);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0054(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(2, 0, 2);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0055(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(2, 0, 10);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0056(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(2, 2, -1);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0057(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(2, 2, 0);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0058(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(2, 2, 2);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0059(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(2, 2, 10);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0060(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(2, 10, 10);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0061(): string {
  let array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Int8Array = array.copyWithin(10, 10, 10);
  return copied.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0062(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike);
  return int8Array.some((element: number) => element < 0);
}

@Concurrent
export function testInt8ArrayTaskPool0063(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike);
  return int8Array.some((element: number) => element > 40);
}

@Concurrent
export function testInt8ArrayTaskPool0064(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike);
  return int8Array.some((element: number) => element < 100);
}

@Concurrent
export function testInt8ArrayTaskPool0065(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike);
  return int8Array.every((element: number) => element < 100);
}

@Concurrent
export function testInt8ArrayTaskPool0066(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike);
  return int8Array.every((element: number) => element < 0);
}

@Concurrent
export function testInt8ArrayTaskPool0067(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike);
  return int8Array.every((element: number) => element > 40);
}

@Concurrent
export function testInt8ArrayTaskPool0068(): string {
  let arrayLike = [1, 2, 3];
  let int8Array1: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4);
  let int8Array2: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 1);
  let int8Array3: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, 1, 2);
  return int8Array1.toString()+","+int8Array2.toString()+","+int8Array3.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0069(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, -1, -1);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0070(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array: collections.Int8Array = new collections.Int8Array(arrayLike).fill(4, -1, 0);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0071(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array = new collections.Int8Array(arrayLike).fill(4, -1, 2);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0072(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array = new collections.Int8Array(arrayLike).fill(4, -1, 10);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0073(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array = new collections.Int8Array(arrayLike).fill(4, 0, -1);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0074(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array = new collections.Int8Array(arrayLike).fill(4, 0, 0);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0075(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array = new collections.Int8Array(arrayLike).fill(4, 0, 2);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0076(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array = new collections.Int8Array(arrayLike).fill(4, 0, 10);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0077(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array = new collections.Int8Array(arrayLike).fill(4, 2, -1);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0078(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array = new collections.Int8Array(arrayLike).fill(4, 2, 0);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0079(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array = new collections.Int8Array(arrayLike).fill(4, 2, 2);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0080(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array = new collections.Int8Array(arrayLike).fill(4, 2, 10);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0081(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array = new collections.Int8Array(arrayLike).fill(4, 10, -1);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0082(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array = new collections.Int8Array(arrayLike).fill(4, 10, 0);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0083(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array = new collections.Int8Array(arrayLike).fill(4, 10, 2);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0084(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let int8Array = new collections.Int8Array(arrayLike).fill(4, 10, 10);
  return int8Array.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0085(): string {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Int8Array.from(arrayLike);
  let filtered = array.filter((element: number) => element % 2 == 0);
  return filtered.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0086(): number {
  let arrayLike: number[] = [];
  let array = collections.Int8Array.from(arrayLike);
  let filtered = array.filter((element: number) => element % 2 == 0);
  return filtered.length;
}

@Concurrent
export function testInt8ArrayTaskPool0087(): string {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Int8Array.from(arrayLike);
  let filtered1 = array.filter((element: number) => element > 4);
  array.set([5, 6], 2);
  let filtered2 = array.filter((element: number) => element > 4);
  return filtered1.toString()+' after set is '+filtered2.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0088(): number | undefined {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Int8Array.from(arrayLike);
  return array.find((element: number) => element > 2);
}

@Concurrent
export function testInt8ArrayTaskPool0089(): number | undefined {
  let arrayLike: number[] = [];
  let array = collections.Int8Array.from(arrayLike);
  return array.find((element: number) => element > 2);
}

@Concurrent
export function testInt8ArrayTaskPool0090(): string {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Int8Array.from(arrayLike);
  let res1 = array.find((element: number) => element > 4);
  array.set([5, 6], 2);
  let res2 = array.find((element: number) => element > 4);
  let arrayResult = [typeof res1,res2];
  return  arrayResult.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0091(): undefined | number {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Int8Array.from(arrayLike);
  return array.find((index: number) => index == -1);
}

@Concurrent
export function testInt8ArrayTaskPool0092(): undefined | number {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Int8Array.from(arrayLike);
  return array.find((index: number) => index == 0);
}

@Concurrent
export function testInt8ArrayTaskPool0093(): undefined | number {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Int8Array.from(arrayLike);
  return array.find((index: number) => index == 10);
}

@Concurrent
export function testInt8ArrayTaskPool0094(): boolean {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Int8Array.from(arrayLike);
  let condition = (element: number) => element > 0;
  let filtered = array.filter(condition);
  let found = array.find(condition);
  return found == filtered[0];
}

@Concurrent
export function testInt8ArrayTaskPool0095(): number {
  let array: collections.Int8Array = collections.Int8Array.from([]);
  return array.findIndex((element: number) => element % 2 === 0);
}

@Concurrent
export function testInt8ArrayTaskPool0096(): number {
  const array: collections.Int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
  return array.findIndex((element: number) => element % 2 === 0);
}

@Concurrent
export function testInt8ArrayTaskPool0097(): number {
  const array: collections.Int8Array = collections.Int8Array.from([1, 3, 5]);
  return array.findIndex((element: number) => element % 2 === 0);
}

@Concurrent
export function testInt8ArrayTaskPool0098(): boolean {
  let int8Array = collections.Int8Array.from([]);
  let res = false;
  int8Array.forEach(() => {
    res = true;
  });
  let res1 = int8Array.length === 0;
  let res2 = res === false;
  return res1 && res2;
}

@Concurrent
export function testInt8ArrayTaskPool0099(): boolean {
  let int8Array = collections.Int8Array.from([1, 2, 3]);
  let res = false;
  int8Array.forEach((value, index, array) => {
    res = true;
  });
  console.error(`${int8Array.length} failed, error: ${int8Array.toString()},${res}`);
  let res1 = int8Array.length === 3;
  let  res2 = int8Array.toString() === '1,2,3';
  return res1 && res2 && res;
}

@Concurrent
export function testInt8ArrayTaskPool0100(): boolean {
  let int8Array = collections.Int8Array.from([1, 2, 3, 4, 5]);
  int8Array.set([5, 6], 2);
  let res = false;
  int8Array.forEach((value, index, array) => {
    res = true;
  });
  let res1 = int8Array.length === 5;
  let  res2 = int8Array.toString() === '1,2,5,6,5';
  return res1 && res2 && res;
}

@Concurrent
export function testInt8ArrayTaskPool0101(): number {
  let array = collections.Int8Array.from([]);
  return array.indexOf(3);
}

@Concurrent
export function testInt8ArrayTaskPool0102(): number {
  let array = collections.Int8Array.from([1, 2, 3]);
  return array.indexOf(4);
}

@Concurrent
export function testInt8ArrayTaskPool0103(): number {
  let array = collections.Int8Array.from([1, 2, 3]);
  array.set([4, 5], 1);
  return array.indexOf(4);
}

@Concurrent
export function testInt8ArrayTaskPool0104(): number {
  let array = collections.Int8Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, -1);
}

@Concurrent
export function testInt8ArrayTaskPool0105(): number {
  let array = collections.Int8Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, 5);
}

@Concurrent
export function testInt8ArrayTaskPool0106(): number {
  let array = collections.Int8Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3);
}

@Concurrent
export function testInt8ArrayTaskPool0107(): number {
  let array = collections.Int8Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, 3);
}

@Concurrent
export function testInt8ArrayTaskPool0108(): number {
  let array = collections.Int8Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, 9);
}

@Concurrent
export function testInt8ArrayTaskPool0109(): string {
  let array = collections.Int8Array.from([]);
  return array.join('');
}

@Concurrent
export function testInt8ArrayTaskPool0110(): string {
  let array = collections.Int8Array.from([]);
  return array.join('-');
}

@Concurrent
export function testInt8ArrayTaskPool0111(): string {
  let array = collections.Int8Array.from([1, 2, 3, 4, 5]);
  return array.join();
}

@Concurrent
export function testInt8ArrayTaskPool0112(): string {
  let array = collections.Int8Array.from([1, 2, 3, 4, 5]);
  return array.join('');
}

@Concurrent
export function testInt8ArrayTaskPool0113(): string {
  let array = collections.Int8Array.from([1, 2, 3, 4, 5]);
  return array.join(undefined);
}

@Concurrent
export function testInt8ArrayTaskPool0114(): string {
  let array = collections.Int8Array.from([1, 2, 3, 4, 5]);
  return array.join('/');
}

@Concurrent
export function testInt8ArrayTaskPool0115(): string {
  let array = collections.Int8Array.from([1, 2, 3, 4, 5]);
  return array.join(',。￥·');
}

@Concurrent
export function testInt8ArrayTaskPool0116(): string {
  let array = collections.Int8Array.from([1, 2, 3, 4, 5]);
  return array.join('녕하こんйте');
}

@Concurrent
export function testInt8ArrayTaskPool0117(): string {
  let array = collections.Int8Array.from([1, 2, 3, 4, 5]);
  return array.join('，');
}

@Concurrent
export function testInt8ArrayTaskPool0118(): string {
  let array = new collections.Int8Array([]);
  const mapped = array.map(Math.sqrt);
  return mapped.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0119(): boolean {
  let array = new collections.Int8Array([25, 36, 49]);
  const mapped = array.map(Math.sqrt);
  let res1 = mapped.toString() === "5,6,7";
  let res2 = mapped.length === 3;
  return res1 && res2;
}

@Concurrent
export function testInt8ArrayTaskPool0120(): boolean {
  let array = new collections.Int8Array([25, 36, 49, 100, 256]);
  array.set([81, 64], 2);
  const mapped = array.map(Math.sqrt);
  let res1 = mapped.toString() === "5,6,9,8,0";
  let res2 = mapped.length === 5;
  return res1 && res2;
}

@Concurrent
export function testInt8ArrayTaskPool0121(): string {
  let errorMessage = "";
  try {
    let array = collections.Int8Array.from([]);
    array.reduce((accumulator: number, value: number) => accumulator + value);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testInt8ArrayTaskPool0122(): number {
  let array = collections.Int8Array.from([1, 2, 3, 4, 5]);
  return array.reduce((accumulator: number, value: number, index: number) => {
    let newAccumulator = accumulator + value;
    return newAccumulator;
  });
}

@Concurrent
export function testInt8ArrayTaskPool0123(): number {
  const array = collections.Int8Array.from([1, 2, 3, 4, 5]);
  const initialAccumulator = 8;
  return array.reduce((accumulator: number, value: number, index: number) => {
    const newAccumulator = accumulator + value;
    return newAccumulator;
  }, initialAccumulator);
}

@Concurrent
export function testInt8ArrayTaskPool0124(): string {
  let array = collections.Int8Array.from([1, 2, 3, 4, 5]);
  let initialValue = "initialValue";
  return array.reduce((accumulator: string, value: number) => accumulator + value, initialValue);
}

@Concurrent
export function testInt8ArrayTaskPool0125(): string {
  let array = collections.Int8Array.from([]);
  return array.reverse().toString();
}

@Concurrent
export function testInt8ArrayTaskPool0126(): string {
  let array = collections.Int8Array.from([1, 2, 3, 4, 5]);
  return array.reverse().toString();
}

@Concurrent
export function testInt8ArrayTaskPool0127(): boolean {
  let array = collections.Int8Array.from([1, 2, 3, 4, 5]);
  let reversed = array.reverse();
  const expectedValues = [5, 4, 3, 2, 1];
  let res = false;
  reversed.forEach((value, index) => {
    res = value === expectedValues[index];
  });
  return res;
}

@Concurrent
export function testInt8ArrayTaskPool0128(): string {
  let buf = new collections.ArrayBuffer(8);
  let arrList = new collections.Int8Array(buf);
  arrList.set([1, 3, 5]);
  return arrList.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0129(): boolean {
  let buf = new collections.ArrayBuffer(8);
  let arrList = new collections.Int8Array(buf);
  arrList.set([1, 3, 5]);
  let res = false;
  arrList.forEach((value, index, array) => {
    res = array.toString() === "1,3,5,0,0,0,0,0";
  });
  return res;
}

@Concurrent
export function testInt8ArrayTaskPool0130(): string {
  let errorMessage = "";
  try {
    let buf = new collections.ArrayBuffer(8);
    let arrList = new collections.Int8Array(buf);
    arrList.set([1, 3, 5], -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testInt8ArrayTaskPool0131(): string {
  let buf = new collections.ArrayBuffer(8);
  let arrList = new collections.Int8Array(buf);
  arrList.set([1, 3, 5], 0);
  return arrList.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0132(): boolean {
  let buf = new collections.ArrayBuffer(8);
  let arrList = new collections.Int8Array(buf);
  arrList.set([1, 3, 5], 0);
  let rst = false;
  arrList.forEach((value, index, array) => {
    rst = true;
  });
  let res1 = arrList.toString() === "1,3,5,0,0,0,0,0";
  return res1 && rst ;
}

@Concurrent
export function testInt8ArrayTaskPool0133(): string {
  let buf = new collections.ArrayBuffer(8);
  let arrList = new collections.Int8Array(buf);
  arrList.set([1, 3, 5], 2);
  return arrList.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0134(): boolean {
  let buf = new collections.ArrayBuffer(8);
  let arrList = new collections.Int8Array(buf);
  arrList.set([1, 3, 5], 2);
  let rst = false;
  arrList.forEach((value, index, array) => {
    rst = true;
  });
  let res1 = arrList.toString() === "0,0,1,3,5,0,0,0";
  return res1 && rst ;
}

@Concurrent
export function testInt8ArrayTaskPool0135(): string {
  let errorMessage = "";
  try {
    let buf = new collections.ArrayBuffer(8);
    let arrList = new collections.Int8Array(buf);
    arrList.set([1, 3, 5], 10);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testInt8ArrayTaskPool0136(): string {
  let arrList = new collections.Int8Array();
  return arrList.slice(1, 3).toString();
}

@Concurrent
export function testInt8ArrayTaskPool0137(): string {
  let arrList = new collections.Int8Array();
  return arrList.slice().toString();
}

@Concurrent
export function testInt8ArrayTaskPool0138(): string {
  let arrList = new collections.Int8Array([1, 2, 3, 4, 5]);
  return arrList.slice().toString();
}

@Concurrent
export function testInt8ArrayTaskPool0139(): string {
  let arrList = new collections.Int8Array([1, 2, 3, 4, 5]);
  return arrList.slice(undefined, undefined).toString();
}

@Concurrent
export function testInt8ArrayTaskPool0140(): string {
  let arrList = new collections.Int8Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(-1);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0141(): string {
  let arrList = new collections.Int8Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(-1, -1);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0142(): string {
  let arrList = new collections.Int8Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(-1, 0);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0143(): string {
  let arrList = new collections.Int8Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(0, -1);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0144(): string {
  let arrList = new collections.Int8Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(2);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0145(): string {
  let arrList = new collections.Int8Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(10);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0146(): string {
  let arrList = new collections.Int8Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(2, 2);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0147(): string {
  let arrList = new collections.Int8Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(2, 0);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0148(): string {
  let arrList = new collections.Int8Array([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(2, 4);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0149(): string {
  let arrList = new collections.Int8Array();
  let arrListNew = arrList.sort();
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0150(): string {
  let arrList = new collections.Int8Array();
  let arrListNew = arrList.sort((a: number, b: number) => a - b);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0151(): string {
  let arrList = new collections.Int8Array([5, 2, 3, 4, 1]);
  let arrListNew = arrList.sort();
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0152(): string {
  let arrList = new collections.Int8Array([5, 2, 3, 4, 1]);
  let arrListNew = arrList.sort(undefined);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0153(): string {
  let arrList = new collections.Int8Array([5, 2, 3, 4, 1]);
  let arrListNew = arrList.sort((a: number, b: number) => b - a);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0154(): string {
  let arrList = new collections.Int8Array([5, 2, 3, 4, 1]);
  arrList.set([7, 9, 8], 2);
  let arrListNew = arrList.sort();
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0155(): string {
  let arrList = new collections.Int8Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray();
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0156(): string {
  let arrList = new collections.Int8Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(-1);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0157(): string {
  let arrList = new collections.Int8Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(-1, -1);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0158(): string {
  let arrList = new collections.Int8Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(-1, 2);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0159(): string {
  let arrList = new collections.Int8Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(-1, 7);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0160(): string {
  let arrList = new collections.Int8Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(2);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0161(): string {
  let arrList = new collections.Int8Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(2, -1);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0162(): string {
  let arrList = new collections.Int8Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(2, 2);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0163(): string {
  let arrList = new collections.Int8Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(2, 10);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0164(): string {
  let arrList = new collections.Int8Array([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(7, 10);
  return arrListNew.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0165(): string {
  let array = collections.Int8Array.from([]);
  let res = typeof array.at(1);
  return res;
}

@Concurrent
export function testInt8ArrayTaskPool0166(): string {
  let array = collections.Int8Array.from([1, 2, 3]);
  let res = typeof array.at(3);
  return res;
}

@Concurrent
export function testInt8ArrayTaskPool0167(): number | undefined {
  let array = collections.Int8Array.from([1, 2, 3]);
  let res = array.at(-1);
  return res;
}

@Concurrent
export function testInt8ArrayTaskPool0168(): string {
  let array = collections.Int8Array.from([1, 2, 3]);
  let res = typeof array.at(5);
  return res;
}

@Concurrent
export function testInt8ArrayTaskPool0169(): number | undefined {
  let array = collections.Int8Array.from([1, 2, 3]);
  let res = array.at(0);
  return res;
}

@Concurrent
export function testInt8ArrayTaskPool0170(): boolean {
  let array = collections.Int8Array.from([]);
  return array.includes(2);
}

@Concurrent
export function testInt8ArrayTaskPool0171(): boolean {
  let array = collections.Int8Array.from([1, 2, 3]);
  return array.includes(5, -1);
}

@Concurrent
export function testInt8ArrayTaskPool0172(): boolean {
  let array = collections.Int8Array.from([1, 2, 3]);
  return array.includes(3, -1);
}

@Concurrent
export function testInt8ArrayTaskPool0173(): boolean {
  let array = collections.Int8Array.from([1, 2, 3]);
  return array.includes(10);
}

@Concurrent
export function testInt8ArrayTaskPool0174(): boolean {
  let array = collections.Int8Array.from([1, 2, 3]);
  return array.includes(1);
}

@Concurrent
export function testInt8ArrayTaskPool0175(): boolean {
  let array = collections.Int8Array.from([1, 2, 3]);
  return array.includes(1, 5);
}

@Concurrent
export function testInt8ArrayTaskPool0176(): string {
  let array = collections.Int8Array.from([]);
  let iterator: IterableIterator<[number, number]> = array.entries();
  let rst = typeof iterator.next().value;
  return rst;
}

@Concurrent
export function testInt8ArrayTaskPool0177(): string {
  let array = collections.Int8Array.from([1, 2, 3]);
  let iterator: IterableIterator<[number, number]> = array.entries();
  return iterator.next().value.toString();
}

@Concurrent
export function testInt8ArrayTaskPool0178(): number {
  let array = collections.Int8Array.from([]);
  let iterator: IterableIterator<number> = array.keys();
  let tempNum: number = 0;
  for (const key of iterator) {
    tempNum++
  }
  return tempNum;
}

@Concurrent
export function testInt8ArrayTaskPool0179(): string {
  let array = collections.Int8Array.from([-1, 2, 3]);
  let iterator: IterableIterator<number> = array.keys();
  let rst = [iterator.next().value, iterator.next().value, iterator.next().value].toString();
  return rst;
}

@Concurrent
export function testInt8ArrayTaskPool0180(): boolean {
  let array = collections.Int8Array.from([1, 2, 3]);
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
export function testInt8ArrayTaskPool0181(): boolean {
  let array = collections.Int8Array.from([]);
  let iterator: IterableIterator<number> = array.values();
  console.info("iterator values:" + iterator);
  return iterator.next().done === true;
}

@Concurrent
export function testInt8ArrayTaskPool0182(): boolean {
  let array = collections.Int8Array.from([1, 2, 3]);
  let iterator: IterableIterator<number> = array.values();
  console.info("iterator values:" + iterator);
  return iterator.next().value === 1 && iterator.next().value === 2 && iterator.next().value === 3;
}

@Concurrent
export function testInt8ArrayTaskPool0183(): boolean {
  let array = collections.Int8Array.from([1, 2, 3]);
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
export function testInt8ArrayTaskPool0184(): boolean {
  let array = collections.Int8Array.from([1, 2, 3]);
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
export function testInt8ArrayTaskPool0185(): boolean {
  let array = collections.Int8Array.from([1, 2, 3]);
  console.info("array is:" + array);
  return array[-1] === undefined;
}

@Concurrent
export function testInt8ArrayTaskPool0186(): boolean {
  let array = collections.Int8Array.from([1, 2, 3]);
  console.info("array is:" + array);
  return array[5] === undefined;
}

@Concurrent
export function testInt8ArrayTaskPool0187(): boolean {
  let array = collections.Int8Array.from([1, 2, 3]);
  console.info("array is:" + array);
  return array[1] === 2;
}