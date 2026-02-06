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
export function testUint8ClampedArrayTaskPool0001(): string {
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(10);
  let expectedValues: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  uint8ClampedArray.set(expectedValues);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0002(): string {
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(10);
  const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  uint8ClampedArray.set(expectedValues);
  const normalArray: number[] = [...uint8ClampedArray];
  return normalArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0003(): boolean {
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray();
  return uint8ClampedArray instanceof collections.Uint8ClampedArray;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0004(): string {
  let errorMessage = "";
  try {
    new collections.Uint8ClampedArray(-1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ClampedArrayTaskPool0005(): number {
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(0);
  return uint8ClampedArray.length;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0006(): number {
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(10);
  return uint8ClampedArray.length;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0007(): number {
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(100000);
  return uint8ClampedArray.length;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0008(): boolean {
  let arrayLike = [1, 3, 5];
  let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
  return array instanceof collections.Uint8ClampedArray;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0009(): boolean {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
  let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayBuffer);
  return array instanceof collections.Uint8ClampedArray;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0010(): boolean {
  let arrayLike = [1, 3, 5];
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
  let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray);
  return array instanceof collections.Uint8ClampedArray;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0011(): string {
  let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([]);
  let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 0, 0);
  return array.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0012(): string {
  let errorMessage = "";
  try {
    let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint8ClampedArray(uint8ClampedArray.buffer, -1, 0);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ClampedArrayTaskPool0013(): string {
  let errorMessage = "";
  try {
    let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint8ClampedArray(uint8ClampedArray.buffer, -1, -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ClampedArrayTaskPool0014(): string {
  let errorMessage = "";
  try {
    let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint8ClampedArray(uint8ClampedArray.buffer, -1, 2);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ClampedArrayTaskPool0015(): string {
  let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
  let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 0, 0);
  return array.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0016(): string {
  let errorMessage = "";
  try {
    let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 0, -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ClampedArrayTaskPool0017(): string {
  let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
  let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 0, 2);
  return array.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0018(): string {
  let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
  let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 2, 0);
  return array.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0019(): string {
  let errorMessage = "";
  try {
    let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 2, -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ClampedArrayTaskPool0020(): string {
  let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6]);
  let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(uint8ClampedArray.buffer, 2, 2);
  return array.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0021(): string {
  let arrayLike = [1, 3, 5];
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
  return array.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0022(): string {
  let arrayLike = [];
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(arrayLike);
  return array.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0023(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from<number>(
    { length: 5 },
    (v: Object, k: number) => k
  );
  return array.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0024(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from<string>(
    ["1", "3", "5"],
    (v: string, k: number) => parseInt(v)
  );
  return array.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0025(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from<string>(
    "12345",
    (v: string, k: number) => parseInt(v)
  );
  return array.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0026(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from<number>(
    [1, 3, 5],
    (v: number, k: number) => v
  );
  return array.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0027(): string {
  let nestedArray: number[][] = [[1, 2], [3, 4], [5, 6]];
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from<number>(
    ([] as number[]).concat(...nestedArray),
    (v: number) => v
  );
  return array.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0028(): string {
  let set: Set<number> = new Set<number>([1, 2, 3]);
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(set);
  return array.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0029(): string {
  let set: Set<number> = new Set<number>([1, 2, 3]);
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from(
    set,
    (v: number, k: number) => v + k
  );
  return array.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0030(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(3, 1, 3);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0031(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(-1, -1, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0032(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 0, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0033(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 0, 0);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0034(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 0, 2);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0035(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 0, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0036(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 2, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0037(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 2, 0);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0038(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 2, 2);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0039(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 2, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0040(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(-1, 10, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0041(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(0, -1, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0042(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(0, 0, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0043(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(0, 0, 0);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0044(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(0, 0, 2);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0045(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(0, 0, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0046(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(0, 2, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0047(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(0, 2, 0);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0048(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(0, 2, 2);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0049(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(0, 2, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0050(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(0, 10, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0051(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(2, -1, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0052(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(2, 0, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0053(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(2, 0, 0);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0054(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(2, 0, 2);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0055(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(2, 0, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0056(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(2, 2, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0057(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(2, 2, 0);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0058(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(2, 2, 2);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0059(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(2, 2, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0060(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(2, 10, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0061(): string {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8ClampedArray = array.copyWithin(10, 10, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0062(): boolean {
  let arrayLike = [-10, 20, 300, 40, -50];
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
  let res = uint8ClampedArray.some((element: number) => element == 0);
  let res1 = uint8ClampedArray.some((element: number) => element == 255);
  return res && res1;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0063(): boolean {
  let arrayLike = [-10, 20, 300, 40, -50];
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
  return uint8ClampedArray.some((element: number) => element == 300);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0064(): boolean {
  let arrayLike = [-10, 20, 300, 40, -50];
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
  let res = uint8ClampedArray.some((element: number) => element >= 0);
  let res1 = uint8ClampedArray.some((element: number) => element <= 255);
  return res && res1;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0065(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
  return uint8ClampedArray.every((element: number) => element >= 0);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0066(): boolean {
  let arrayLike = [10, 20, 30, 40, 50];
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
  return uint8ClampedArray.every((element: number) => element <= 40);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0067(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);
  return uint8ClampedArray.every((element: number) => element < 20);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0068(): string {
  let arrayLike = [1, 2, 3];
  let uint8ClampedArray1: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4);
  let uint8ClampedArray2: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 1);
  let uint8ClampedArray3: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 1, 2);
  return uint8ClampedArray1.toString()+","+uint8ClampedArray2.toString()+","+uint8ClampedArray3.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0069(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, -1, -1);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0070(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, -1, 0);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0071(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, -1, 2);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0072(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, -1, 10);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0073(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 0, -1);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0074(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 0, 0);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0075(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 0, 2);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0076(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 0, 10);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0077(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 2, -1);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0078(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 2, 0);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0079(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 2, 2);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0080(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 2, 10);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0081(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 10, -1);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0082(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 10, 0);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0083(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 10, 2);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0084(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike).fill(4, 10, 10);
  return uint8ClampedArray.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0085(): string {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8ClampedArray.from(arrayLike);
  let filtered = array.filter((element: number) => element % 2 == 0);
  return filtered.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0086(): number {
  let arrayLike: number[] = [];
  let array = collections.Uint8ClampedArray.from(arrayLike);
  let filtered = array.filter((element: number) => element % 2 == 0);
  return filtered.length;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0087(): string {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8ClampedArray.from(arrayLike);
  let filtered1 = array.filter((element: number) => element > 4);
  array.set([5, 6], 2);
  let filtered2 = array.filter((element: number) => element > 4);
  return filtered1.toString()+' after set is '+filtered2.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0088(): number | undefined {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8ClampedArray.from(arrayLike);
  return array.find((element: number) => element > 2);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0089(): number | undefined {
  let arrayLike: number[] = [];
  let array = collections.Uint8ClampedArray.from(arrayLike);
  return array.find((element: number) => element > 2);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0090(): string {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8ClampedArray.from(arrayLike);
  let res1 = array.find((element: number) => element > 4);
  array.set([5, 6], 2);
  let res2 = array.find((element: number) => element > 4);
  let arrayResult = [typeof res1,res2];
  return  arrayResult.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0091(): undefined | number {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8ClampedArray.from(arrayLike);
  return array.find((index: number) => index == -1);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0092(): undefined | number {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8ClampedArray.from(arrayLike);
  return array.find((index: number) => index == 0);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0093(): undefined | number {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8ClampedArray.from(arrayLike);
  return array.find((index: number) => index == 10);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0094(): boolean {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8ClampedArray.from(arrayLike);
  let condition = (element: number) => element > 0;
  let filtered = array.filter(condition);
  let found = array.find(condition);
  return found == filtered[0];
}

@Concurrent
export function testUint8ClampedArrayTaskPool0095(): number {
  let array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([]);
  return array.findIndex((element: number) => element % 2 === 0);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0096(): number {
  const array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
  return array.findIndex((element: number) => element % 2 === 0);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0097(): number {
  const array: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([1, 3, 5]);
  return array.findIndex((element: number) => element % 2 === 0);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0098(): boolean {
  let uint8ClampedArray = collections.Uint8ClampedArray.from([]);
  let res = false;
  uint8ClampedArray.forEach(() => {
    res = true;
  });
  let res1 = uint8ClampedArray.length === 0;
  let res2 = res === false;
  return res1 && res2;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0099(): boolean {
  let uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3]);
  let res = false;
  uint8ClampedArray.forEach((value, index, array) => {
    res = true;
  });
  console.error(`${uint8ClampedArray.length} failed, error: ${uint8ClampedArray.toString()},${res}`);
  let res1 = uint8ClampedArray.length === 3;
  let  res2 = uint8ClampedArray.toString() === '1,2,3';
  return res1 && res2 && res;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0100(): boolean {
  let uint8ClampedArray = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
  uint8ClampedArray.set([5, 6], 2);
  let res = false;
  uint8ClampedArray.forEach((value, index, array) => {
    res = true;
  });
  let res1 = uint8ClampedArray.length === 5;
  let  res2 = uint8ClampedArray.toString() === '1,2,5,6,5';
  return res1 && res2 && res;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0101(): number {
  let array = collections.Uint8ClampedArray.from([]);
  return array.indexOf(3);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0102(): number {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  return array.indexOf(4);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0103(): number {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  array.set([4, 5], 1);
  return array.indexOf(4);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0104(): number {
  let array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, -1);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0105(): number {
  let array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, 5);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0106(): number {
  let array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0107(): number {
  let array = collections.Uint8ClampedArray.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, 3);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0108(): number {
  let array = collections.Uint8ClampedArray.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, 9);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0109(): string {
  let array = collections.Uint8ClampedArray.from([]);
  return array.join('');
}

@Concurrent
export function testUint8ClampedArrayTaskPool0110(): string {
  let array = collections.Uint8ClampedArray.from([]);
  return array.join('-');
}

@Concurrent
export function testUint8ClampedArrayTaskPool0111(): string {
  let array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
  return array.join();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0112(): string {
  let array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
  return array.join('');
}

@Concurrent
export function testUint8ClampedArrayTaskPool0113(): string {
  let array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
  return array.join(undefined);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0114(): string {
  let array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
  return array.join('/');
}

@Concurrent
export function testUint8ClampedArrayTaskPool0115(): string {
  let array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
  return array.join(',。￥·');
}

@Concurrent
export function testUint8ClampedArrayTaskPool0116(): string {
  let array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
  return array.join('녕하こんйте');
}

@Concurrent
export function testUint8ClampedArrayTaskPool0117(): string {
  let array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
  return array.join('，');
}

@Concurrent
export function testUint8ClampedArrayTaskPool0118(): string {
  let array = new collections.Uint8ClampedArray([]);
  const mapped = array.map(Math.sqrt);
  return mapped.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0119(): boolean {
  let array = new collections.Uint8ClampedArray([25, 36, 49]);
  const mapped = array.map(Math.sqrt);
  let res1 = mapped.toString() === "5,6,7";
  let res2 = mapped.length === 3;
  return res1 && res2;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0120(): boolean {
  let array = new collections.Uint8ClampedArray([25, 36, 49, 100, 225]);
  array.set([81, 64], 2);
  const mapped = array.map(Math.sqrt);
  let res1 = mapped.toString() === "5,6,9,8,15";
  let res2 = mapped.length === 5;
  return res1 && res2;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0121(): string {
  let errorMessage = "";
  try {
    let array = collections.Uint8ClampedArray.from([]);
    array.reduce((accumulator: number, value: number) => accumulator + value);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ClampedArrayTaskPool0122(): number {
  let array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
  return array.reduce((accumulator: number, value: number, index: number) => {
    let newAccumulator = accumulator + value;
    return newAccumulator;
  });
}

@Concurrent
export function testUint8ClampedArrayTaskPool0123(): number {
  const array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
  const initialAccumulator = 8;
  return array.reduce((accumulator: number, value: number, index: number) => {
    const newAccumulator = accumulator + value;
    return newAccumulator;
  }, initialAccumulator);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0124(): string {
  let array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
  let initialValue = "initialValue";
  return array.reduce((accumulator: string, value: number) => accumulator + value, initialValue);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0125(): string {
  let array = collections.Uint8ClampedArray.from([]);
  return array.reverse().toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0126(): string {
  let array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
  return array.reverse().toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0127(): boolean {
  let array = collections.Uint8ClampedArray.from([1, 2, 3, 4, 5]);
  let reversed = array.reverse();
  const expectedValues = [5, 4, 3, 2, 1];
  let res = false;
  reversed.forEach((value, index) => {
    res = value === expectedValues[index];
  });
  return res;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0128(): string {
  let buf = new collections.ArrayBuffer(8);
  let arrList = new collections.Uint8ClampedArray(buf);
  arrList.set([1, 3, 5]);
  return arrList.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0129(): boolean {
  let buf = new collections.ArrayBuffer(8);
  let arrList = new collections.Uint8ClampedArray(buf);
  arrList.set([1, 3, 5]);
  let res = false;
  arrList.forEach((value, index, array) => {
    res = array.toString() === "1,3,5,0,0,0,0,0";
  });
  return res;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0130(): string {
  let errorMessage = "";
  try {
    let buf = new collections.ArrayBuffer(8);
    let arrList = new collections.Uint8ClampedArray(buf);
    arrList.set([1, 3, 5], -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ClampedArrayTaskPool0131(): string {
  let buf = new collections.ArrayBuffer(8);
  let arrList = new collections.Uint8ClampedArray(buf);
  arrList.set([1, 3, 5], 0);
  return arrList.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0132(): boolean {
  let buf = new collections.ArrayBuffer(8);
  let arrList = new collections.Uint8ClampedArray(buf);
  arrList.set([1, 3, 5], 0);
  let rst = false;
  arrList.forEach((value, index, array) => {
    rst = true;
  });
  let res1 = arrList.toString() === "1,3,5,0,0,0,0,0";
  return res1 && rst ;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0133(): string {
  let buf = new collections.ArrayBuffer(8);
  let arrList = new collections.Uint8ClampedArray(buf);
  arrList.set([1, 3, 5], 2);
  return arrList.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0134(): boolean {
  let buf = new collections.ArrayBuffer(8);
  let arrList = new collections.Uint8ClampedArray(buf);
  arrList.set([1, 3, 5], 2);
  let rst = false;
  arrList.forEach((value, index, array) => {
    rst = true;
  });
  let res1 = arrList.toString() === "0,0,1,3,5,0,0,0";
  return res1 && rst ;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0135(): string {
  let errorMessage = "";
  try {
    let buf = new collections.ArrayBuffer(8);
    let arrList = new collections.Uint8ClampedArray(buf);
    arrList.set([1, 3, 5], 10);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ClampedArrayTaskPool0136(): string {
  let arrList = new collections.Uint8ClampedArray();
  return arrList.slice(1, 3).toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0137(): string {
  let arrList = new collections.Uint8ClampedArray();
  return arrList.slice().toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0138(): string {
  let arrList = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
  return arrList.slice().toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0139(): string {
  let arrList = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
  return arrList.slice(undefined, undefined).toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0140(): string {
  let arrList = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(-1);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0141(): string {
  let arrList = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(-1, -1);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0142(): string {
  let arrList = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(-1, 0);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0143(): string {
  let arrList = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(0, -1);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0144(): string {
  let arrList = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(2);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0145(): string {
  let arrList = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(10);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0146(): string {
  let arrList = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(2, 2);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0147(): string {
  let arrList = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(2, 0);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0148(): string {
  let arrList = new collections.Uint8ClampedArray([1, 2, 3, 4, 5]);
  let arrListNew = arrList.slice(2, 4);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0149(): string {
  let arrList = new collections.Uint8ClampedArray();
  let arrListNew = arrList.sort();
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0150(): string {
  let arrList = new collections.Uint8ClampedArray();
  let arrListNew = arrList.sort((a: number, b: number) => a - b);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0151(): string {
  let arrList = new collections.Uint8ClampedArray([5, 2, 3, 4, 1]);
  let arrListNew = arrList.sort();
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0152(): string {
  let arrList = new collections.Uint8ClampedArray([5, 2, 3, 4, 1]);
  let arrListNew = arrList.sort(undefined);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0153(): string {
  let arrList = new collections.Uint8ClampedArray([5, 2, 3, 4, 1]);
  let arrListNew = arrList.sort((a: number, b: number) => b - a);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0154(): string {
  let arrList = new collections.Uint8ClampedArray([5, 2, 3, 4, 1]);
  arrList.set([7, 9, 8], 2);
  let arrListNew = arrList.sort();
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0155(): string {
  let arrList = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray();
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0156(): string {
  let arrList = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(-1);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0157(): string {
  let arrList = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(-1, -1);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0158(): string {
  let arrList = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(-1, 2);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0159(): string {
  let arrList = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(-1, 7);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0160(): string {
  let arrList = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(2);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0161(): string {
  let arrList = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(2, -1);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0162(): string {
  let arrList = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(2, 2);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0163(): string {
  let arrList = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(2, 10);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0164(): string {
  let arrList = new collections.Uint8ClampedArray([1, 3, 5, 7, 9]);
  let arrListNew = arrList.subarray(7, 10);
  return arrListNew.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0165(): string {
  let array = collections.Uint8ClampedArray.from([]);
  let res = typeof array.at(1);
  return res;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0166(): string {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  let res = typeof array.at(3);
  return res;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0167(): number | undefined {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  let res = array.at(-1);
  return res;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0168(): string {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  let res = typeof array.at(5);
  return res;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0169(): number | undefined {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  let res = array.at(0);
  return res;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0170(): boolean {
  let array = collections.Uint8ClampedArray.from([]);
  return array.includes(2);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0171(): boolean {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  return array.includes(5, -1);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0172(): boolean {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  return array.includes(3, -1);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0173(): boolean {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  return array.includes(10);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0174(): boolean {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  return array.includes(1);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0175(): boolean {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  return array.includes(1, 5);
}

@Concurrent
export function testUint8ClampedArrayTaskPool0176(): string {
  let array = collections.Uint8ClampedArray.from([]);
  let iterator: IterableIterator<[number, number]> = array.entries();
  let rst = typeof iterator.next().value;
  return rst;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0177(): string {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  let iterator: IterableIterator<[number, number]> = array.entries();
  return iterator.next().value.toString();
}

@Concurrent
export function testUint8ClampedArrayTaskPool0178(): number {
  let array = collections.Uint8ClampedArray.from([]);
  let iterator: IterableIterator<number> = array.keys();
  let tempNum: number = 0;
  for (const key of iterator) {
    tempNum++
  }
  return tempNum;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0179(): string {
  let array = collections.Uint8ClampedArray.from([-1, 2, 3]);
  let iterator: IterableIterator<number> = array.keys();
  let rst = [iterator.next().value, iterator.next().value, iterator.next().value].toString();
  return rst;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0180(): boolean {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
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
export function testUint8ClampedArrayTaskPool0181(): boolean {
  let array = collections.Uint8ClampedArray.from([]);
  let iterator: IterableIterator<number> = array.values();
  console.info("iterator values:" + iterator);
  return iterator.next().done === true;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0182(): boolean {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  let iterator: IterableIterator<number> = array.values();
  console.info("iterator values:" + iterator);
  return iterator.next().value === 1 && iterator.next().value === 2 && iterator.next().value === 3;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0183(): boolean {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
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
export function testUint8ClampedArrayTaskPool0184(): boolean {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
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
export function testUint8ClampedArrayTaskPool0185(): boolean {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  console.info("array is:" + array);
  return array[-1] === undefined;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0186(): boolean {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  console.info("array is:" + array);
  return array[5] === undefined;
}

@Concurrent
export function testUint8ClampedArrayTaskPool0187(): boolean {
  let array = collections.Uint8ClampedArray.from([1, 2, 3]);
  console.info("array is:" + array);
  return array[1] === 2;
}