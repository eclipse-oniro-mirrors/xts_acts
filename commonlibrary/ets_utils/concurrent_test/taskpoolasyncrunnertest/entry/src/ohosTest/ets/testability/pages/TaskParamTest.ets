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
import { count1, count2, MyClass, MyEnum, SendableTestClass } from './DataFlg';
import { AsyncLock, BaseClass, DeriveClass } from './SendableTest';
import { ArkTSUtils, collections, lang } from '@kit.ArkTS';


@Concurrent
export function printStr1(str: string): string {
  console.info(`printStr: ${str}`);
  return str;
}

@Concurrent
export function printStr2(str: string): string {
  console.info(`printStr: ${str}`);
  return str;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printStr3(str: string): string {
  console.info('printStr: ' + str);
  let s: string[] = []
  s[0].split('')[1].toString()
  return str;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printStr4(str: string): string {
  let start: number = new Date().getTime();
  while (new Date().getTime() - start < 100) {
    continue;
  }
  console.info('printStr: ' + str);
  let s: string[] = []
  s[0].split('')[1].toString()
  return str;
}


@Concurrent
export function printArgs1(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

@Concurrent
export function printArgs2(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printArgs3(args: number): number {
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printArgs4(args: number): number {
  let s: string[] = []
  s[0].split('')[1].toString()
  return args;
}

@Concurrent
export function printBoolean1(bol: boolean): boolean {
  console.info('printArgs: ' + bol);
  return bol;
}

@Concurrent
export function printBoolean2(bol: boolean): boolean {
  console.info('printArgs: ' + bol);
  return bol;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printBoolean4(bol: boolean): boolean {
  console.info('printArgs: ' + bol);
  let s: string[] = []
  s[0].split('')[1].toString()
  return bol;
}


@Concurrent
export function printBigint1(big: bigint): bigint {
  console.info('printArgs: ' + big);
  return big;
}

@Concurrent
export function printBigint2(big: bigint): bigint {
  console.info('printArgs: ' + big);
  return big;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printBigint4(big: bigint): bigint {
  console.info('printArgs: ' + big);
  let s: string[] = []
  s[0].split('')[1].toString()
  return big;
}


@Concurrent
export function printUndefined1(und: undefined): undefined {
  console.info('printArgs: ' + und);
  return;
}

@Concurrent
export function printUndefined2(und: undefined): undefined {
  console.info('printArgs: ' + und);
  return;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printUndefined4(und: undefined): undefined {
  console.info('printArgs: ' + und);
  let s: string[] = []
  s[0].split('')[1].toString()
  return und;
}


@Concurrent
export function printNull1(nul: null): null {
  console.info('printArgs: ' + nul);
  return nul;
}

@Concurrent
export function printNull2(nul: null): null {
  console.info('printArgs: ' + nul);
  return nul;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printNull4(nul: null): null {
  console.info('printArgs: ' + nul);
  let s: string[] = []
  s[0].split('')[1].toString()
  return nul;
}


@Concurrent
export function printArray1(arr: Array<number>): Array<number> {
  console.info('printArgs: ' + arr);
  return arr;
}

@Concurrent
export function printArray2(arr: Array<number>): Array<number> {
  console.info('printArgs: ' + arr);
  return arr;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printArray3(arr: Array<number>): Array<number> {
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
@Concurrent
export function printArray4(arr: Array<number>): Array<number> {
  console.info('printArgs: ' + arr);
  let s: string[] = []
  s[0].split('')[1].toString()
  return arr;
}


@Concurrent
export function printMap1(map: Map<string, number>): Map<string, number> {
  console.info('printArgs: ' + map);
  return map;
}

@Concurrent
export function printMap2(map: Map<string, number>): Map<string, number> {
  console.info('printArgs: ' + map);
  return map;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printMap3(map: Map<string, number>): Map<string, number> {
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
@Concurrent
export function printMap4(map: Map<string, number>): Map<string, number> {
  console.info('printArgs: ' + map);
  let s: string[] = []
  s[0].split('')[1].toString()
  return map;
}


@Concurrent
export function printSet1(set: Set<number>): Set<number> {
  console.info('printArgs: ' + set);
  return set;
}

@Concurrent
export function printSet2(set: Set<number>): Set<number> {
  console.info('printArgs: ' + set);
  return set;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printSet3(set: Set<number>): Set<number> {
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
@Concurrent
export function printSet4(set: Set<number>): Set<number> {
  console.info('printArgs: ' + set);
  let s: string[] = []
  s[0].split('')[1].toString()
  return set;
}


@Concurrent
export function printInt8Array1(int8: Int8Array): Int8Array {
  console.info('printArgs: ' + int8);
  return int8;
}

@Concurrent
export function printInt8Array2(int8: Int8Array): Int8Array {
  console.info('printArgs: ' + int8);
  return int8;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printInt8Array4(int8: Int8Array): Int8Array {
  console.info('printArgs: ' + int8);
  let s: string[] = []
  s[0].split('')[1].toString()
  return int8;
}

@Concurrent
export function printUint8Array1(uint8: Uint8Array): Uint8Array {
  console.info('printArgs: ' + uint8);
  return uint8;
}

@Concurrent
export function printUint8Array2(uint8: Uint8Array): Uint8Array {
  console.info('printArgs: ' + uint8);
  return uint8;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printUint8Array4(uint8: Uint8Array): Uint8Array {
  console.info('printArgs: ' + uint8);
  let s: string[] = []
  s[0].split('')[1].toString()
  return uint8;
}


@Concurrent
export function printInt16Array1(int16: Int16Array): Int16Array {
  console.info('printArgs: ' + int16);
  return int16;
}

@Concurrent
export function printInt16Array2(int16: Int16Array): Int16Array {
  console.info('printArgs: ' + int16);
  return int16;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printInt16Array4(int16: Int16Array): Int16Array {
  console.info('printArgs: ' + int16);
  let s: string[] = []
  s[0].split('')[1].toString()
  return int16;
}


@Concurrent
export function printUint16Array1(uint16: Uint16Array): Uint16Array {
  console.info('printArgs: ' + uint16);
  return uint16;
}

@Concurrent
export function printUint16Array2(uint16: Uint16Array): Uint16Array {
  console.info('printArgs: ' + uint16);
  return uint16;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printUint16Array4(uint16: Uint16Array): Uint16Array {
  console.info('printArgs: ' + uint16);
  let s: string[] = []
  s[0].split('')[1].toString()
  return uint16;
}


@Concurrent
export function printInt32Array1(int32: Int32Array): Int32Array {
  console.info('printArgs: ' + int32);
  return int32;
}

@Concurrent
export function printInt32Array2(int32: Int32Array): Int32Array {
  console.info('printArgs: ' + int32);
  return int32;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printInt32Array4(int32: Int32Array): Int32Array {
  console.info('printArgs: ' + int32);
  let s: string[] = []
  s[0].split('')[1].toString()
  return int32;
}


@Concurrent
export function printUint32Array1(uint32: Uint32Array): Uint32Array {
  console.info('printArgs: ' + uint32);
  return uint32;
}

@Concurrent
export function printUint32Array2(uint32: Uint32Array): Uint32Array {
  console.info('printArgs: ' + uint32);
  return uint32;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printUint32Array4(uint32: Uint32Array): Uint32Array {
  console.info('printArgs: ' + uint32);
  let s: string[] = []
  s[0].split('')[1].toString()
  return uint32;
}


@Concurrent
export function printUint8ClampedArray1(uint8Clamped: Uint8ClampedArray): Uint8ClampedArray {
  console.info('printArgs: ' + uint8Clamped);
  return uint8Clamped;
}

@Concurrent
export function printUint8ClampedArray2(uint8Clamped: Uint8ClampedArray): Uint8ClampedArray {
  console.info('printArgs: ' + uint8Clamped);
  return uint8Clamped;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printUint8ClampedArray4(uint8Clamped: Uint8ClampedArray): Uint8ClampedArray {
  console.info('printArgs: ' + uint8Clamped);
  let s: string[] = []
  s[0].split('')[1].toString()
  return uint8Clamped;
}

@Concurrent
export function printFloat32Array1(float32: Float32Array): Float32Array {
  console.info('printArgs: ' + float32);
  return float32;
}

@Concurrent
export function printFloat32Array2(float32: Float32Array): Float32Array {
  console.info('printArgs: ' + float32);
  return float32;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printFloat32Array4(float32: Float32Array): Float32Array {
  console.info('printArgs: ' + float32);
  let s: string[] = []
  s[0].split('')[1].toString()
  return float32;
}

@Concurrent
export function printArrayBuffer1(arrBuf: ArrayBuffer): ArrayBuffer {
  console.info('printArgs: ' + arrBuf);
  return arrBuf;
}

@Concurrent
export function printArrayBuffer2(arrBuf: ArrayBuffer): ArrayBuffer {
  console.info('printArgs: ' + arrBuf);
  return arrBuf;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printArrayBuffer4(arrBuf: ArrayBuffer): ArrayBuffer {
  console.info('printArgs: ' + arrBuf);
  let s: string[] = []
  s[0].split('')[1].toString()
  return arrBuf;
}

@Concurrent
export function printSharedArrayBuffer1(shared: SharedArrayBuffer): SharedArrayBuffer {
  console.info('printArgs: ' + shared);
  return shared;
}

@Concurrent
export function printSharedArrayBuffer2(shared: SharedArrayBuffer): SharedArrayBuffer {
  console.info('printArgs: ' + shared);
  return shared;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printSharedArrayBuffer3(shared: SharedArrayBuffer): SharedArrayBuffer {
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
@Concurrent
export function printSharedArrayBuffer4(shared: SharedArrayBuffer): SharedArrayBuffer {
  console.info('printArgs: ' + shared);
  let s: string[] = []
  s[0].split('')[1].toString()
  return shared;
}


@Concurrent
export function printConcatArray1(concat: ConcatArray<number>): ConcatArray<number> {
  console.info('printArgs: ' + concat);
  return concat;
}

@Concurrent
export function printConcatArray2(concat: ConcatArray<number>): ConcatArray<number> {
  console.info('printArgs: ' + concat);
  return concat;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printConcatArray3(concat: ConcatArray<number>): ConcatArray<number> {
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
@Concurrent
export function printConcatArray4(concat: ConcatArray<number>): ConcatArray<number> {
  console.info('printArgs: ' + concat);
  let s: string[] = []
  s[0].split('')[1].toString()
  return concat;
}

@Concurrent
export function printBitVector1(bitVector: collections.BitVector): collections.BitVector {
  console.info('printArgs: ' + bitVector);
  return bitVector;
}

@Concurrent
export function printBitVector2(bitVector: collections.BitVector): collections.BitVector {
  console.info('printArgs: ' + bitVector);
  return bitVector;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printBitVector3(bitVector: collections.BitVector): collections.BitVector {
  console.info('printArgs: ' + bitVector);
  let s: string[] = []
  s[0].split('')[1].toString()
  return bitVector;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printBitVector4(bitVector: collections.BitVector): collections.BitVector {
  console.info('printArgs: ' + bitVector);
  let s: string[] = []
  s[0].split('')[1].toString()
  return bitVector;
}


type Union = string | number | Array<number>;

@Concurrent
export function printUnion1(un: Union): Union {
  console.info('printArgs: ' + un);
  return un;
}


@Concurrent
export function printUnion2(un: Union): Union {
  console.info('printArgs: ' + un);
  return un;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printUnion4(un: Union): Union {
  console.info('printArgs: ' + un);
  let s: string[] = []
  s[0].split('')[1].toString()
  return un;
}


@Concurrent
export function printEnum1(en: MyEnum): MyEnum {
  console.info('printArgs: ' + en);
  return en;
}


@Concurrent
export function printEnum2(en: MyEnum): MyEnum {
  console.info('printArgs: ' + en);
  return en;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printEnum4(en: MyEnum): MyEnum {
  console.info('printArgs: ' + en);
  let s: string[] = []
  s[0].split('')[1].toString()
  return en;
}


@Concurrent
export function printASON1(ason: ArkTSUtils.ASON.ISendable): ArkTSUtils.ASON.ISendable {
  console.info('printArgs: ' + ason);
  return ason;
}


@Concurrent
export function printASON2(ason: ArkTSUtils.ASON.ISendable): ArkTSUtils.ASON.ISendable {
  console.info('printArgs: ' + ason);
  return ason;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printASON3(ason: ArkTSUtils.ASON.ISendable): ArkTSUtils.ASON.ISendable {
  console.info('printArgs: ' + ason);
  let s: string[] = []
  s[0].split('')[1].toString()
  return ason;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printASON4(asn: ArkTSUtils.ASON.ISendable): ArkTSUtils.ASON.ISendable {
  console.info('printArgs: ' + asn);
  let s: string[] = []
  s[0].split('')[1].toString()
  return asn;
}

@Concurrent
export function printAsyncLock1(asn: AsyncLock): AsyncLock {
  console.info('printArgs: ' + asn);
  return asn;
}


@Concurrent
export function printAsyncLock2(asn: AsyncLock): AsyncLock {
  console.info('printArgs: ' + asn);
  return asn;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
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
@Concurrent
export function printAsyncLock4(asn: AsyncLock): AsyncLock {
  console.info('printArgs: ' + asn);
  let s: string[] = []
  s[0].split('')[1].toString()
  return asn;
}


@Concurrent
export function printMyClass1(args: MyClass): MyClass {
  console.info(`Task 1 is running with input: ${args}`);
  args.id
  console.info(`Task 1 is running with myclass: ${args}` + args.id);
  return args;
}

@Concurrent
export function printMyClass2(args: MyClass): MyClass {
  console.info(`Task 2 is running with input: ${args}`);
  args.greet()
  console.info(`Task 2 is running with myclass: ${args}` + args.greet());
  return args;
}

@Concurrent
export function printSendableTestClass1(arg: SendableTestClass): SendableTestClass {
  arg.increaseValue();
  console.info('Task one is processing...' + arg);
  return arg;
}


@Concurrent
export function printSendableTestClass2(arg: SendableTestClass): SendableTestClass {
  arg.increaseValue();
  console.info('Task two is processing...' + arg);
  return arg;
}

@Concurrent
export function printISendable1(arg: lang.ISendable): lang.ISendable {
  console.info('printArgs: ' + arg);
  return arg;
}


@Concurrent
export function printISendable2(arg: lang.ISendable): lang.ISendable {
  console.info('printArgs: ' + arg);
  return arg;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printISendable3(arg: lang.ISendable): lang.ISendable {
  console.info('printArgs: ' + arg);
  let s: string[] = []
  s[0].split('')[1].toString()
  return arg;
}

/**
 * error
 * @param args
 * @returns
 */
@Concurrent
export function printISendable4(arg: lang.ISendable): lang.ISendable {
  console.info('printArgs: ' + arg);
  let s: string[] = []
  s[0].split('')[1].toString()
  return arg;
}

@Sendable
type SendableFunction = (func: SendableFunction) => SendableFunction;

// 定义一个示例的可发送函数
@Sendable
export function sampleFunction(func: SendableFunction): SendableFunction {
  console.log('Executing sampleFunction');
  return func;
}

@Concurrent
export function printSendableFunction1(arg: SendableFunction): SendableFunction {
  console.info('printArgs: ' + arg);
  return arg;
}

@Concurrent
export function printSendableFunction2(arg: SendableFunction): SendableFunction {
  console.info('printArgs: ' + arg);
  return arg;
}


@Concurrent
export function printAny1(arg1: number, arg2: string): number | string {
  console.info('printArgs: ' + arg1 + arg2);
  return arg1;
}


@Concurrent
export function printAny2(arg1: number, arg2: string): number | string {
  console.info('printArgs: ' + arg1 + arg2);
  return arg1;
}


@Concurrent
export function testTransfer(arg1: ArrayBuffer, arg2: ArrayBuffer): number {
  console.info('testTransfer arg1 byteLength: ' + arg1.byteLength);
  console.info('testTransfer arg2 byteLength: ' + arg2.byteLength);
  return 100;
}

@Concurrent
export function testFunc(arr: Array<BaseClass>, num: number): number {
  let baseInstance1 = arr[0];
  console.info('sendable: str1 is: ' + baseInstance1.str1);
  baseInstance1.SetNum = 100;
  console.info('sendable: num1 is: ' + baseInstance1.GetNum);
  console.info('sendable: isDone1 is: ' + baseInstance1.isDone1);
  // 获取斐波那契数列第num项的结果
  let res: number = baseInstance1.publicFunc(num);
  return res;
}

@Concurrent
export function printLog(arr: Array<DeriveClass>): void {
  let deriveInstance = arr[0];
  deriveInstance.printName();
}