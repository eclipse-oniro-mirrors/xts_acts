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
import { ImplISendableClass } from "../ConcurrentUtils/ConcurrentUtils";

export const sleep = (ms: number | undefined) => {
  return new Promise <void>(resolve => setTimeout(resolve, ms));
}

@Concurrent
export function testCollectionsArray0001(): string {
  let newArray: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
  console.info("newArray is: ", newArray);
  let normalArray: number[] = [];
  for (let item of newArray) {
    normalArray.push(item);
  }
  let rst = normalArray.toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0002(): string {
  let newArray: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
  console.info("newArray is: ", newArray);
  const normalArray: number[] = [...newArray];
  console.info("normalArray is: ", normalArray);
  let rst = normalArray.toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0003(): string {
  let array: collections.Array<number> = new collections.Array<number>(1);
  console.info("array is: ", array);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0004(): string {
  let array: collections.Array<string> = new collections.Array<string>('a', 'b');
  console.info("array is: ", array);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0005(): string {
  let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
  console.info("array is: ", array);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0006(): string {
  let array: collections.Array<boolean> = new collections.Array<boolean>(true, false, true);
  console.info("array is: ", array);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0007(): string {
  let array: collections.Array<undefined> = new collections.Array<undefined>(undefined);
  console.info("array is: ", array);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0008(): string {
  let array: collections.Array<null> = new collections.Array<null>(null);
  console.info("array is: ", array);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0009(): string {
  let num1: bigint = 98765432109876543210n;
  let num2: bigint = 12345678901234567890n;
  let array: collections.Array<bigint> = new collections.Array<bigint>(num1, num2);
  console.info("array is: ", array);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0010(): string {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  let concatArray1: collections.ConcatArray<number> = new collections.Array<number>(6, 8);
  let newArray: collections.Array<collections.ConcatArray<number>> =
    new collections.Array<collections.ConcatArray<number>>(concatArray);
  newArray.push(concatArray1);
  console.info("newArray is: ", newArray);
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0011(): string {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  let newArray: collections.Array<collections.ConcatArray<number>> =
    new collections.Array<collections.ConcatArray<number>>(concatArray);
  newArray.pop();
  console.info("newArray is: ", newArray);
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0012(): string {
  let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  let newArray: collections.Array<collections.ConcatArray<number>> =
    new collections.Array<collections.ConcatArray<number>>(concatArray);
  console.info("newArray is: ", newArray);
  console.info("newArray.at(0) is: ", newArray[0]);
  return newArray[0].toString();
}

@Concurrent
export function testCollectionsArray0013(): string {
  let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
  let newArray: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(array);
  let array1: collections.Array<number> = new collections.Array<number>(4, 5, 6);
  newArray.push(array1);
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0014(): string {
  let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
  let newArray: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(array);
  let array1: collections.Array<number> = new collections.Array<number>(4, 5, 6);
  newArray.push(array1);
  let resultBeforePop = newArray.toString();
  newArray.pop();
  let resultAfterPop = newArray.toString();
  return `Before is ${resultBeforePop} and After is ${resultAfterPop}`;
}

@Concurrent
export function testCollectionsArray0015(): string {
  let array: collections.Array<number> = new collections.Array<number>(1, 2, 3);
  let newArray: collections.Array<collections.Array<number>> = new collections.Array<collections.Array<number>>(array);
  return newArray[0].toString();
}

@Concurrent
export function testCollectionsArray0016(): string {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  let newArray: collections.Array<collections.ArrayBuffer> =
    new collections.Array<collections.ArrayBuffer>(arrayBuffer);
  let arrayBuffer1: collections.ArrayBuffer = new collections.ArrayBuffer(20);
  newArray.push(arrayBuffer1);
  let rst = [newArray[0].byteLength, newArray[1].byteLength].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0017(): string {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  let newArray: collections.Array<collections.ArrayBuffer> =
    new collections.Array<collections.ArrayBuffer>(arrayBuffer);
  let arrayBuffer1: collections.ArrayBuffer = new collections.ArrayBuffer(20);
  newArray.push(arrayBuffer1);
  let resultBeforePop = [newArray[0].byteLength, newArray[1].byteLength];
  newArray.pop();
  let resultAfterPop = [newArray[0].byteLength];
  let rst = [...resultBeforePop, ...resultAfterPop].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0018(): number {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  let newArray: collections.Array<collections.ArrayBuffer> =
    new collections.Array<collections.ArrayBuffer>(arrayBuffer);
  return newArray[0].byteLength;
}

@Concurrent
export function testCollectionsArray0019(): string {
  let int8Array: collections.Int8Array = collections.Int8Array.from([-1, 2, 3]);
  let newArray: collections.Array<collections.Int8Array> = new collections.Array<collections.Int8Array>(int8Array);
  let int8Array1: collections.Int8Array = collections.Int8Array.from([8, 9]);
  newArray.push(int8Array1);
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0020(): string {
  let int8Array: collections.Int8Array = collections.Int8Array.from([-1, 2, 3]);
  let newArray: collections.Array<collections.Int8Array> = new collections.Array<collections.Int8Array>(int8Array);
  newArray.pop();
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0021(): string {
  let int8Array: collections.Int8Array = collections.Int8Array.from([-1, 2, 3]);
  let newArray: collections.Array<collections.Int8Array> = new collections.Array<collections.Int8Array>(int8Array);
  let int8Array1: collections.Int8Array = collections.Int8Array.from([8, 9]);
  newArray.push(int8Array1);
  return `Before is ${newArray[0].includes(-1)} and After is ${newArray[1].toString()}`;
}

@Concurrent
export function testCollectionsArray0022(): string {
  let uint8Array: collections.Uint8Array = collections.Uint8Array.from([-1, 2, 3]);
  let newArray: collections.Array<collections.Uint8Array> = new collections.Array<collections.Uint8Array>(uint8Array);
  let uint8Array1: collections.Uint8Array = collections.Uint8Array.from([8, 9]);
  newArray.push(uint8Array1);
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0023(): string {
  let uint8Array: collections.Uint8Array = collections.Uint8Array.from([-1, 2, 3]);
  let newArray: collections.Array<collections.Uint8Array> = new collections.Array<collections.Uint8Array>(uint8Array);
  newArray.pop();
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0024(): boolean {
  let uint8Array: collections.Uint8Array = collections.Uint8Array.from([-1, 2, 3]);
  let newArray: collections.Array<collections.Uint8Array> = new collections.Array<collections.Uint8Array>(uint8Array);
  let uint8Array1: collections.Uint8Array = collections.Uint8Array.from([8, 9]);
  newArray.push(uint8Array1);
  let rst = newArray[0].includes(255) == newArray[1].includes(9);
  return rst;
}

@Concurrent
export function testCollectionsArray0025(): string {
  let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([-10, 50, 90]);
  let newArray: collections.Array<collections.Uint8ClampedArray> =
    new collections.Array<collections.Uint8ClampedArray>(uint8ClampedArray);
  let uint8ClampedArray1: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([150, 300]);
  newArray.push(uint8ClampedArray1);
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0026(): string {
  let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([-10, 50, 90]);
  let newArray: collections.Array<collections.Uint8ClampedArray> =
    new collections.Array<collections.Uint8ClampedArray>(uint8ClampedArray);
  newArray.pop();
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0027(): boolean {
  let uint8ClampedArray: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([-10, 50, 90]);
  let newArray: collections.Array<collections.Uint8ClampedArray> =
    new collections.Array<collections.Uint8ClampedArray>(uint8ClampedArray);
  let uint8ClampedArray1: collections.Uint8ClampedArray = collections.Uint8ClampedArray.from([300]);
  newArray.push(uint8ClampedArray1);
  let rst = newArray[0].includes(0) == newArray[1].includes(255);
  return rst;
}

@Concurrent
export function testCollectionsArray0028(): string {
  let int16Array: collections.Int16Array = collections.Int16Array.from([-10, 50]);
  let newArray: collections.Array<collections.Int16Array> = new collections.Array<collections.Int16Array>(int16Array);
  let int16Array1: collections.Int16Array = collections.Int16Array.from([100]);
  newArray.push(int16Array1);
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0029(): string {
  let int16Array: collections.Int16Array = collections.Int16Array.from([-10, 50]);
  let newArray: collections.Array<collections.Int16Array> = new collections.Array<collections.Int16Array>(int16Array);
  newArray.pop();
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0030(): boolean {
  let int16Array: collections.Int16Array = collections.Int16Array.from([-10, 50, 90]);
  let newArray: collections.Array<collections.Int16Array> = new collections.Array<collections.Int16Array>(int16Array);
  let int16Array1: collections.Int16Array = collections.Int16Array.from([300]);
  newArray.push(int16Array1);
  let rst = newArray[0].includes(-10) == newArray[1].includes(300);
  return rst;
}

@Concurrent
export function testCollectionsArray0031(): string {
  let uint16Array: collections.Uint16Array = collections.Uint16Array.from([-10, 50]);
  let newArray: collections.Array<collections.Uint16Array> =
    new collections.Array<collections.Uint16Array>(uint16Array);
  let uint16Array1: collections.Uint16Array = collections.Uint16Array.from([100]);
  newArray.push(uint16Array1);
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0032(): string {
  let uint16Array: collections.Uint16Array = collections.Uint16Array.from([-10, 50]);
  let newArray: collections.Array<collections.Uint16Array> =
    new collections.Array<collections.Uint16Array>(uint16Array);
  newArray.pop();
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0033(): boolean {
  let uint16Array: collections.Uint16Array = collections.Uint16Array.from([-10, 50, 90]);
  let newArray: collections.Array<collections.Uint16Array> =
    new collections.Array<collections.Uint16Array>(uint16Array);
  let uint16Array1: collections.Uint16Array = collections.Uint16Array.from([300]);
  newArray.push(uint16Array1);
  let rst = newArray[0].includes(65526) == newArray[1].includes(300);
  return rst;
}

@Concurrent
export function testCollectionsArray0034(): string {
  let int32Array: collections.Int32Array = collections.Int32Array.from([-10, 50]);
  let newArray: collections.Array<collections.Int32Array> = new collections.Array<collections.Int32Array>(int32Array);
  let int32Array1: collections.Int32Array = collections.Int32Array.from([100]);
  newArray.push(int32Array1);
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0035(): string {
  let int32Array: collections.Int32Array = collections.Int32Array.from([-10, 50]);
  let newArray: collections.Array<collections.Int32Array> = new collections.Array<collections.Int32Array>(int32Array);
  newArray.pop();
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0036(): boolean {
  let int32Array: collections.Int32Array = collections.Int32Array.from([-10, 50]);
  let newArray: collections.Array<collections.Int32Array> = new collections.Array<collections.Int32Array>(int32Array);
  let int32Array1: collections.Int32Array = collections.Int32Array.from([100]);
  newArray.push(int32Array1);
  let rst = newArray[0].includes(-10) == newArray[1].includes(100);
  return rst;
}

@Concurrent
export function testCollectionsArray0037(): string {
  let uint32Array: collections.Uint32Array = collections.Uint32Array.from([-10, 50]);
  let newArray: collections.Array<collections.Uint32Array> =
    new collections.Array<collections.Uint32Array>(uint32Array);
  let uint32Array1: collections.Uint32Array = collections.Uint32Array.from([100]);
  newArray.push(uint32Array1);
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0038(): string {
  let uint32Array: collections.Uint32Array = collections.Uint32Array.from([-10, 50]);
  let newArray: collections.Array<collections.Uint32Array> =
    new collections.Array<collections.Uint32Array>(uint32Array);
  newArray.pop();
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0039(): boolean {
  let uint32Array: collections.Uint32Array = collections.Uint32Array.from([-10, 50]);
  let newArray: collections.Array<collections.Uint32Array> =
    new collections.Array<collections.Uint32Array>(uint32Array);
  let uint32Array1: collections.Uint32Array = collections.Uint32Array.from([100]);
  newArray.push(uint32Array1);
  let rst = newArray[0].includes(4294967286) == newArray[1].includes(100);
  return rst;
}

@Concurrent
export function testCollectionsArray0040(): string {
  let float32Array: collections.Float32Array = collections.Float32Array.from([0, 5.0]);
  let newArray: collections.Array<collections.Float32Array> =
    new collections.Array<collections.Float32Array>(float32Array);
  let float32Array1: collections.Float32Array = collections.Float32Array.from([10.0]);
  newArray.push(float32Array1);
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0041(): string {
  let float32Array: collections.Float32Array = collections.Float32Array.from([0, 5.0]);
  let newArray: collections.Array<collections.Float32Array> =
    new collections.Array<collections.Float32Array>(float32Array);
  newArray.pop();
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0042(): boolean {
  let float32Array: collections.Float32Array = collections.Float32Array.from([-1.0, 5.0]);
  let newArray: collections.Array<collections.Float32Array> =
    new collections.Array<collections.Float32Array>(float32Array);
  let float32Array1: collections.Float32Array = collections.Float32Array.from([0]);
  newArray.push(float32Array1);
  let rst = newArray[0].includes(-1) == newArray[1].includes(0);
  return rst;
}

@Concurrent
export function testCollectionsArray0043(): number {
  const testMap = new collections.Map<number, string>([
    [0, "foo"],
    [1, "bar"]
  ]);
  let newArray: collections.Array<collections.Map<number, string>> =
    new collections.Array<collections.Map<number, string>>(testMap);
  const testMap1 = new collections.Map<number, string>([
    [2, "xoo"]
  ]);
  newArray.push(testMap1);
  return newArray.length;
}

@Concurrent
export function testCollectionsArray0044(): number {
  const testMap = new collections.Map<number, string>([
    [0, "foo"],
    [1, "bar"]
  ]);
  let newArray: collections.Array<collections.Map<number, string>> =
    new collections.Array<collections.Map<number, string>>(testMap);
  newArray.pop();
  return newArray.length;
}

@Concurrent
export function testCollectionsArray0045(): string {
  const testMap = new collections.Map<number, string>([
    [0, "foo"],
    [1, "bar"]
  ]);
  let newArray: collections.Array<collections.Map<number, string>> =
    new collections.Array<collections.Map<number, string>>(testMap);
  const iterator = newArray[0].values();
  let rst = [iterator.next().value, iterator.next().value].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0046(): number {
  const testSet = new collections.Set<number>([1, 2]);
  let newArray: collections.Array<collections.Set<number>> = new collections.Array<collections.Set<number>>(testSet);
  const testSet1 = new collections.Set<number>([3]);
  newArray.push(testSet1);
  return newArray.length;
}

@Concurrent
export function testCollectionsArray0047(): number {
  const testSet = new collections.Set<number>([1, 2]);
  let newArray: collections.Array<collections.Set<number>> = new collections.Array<collections.Set<number>>(testSet);
  newArray.pop();
  return newArray.length;
}

@Concurrent
export function testCollectionsArray0048(): string {
  const testSet = new collections.Set<number>([1, 2]);
  let newArray: collections.Array<collections.Set<number>> = new collections.Array<collections.Set<number>>(testSet);
  const iterator = newArray[0].values();
  let rst = [iterator.next().value, iterator.next().value].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0049(): number {
  let bitVector: collections.BitVector = new collections.BitVector(0);
  bitVector.push(0);
  bitVector.push(1);
  bitVector.push(0);
  bitVector.push(1);
  bitVector.push(0);
  let newArray: collections.Array<collections.BitVector> = new collections.Array<collections.BitVector>(bitVector);
  let bitVector1: collections.BitVector = new collections.BitVector(0);
  bitVector.push(0);
  bitVector.push(1);
  bitVector.push(0);
  newArray.push(bitVector1);
  return newArray.length;
}

@Concurrent
export function testCollectionsArray0050(): number {
  let bitVector: collections.BitVector = new collections.BitVector(0);
  bitVector.push(0);
  bitVector.push(1);
  bitVector.push(0);
  bitVector.push(1);
  bitVector.push(0);
  let newArray: collections.Array<collections.BitVector> = new collections.Array<collections.BitVector>(bitVector);
  newArray.pop();
  return newArray.length;
}

@Concurrent
export function testCollectionsArray0051(): number {
  let bitVector: collections.BitVector = new collections.BitVector(0);
  bitVector.push(0);
  bitVector.push(1);
  bitVector.push(0);
  bitVector.push(1);
  bitVector.push(0);
  let newArray: collections.Array<collections.BitVector> = new collections.Array<collections.BitVector>(bitVector);
  const iterator = newArray[0].values();
  return iterator.next().value;
}

@Concurrent
export function testCollectionsArray0052(): number {
  let lock1 = new ArkTSUtils.locks.AsyncLock();
  let lock2 = new ArkTSUtils.locks.AsyncLock();
  const newArray = new collections.Array<ArkTSUtils.locks.AsyncLock>(lock1);
  newArray.push(lock2);
  return newArray.length;
}

@Concurrent
export function testCollectionsArray0053(): number {
  let lock1 = new ArkTSUtils.locks.AsyncLock();
  let lock2 = new ArkTSUtils.locks.AsyncLock();
  const newArray = new collections.Array<ArkTSUtils.locks.AsyncLock>(lock1);
  newArray.push(lock2);
  newArray.pop();
  return newArray.length;
}

@Concurrent
export function testCollectionsArray0054(): number {
  let lock = new ArkTSUtils.locks.AsyncLock();
  const newArray = new collections.Array<ArkTSUtils.locks.AsyncLock>(lock);
  return newArray.length;
}

@Concurrent
export function testCollectionsArray0055(): number {
  @Sendable
  class SendableTestClass {
    num: number = 5;

    getNum() {
      return this.num;
    }
  }
  let sendableClass1 = new SendableTestClass();
  sendableClass1.num = 10;
  let sendableClass2 = new SendableTestClass();
  sendableClass2.num = 20;
  const newArray = new collections.Array<SendableTestClass>(sendableClass1);
  newArray.push(sendableClass2);
  return newArray[0].getNum() + newArray[1].getNum();
}

@Concurrent
export function testCollectionsArray0056(): number {
  @Sendable
  class SendableTestClass {
    num: number = 5;

    getNum() {
      return this.num;
    }
  }
  let sendableClass = new SendableTestClass();
  sendableClass.num = 10;
  const newArray = new collections.Array<SendableTestClass>(sendableClass);
  newArray.pop();
  return newArray.length;
}

@Concurrent
export function testCollectionsArray0057(): number {
  @Sendable
  class SendableTestClass {
    num: number = 5;

    getNum() {
      return this.num;
    }
  }
  let sendableClass1 = new SendableTestClass();
  sendableClass1.num = 10;
  let sendableClass2 = new SendableTestClass();
  sendableClass2.num = 20;
  const newArray = new collections.Array<SendableTestClass>(sendableClass1);
  newArray.push(sendableClass2);
  return newArray.length + newArray[1].getNum();
}

@Concurrent
export function testCollectionsArray0058(): number {
  let sendableClass1 = new ImplISendableClass();
  sendableClass1.count = 10;
  let sendableClass2 = new ImplISendableClass();
  sendableClass2.count = 20;
  const newArray = new collections.Array<ImplISendableClass>(sendableClass1);
  newArray.push(sendableClass2);
  return newArray[0].getNum() + newArray[1].getNum();
}

@Concurrent
export function testCollectionsArray0059(): number {
  let sendableClass = new ImplISendableClass();
  sendableClass.count = 10;
  const newArray = new collections.Array<ImplISendableClass>(sendableClass);
  newArray.pop();
  return newArray.length;
}

@Concurrent
export function testCollectionsArray0060(): string {
  let sendableClass1 = new ImplISendableClass();
  sendableClass1.count = 10;
  let sendableClass2 = new ImplISendableClass();
  sendableClass2.count = 20;
  const newArray = new collections.Array<ImplISendableClass>(sendableClass1);
  newArray.push(sendableClass2);
  let rst = [newArray.length, newArray[1].getNum()].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0061(): string {
  let newArray = new collections.Array<number | string>(1);
  newArray.push('a');
  let rst = [newArray[0], newArray[1]].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0062(): string {
  let newArray = new collections.Array<number | string>(1, 'a', 2, 'b');
  newArray.pop();
  return newArray.toString();
}

@Concurrent
export function testCollectionsArray0063(): boolean {
  let newArray = new collections.Array<number | string>(1, 'a', 2, 'b');
  let rst = newArray.includes('b') == newArray.includes(1);
  let rst1 = newArray.includes('c');
  return rst && !rst1;
}

@Concurrent
export function testCollectionsArray0064(): string {
  try {
    let array = collections.Array.create<number>(-1, 10);
    console.info("array is: " + array);
    return "no_error";
  } catch (err) {
    console.info("testCollectionsArray0064 error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsArray0065(): string {
  let array = collections.Array.create<number>(0, 10);
  console.info("array is: " + array);
  let rst = [array.toString(), array.length].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0066(): string {
  let array = collections.Array.create<number>(10, 3);
  console.info("array is: " + array);
  let rst = [array.toString(), array.length].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0067(): number {
  let array = collections.Array.create<number>(100000, 5);
  console.info("array length: " + array.length);
  return array.length;
}

@Concurrent
export function testCollectionsArray0068(): string {
  try {
    const regex = new RegExp("abc", "ig");
    collections.Array.create<RegExp>(1, regex);
    return "no_error";
  } catch (err) {
    console.info("testCollectionsArray0068 error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsArray0069(): string {
  let array: Array<string> = ['d', 'e', 'f'];
  let sendableArray = collections.Array.from<string>(array);
  console.info("sendableArray is: " + sendableArray);
  return sendableArray.toString();
}

@Concurrent
export function testCollectionsArray0070(): string {
  let array: Array<string> = [];
  let sendableArray = collections.Array.from<string>(array);
  let rst = [sendableArray.toString(), sendableArray.length].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0071(): string {
  let array: Array<null> = [null];
  let sendableArray = collections.Array.from<null>(array);
  let rst = [sendableArray.toString(), sendableArray.length].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0072(): string {
  let array: Array<undefined> = [undefined];
  let sendableArray = collections.Array.from<undefined>(array);
  let rst = [sendableArray.toString(), sendableArray.length].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0073(): string {
  try {
    const regex = new RegExp("abc", "ig");
    collections.Array.from<RegExp>([regex]);
    return "no_error";
  } catch (err) {
    console.info("testCollectionsArray0073 error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsArray0074(): number | undefined {
  let array = new collections.Array<number>();
  let lastElement = array.pop();
  return lastElement;
}

@Concurrent
export function testCollectionsArray0075(): string | undefined {
  let array = new collections.Array<string>('');
  let lastElement = array.pop();
  return lastElement;
}

@Concurrent
export function testCollectionsArray0076(): null | undefined {
  let array = new collections.Array<null>(null);
  let lastElement = array.pop();
  return lastElement;
}

@Concurrent
export function testCollectionsArray0077(): undefined {
  let array = new collections.Array<undefined>(undefined);
  let lastElement = array.pop();
  return lastElement;
}

@Concurrent
export function testCollectionsArray0078(): number | undefined {
  let array = new collections.Array<number>(1, 2, 3);
  let lastElement = array.pop();
  return lastElement;
}

@Concurrent
export function testCollectionsArray0079(): number {
  let array = new collections.Array<number>();
  let length = array.push();
  return length;
}

@Concurrent
export function testCollectionsArray0080(): number {
  let array = new collections.Array<number>();
  let length = array.push(0);
  return length;
}

@Concurrent
export function testCollectionsArray0081(): string {
  let array = new collections.Array<string>();
  let length = array.push('');
  let rst = [length, array.toString()].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0082(): string {
  let array = new collections.Array<null>();
  let length = array.push(null);
  let rst = [length, array.toString()].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0083(): string {
  let array = new collections.Array<undefined>();
  let length = array.push(undefined);
  let rst = [length, array.toString()].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0084(): string {
  let array = new collections.Array<number>(1, 2);
  let length = array.push(3);
  let rst = [length, array.toString()].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0085(): string {
  let array = new collections.Array<number>(1, 2);
  let length = array.push(3);
  let rst = [length, array.toString()].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0086(): string {
  let array = new collections.Array<string>();
  let newArray = array.join();
  return newArray;
}

@Concurrent
export function testCollectionsArray0087(): string {
  let array = new collections.Array<string>();
  let newArray = array.join('-');
  return newArray;
}

@Concurrent
export function testCollectionsArray0088(): string {
  let array = new collections.Array<number>(1, 3, 5);
  let newArray = array.join();
  return newArray;
}

@Concurrent
export function testCollectionsArray0089(): string {
  let array = new collections.Array<number>(1, 3, 5);
  let newArray = array.join('');
  return newArray;
}

@Concurrent
export function testCollectionsArray0090(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let newArray = array.join(undefined);
  return newArray;
}

@Concurrent
export function testCollectionsArray0091(): string {
  let array = new collections.Array<number>(1, 2);
  let newArray = array.join('分隔符');
  return newArray;
}

@Concurrent
export function testCollectionsArray0092(): string {
  let array = new collections.Array<number>(1, 2);
  let newArray = array.join(',。\￥·');
  return newArray;
}

@Concurrent
export function testCollectionsArray0093(): string {
  let array = new collections.Array<number>(1, 2);
  let newArray = array.join("녕하こんйте");
  return newArray;
}

@Concurrent
export function testCollectionsArray0094(): string {
  let array = new collections.Array<number>(1, 2);
  let newArray = array.join("，");
  return newArray;
}

@Concurrent
export function testCollectionsArray0095(): number | undefined {
  let array = new collections.Array<number>();
  let firstElement = array.shift();
  return firstElement;
}

@Concurrent
export function testCollectionsArray0096(): string | undefined {
  let array = new collections.Array<string>('');
  let firstElement = array.shift();
  return firstElement;
}

@Concurrent
export function testCollectionsArray0097(): null | undefined {
  let array = new collections.Array<null>(null);
  let firstElement = array.shift();
  return firstElement;
}

@Concurrent
export function testCollectionsArray0098(): undefined {
  let array = new collections.Array<undefined>(undefined);
  let firstElement = array.shift();
  return firstElement;
}

@Concurrent
export function testCollectionsArray0099(): number | undefined {
  let array = new collections.Array<number>(1, 2, 3);
  let firstElement = array.shift();
  return firstElement;
}

@Concurrent
export function testCollectionsArray0100(): number {
  let array = new collections.Array<number>();
  let newLength = array.unshift();
  return newLength;
}

@Concurrent
export function testCollectionsArray0101(): number {
  let array = new collections.Array<number>();
  let newLength = array.unshift(0);
  return newLength;
}

@Concurrent
export function testCollectionsArray0102(): string {
  let array = new collections.Array<string>();
  let newLength = array.unshift('');
  let rst = [newLength, array.toString()].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0103(): string {
  let array = new collections.Array<null>();
  let newLength = array.unshift(null);
  let rst = [newLength, array.toString()].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0104(): string {
  let array = new collections.Array<undefined>();
  let newLength = array.unshift(undefined);
  let rst = [newLength, array.toString()].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0105(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let newLength = array.unshift(0);
  let rst = [newLength, array.toString()].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0106(): string {
  let array = new collections.Array<number>();
  let slicedArray = array.slice(0, 3);
  return slicedArray.toString();
}

@Concurrent
export function testCollectionsArray0107(): string {
  let array = new collections.Array<number>();
  let slicedArray = array.slice();
  return slicedArray.toString();
}

@Concurrent
export function testCollectionsArray0108(): string {
  let array = new collections.Array<number>(1, 2);
  let slicedArray = array.slice();
  return slicedArray.toString();
}

@Concurrent
export function testCollectionsArray0109(): string {
  let array = new collections.Array<number>(1, 2);
  let slicedArray = array.slice(undefined);
  return slicedArray.toString();
}

@Concurrent
export function testCollectionsArray0110(): string {
  let array = new collections.Array<number>(1, 2);
  let slicedArray = array.slice(-1);
  return slicedArray.toString();
}

@Concurrent
export function testCollectionsArray0111(): string {
  let array = new collections.Array<number>(1, 2);
  let slicedArray = array.slice(-1, -1);
  return slicedArray.toString();
}

@Concurrent
export function testCollectionsArray0112(): string {
  let array = new collections.Array<number>(1, 2);
  let slicedArray = array.slice(-1, 0);
  return slicedArray.toString();
}

@Concurrent
export function testCollectionsArray0113(): string {
  let array = new collections.Array<number>(1, 2, 3, 4);
  let slicedArray = array.slice(0, -1);
  return slicedArray.toString();
}

@Concurrent
export function testCollectionsArray0114(): string {
  let array = new collections.Array<number>(1, 2, 3, 4);
  let slicedArray = array.slice(2);
  return slicedArray.toString();
}

@Concurrent
export function testCollectionsArray0115(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let slicedArray = array.slice(10);
  return slicedArray.toString();
}

@Concurrent
export function testCollectionsArray0116(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let slicedArray = array.slice(2, 4);
  return slicedArray.toString();
}

@Concurrent
export function testCollectionsArray0117(): string {
  let array = new collections.Array<number>(1);
  let slicedArray = array.slice(2, 4);
  return slicedArray.toString();
}

@Concurrent
export function testCollectionsArray0118(): string {
  let array = new collections.Array<number>(1);
  let slicedArray = array.slice(2, 0);
  return slicedArray.toString();
}

@Concurrent
export function testCollectionsArray0119(): string {
  let array = new collections.Array<number>();
  array.sort((a: number, b: number) => a - b);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0120(): string {
  let array = new collections.Array<number>();
  array.sort();
  return array.toString();
}

@Concurrent
export function testCollectionsArray0121(): string {
  let array = new collections.Array<number>(5, 2, 3, 1);
  array.sort();
  return array.toString();
}

@Concurrent
export function testCollectionsArray0122(): string {
  let array = new collections.Array<number>(5, 2, 3, 1);
  array.sort(undefined);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0123(): string {
  let array = new collections.Array<number>(5, 2, 3, 1);
  array.sort((a: number, b: number) => b - a);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0124(): string {
  let array = new collections.Array<number>(5, 2, 3, 1);
  array.sort((a: number, b: number) => b - a);
  array.pop();
  return array.toString();
}

@Concurrent
export function testCollectionsArray0125(): string {
  let array = new collections.Array<number>(5, 3, 1);
  array.sort((a: number, b: number) => b - a);
  array.push(6, 7);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0126(): string {
  let array = new collections.Array<number>(5, 3, 1);
  array.sort((a: number, b: number) => b - a);
  array.shift();
  return array.toString();
}

@Concurrent
export function testCollectionsArray0127(): string {
  let array = new collections.Array<number>(5, 3, 1);
  array.sort((a: number, b: number) => b - a);
  array.unshift(0);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0128(): number {
  let array = new collections.Array<string>();
  let index = array.indexOf('b');
  return index;
}

@Concurrent
export function testCollectionsArray0129(): number {
  let array = new collections.Array<string>('a', 'b', 'c');
  let index = array.indexOf('d');
  return index;
}

@Concurrent
export function testCollectionsArray0130(): number {
  let array = new collections.Array<string>('a', 'b', 'c');
  return array.indexOf('b', -1);
}

@Concurrent
export function testCollectionsArray0131(): number {
  let array = new collections.Array<string>('a', 'b', 'c', 'a', 'a');
  return array.indexOf('a', 1);
}

@Concurrent
export function testCollectionsArray0132(): number {
  let array = new collections.Array<string>('a', 'b', 'c', 'a', 'a');
  return array.indexOf('a');
}

@Concurrent
export function testCollectionsArray0133(): number {
  let array = new collections.Array<string>('a', 'b', 'c', 'a', 'd', 'a');
  return array.indexOf('a', 4);
}

@Concurrent
export function testCollectionsArray0134(): number {
  let array = new collections.Array<string>();
  let length = 0;
  array.forEach((value, index, array) => {
    length = array.length;
  });
  return length;
}

@Concurrent
export function testCollectionsArray0135(): string {
  let array = new collections.Array<number>(2, 3, 4);
  let length = array.length;
  let values: number[] = [];
  array.forEach((value, index, array) => {
    values.push(array[index]);
  });
  let rst = [length, values].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0136(): string {
  let array = new collections.Array<number>(1, 2, 3);
  array.pop();
  let length = array.length;
  let values: number[] = [];
  array.forEach((value, index, array) => {
    values.push(array[index]);
  });
  let rst = [length, values].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0137(): string {
  let array = new collections.Array<number>(1, 2, 3);
  array.push(8);
  let length = array.length;
  let values: number[] = [];
  array.forEach((value, index, array) => {
    values.push(array[index]);
  });
  let rst = [length, values].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0138(): string {
  let array = new collections.Array<number>();
  let mappedArray = array.map((value, index, array) => value + 1);
  let rst = [mappedArray.length, mappedArray].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0139(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let mappedArray = array.map((value, index, array) => value + 1);
  let rst = [mappedArray.length, mappedArray].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0140(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let mappedArray = array.map((value, index, array) => value + 1);
  mappedArray.pop();
  let mappedArray1 = mappedArray.map((value, index, mappedArray) => value * 2);
  let rst = [mappedArray1.length, mappedArray1].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0141(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let mappedArray = array.map((value, index, array) => value + 1);
  mappedArray.push(9);
  let mappedArray1 = mappedArray.map((value, index, mappedArray) => value * 2);
  let rst = [mappedArray1.length, mappedArray1].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0142(): string {
  let array = new collections.Array<number>();
  let filteredArray = array.filter((value: number) => value % 2 === 0);
  let rst = [filteredArray.length, filteredArray].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0143(): string {
  let array = new collections.Array<number>(1, 2, 3, 4);
  let filteredArray = array.filter((value: number) => value % 2 === 0);
  let rst = [filteredArray.length, filteredArray].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0144(): string {
  let array = new collections.Array<number>(1, 2, 3, 4);
  let filteredArray = array.filter((value: number) => value % 2 === 0);
  filteredArray.pop();
  let filteredArray1 = filteredArray.filter((value: number) => value % 2 === 1);
  let rst = [filteredArray1.length, filteredArray1].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0145(): string {
  let array = new collections.Array<number>(1, 2, 3, 4, 5);
  let filteredArray = array.filter((value: number) => value % 2 === 1);
  filteredArray.push(7);
  let filteredArray1 = filteredArray.filter((value: number) => value % 2 === 1);
  let rst = [filteredArray1.length, filteredArray1].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0146(): string {
  try {
    let array = new collections.Array<number>();
    array.reduce((accumulator, value) => accumulator + value);
    return "no_error";
  } catch (err) {
    return "error";
  }
}

@Concurrent
export function testCollectionsArray0147(): number {
  let array = new collections.Array<number>(1, 2, 3, 4);
  return array.reduce((accumulator, value) => accumulator + value);
}

@Concurrent
export function testCollectionsArray0148(): number {
  let array = new collections.Array<number>(1, 2, 3, 4);
  return array.reduce((accumulator, value) => accumulator + value, 10);
}

@Concurrent
export function testCollectionsArray0149(): string {
  let array = new collections.Array<number>(1, 2, 3, 4);
  array.pop();
  let reducedValue = array.reduce((accumulator, value) => accumulator + value, 5);
  array.pop();
  let reducedValue1 = array.reduce((accumulator, value) => accumulator + value, 5);
  let rst = [reducedValue, reducedValue1].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0150(): string {
  let array = new collections.Array<number>(1, 2, 3, 4);
  array.push(5);
  let reducedValue = array.reduce<number>((accumulator: number, value: number) => accumulator + value, 1);
  array.push(6);
  let reducedValue1 = array.reduce<number>((accumulator: number, value: number) => accumulator + value, 0);
  let rst = [reducedValue, reducedValue1].toString();
  return rst;
}

@Concurrent
export function testCollectionsArray0151(): string {
  let array = new collections.Array<number>();
  let elementAtIndex = array.at(2);
  return elementAtIndex === undefined ? "undefined" : String(elementAtIndex);
}

@Concurrent
export function testCollectionsArray0152(): string {
  let array = new collections.Array<number>(1, 2, 3, 4, 5);
  let elementAtIndex = array.at(5);
  return elementAtIndex === undefined ? "undefined" : String(elementAtIndex);
}

@Concurrent
export function testCollectionsArray0153(): string {
  let array = new collections.Array<number>(1, 2, 3, 4, 5);
  let elementAtIndex = array.at(-2);
  return String(elementAtIndex); // Should return "4"
}

@Concurrent
export function testCollectionsArray0154(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let elementAtIndex = array.at(5);
  return elementAtIndex === undefined ? "undefined" : String(elementAtIndex);
}

@Concurrent
export function testCollectionsArray0155(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let elementAtIndex = array.at(1);
  return String(elementAtIndex); // Should return "2"
}

@Concurrent
export function testCollectionsArray0156(): string {
  let array = new collections.Array<string>();
  let iterator = array.entries();
  return iterator.next().value === undefined ? "undefined" : String(iterator.next().value);
}

@Concurrent
export function testCollectionsArray0157(): string {
  let array = new collections.Array<string>('a', 'b', 'c');
  let iterator = array.entries();
  let results: string[] = [];
  for (let entry of iterator) {
    results.push(entry.toString());
  }
  return results.join(',');
}

@Concurrent
export function testCollectionsArray0158(): string {
  let array = new collections.Array<string>();
  let iterator = array.keys();
  let keys: number[] = [];
  for (const key of iterator) {
    keys.push(key);
  }
  return keys.join(',');
}

@Concurrent
export function testCollectionsArray0159(): string {
  let array = new collections.Array<string>('a', 'b', 'c');
  let iterator = array.keys();
  let keys: number[] = [];
  for (const key of iterator) {
    keys.push(key);
  }
  return keys.join(',');
}

@Concurrent
export function testCollectionsArray0160(): string {
  let array = new collections.Array<string>('a', 'b', 'c');
  let iterator = array.keys();
  let keys: number[] = [];
  for (const key of iterator) {
    keys.push(key);
  }
  return keys.join(',');
}

@Concurrent
export function testCollectionsArray0161(): string {
  let array = new collections.Array<string>();
  let iterator = array.values();
  return iterator.next().done ? "true" : "false";
}

@Concurrent
export function testCollectionsArray0162(): string {
  let array = new collections.Array<string>('e', 'f', 'g');
  let iterator = array.values();
  let values: string[] = [];
  let result = iterator.next();
  while (!result.done) {
    values.push(result.value);
    result = iterator.next();
  }
  return values.join(',');
}

@Concurrent
export function testCollectionsArray0163(): string {
  let array = new collections.Array<string>('e', 'f', 'g');
  array.pop();
  let iterator = array.values();
  let values: string[] = [];
  let result = iterator.next();
  while (!result.done) {
    values.push(result.value);
    result = iterator.next();
  }
  return values.join(',');
}

@Concurrent
export function testCollectionsArray0164(): string {
  let array = new collections.Array<string>('e', 'f', 'g');
  array.push('h');
  let iterator = array.values();
  let values: string[] = [];
  let result = iterator.next();
  while (!result.done) {
    values.push(result.value);
    result = iterator.next();
  }
  return values.join(',');
}

@Concurrent
export function testCollectionsArray0165(): string {
  let array = new collections.Array<number>();
  let foundValue = array.find((value: number) => value % 2 === 0);
  return foundValue === undefined ? "undefined" : String(foundValue);
}

@Concurrent
export function testCollectionsArray0166(): string {
  let array = new collections.Array<number>(1, 3, 5);
  let foundValue = array.find((value: number) => value % 2 === 0);
  return foundValue === undefined ? "undefined" : String(foundValue);
}

@Concurrent
export function testCollectionsArray0167(): string {
  let array = new collections.Array<number>(1, 3, 5);
  let foundValue = array.find((value: number, index: number) => index === -1);
  return foundValue === undefined ? "undefined" : String(foundValue);
}

@Concurrent
export function testCollectionsArray0168(): string {
  let array = new collections.Array<number>(1, 3, 5);
  let foundValue = array.find((value: number, index: number) => index === 0);
  return foundValue === undefined ? "undefined" : String(foundValue);
}

@Concurrent
export function testCollectionsArray0169(): string {
  let array = new collections.Array<number>(3, 5);
  let foundValue = array.find((value: number) => value % 2 === 1);
  return foundValue === undefined ? "undefined" : String(foundValue);
}

@Concurrent
export function testCollectionsArray0170(): string {
  let array = new collections.Array<number>();
  let includesResult = array.includes(1);
  return includesResult.toString();
}

@Concurrent
export function testCollectionsArray0171(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let includesResult = array.includes(4, -1);
  return includesResult.toString();
}

@Concurrent
export function testCollectionsArray0172(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let includesResult = array.includes(2, -1);
  return includesResult.toString();
}

@Concurrent
export function testCollectionsArray0173(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let includesResult = array.includes(5);
  return includesResult.toString();
}

@Concurrent
export function testCollectionsArray0174(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let includesResult = array.includes(3);
  return includesResult.toString();
}

@Concurrent
export function testCollectionsArray0175(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let includesResult = array.includes(3, 4);
  return includesResult.toString();
}

@Concurrent
export function testCollectionsArray0176(): string {
  let array = new collections.Array<number>();
  let foundIndex = array.findIndex((value: number) => value % 2 === 0);
  return foundIndex.toString();
}

@Concurrent
export function testCollectionsArray0177(): string {
  let array = new collections.Array<number>(2, 4);
  let foundIndex = array.findIndex((value: number, index: number) => index === -1);
  return foundIndex.toString();
}

@Concurrent
export function testCollectionsArray0178(): string {
  let array = new collections.Array<number>(1, 3, 5);
  let foundIndex = array.findIndex((value: number) => value % 2 === 0);
  return foundIndex.toString();
}

@Concurrent
export function testCollectionsArray0179(): string {
  let array = new collections.Array<number>(1, 3, 5);
  let foundIndex = array.findIndex((value: number) => value % 2 === 1);
  return foundIndex.toString();
}

@Concurrent
export function testCollectionsArray0180(): string {
  let array = new collections.Array<number>(1, 3, 5);
  let foundIndex = array.findIndex((value: number, index: number) => value % 2 === 1 && index === 5);
  return foundIndex.toString();
}

@Concurrent
export function testCollectionsArray0181(): string {
  let array = new collections.Array(1, 2, 3, 4, 5);
  let fillArray = array.fill(-1, -1, 3);
  return fillArray.toString();
}

@Concurrent
export function testCollectionsArray0182(): string {
  let array = new collections.Array(1, 2, 3, 4, 5);
  let fillArray = array.fill(-1, 0, -1);
  return fillArray.toString();
}

@Concurrent
export function testCollectionsArray0183(): string {
  let array = new collections.Array(1, 2, 3, 4, 5);
  let fillArray = array.fill(-1, 10, 2);
  return fillArray.toString();
}

@Concurrent
export function testCollectionsArray0184(): string {
  let array = new collections.Array(1, 2, 3, 4, 5);
  let fillArray = array.fill(-1, 0, 10);
  return fillArray.toString();
}

@Concurrent
export function testCollectionsArray0185(): string {
  let array = new collections.Array<null>(null);
  let fillArray = array.fill(null);
  return fillArray.toString();
}

@Concurrent
export function testCollectionsArray0186(): string {
  let array = new collections.Array<undefined>();
  let fillArray = array.fill(undefined);
  return fillArray.toString();
}

@Concurrent
export function testCollectionsArray0187(): string {
  let array = new collections.Array<number>(1, 2, 3, 4, 5);
  let fillArray = array.fill(8, 0, 5);
  return fillArray.toString();
}

@Concurrent
export function testCollectionsArray0188(): string {
  let array = new collections.Array<number>(1, 2, 3, 4, 5);
  array.shrinkTo(10);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0189(): string {
  let array = new collections.Array<number>(1, 2, 3, 4, 5);
  array.shrinkTo(2);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0190(): string {
  try {
    let array = new collections.Array<number>(1, 2, 3, 4, 5);
    array.shrinkTo(-1);
    return array.toString();
  } catch (err) {
    console.info("testCollectionsArray0190 error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsArray0191(): string {
  let array = new collections.Array<number>(1, 2, 3, 4, 5);
  array.extendTo(2, 10);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0192(): string {
  let array = new collections.Array<number>(1, 2, 3);
  array.extendTo(5, 10);
  return array.toString();
}

@Concurrent
export function testCollectionsArray0193(): string {
  try {
    let array = new collections.Array<number>(1, 2, 3);
    array.extendTo(-1, 10);
    return array.toString();
  } catch (err) {
    console.info("testCollectionsArray0193 error is: " + `${err.message}`);
    return "error";
  }
}

@Concurrent
export function testCollectionsArray0194(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let concatArray = array.concat();
  return concatArray.toString();
}

@Concurrent
export function testCollectionsArray0195(): string {
  let array1 = new collections.Array<number>(1, 2, 3);
  let array2 = new collections.Array<number>(4, 5, 6);
  let concatArray = array1.concat(array2);
  return concatArray.toString();
}

@Concurrent
export function testCollectionsArray0196(): string {
  let array = new collections.Array<null>(null);
  let array1 = new collections.Array<null>(null);
  let concatArray = array.concat(array1);
  return concatArray.toString();
}

@Concurrent
export function testCollectionsArray0197(): string {
  let array = new collections.Array<number>();
  let removeArray = array.splice(2);
  return removeArray.toString();
}

@Concurrent
export function testCollectionsArray0198(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let removeArray = array.splice(-1);
  return array.toString() + ';' + removeArray.toString();
}

@Concurrent
export function testCollectionsArray0199(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let removeArray = array.splice(5);
  return array.toString() + ';' + removeArray.toString();
}

@Concurrent
export function testCollectionsArray0200(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let removeArray = array.splice(-5);
  return array.toString() + ';' + removeArray.toString();
}

@Concurrent
export function testCollectionsArray0201(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let removeArray = array.splice(0);
  return array.toString() + ';' + removeArray.toString();
}

@Concurrent
export function testCollectionsArray0202(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let removeArray = array.splice(2);
  return array.toString() + ';' + removeArray.toString();
}

@Concurrent
export function testCollectionsArray0203(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let removeArray = array.splice(0, -1);
  return array.toString() + ';' + removeArray.toString();
}

@Concurrent
export function testCollectionsArray0204(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let removeArray = array.splice(0, 0);
  return array.toString() + ';' + removeArray.toString();
}

@Concurrent
export function testCollectionsArray0205(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let removeArray = array.splice(0, 2);
  return array.toString() + ';' + removeArray.toString();
}

@Concurrent
export function testCollectionsArray0206(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let removeArray = array.splice(0, 10);
  return array.toString() + ';' + removeArray.toString();
}

@Concurrent
export function testCollectionsArray0207(): string {
  let array = new collections.Array<null>(null, null, null);
  let removeArray = array.splice(0, 0, null);
  return array.toString() + ';' + removeArray.toString();
}

@Concurrent
export function testCollectionsArray0208(): string {
  let array = new collections.Array<undefined>(undefined, undefined);
  let removeArray = array.splice(0, 0, undefined);
  return array.toString() + ';' + removeArray.toString();
}

@Concurrent
export function testCollectionsArray0209(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let elementVal = array[-5];
  return elementVal === undefined ? "undefined" : String(elementVal);
}

@Concurrent
export function testCollectionsArray0210(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let elementVal = array[5];
  return elementVal === undefined ? "undefined" : String(elementVal);
}

@Concurrent
export function testCollectionsArray0211(): string {
  let array = new collections.Array<number>(1, 2, 3);
  let elementVal = array[1];
  return String(elementVal);
}