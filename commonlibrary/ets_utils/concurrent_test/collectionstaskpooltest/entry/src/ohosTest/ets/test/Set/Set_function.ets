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
import { ArkTSUtils, collections } from "@kit.ArkTS";
import { ImplISendableClass, SendableTestClass } from "../ConcurrentUtils/ConcurrentUtils";

export const sleep = (ms: number | undefined) => {
  return new Promise <void>(resolve => setTimeout(resolve, ms));
}

@Concurrent
export function testSet0001(): boolean {
  const setList = new collections.Set<number>([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  let num1 = 0;
  for (let item of setList) {
    num1++;
    if (item !== num1) {
      return false;
    }
  }
  return true;
}

@Concurrent
export function testSet0002(): boolean {
  const setList = new collections.Set<number>();
  let sizeNum = setList.size;
  return sizeNum === 0;
}

@Concurrent
export function testSet0003(): boolean {
  const setList = new collections.Set<number>([1, 2, 3]);
  let sizeNum = setList.size;
  return sizeNum === 3;
}

@Concurrent
export function testSet0004(): boolean {
  const setList = new collections.Set<number>([1, 2, 3]);
  let sizeNum = setList.size;
  if (sizeNum !== 3) {
    return false;
  }
  let rstDel = setList.delete(2);
  if (!rstDel) {
    return false;
  }
  sizeNum = setList.size;
  return sizeNum === 2;
}

@Concurrent
export function testSet0005(): boolean {
  const setList = new collections.Set<number>([1, 2, 3]);
  let sizeNum = setList.size;
  if (sizeNum !== 3) {
    return false;
  }
  setList.add(4);
  sizeNum = setList.size;
  return sizeNum === 4;
}

@Concurrent
export function testSet0006(): boolean {
  const setList = new collections.Set<number>([1, 2, 3]);
  let sizeNum = setList.size;
  if (sizeNum !== 3) {
    return false;
  }
  setList.clear();
  sizeNum = setList.size;
  return sizeNum === 0;
}

@Concurrent
export function testSet0007(): boolean {
  const setList = new collections.Set<number>([1, 2, 3]);
  let sizeNum = setList.size;
  if (sizeNum !== 3) {
    return false;
  }
  setList.add(2);
  sizeNum = setList.size;
  return sizeNum === 3;
}

@Concurrent
export function testSet0008(): boolean {
  const setList = new collections.Set<string>(["one"]);
  setList.add("four");
  const iterator = setList.values();
  if (iterator.next().value.toString() !== "one") {
    return false;
  }
  return iterator.next().value.toString() === "four";
}

@Concurrent
export function testSet0009(): boolean {
  const setList = new collections.Set<string>(["one", "two"]);
  const rst = setList.delete("two");
  if (!rst) {
    return false;
  }
  const iterator = setList.values();
  return iterator.next().value.toString() === "one";
}

@Concurrent
export function testSet0010(): boolean {
  const setList = new collections.Set<string>(["one", "two"]);
  return setList.has("two");
}

@Concurrent
export function testSet0011(): boolean {
  const setList = new collections.Set<number>([1]);
  setList.add(3);
  const iterator = setList.values();
  return iterator.next().value === 1 && iterator.next().value === 3;
}

@Concurrent
export function testSet0012(): boolean {
  const setList = new collections.Set<number>([1, 2]);
  let rst = setList.delete(2);
  if (!rst) {
    return false;
  }
  const iterator = setList.values();
  return iterator.next().value === 1;
}

@Concurrent
export function testSet0013(): boolean {
  const setList = new collections.Set<number>([1, 2]);
  return setList.has(2);
}

@Concurrent
export function testSet0014(): boolean {
  const setList = new collections.Set<boolean>([true]);
  setList.add(false);
  const iterator = setList.values();
  return iterator.next().value === true && iterator.next().value === false;
}

@Concurrent
export function testSet0015(): boolean {
  const setList = new collections.Set<boolean>([true, false]);
  let rst = setList.delete(true);
  if (!rst) {
    return false;
  }
  const iterator = setList.values();
  return iterator.next().value === false;
}

@Concurrent
export function testSet0016(): boolean {
  const setList = new collections.Set<boolean>([true, false]);
  return setList.has(true);
}

@Concurrent
export function testSet0017(): boolean {
  const setList = new collections.Set<undefined>([undefined]);
  setList.add(undefined);
  const iterator = setList.values();
  return iterator.next().value === undefined;
}

@Concurrent
export function testSet0018(): boolean | undefined {
  const setList = new collections.Set<undefined>([undefined]);
  let rst = setList.delete(undefined);
  if (!rst) {
    return false;
  }
  const iterator = setList.values();
  return iterator.next().done && setList.size === 0;
}

@Concurrent
export function testSet0019(): boolean {
  const setList = new collections.Set<undefined>([undefined]);
  return setList.has(undefined);
}

@Concurrent
export function testSet0020(): boolean {
  const setList = new collections.Set<null>([null]);
  setList.add(null);
  const iterator = setList.values();
  return iterator.next().value == null;
}

@Concurrent
export function testSet0021(): boolean | undefined {
  const setList = new collections.Set<null>([null, null]);
  let rst = setList.delete(null);
  if (!rst) {
    return false;
  }
  const iterator = setList.values();
  return iterator.next().done && setList.size === 0;
}

@Concurrent
export function testSet0022(): boolean {
  const setList = new collections.Set<null>([null, null]);
  return setList.has(null);
}

@Concurrent
export function testSet0023(): boolean {
  const setList = new collections.Set<bigint>([555555n]);
  setList.add(99999999n);
  const iterator = setList.values();
  return iterator.next().value === 555555n && iterator.next().value === 99999999n;
}

@Concurrent
export function testSet0024(): boolean {
  const setList = new collections.Set<bigint>([66666666n, 99999999n]);
  let rst = setList.delete(66666666n);
  if (!rst) {
    return false;
  }
  return setList.size === 1 && setList.has(99999999n);
}

@Concurrent
export function testSet0025(): boolean {
  const setList = new collections.Set<bigint>([66666666n, 99999999n]);
  return setList.has(99999999n);
}

@Concurrent
export function testSet0026(): boolean {
  let arrayList = new collections.Array<number>(1, 2, 3);
  const setList = new collections.Set<collections.Array<number>>([arrayList]);
  let arrayList1 = new collections.Array<number>(4, 5, 6);
  setList.add(arrayList1);
  const iterator = setList.values();
  return iterator.next().value.toString() === "1,2,3" &&
    iterator.next().value.toString() === "4,5,6";
}

@Concurrent
export function testSet0027(): boolean {
  let arrayList1 = new collections.Array<number>(1, 2, 3);
  let arrayList2 = new collections.Array<number>(4, 5, 6);
  const setList = new collections.Set<collections.Array<number>>([arrayList1, arrayList2]);
  setList.delete(arrayList1);
  const iterator = setList.values();
  return iterator.next().value.toString() === "4,5,6";
}

@Concurrent
export function testSet0028(): boolean {
  let arrayList1 = new collections.Array<number>(1, 2, 3);
  let arrayList2 = new collections.Array<number>(4, 5, 6);
  const setList = new collections.Set<collections.Array<number>>([arrayList1, arrayList2]);
  return setList.has(arrayList2);
}

@Concurrent
export function testSet0029(): boolean {
  let mapList1 = new collections.Map<number, string>();
  mapList1.set(1, "a");
  const setList = new collections.Set<collections.Map<number, string>>([mapList1]);
  let mapList2 = new collections.Map<number, string>();
  mapList2.set(2, "b");
  setList.add(mapList2);
  const iterator = setList.values();
  return iterator.next()
    .value
    .entries()
    .next()
    .value
    .toString() === "1,a"
    && iterator.next()
      .value
      .entries()
      .next()
      .value
      .toString() === "2,b";
}

@Concurrent
export function testSet0030(): boolean {
  let mapList1 = new collections.Map<number, string>();
  mapList1.set(1, "a");
  let mapList2 = new collections.Map<number, string>();
  mapList2.set(2, "b");
  const setList = new collections.Set<collections.Map<number, string>>([mapList1, mapList2]);
  setList.delete(mapList2);
  const iterator = setList.values();
  return iterator.next()
    .value
    .entries()
    .next()
    .value
    .toString() === "1,a";
}

@Concurrent
export function testSet0031(): boolean {
  let mapList1 = new collections.Map<number, string>();
  mapList1.set(1, "a");
  let mapList2 = new collections.Map<number, string>();
  mapList2.set(2, "b");
  const setList = new collections.Set<collections.Map<number, string>>([mapList1, mapList2]);
  return setList.has(mapList2);
}

@Concurrent
export function testSet0032(): boolean {
  let setList1 = new collections.Set<number>([1]);
  const setList = new collections.Set<collections.Set<number>>([setList1]);
  let setList2 = new collections.Set<number>([2]);
  setList.add(setList2);
  const iterator = setList.values();
  return iterator.next()
    .value
    .values()
    .next()
    .value
    .toString() === "1" &&
    iterator.next()
      .value
      .values()
      .next()
      .value
      .toString() === "2";
}

@Concurrent
export function testSet0033(): boolean {
  let setList1 = new collections.Set<number>([1]);
  let setList2 = new collections.Set<number>([2]);
  const setList = new collections.Set<collections.Set<number>>([setList1, setList2]);
  setList.delete(setList1);
  const iterator = setList.values();
  return iterator.next()
    .value
    .values()
    .next()
    .value
    .toString() === "2";
}

@Concurrent
export function testSet0034(): boolean {
  let setList1 = new collections.Set<number>([1]);
  let setList2 = new collections.Set<number>([2]);
  const setList = new collections.Set<collections.Set<number>>([setList1, setList2]);
  return setList.has(setList1);
}

@Concurrent
export function testSet0035(): boolean {
  let arrayBuf1 = new collections.ArrayBuffer(5);
  const setList = new collections.Set<collections.ArrayBuffer>([arrayBuf1]);
  let arrayBuf2 = new collections.ArrayBuffer(3);
  setList.add(arrayBuf2);
  const iterator = setList.values();
  return iterator.next().value.byteLength === 5 &&
    iterator.next().value.byteLength === 3;
}

@Concurrent
export function testSet0036(): boolean {
  let arrayBuf1 = new collections.ArrayBuffer(5);
  let arrayBuf2 = new collections.ArrayBuffer(3);
  const setList = new collections.Set<collections.ArrayBuffer>([arrayBuf1, arrayBuf2]);
  setList.delete(arrayBuf2);
  const iterator = setList.values();
  return iterator.next().value.byteLength === 5;
}

@Concurrent
export function testSet0037(): boolean {
  let arrayBuf1 = new collections.ArrayBuffer(5);
  let arrayBuf2 = new collections.ArrayBuffer(3);
  const setList = new collections.Set<collections.ArrayBuffer>([arrayBuf1, arrayBuf2]);
  return setList.has(arrayBuf2);
}

@Concurrent
export function testSet0038(): boolean {
  let int8ArrayList1 = new collections.Int8Array([1, 3, 5]);
  const setList = new collections.Set<collections.Int8Array>([int8ArrayList1]);
  let int8ArrayList2 = new collections.Int8Array([7, 9, 11]);
  setList.add(int8ArrayList2);
  const iterator = setList.values();
  return iterator.next().value.toString() === "1,3,5" &&
    iterator.next().value.toString() === "7,9,11";
}

@Concurrent
export function testSet0039(): boolean {
  let int8ArrayList1 = new collections.Int8Array([1, 3, 5]);
  let int8ArrayList2 = new collections.Int8Array([7, 9, 11]);
  const setList = new collections.Set<collections.Int8Array>([int8ArrayList1, int8ArrayList2]);
  setList.delete(int8ArrayList1);
  const iterator = setList.values();
  return iterator.next().value.toString() === "7,9,11";
}

@Concurrent
export function testSet0040(): boolean {
  let int8ArrayList1 = new collections.Int8Array([1, 3, 5]);
  let int8ArrayList2 = new collections.Int8Array([7, 9, 11]);
  const setList = new collections.Set<collections.Int8Array>([int8ArrayList1, int8ArrayList2]);
  return setList.has(int8ArrayList2);
}

@Concurrent
export function testSet0041(): boolean {
  let uint8ArrayList1 = new collections.Uint8Array([1, 3, 5]);
  const setList = new collections.Set<collections.Uint8Array>([uint8ArrayList1]);
  let uint8ArrayList2 = new collections.Uint8Array([7, 9, 11]);
  setList.add(uint8ArrayList2);
  const iterator = setList.values();
  return iterator.next().value.toString() === "1,3,5" &&
    iterator.next().value.toString() === "7,9,11";
}

@Concurrent
export function testSet0042(): boolean {
  let uint8ArrayList1 = new collections.Uint8Array([1, 3, 5]);
  let uint8ArrayList2 = new collections.Uint8Array([7, 9, 11]);
  const setList = new collections.Set<collections.Uint8Array>([uint8ArrayList1, uint8ArrayList2]);
  setList.delete(uint8ArrayList1);
  const iterator = setList.values();
  return iterator.next().value.toString() === "7,9,11";
}

@Concurrent
export function testSet0043(): boolean {
  let uint8ArrayList1 = new collections.Uint8Array([1, 3, 5]);
  let uint8ArrayList2 = new collections.Uint8Array([7, 9, 11]);
  const setList = new collections.Set<collections.Uint8Array>([uint8ArrayList1, uint8ArrayList2]);
  return setList.has(uint8ArrayList2);
}

@Concurrent
export function testSet0044(): boolean {
  let uint8ClampedArrayList1 = new collections.Uint8ClampedArray([1, 3, 5]);
  const setList = new collections.Set<collections.Uint8ClampedArray>([uint8ClampedArrayList1]);
  let uint8ClampedArrayList2 = new collections.Uint8ClampedArray([7, 9, 11]);
  setList.add(uint8ClampedArrayList2);
  const iterator = setList.values();
  return iterator.next().value.toString() === "1,3,5" &&
    iterator.next().value.toString() === "7,9,11";
}

@Concurrent
export function testSet0045(): boolean {
  let uint8ClampedArrayList1 = new collections.Uint8ClampedArray([1, 3, 5]);
  let uint8ClampedArrayList2 = new collections.Uint8ClampedArray([7, 9, 11]);
  const setList = new collections.Set<collections.Uint8ClampedArray>([uint8ClampedArrayList1, uint8ClampedArrayList2]);
  setList.delete(uint8ClampedArrayList1);
  const iterator = setList.values();
  return iterator.next().value.toString() === "7,9,11";
}

@Concurrent
export function testSet0046(): boolean {
  let uint8ClampedArrayList1 = new collections.Uint8ClampedArray([1, 3, 5]);
  let uint8ClampedArrayList2 = new collections.Uint8ClampedArray([7, 9, 11]);
  const setList = new collections.Set<collections.Uint8ClampedArray>([uint8ClampedArrayList1, uint8ClampedArrayList2]);
  return setList.has(uint8ClampedArrayList2);
}

@Concurrent
export function testSet0047(): boolean {
  let int16ArrayList1 = new collections.Int16Array([1, 3, 5]);
  const setList = new collections.Set<collections.Int16Array>([int16ArrayList1]);
  let int16ArrayList2 = new collections.Int16Array([7, 9, 11]);
  setList.add(int16ArrayList2);
  const iterator = setList.values();
  return iterator.next().value.toString() === "1,3,5" &&
    iterator.next().value.toString() === "7,9,11";
}

@Concurrent
export function testSet0048(): boolean {
  let int16ArrayList1 = new collections.Int16Array([1, 3, 5]);
  let int16ArrayList2 = new collections.Int16Array([7, 9, 11]);
  const setList = new collections.Set<collections.Int16Array>([int16ArrayList1, int16ArrayList2]);
  setList.delete(int16ArrayList1);
  const iterator = setList.values();
  return iterator.next().value.toString() === "7,9,11";
}

@Concurrent
export function testSet0049(): boolean {
  let int16ArrayList1 = new collections.Int16Array([1, 3, 5]);
  let int16ArrayList2 = new collections.Int16Array([7, 9, 11]);
  const setList = new collections.Set<collections.Int16Array>([int16ArrayList1, int16ArrayList2]);
  return setList.has(int16ArrayList2);
}

@Concurrent
export function testSet0050(): boolean {
  let uint16ArrayList1 = new collections.Uint16Array([1, 3, 5]);
  const setList = new collections.Set<collections.Uint16Array>([uint16ArrayList1]);
  let uint16ArrayList2 = new collections.Uint16Array([7, 9, 11]);
  setList.add(uint16ArrayList2);
  const iterator = setList.values();
  return iterator.next().value.toString() === "1,3,5" &&
    iterator.next().value.toString() === "7,9,11";
}

@Concurrent
export function testSet0051(): boolean {
  let uint16ArrayList1 = new collections.Uint16Array([1, 3, 5]);
  let uint16ArrayList2 = new collections.Uint16Array([7, 9, 11]);
  const setList = new collections.Set<collections.Uint16Array>([uint16ArrayList1, uint16ArrayList2]);
  setList.delete(uint16ArrayList1);
  const iterator = setList.values();
  return iterator.next().value.toString() === "7,9,11";
}

@Concurrent
export function testSet0052(): boolean {
  let uint16ArrayList1 = new collections.Uint16Array([1, 3, 5]);
  let uint16ArrayList2 = new collections.Uint16Array([7, 9, 11]);
  const setList = new collections.Set<collections.Uint16Array>([uint16ArrayList1, uint16ArrayList2]);
  return setList.has(uint16ArrayList2);
}

@Concurrent
export function testSet0053(): boolean {
  let int32ArrayList1 = new collections.Int32Array([1, 3, 5]);
  const setList = new collections.Set<collections.Int32Array>([int32ArrayList1]);
  let int32ArrayList2 = new collections.Int32Array([7, 9, 11]);
  setList.add(int32ArrayList2);
  const iterator = setList.values();
  return iterator.next().value.toString() === "1,3,5" &&
    iterator.next().value.toString() === "7,9,11";
}

@Concurrent
export function testSet0054(): boolean {
  let int32ArrayList1 = new collections.Int32Array([1, 3, 5]);
  let int32ArrayList2 = new collections.Int32Array([7, 9, 11]);
  const setList = new collections.Set<collections.Int32Array>([int32ArrayList1, int32ArrayList2]);
  setList.delete(int32ArrayList1);
  const iterator = setList.values();
  return iterator.next().value.toString() === "7,9,11";
}

@Concurrent
export function testSet0055(): boolean {
  let int32ArrayList1 = new collections.Int32Array([1, 3, 5]);
  let int32ArrayList2 = new collections.Int32Array([7, 9, 11]);
  const setList = new collections.Set<collections.Int32Array>([int32ArrayList1, int32ArrayList2]);
  return setList.has(int32ArrayList2);
}

@Concurrent
export function testSet0056(): boolean {
  let float32ArrayList1 = new collections.Float32Array([1.5, 3.5, 5.5]);
  const setList = new collections.Set<collections.Float32Array>([float32ArrayList1]);
  let float32ArrayList2 = new collections.Float32Array([7.5, 9.5, 11.5]);
  setList.add(float32ArrayList2);
  const iterator = setList.values();
  return iterator.next().value.toString() === "1.5,3.5,5.5" &&
    iterator.next().value.toString() === "7.5,9.5,11.5";
}

@Concurrent
export function testSet0057(): boolean {
  let float32ArrayList1 = new collections.Float32Array([1.5, 3.5, 5.5]);
  let float32ArrayList2 = new collections.Float32Array([7.5, 9.5, 11.5]);
  const setList = new collections.Set<collections.Float32Array>([float32ArrayList1, float32ArrayList2]);
  setList.delete(float32ArrayList1);
  const iterator = setList.values();
  return iterator.next().value.toString() === "7.5,9.5,11.5";
}

@Concurrent
export function testSet0058(): boolean {
  let float32ArrayList1 = new collections.Float32Array([1.5, 3.5, 5.5]);
  let float32ArrayList2 = new collections.Float32Array([7.5, 9.5, 11.5]);
  const setList = new collections.Set<collections.Float32Array>([float32ArrayList1, float32ArrayList2]);
  return setList.has(float32ArrayList2);
}

@Concurrent
export function testSet0059(): boolean {
  let uint32ArrayList1 = new collections.Uint32Array([1, 3, 5]);
  const setList = new collections.Set<collections.Uint32Array>([uint32ArrayList1]);
  let uint32ArrayList2 = new collections.Uint32Array([7, 9, 11]);
  setList.add(uint32ArrayList2);
  const iterator = setList.values();
  return iterator.next().value.toString() === "1,3,5" &&
    iterator.next().value.toString() === "7,9,11";
}

@Concurrent
export function testSet0060(): boolean {
  let uint32ArrayList1 = new collections.Uint32Array([1, 3, 5]);
  let uint32ArrayList2 = new collections.Uint32Array([7, 9, 11]);
  const setList = new collections.Set<collections.Uint32Array>([uint32ArrayList1, uint32ArrayList2]);
  setList.delete(uint32ArrayList1);
  const iterator = setList.values();
  return iterator.next().value.toString() === "7,9,11";
}

@Concurrent
export function testSet0061(): boolean {
  let uint32ArrayList1 = new collections.Uint32Array([1, 3, 5]);
  let uint32ArrayList2 = new collections.Uint32Array([7, 9, 11]);
  const setList = new collections.Set<collections.Uint32Array>([uint32ArrayList1, uint32ArrayList2]);
  return setList.has(uint32ArrayList2);
}

@Concurrent
export function testSet0062(): boolean {
  let concatArrayList1: collections.ConcatArray<number> = new collections.Array<number>(1, 3, 5);
  let concatArrayList2: collections.ConcatArray<number> = new collections.Array<number>(2, 4, 6);
  const setList = new collections.Set<collections.ConcatArray<number>>([concatArrayList1]);
  setList.add(concatArrayList2);
  const iterator = setList.values();
  return iterator.next().value.toString() === "1,3,5" &&
    iterator.next().value.toString() === "2,4,6";
}

@Concurrent
export function testSet0063(): boolean {
  let concatArrayList1: collections.ConcatArray<number> = new collections.Array<number>(1, 3, 5);
  let concatArrayList2: collections.ConcatArray<number> = new collections.Array<number>(2, 4, 6);
  const setList = new collections.Set<collections.ConcatArray<number>>([concatArrayList1, concatArrayList2]);
  setList.delete(concatArrayList1);
  const iterator = setList.values();
  return iterator.next().value.toString() === "2,4,6";
}

@Concurrent
export function testSet0064(): boolean {
  let concatArrayList1: collections.ConcatArray<number> = new collections.Array<number>(1, 3, 5);
  let concatArrayList2: collections.ConcatArray<number> = new collections.Array<number>(2, 4, 6);
  const setList = new collections.Set<collections.ConcatArray<number>>([concatArrayList1, concatArrayList2]);
  return setList.has(concatArrayList1);
}

@Concurrent
export function testSet0065(): boolean {
  let concatArrayList1: collections.ConcatArray<number> = new collections.Array<number>(1, 3, 5);
  let concatArrayList2: collections.ConcatArray<number> = new collections.Array<number>(2, 4, 6);
  const setList = new collections.Set<collections.ConcatArray<number>>([concatArrayList1, concatArrayList2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0066(): boolean {
  let arrayList1 = new collections.Array<number>(1, 2, 3);
  let arrayList2 = new collections.Array<number>(4, 5, 6);
  const setList = new collections.Set<collections.Array<number>>([arrayList1, arrayList2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0067(): boolean {
  let mapList1 = new collections.Map<number, string>();
  mapList1.set(1, "a");
  let mapList2 = new collections.Map<number, string>();
  mapList2.set(2, "b");
  const setList = new collections.Set<collections.Map<number, string>>([mapList1, mapList2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0068(): boolean {
  let setList1 = new collections.Set<number>([1]);
  let setList2 = new collections.Set<number>([2]);
  const setList = new collections.Set<collections.Set<number>>([setList1, setList2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0069(): boolean {
  const setList = new collections.Set<string>(["one", "two"]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0070(): boolean {
  const setList = new collections.Set<number>([1, 2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0071(): boolean {
  const setList = new collections.Set<boolean>([true, false]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0072(): boolean {
  const setList = new collections.Set<undefined>([undefined]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0073(): boolean {
  const setList = new collections.Set<null>([null, null]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0074(): boolean {
  const setList = new collections.Set<bigint>([66666666n, 99999999n]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0075(): boolean {
  let arrayBuf1 = new collections.ArrayBuffer(5);
  let arrayBuf2 = new collections.ArrayBuffer(3);
  const setList = new collections.Set<collections.ArrayBuffer>([arrayBuf1, arrayBuf2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0076(): boolean {
  let int8ArrayList1 = new collections.Int8Array([1, 3, 5]);
  let int8ArrayList2 = new collections.Int8Array([7, 9, 11]);
  const setList = new collections.Set<collections.Int8Array>([int8ArrayList1, int8ArrayList2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0077(): boolean {
  let uint8ArrayList1 = new collections.Uint8Array([1, 3, 5]);
  let uint8ArrayList2 = new collections.Uint8Array([7, 9, 11]);
  const setList = new collections.Set<collections.Uint8Array>([uint8ArrayList1, uint8ArrayList2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0078(): boolean {
  let uint8ClampedArrayList1 = new collections.Uint8ClampedArray([1, 3, 5]);
  let uint8ClampedArrayList2 = new collections.Uint8ClampedArray([7, 9, 11]);
  const setList =
    new collections.Set<collections.Uint8ClampedArray>([uint8ClampedArrayList1, uint8ClampedArrayList2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0079(): boolean {
  let int16ArrayList1 = new collections.Int16Array([1, 3, 5]);
  let int16ArrayList2 = new collections.Int16Array([7, 9, 11]);
  const setList = new collections.Set<collections.Int16Array>([int16ArrayList1, int16ArrayList2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0080(): boolean {
  let uint16ArrayList1 = new collections.Uint16Array([1, 3, 5]);
  let uint16ArrayList2 = new collections.Uint16Array([7, 9, 11]);
  const setList = new collections.Set<collections.Uint16Array>([uint16ArrayList1, uint16ArrayList2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0081(): boolean {
  let int32ArrayList1 = new collections.Int32Array([1, 3, 5]);
  let int32ArrayList2 = new collections.Int32Array([7, 9, 11]);
  const setList = new collections.Set<collections.Int32Array>([int32ArrayList1, int32ArrayList2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0082(): boolean {
  let uint32ArrayList1 = new collections.Uint32Array([1, 3, 5]);
  let uint32ArrayList2 = new collections.Uint32Array([7, 9, 11]);
  const setList = new collections.Set<collections.Uint32Array>([uint32ArrayList1, uint32ArrayList2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0083(): boolean {
  let float32ArrayList1 = new collections.Float32Array([1.5, 3.5, 5.5]);
  let float32ArrayList2 = new collections.Float32Array([7.5, 9.5, 11.5]);
  const setList = new collections.Set<collections.Float32Array>([float32ArrayList1, float32ArrayList2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0084(): boolean {
  let bitVectorList1 = new collections.BitVector(0);
  bitVectorList1.push(0);
  let bitVectorList2 = new collections.BitVector(0);
  bitVectorList2.push(1);
  const setList = new collections.Set<collections.BitVector>([bitVectorList1]);
  setList.add(bitVectorList2);
  const iterator = setList.values();
  return iterator.next()
    .value
    .values()
    .next()
    .value === 0 &&
    iterator.next()
      .value
      .values()
      .next()
      .value === 1;
}

@Concurrent
export function testSet0085(): boolean {
  let bitVectorList1 = new collections.BitVector(0);
  bitVectorList1.push(0);
  let bitVectorList2 = new collections.BitVector(0);
  bitVectorList2.push(1);
  const setList = new collections.Set<collections.BitVector>([bitVectorList1, bitVectorList2]);
  setList.delete(bitVectorList1);
  const iterator = setList.values();
  return iterator.next()
    .value
    .values()
    .next()
    .value === 1;
}

@Concurrent
export function testSet0086(): boolean {
  let bitVectorList1 = new collections.BitVector(0);
  bitVectorList1.push(0);
  let bitVectorList2 = new collections.BitVector(0);
  bitVectorList2.push(1);
  const setList = new collections.Set<collections.BitVector>([bitVectorList1, bitVectorList2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0087(): boolean {
  let bitVectorList1 = new collections.BitVector(0);
  bitVectorList1.push(0);
  let bitVectorList2 = new collections.BitVector(0);
  bitVectorList2.push(1);
  const setList = new collections.Set<collections.BitVector>([bitVectorList1, bitVectorList2]);
  return setList.has(bitVectorList2);
}

@Concurrent
export function testSet0088(): boolean {
  let lock1 = new ArkTSUtils.locks.AsyncLock();
  let lock2 = new ArkTSUtils.locks.AsyncLock();
  const setList = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock1]);
  setList.add(lock2);
  return setList.size === 2;
}

@Concurrent
export function testSet0089(): boolean {
  let lock1 = ArkTSUtils.locks.AsyncLock.request("lock1");
  let lock2 = ArkTSUtils.locks.AsyncLock.request("lock2");
  const setList = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock1, lock2]);
  setList.delete(lock1);
  return setList.size === 1;
}

@Concurrent
export function testSet0090(): boolean {
  let lock1 = ArkTSUtils.locks.AsyncLock.request("lock1");
  let lock2 = ArkTSUtils.locks.AsyncLock.request("lock2");
  const setList = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock1, lock2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0091(): boolean {
  let lock1 = ArkTSUtils.locks.AsyncLock.request("lock1");
  let lock2 = ArkTSUtils.locks.AsyncLock.request("lock2");
  const setList = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock1, lock2]);
  return setList.has(lock1);
}

@Concurrent
export function testSet0092(): boolean {
  let sendableClass1 = new SendableTestClass();
  sendableClass1.num = 10;
  let sendableClass2 = new SendableTestClass();
  sendableClass2.num = 20;
  const setList = new collections.Set<SendableTestClass>([sendableClass1]);
  setList.add(sendableClass2);
  const iterator = setList.values();
  return iterator.next().value.getNum() === 10 &&
    iterator.next().value.getNum() === 20;
}

@Concurrent
export function testSet0093(): boolean {
  let sendableClass1 = new SendableTestClass();
  sendableClass1.num = 10;
  let sendableClass2 = new SendableTestClass();
  sendableClass2.num = 20;
  const setList = new collections.Set<SendableTestClass>([sendableClass1, sendableClass2]);
  setList.delete(sendableClass1);
  const iterator = setList.values();
  return iterator.next().value.getNum() === 20;
}

@Concurrent
export function testSet0094(): boolean {
  let sendableClass1 = new SendableTestClass();
  sendableClass1.num = 10;
  let sendableClass2 = new SendableTestClass();
  sendableClass2.num = 20;
  const setList = new collections.Set<SendableTestClass>([sendableClass1, sendableClass2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0095(): boolean {
  let sendableClass1 = new SendableTestClass();
  sendableClass1.num = 10;
  let sendableClass2 = new SendableTestClass();
  sendableClass2.num = 20;
  const setList = new collections.Set<SendableTestClass>([sendableClass1, sendableClass2]);
  return setList.has(sendableClass2);
}

@Concurrent
export function testSet0096(): boolean {
  let union1: number | string = 3;
  let union2: number | string = "abc"
  const setList = new collections.Set<number | string>([union1]);
  setList.add(union2);
  const iterator = setList.values();
  return iterator.next().value.toString() === "3" &&
    iterator.next().value.toString() === "abc";
}

@Concurrent
export function testSet0097(): boolean {
  let union1: number | string = 3;
  let union2: number | string = "abc"
  const setList = new collections.Set<number | string>([union1, union2]);
  setList.delete(union1);
  const iterator = setList.values();
  return iterator.next().value.toString() === "abc";
}

@Concurrent
export function testSet0098(): boolean {
  let union1: number | string = 3;
  let union2: number | string = "abc"
  const setList = new collections.Set<number | string>([union1, union2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0099(): boolean {
  let union1: number | string = 3;
  let union2: number | string = "abc"
  const setList = new collections.Set<number | string>([union1, union2]);
  return setList.has(union1);
}

@Concurrent
export function testSet0100(): boolean {
  let sendableClass1 = new ImplISendableClass();
  sendableClass1.count = 6;
  let sendableClass2 = new ImplISendableClass();
  sendableClass2.count = 8;
  const setList = new collections.Set<ImplISendableClass>([sendableClass1]);
  setList.add(sendableClass2);
  const iterator = setList.values();
  return iterator.next().value.getNum() === 6 &&
    iterator.next().value.getNum() === 8;
}

@Concurrent
export function testSet0101(): boolean {
  let sendableClass1 = new ImplISendableClass();
  sendableClass1.count = 6;
  let sendableClass2 = new ImplISendableClass();
  sendableClass2.count = 8;
  const setList = new collections.Set<ImplISendableClass>([sendableClass1, sendableClass2]);
  setList.delete(sendableClass1);
  const iterator = setList.values();
  return iterator.next().value.getNum() === 8;
}

@Concurrent
export function testSet0102(): boolean {
  let sendableClass1 = new ImplISendableClass();
  sendableClass1.count = 6;
  let sendableClass2 = new ImplISendableClass();
  sendableClass2.count = 8;
  const setList = new collections.Set<ImplISendableClass>([sendableClass1, sendableClass2]);
  setList.clear();
  return setList.size === 0;
}

@Concurrent
export function testSet0103(): boolean {
  let sendableClass1 = new ImplISendableClass();
  sendableClass1.count = 6;
  let sendableClass2 = new ImplISendableClass();
  sendableClass2.count = 8;
  const setList = new collections.Set<ImplISendableClass>([sendableClass1, sendableClass2]);
  return setList.has(sendableClass1);
}

@Concurrent
export function testSet0104(): boolean {
  const setList = new collections.Set<number>();
  const iterator = setList.entries();
  return iterator.next().value == null;
}

@Concurrent
export function testSet0105(): boolean {
  const setList = new collections.Set<number>([2, 4, 6]);
  const iterator = setList.entries();
  return iterator.next().value.toString() === "2,2" &&
    iterator.next().value.toString() === "4,4" &&
    iterator.next().value.toString() === "6,6";
}

@Concurrent
export function testSet0106(): boolean {
  const setList = new collections.Set<number>([1, 3]);
  setList.add(2);
  const iterator = setList.entries();
  return iterator.next().value.toString() === "1,1" &&
    iterator.next().value.toString() === "3,3" &&
    iterator.next().value.toString() === "2,2";
}

@Concurrent
export function testSet0107(): boolean {
  const setList = new collections.Set<number>([1, 2, 3]);
  let rst = setList.delete(2);
  if (!rst) {
    return false;
  }
  const iterator = setList.entries();
  return iterator.next().value.toString() === "1,1" &&
    iterator.next().value.toString() === "3,3";
}

@Concurrent
export function testSet0108(): boolean {
  const setList = new collections.Set<number>([1, 2, 3]);
  setList.clear();
  const iterator = setList.entries();
  return iterator.next().value == null;
}

@Concurrent
export function testSet0109(): boolean {
  const setList = new collections.Set<number>();
  let rstNum = 1;
  setList.forEach((value1, value2, setList) => {
    rstNum = value1;
  });
  return setList.size === 0 && rstNum === 1;
}

@Concurrent
export function testSet0110(): boolean {
  const setList = new collections.Set<number>([3, 5]);
  let rstNum = 0;
  setList.forEach((value1, value2, setList) => {
    rstNum = value1 + value2;
  });
  return rstNum === 10;
}

@Concurrent
export function testSet0111(): boolean {
  const setList = new collections.Set<number>([3, 5]);
  let rstNum = 0;
  setList.add(7);
  setList.forEach((value1, value2, setList) => {
    rstNum = value1 + value2;
  });
  return rstNum === 14;
}

@Concurrent
export function testSet0112(): boolean {
  const setList = new collections.Set<number>([3, 5]);
  let rst = setList.delete(3);
  if (!rst) {
    return false;
  }
  let rstNum = 0;
  setList.forEach((value1, value2, setList) => {
    rstNum = value1 + value2;
  });
  return rstNum === 10;
}

@Concurrent
export function testSet0113(): boolean {
  const setList = new collections.Set<number>([3, 5]);
  setList.clear();
  let rstNum = 0;
  setList.forEach((value1, value2, setList) => {
    rstNum = value1 + value2;
  });
  return rstNum === 0 && setList.size === 0;
}

@Concurrent
export function testSet0114(): boolean | undefined {
  const setList = new collections.Set<number>();
  const iterator = setList.keys();
  return iterator.next().done;
}

@Concurrent
export function testSet0115(): boolean {
  const setList = new collections.Set<number>([3, 5, 7]);
  const iterator = setList.keys();
  return iterator.next().value === 3 &&
    iterator.next().value === 5 &&
    iterator.next().value === 7;
}

@Concurrent
export function testSet0116(): boolean | undefined {
  const setList = new collections.Set<string>();
  const iterator = setList.values();
  return iterator.next().done;
}

@Concurrent
export function testSet0117(): boolean {
  const setList = new collections.Set<string>(["a", "b", "c"]);
  const iterator = setList.values();
  return iterator.next().value === "a" &&
    iterator.next().value === "b" &&
    iterator.next().value === "c";
}

@Concurrent
export function testSet0118(): boolean {
  const setList = new collections.Set<string>(["a", "b", "c"]);
  setList.add("abc");
  const iterator = setList.values();
  return iterator.next().value === "a" &&
    iterator.next().value === "b" &&
    iterator.next().value === "c" &&
    iterator.next().value === "abc";
}

@Concurrent
export function testSet0119(): boolean {
  const setList = new collections.Set<string>(["a", "b", "c"]);
  let rst = setList.delete("a");
  if (!rst) {
    return false;
  }
  const iterator = setList.values();
  return iterator.next().value === "b" &&
    iterator.next().value === "c";
}

@Concurrent
export function testSet0120(): boolean {
  const setList = new collections.Set<string>(["a", "b", "c"]);
  setList.clear();
  const iterator = setList.values();
  return iterator.next().value == null;
}

@Concurrent
export function testSet0121(): boolean {
  const setList = new collections.Set<number>();
  setList.clear();
  const iterator = setList.values();
  return iterator.next().value == null && setList.size === 0;
}

@Concurrent
export function testSet0122(): boolean {
  const setList = new collections.Set<number>([1, 2, 3]);
  setList.clear();
  const iterator = setList.values();
  return iterator.next().value == null && setList.size === 0;
}

@Concurrent
export function testSet0123(): boolean {
  const setList = new collections.Set<number>([1, 2, 3]);
  setList.clear();
  let rst1 = setList.size == 0;
  setList.add(3);
  const iterator = setList.values();
  let rst2 = iterator.next().value == 3;
  let rst3 = setList.size == 1;
  return rst1 && rst2 && rst3;
}

@Concurrent
export function testSet0124(): boolean {
  const setList = new collections.Set<number>([1, 3, 5]);
  let rst = setList.delete(2);
  return !rst;
}

@Concurrent
export function testSet0125(): boolean {
  const setList = new collections.Set<number>([1, 3, 5]);
  let rst = setList.delete(3);
  if (!rst) {
    return false;
  }
  const iterator = setList.values();
  return iterator.next().value === 1 &&
    iterator.next().value === 5;
}

@Concurrent
export function testSet0126(): boolean {
  const setList = new collections.Set<null>([null]);
  let rst = setList.delete(null);
  if (!rst) {
    return false;
  }
  return setList.size === 0;
}

@Concurrent
export function testSet0127(): boolean {
  const setList = new collections.Set<undefined>([undefined]);
  let rst = setList.delete(undefined);
  if (!rst) {
    return false;
  }
  return setList.size === 0;
}

@Concurrent
export function testSet0128(): boolean {
  const setList = new collections.Set<number>([1, 2, 3]);
  return !setList.has(5);
}

@Concurrent
export function testSet0129(): boolean {
  const setList = new collections.Set<number>([1, 2, 3]);
  return setList.has(2);
}

@Concurrent
export function testSet0130(): boolean {
  const setList = new collections.Set<null>([null]);
  return setList.has(null);
}

@Concurrent
export function testSet0131(): boolean {
  const setList = new collections.Set<undefined>([undefined]);
  return setList.has(undefined);
}

@Concurrent
export function testSet0132(): boolean {
  const setList = new collections.Set<number>([1, 2]);
  setList.add(3);
  const iterator = setList.values();
  return iterator.next().value === 1 &&
    iterator.next().value === 2 &&
    iterator.next().value === 3;
}

@Concurrent
export function testSet0133(): boolean {
  const setList = new collections.Set<number>([1, 2, 3]);
  setList.add(3);
  const iterator = setList.values();
  return iterator.next().value === 1 &&
    iterator.next().value === 2 &&
    iterator.next().value === 3 &&
    setList.size === 3;
}

@Concurrent
export function testSet0134(): boolean {
  const setList = new collections.Set<null>([null]);
  setList.add(null);
  const iterator = setList.values();
  return iterator.next().value == null &&
    setList.size === 1;
}

@Concurrent
export function testSet0135(): boolean {
  const setList = new collections.Set<undefined>([undefined]);
  setList.add(undefined);
  const iterator = setList.values();
  return iterator.next().value === undefined &&
    setList.size === 1;
}