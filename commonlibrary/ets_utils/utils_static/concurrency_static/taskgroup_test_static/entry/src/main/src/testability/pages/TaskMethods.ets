/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Count1, Count2, MyClass, MyEnum, SendableTestClass } from './TaskDataFlg';
import { AsyncLocks, BaseClass, DeriveClass } from './SendableTest';

export function printStr1(str: string): string {
  console.info(`printStr: ${str}`);
  return str;
}

export function printStr2(str: string): string {
  console.info(`printStr: ${str}`);
  return str;
}


export function printStr3(str: string): string {
  console.info('printStr: ' + str);
  let s: string[] = []
  s[0].split('')[1].toString()
  return str;
}

export function printStr4(str: string): string {
  console.info('printStr: ' + str);
  let s: string[] = []
  s[0].split('')[1].toString()
  return str;
}

export function printArgs1(args: Number): Number {
  console.info('printArgs: ' + args);
  Count1.count++
  return args;
}

export function printArgs2(args: Number): Number {
  console.info('printArgs: ' + args);
  Count2.count++
  return args;
}

export function printArgs3(args: Number): Number {
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

/**
 * error
 * @param args
 * @returns
 */
export function printArgs4(args: Number): Number {
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

export function printBoolean1(bol: boolean): boolean {
  console.info('printArgs: ' + bol);
  return bol;
}

export function printBoolean2(bol: boolean): boolean {
  console.info('printArgs: ' + bol);
  return bol;
}

/**
 * error
 * @param args
 * @returns
 */

export function printBoolean3(bol: boolean): boolean {
  console.info('printArgs: ' + bol);
  let s: string[] = []
  s[0].split('')[1].toString()
  return bol;
}

/**
 * error
 * @param args
 * @returns
 */

export function printBoolean4(bol: boolean): boolean {
  console.info('printArgs: ' + bol);
  let s: string[] = []
  s[0].split('')[1].toString()
  return bol;
}

export function printBigint1(big: bigint): bigint {
  console.info('printArgs: ' + big);
  return big;
}

export function printBigint2(big: bigint): bigint {
  console.info('printArgs: ' + big);
  return big;
}

/**
 * error
 * @param args
 * @returns
 */
export function printBigint3(big: bigint): bigint {
  console.info('printArgs: ' + big);
  let s: string[] = []
  s[0].split('')[1].toString()
  return big;
}

/**
 * error
 * @param args
 * @returns
 */
export function printBigint4(big: bigint): bigint {
  console.info('printArgs: ' + big);
  let s: string[] = []
  s[0].split('')[1].toString()
  return big;
}

export function printUndefined1(und: undefined): undefined {
  console.info('printArgs: ' + und);
  return undefined;
}

export function printUndefined2(und: undefined): undefined {
  console.info('printArgs: ' + und);
  return undefined;
}

/**
 * error
 * @param args
 * @returns
 */
export function printUndefined3(und: undefined): undefined {
  console.info('printArgs: ' + und);
  let s: string[] = []
  s[0].split('')[1].toString()
  return und;
}

/**
 * error
 * @param args
 * @returns
 */
export function printUndefined4(und: undefined): undefined {
  console.info('printArgs: ' + und);
  let s: string[] = []
  s[0].split('')[1].toString()
  return und;
}

export function printNull1(nul: null): null {
  console.info('printArgs: ' + nul);
  return nul;
}


export function printNull2(nul: null): null {
  console.info('printArgs: ' + nul);
  return nul;
}

/**
 * error
 * @param args
 * @returns
 */

export function printNull3(nul: null): null {
  console.info('printArgs: ' + nul);
  let s: string[] = []
  s[0].split('')[1].toString()
  return nul;
}

/**
 * error
 * @param args
 * @returns
 */

export function printNull4(nul: null): null {
  console.info('printArgs: ' + nul);
  let s: string[] = []
  s[0].split('')[1].toString()
  return nul;
}


export function printArray1(arr: Array<Number>): Array<Number> {
  console.info('printArgs: ' + arr);
  return arr;
}

export function printArray2(arr: Array<Number>): Array<Number> {
  console.info('printArgs: ' + arr);
  return arr;
}

/**
 * error
 * @param args
 * @returns
 */
export function printArray3(arr: Array<Number>): Array<Number> {
  console.info('printArgs: ' + arr);
  let s: string[] = []
  s[0].split('')[1].toString()
  return arr;
}

/**
 * error
 * @param args
 * @returns
 */
export function printArray4(arr: Array<Number>): Array<Number> {
  console.info('printArgs: ' + arr);
  let s: string[] = []
  s[0].split('')[1].toString()
  return arr;
}

export function printMap1(map: Map<string, Number>): Map<string, Number> {
  console.info('printArgs: ' + map);
  return map;
}

export function printMap2(map: Map<string, Number>): Map<string, Number> {
  console.info('printArgs: ' + map);
  return map;
}

/**
 * error
 * @param args
 * @returns
 */
export function printMap3(map: Map<string, Number>): Map<string, Number> {
  console.info('printArgs: ' + map);
  let s: string[] = []
  s[0].split('')[1].toString()
  return map;
}

/**
 * error
 * @param args
 * @returns
 */
export function printMap4(map: Map<string, Number>): Map<string, Number> {
  console.info('printArgs: ' + map);
  let s: string[] = []
  s[0].split('')[1].toString()
  return map;
}


export function printSet1(set: Set<Number>): Set<Number> {
  console.info('printArgs: ' + set);
  return set;
}

export function printSet2(set: Set<Number>): Set<Number> {
  console.info('printArgs: ' + set);
  return set;
}

/**
 * error
 * @param args
 * @returns
 */
export function printSet3(set: Set<Number>): Set<Number> {
  console.info('printArgs: ' + set);
  let s: string[] = []
  s[0].split('')[1].toString()
  return set;
}

/**
 * error
 * @param args
 * @returns
 */
export function printSet4(set: Set<Number>): Set<Number> {
  console.info('printArgs: ' + set);
  let s: string[] = []
  s[0].split('')[1].toString()
  return set;
}


export function printInt8Array1(int8: Int8Array): Int8Array {
  console.info('printArgs: ' + int8);
  return int8;
}

export function printInt8Array2(int8: Int8Array): Int8Array {
  console.info('printArgs: ' + int8);
  return int8;
}

/**
 * error
 * @param args
 * @returns
 */
export function printInt8Array3(int8: Int8Array): Int8Array {
  console.info('printArgs: ' + int8);
  let s: string[] = []
  s[0].split('')[1].toString()
  return int8;
}

/**
 * error
 * @param args
 * @returns
 */
export function printInt8Array4(int8: Int8Array): Int8Array {
  console.info('printArgs: ' + int8);
  let s: string[] = []
  s[0].split('')[1].toString()
  return int8;
}

export function printUint8Array1(uint8: Uint8Array): Uint8Array {
  console.info('printArgs: ' + uint8);
  return uint8;
}

export function printUint8Array2(uint8: Uint8Array): Uint8Array {
  console.info('printArgs: ' + uint8);
  return uint8;
}

/**
 * error
 * @param args
 * @returns
 */
export function printUint8Array3(uint8: Uint8Array): Uint8Array {
  console.info('printArgs: ' + uint8);
  let s: string[] = []
  s[0].split('')[1].toString()
  return uint8;
}

/**
 * error
 * @param args
 * @returns
 */
export function printUint8Array4(uint8: Uint8Array): Uint8Array {
  console.info('printArgs: ' + uint8);
  let s: string[] = []
  s[0].split('')[1].toString()
  return uint8;
}

export function printInt16Array1(int16: Int16Array): Int16Array {
  console.info('printArgs: ' + int16);
  return int16;
}

export function printInt16Array2(int16: Int16Array): Int16Array {
  console.info('printArgs: ' + int16);
  return int16;
}

/**
 * error
 * @param args
 * @returns
 */
export function printInt16Array3(int16: Int16Array): Int16Array {
  console.info('printArgs: ' + int16);
  let s: string[] = []
  s[0].split('')[1].toString()
  return int16;
}

/**
 * error
 * @param args
 * @returns
 */
export function printInt16Array4(int16: Int16Array): Int16Array {
  console.info('printArgs: ' + int16);
  let s: string[] = []
  s[0].split('')[1].toString()
  return int16;
}



export function printUint16Array1(uint16: Uint16Array): Uint16Array {
  console.info('printArgs: ' + uint16);
  return uint16;
}


export function printUint16Array2(uint16: Uint16Array): Uint16Array {
  console.info('printArgs: ' + uint16);
  return uint16;
}

/**
 * error
 * @param args
 * @returns
 */
export function printUint16Array3(uint16: Uint16Array): Uint16Array {
  console.info('printArgs: ' + uint16);
  let s: string[] = []
  s[0].split('')[1].toString()
  return uint16;
}

/**
 * error
 * @param args
 * @returns
 */
export function printUint16Array4(uint16: Uint16Array): Uint16Array {
  console.info('printArgs: ' + uint16);
  let s: string[] = []
  s[0].split('')[1].toString()
  return uint16;
}



export function printInt32Array1(int32: Int32Array): Int32Array {
  console.info('printArgs: ' + int32);
  return int32;
}


export function printInt32Array2(int32: Int32Array): Int32Array {
  console.info('printArgs: ' + int32);
  return int32;
}

/**
 * error
 * @param args
 * @returns
 */
export function printInt32Array3(int32: Int32Array): Int32Array {
  console.info('printArgs: ' + int32);
  let s: string[] = []
  s[0].split('')[1].toString()
  return int32;
}

/**
 * error
 * @param args
 * @returns
 */
export function printInt32Array4(int32: Int32Array): Int32Array {
  console.info('printArgs: ' + int32);
  let s: string[] = []
  s[0].split('')[1].toString()
  return int32;
}



export function printUint32Array1(uint32: Uint32Array): Uint32Array {
  console.info('printArgs: ' + uint32);
  return uint32;
}


export function printUint32Array2(uint32: Uint32Array): Uint32Array {
  console.info('printArgs: ' + uint32);
  return uint32;
}

/**
 * error
 * @param args
 * @returns
 */
export function printUint32Array3(uint32: Uint32Array): Uint32Array {
  console.info('printArgs: ' + uint32);
  let s: string[] = []
  s[0].split('')[1].toString()
  return uint32;
}

/**
 * error
 * @param args
 * @returns
 */
export function printUint32Array4(uint32: Uint32Array): Uint32Array {
  console.info('printArgs: ' + uint32);
  let s: string[] = []
  s[0].split('')[1].toString()
  return uint32;
}



export function printUint8ClampedArray1(uint8Clamped: Uint8ClampedArray): Uint8ClampedArray {
  console.info('printArgs: ' + uint8Clamped);
  return uint8Clamped;
}


export function printUint8ClampedArray2(uint8Clamped: Uint8ClampedArray): Uint8ClampedArray {
  console.info('printArgs: ' + uint8Clamped);
  return uint8Clamped;
}

/**
 * error
 * @param args
 * @returns
 */
export function printUint8ClampedArray3(uint8Clamped: Uint8ClampedArray): Uint8ClampedArray {
  console.info('printArgs: ' + uint8Clamped);
  let s: string[] = []
  s[0].split('')[1].toString()
  return uint8Clamped;
}

/**
 * error
 * @param args
 * @returns
 */
export function printUint8ClampedArray4(uint8Clamped: Uint8ClampedArray): Uint8ClampedArray {
  console.info('printArgs: ' + uint8Clamped);
  let s: string[] = []
  s[0].split('')[1].toString()
  return uint8Clamped;
}


export function printFloat32Array1(float32: Float32Array): Float32Array {
  console.info('printArgs: ' + float32);
  return float32;
}


export function printFloat32Array2(float32: Float32Array): Float32Array {
  console.info('printArgs: ' + float32);
  return float32;
}

/**
 * error
 * @param args
 * @returns
 */
export function printFloat32Array3(float32: Float32Array): Float32Array {
  console.info('printArgs: ' + float32);
  let s: string[] = []
  s[0].split('')[1].toString()
  return float32;
}

/**
 * error
 * @param args
 * @returns
 */
export function printFloat32Array4(float32: Float32Array): Float32Array {
  console.info('printArgs: ' + float32);
  let s: string[] = []
  s[0].split('')[1].toString()
  return float32;
}


export function printArrayBuffer1(arrBuf: ArrayBuffer): ArrayBuffer {
  console.info('printArgs: ' + arrBuf);
  return arrBuf;
}


export function printArrayBuffer2(arrBuf: ArrayBuffer): ArrayBuffer {
  console.info('printArgs: ' + arrBuf);
  return arrBuf;
}

/**
 * error
 * @param args
 * @returns
 */
export function printArrayBuffer3(arrBuf: ArrayBuffer): ArrayBuffer {
  console.info('printArgs: ' + arrBuf);
  let s: string[] = []
  s[0].split('')[1].toString()
  return arrBuf;
}

/**
 * error
 * @param args
 * @returns
 */
export function printArrayBuffer4(arrBuf: ArrayBuffer): ArrayBuffer {
  console.info('printArgs: ' + arrBuf);
  let s: string[] = []
  s[0].split('')[1].toString()
  return arrBuf;
}


export function printSharedArrayBuffer1(shared: ArrayBuffer): ArrayBuffer {
  console.info('printArgs: ' + shared);
  return shared;
}


export function printSharedArrayBuffer2(shared: ArrayBuffer): ArrayBuffer {
  console.info('printArgs: ' + shared);
  return shared;
}

/**
 * error
 * @param args
 * @returns
 */
export function printSharedArrayBuffer3(shared: ArrayBuffer): ArrayBuffer {
  console.info('printArgs: ' + shared);
  let s: string[] = []
  s[0].split('')[1].toString()
  return shared;
}

/**
 * error
 * @param args
 * @returns
 */
export function printSharedArrayBuffer4(shared: ArrayBuffer): ArrayBuffer {
  console.info('printArgs: ' + shared);
  let s: string[] = []
  s[0].split('')[1].toString()
  return shared;
}



export function printConcatArray1(concat: ConcatArray<Number>): ConcatArray<Number> {
  console.info('printArgs: ' + concat);
  return concat;
}


export function printConcatArray2(concat: ConcatArray<Number>): ConcatArray<Number> {
  console.info('printArgs: ' + concat);
  return concat;
}

/**
 * error
 * @param args
 * @returns
 */

export function printConcatArray3(concat: ConcatArray<Number>): ConcatArray<Number> {
  console.info('printArgs: ' + concat);
  let s: string[] = []
  s[0].split('')[1].toString()
  return concat;
}

/**
 * error
 * @param args
 * @returns
 */

export function printConcatArray4(concat: ConcatArray<Number>): ConcatArray<Number> {
  console.info('printArgs: ' + concat);
  let s: string[] = []
  s[0].split('')[1].toString()
  return concat;
}

type Union = string | Number | Array<Number>;


export function printUnion1(un: Union): Union {
  console.info('printArgs: ' + un);
  return un;
}



export function printUnion2(un: Union): Union {
  console.info('printArgs: ' + un);
  return un;
}

/**
 * error
 * @param args
 * @returns
 */

export function printUnion3(un: Union): Union {
  console.info('printArgs: ' + un);
  let s: string[] = []
  s[0].split('')[1].toString()
  return un;
}

/**
 * error
 * @param args
 * @returns
 */

export function printUnion4(un: Union): Union {
  console.info('printArgs: ' + un);
  let s: string[] = []
  s[0].split('')[1].toString()
  return un;
}



export function printEnum1(en: MyEnum): MyEnum {
  console.info('printArgs: ' + en);
  return en;
}



export function printEnum2(en: MyEnum): MyEnum {
  console.info('printArgs: ' + en);
  return en;
}

/**
 * error
 * @param args
 * @returns
 */
export function printEnum3(en: MyEnum): MyEnum {
  console.info('printArgs: ' + en);
  let s: string[] = []
  s[0].split('')[1].toString()
  return en;
}

/**
 * error
 * @param args
 * @returns
 */
export function printEnum4(en: MyEnum): MyEnum {
  console.info('printArgs: ' + en);
  let s: string[] = []
  s[0].split('')[1].toString()
  return en;
}

export function printAsyncLock1(asn: AsyncLock): AsyncLock {
  console.info('printArgs: ' + asn);
  return asn;
}



export function printAsyncLock2(asn: AsyncLock): AsyncLock {
  console.info('printArgs: ' + asn);
  return asn;
}

/**
 * error
 * @param args
 * @returns
 */

export function printAsyncLock3(asn: AsyncLock): AsyncLock {
  console.info('printArgs: ' + asn);
  let s: string[] = []
  s[0].split('')[1].toString()
  return asn;
}

/**
 * error
 * @param args
 * @returns
 */

export function printAsyncLock4(asn: AsyncLock): AsyncLock {
  console.info('printArgs: ' + asn);
  let s: string[] = []
  s[0].split('')[1].toString()
  return asn;
}



export function printMyClass1(args: MyClass): MyClass {
  console.info(`Task 1 is running with input: ${args}`);
  args.id
  console.info(`Task 1 is running with myclass: ${args}` + args.id);
  return args;
}


export function printMyClass2(args: MyClass): MyClass {
  console.info(`Task 2 is running with input: ${args}`);
  args.greet()
  console.info(`Task 2 is running with myclass: ${args}` + args.greet());
  return args;
}


export function printSendableTestClass1(arg: SendableTestClass): SendableTestClass {
  arg.increaseValue();
  console.info('Task one is processing...' + arg);
  return arg;
}



export function printSendableTestClass2(arg: SendableTestClass): SendableTestClass {
  arg.increaseValue();
  console.info('Task two is processing...' + arg);
  return arg;
}



export function printAny1(arg1: Number, arg2: string): Number | string {
  console.info('printArgs: ' + arg1 + arg2);
  return arg1;
}



export function printAny2(arg1: Number, arg2: string): Number | string {
  console.info('printArgs: ' + arg1 + arg2);
  return arg1;
}



export function testTransfer(arg1: ArrayBuffer, arg2: ArrayBuffer): Number {
  console.info('testTransfer arg1 byteLength: ' + arg1.byteLength);
  console.info('testTransfer arg2 byteLength: ' + arg2.byteLength);
  return 100;
}


export function testFunc(arr: Array<BaseClass>, num: Number): Number {
  let baseInstance1 = arr[0];
  console.info('sendable: str1 is: ' + baseInstance1.str1);
  baseInstance1.SetNum = 100;
  console.info('sendable: num1 is: ' + baseInstance1.GetNum);
  console.info('sendable: isDone1 is: ' + baseInstance1.isDone1);
  // 获取斐波那契数列第num项的结果
  let res: Number = baseInstance1.publicFunc(num);
  return res;
}


export function printLog(arr: Array<DeriveClass>): void {
  let deriveInstance = arr[0];
  deriveInstance.printName();
}