/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { ArkTSUtils, collections, lang } from '@kit.ArkTS';

export const getString = () => 'example string';

export const getNumber = () => 42;

export const getBoolean = () => true;

export const getBigInt = () => 1234567890123456789012345678901234567890n;

export const getUndefined = () => undefined as undefined | string | number | null;

export const getNull = () => null as undefined | string | number | null;

export const getTopLevelClassInstance = () => new topLevelSendableClass();

export const getTopLevelFunction = () => TopLevelSendableFunction;

export const getEnum = () => SendableConstEnum.OPTION_1;

export const getArray = () => new collections.Array<number>();

export const getMap = () => new collections.Map<number, number>();

export const getSet = () => new collections.Set<number>();

export const getTypedArrayInt8Array = () => new collections.Int8Array(6);

export const getTypedArrayUint8Array = () => new collections.Uint8Array(6);

export const getTypedArrayInt16Array = () => new collections.Int16Array(6);

export const getTypedArrayUint16Array = () => new collections.Uint16Array(6);

export const getTypedArrayInt32Array = () => new collections.Int32Array(6);

export const getTypedArrayUint32Array = () => new collections.Uint32Array(6);

export const getTypedArrayUint8ClampedArray = () => new collections.Uint8ClampedArray(6);

export const getTypedArrayFloat32Array = () => new collections.Float32Array(6);

export const getArrayBuffer = () => new collections.ArrayBuffer(10);

export const getConcatArray = () => new collections.Array<number>(1, 2, 4);

export const getBitVector = () => new collections.BitVector(2);

export const getASON = () => ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;

export const getAsyncLock = () => ArkTSUtils.locks.AsyncLock.request("queryTestLock");

export const getSendableUnionArray = () => 1 as string | number | boolean | bigint;

@Sendable
export class topLevelSendableClass {
  num: number = 1;

  PrintNum() {
    console.info('Top level sendable class');
  }
}

@Sendable
export function TopLevelSendableFunction(): string {
  return 'Top level sendable function';
}

@Sendable
export type SendableFuncType = () => string;

export const enum SendableConstEnum {
  OPTION_1,
  OPTION_2,
  OPTION_3
}

export type ISendable = lang.ISendable;

export function identityFunction<T>(arg: T): T {
  return arg;
}

export function arrowFunc<T>(initializer: () => T): T {
  return initializer();
}

@Sendable
export function ModifiedTopLevelSendableFunction(): string {
  return 'Modified top level sendable function';
}

@Sendable
export class SendableFuncSetClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  topLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  topLevelFunction: SendableFuncType = TopLevelSendableFunction;
  myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  myArray: collections.Array<number> = new collections.Array<number>();
  myMap: collections.Map<number, number> = new collections.Map<number, number>();
  mySet: collections.Set<number> = new collections.Set<number>();
  myTypedArrayInt8Array: collections.Int8Array = new collections.Int8Array(6);
  myTypedArrayUint8Array: collections.Uint8Array = new collections.Uint8Array(6);
  myTypedArrayInt16Array: collections.Int16Array = new collections.Int16Array(6);
  myTypedArrayUint16Array: collections.Uint16Array = new collections.Uint16Array(6);
  myTypedArrayInt32Array: collections.Int32Array = new collections.Int32Array(6);
  myTypedArrayUint32Array: collections.Uint32Array = new collections.Uint32Array(6);
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(6);
  myTypedArrayFloat32Array: collections.Float32Array = new collections.Float32Array(6);
  myArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  myConcatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  myBitVector: collections.BitVector = new collections.BitVector(2);
  myASON: ISendable = ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  mySendableUnionArray: string | number | boolean | bigint = 1;

  constructor() {
  }

  returnString(value: string): string {
    return value;
  }

  returnNumber(value: number): number {
    return value;
  }

  returnBoolean(value: boolean): boolean {
    return value;
  }

  returnBigInt(value: bigint): bigint {
    return value;
  }

  returnUndefined(value: undefined): undefined {
    return value;
  }

  returnNull(value: null): null {
    return value;
  }

  returnTopLevelClassInstance(value: topLevelSendableClass): topLevelSendableClass {
    return value;
  }

  returnTopLevelFunction(value: SendableFuncType): SendableFuncType {
    return value;
  }

  returnEnum(value: SendableConstEnum): SendableConstEnum {
    return value;
  }

  returnArray(value: collections.Array<number>): collections.Array<number> {
    return value;
  }

  returnMap(value: collections.Map<number, number>): collections.Map<number, number> {
    return value;
  }

  returnSet(value: collections.Set<number>): collections.Set<number> {
    return value;
  }

  returnTypedArrayInt8Array(value: collections.Int8Array): collections.Int8Array {
    return value;
  }

  returnTypedArrayUint8Array(value: collections.Uint8Array): collections.Uint8Array {
    return value;
  }

  returnTypedArrayInt16Array(value: collections.Int16Array): collections.Int16Array {
    return value;
  }

  returnTypedArrayUint16Array(value: collections.Uint16Array): collections.Uint16Array {
    return value;
  }

  returnTypedArrayInt32Array(value: collections.Int32Array): collections.Int32Array {
    return value;
  }

  returnTypedArrayUint32Array(value: collections.Uint32Array): collections.Uint32Array {
    return value;
  }

  returnTypedArrayUint8ClampedArray(value: collections.Uint8ClampedArray): collections.Uint8ClampedArray {
    return value;
  }

  returnTypedArrayFloat32Array(value: collections.Float32Array): collections.Float32Array {
    return value;
  }

  returnArrayBuffer(value: collections.ArrayBuffer): collections.ArrayBuffer {
    return value;
  }

  returnConcatArray(value: collections.ConcatArray<number>): collections.ConcatArray<number> {
    return value;
  }

  returnBitVector(value: collections.BitVector): collections.BitVector {
    return value;
  }

  returnASON(value: ISendable): ISendable {
    return value;
  }

  returnAsyncLock(value: ArkTSUtils.locks.AsyncLock): ArkTSUtils.locks.AsyncLock {
    return value;
  }

  returnSendableUnionArray(value: string | number | boolean | bigint): string | number | boolean | bigint {
    return value;
  }
}

@Sendable
export class SendableStaticFuncSetClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  topLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  topLevelFunction: SendableFuncType = TopLevelSendableFunction;
  myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  myArray: collections.Array<number> = new collections.Array<number>();
  myMap: collections.Map<number, number> = new collections.Map<number, number>();
  mySet: collections.Set<number> = new collections.Set<number>();
  myTypedArrayInt8Array: collections.Int8Array = new collections.Int8Array(6);
  myTypedArrayUint8Array: collections.Uint8Array = new collections.Uint8Array(6);
  myTypedArrayInt16Array: collections.Int16Array = new collections.Int16Array(6);
  myTypedArrayUint16Array: collections.Uint16Array = new collections.Uint16Array(6);
  myTypedArrayInt32Array: collections.Int32Array = new collections.Int32Array(6);
  myTypedArrayUint32Array: collections.Uint32Array = new collections.Uint32Array(6);
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(6);
  myTypedArrayFloat32Array: collections.Float32Array = new collections.Float32Array(6);
  myArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  myConcatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  myBitVector: collections.BitVector = new collections.BitVector(2);
  myASON: ISendable = ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  mySendableUnionArray: string | number | boolean | bigint = 1;

  constructor() {
  }

  static returnString(value: string): string {
    return value;
  }

  static returnNumber(value: number): number {
    return value;
  }

  static returnBoolean(value: boolean): boolean {
    return value;
  }

  static returnBigInt(value: bigint): bigint {
    return value;
  }

  static returnUndefined(value: undefined): undefined {
    return value;
  }

  static returnNull(value: null): null {
    return value;
  }

  static returnTopLevelClassInstance(value: topLevelSendableClass): topLevelSendableClass {
    return value;
  }

  static returnTopLevelFunction(value: SendableFuncType): SendableFuncType {
    return value;
  }

  static returnEnum(value: SendableConstEnum): SendableConstEnum {
    return value;
  }

  static returnArray(value: collections.Array<number>): collections.Array<number> {
    return value;
  }

  static returnMap(value: collections.Map<number, number>): collections.Map<number, number> {
    return value;
  }

  static returnSet(value: collections.Set<number>): collections.Set<number> {
    return value;
  }

  static returnTypedArrayInt8Array(value: collections.Int8Array): collections.Int8Array {
    return value;
  }

  static returnTypedArrayUint8Array(value: collections.Uint8Array): collections.Uint8Array {
    return value;
  }

  static returnTypedArrayInt16Array(value: collections.Int16Array): collections.Int16Array {
    return value;
  }

  static returnTypedArrayUint16Array(value: collections.Uint16Array): collections.Uint16Array {
    return value;
  }

  static returnTypedArrayInt32Array(value: collections.Int32Array): collections.Int32Array {
    return value;
  }

  static returnTypedArrayUint32Array(value: collections.Uint32Array): collections.Uint32Array {
    return value;
  }

  static returnTypedArrayUint8ClampedArray(value: collections.Uint8ClampedArray): collections.Uint8ClampedArray {
    return value;
  }

  static returnTypedArrayFloat32Array(value: collections.Float32Array): collections.Float32Array {
    return value;
  }

  static returnArrayBuffer(value: collections.ArrayBuffer): collections.ArrayBuffer {
    return value;
  }

  static returnConcatArray(value: collections.ConcatArray<number>): collections.ConcatArray<number> {
    return value;
  }

  static returnBitVector(value: collections.BitVector): collections.BitVector {
    return value;
  }

  static returnASON(value: ISendable): ISendable {
    return value;
  }

  static returnAsyncLock(value: ArkTSUtils.locks.AsyncLock): ArkTSUtils.locks.AsyncLock {
    return value;
  }

  static returnSendableUnionArray(value: string | number | boolean | bigint): string | number | boolean | bigint {
    return value;
  }
}

@Sendable
export class SendableAsyncFuncSetClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  topLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  topLevelFunction: SendableFuncType = TopLevelSendableFunction;
  myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  myArray: collections.Array<number> = new collections.Array<number>();
  myMap: collections.Map<number, number> = new collections.Map<number, number>();
  mySet: collections.Set<number> = new collections.Set<number>();
  myTypedArrayInt8Array: collections.Int8Array = new collections.Int8Array(6);
  myTypedArrayUint8Array: collections.Uint8Array = new collections.Uint8Array(6);
  myTypedArrayInt16Array: collections.Int16Array = new collections.Int16Array(6);
  myTypedArrayUint16Array: collections.Uint16Array = new collections.Uint16Array(6);
  myTypedArrayInt32Array: collections.Int32Array = new collections.Int32Array(6);
  myTypedArrayUint32Array: collections.Uint32Array = new collections.Uint32Array(6);
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(6);
  myTypedArrayFloat32Array: collections.Float32Array = new collections.Float32Array(6);
  myArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  myConcatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  myBitVector: collections.BitVector = new collections.BitVector(2);
  myASON: ISendable = ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  mySendableUnionArray: string | number | boolean | bigint = 1;

  constructor() {
  }

  async processString(input: string): Promise<string> {
    return input;
  }

  async processNumber(input: number): Promise<number> {
    return input;
  }

  async processBoolean(input: boolean): Promise<boolean> {
    return input;
  }

  async processBigInt(input: bigint): Promise<bigint> {
    return input;
  }

  async processUndefined(input: undefined | string | number | null): Promise<undefined | string | number | null> {
    return input;
  }

  async processNull(input: undefined | string | number | null): Promise<undefined | string | number | null> {
    return input;
  }

  async processTopLevelClassInstance(input: topLevelSendableClass): Promise<topLevelSendableClass> {
    return input;
  }

  async processTopLevelFunction(input: SendableFuncType): Promise<SendableFuncType> {
    return input;
  }

  async processEnum(input: SendableConstEnum): Promise<SendableConstEnum> {
    return input;
  }

  async processArray(input: collections.Array<number>): Promise<collections.Array<number>> {
    return input;
  }

  async processMap(input: collections.Map<number, number>): Promise<collections.Map<number, number>> {
    return input;
  }

  async processSet(input: collections.Set<number>): Promise<collections.Set<number>> {
    return input;
  }

  async processTypedArrayInt8Array(input: collections.Int8Array): Promise<collections.Int8Array> {
    return input;
  }

  async processTypedArrayUint8Array(input: collections.Uint8Array): Promise<collections.Uint8Array> {
    return input;
  }

  async processTypedArrayInt16Array(input: collections.Int16Array): Promise<collections.Int16Array> {
    return input;
  }

  async processTypedArrayUint16Array(input: collections.Uint16Array): Promise<collections.Uint16Array> {
    return input;
  }

  async processTypedArrayInt32Array(input: collections.Int32Array): Promise<collections.Int32Array> {
    return input;
  }

  async processTypedArrayUint32Array(input: collections.Uint32Array): Promise<collections.Uint32Array> {
    return input;
  }

  async processTypedArrayUint8ClampedArray(input: collections.Uint8ClampedArray): Promise<collections.Uint8ClampedArray> {
    return input;
  }

  async processTypedArrayFloat32Array(input: collections.Float32Array): Promise<collections.Float32Array> {
    return input;
  }

  async processArrayBuffer(input: collections.ArrayBuffer): Promise<collections.ArrayBuffer> {
    return input;
  }

  async processConcatArray(input: collections.ConcatArray<number>): Promise<collections.ConcatArray<number>> {
    return input;
  }

  async processBitVector(input: collections.BitVector): Promise<collections.BitVector> {
    return input;
  }

  async processASON(input: ISendable): Promise<ISendable> {
    return input;
  }

  async processAsyncLock(input: ArkTSUtils.locks.AsyncLock): Promise<ArkTSUtils.locks.AsyncLock> {
    return input;
  }

  async processSendableUnionArray(input: string | number | boolean | bigint): Promise<string | number | boolean | bigint> {
    return input;
  }
}

@Sendable
export class SendableStaticGetFuncSetClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  topLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  topLevelFunction: SendableFuncType = TopLevelSendableFunction;
  myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  myArray: collections.Array<number> = new collections.Array<number>();
  myMap: collections.Map<number, number> = new collections.Map<number, number>();
  mySet: collections.Set<number> = new collections.Set<number>();
  myTypedArrayInt8Array: collections.Int8Array = new collections.Int8Array(6);
  myTypedArrayUint8Array: collections.Uint8Array = new collections.Uint8Array(6);
  myTypedArrayInt16Array: collections.Int16Array = new collections.Int16Array(6);
  myTypedArrayUint16Array: collections.Uint16Array = new collections.Uint16Array(6);
  myTypedArrayInt32Array: collections.Int32Array = new collections.Int32Array(6);
  myTypedArrayUint32Array: collections.Uint32Array = new collections.Uint32Array(6);
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(6);
  myTypedArrayFloat32Array: collections.Float32Array = new collections.Float32Array(6);
  myArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  myConcatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  myBitVector: collections.BitVector = new collections.BitVector(2);
  myASON: ISendable = ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  mySendableUnionArray: string | number | boolean | bigint = 1;

  constructor() {
  }

  static getMyString(): string {
    return new SendableStaticGetFuncSetClass().myString;
  }

  static getMyNumber(): number {
    return new SendableStaticGetFuncSetClass().myNumber;
  }

  static getMyBoolean(): boolean {
    return new SendableStaticGetFuncSetClass().myBoolean;
  }

  static getMyBigInt(): bigint {
    return new SendableStaticGetFuncSetClass().myBigInt;
  }

  static getMyUndefined(): undefined | string | number | null {
    return new SendableStaticGetFuncSetClass().myUndefined;
  }

  static getMyNull(): undefined | string | number | null {
    return new SendableStaticGetFuncSetClass().myNull;
  }

  static getMyTopLevelClassInstance(): topLevelSendableClass {
    return new SendableStaticGetFuncSetClass().topLevelClassInstance;
  }

  static getMyTopLevelFunction(): SendableFuncType {
    return new SendableStaticGetFuncSetClass().topLevelFunction;
  }

  static getMyEnum(): SendableConstEnum {
    return new SendableStaticGetFuncSetClass().myEnum;
  }

  static getMyArray(): collections.Array<number> {
    return new SendableStaticGetFuncSetClass().myArray;
  }

  static getMyMap(): collections.Map<number, number> {
    return new SendableStaticGetFuncSetClass().myMap;
  }

  static getMySet(): collections.Set<number> {
    return new SendableStaticGetFuncSetClass().mySet;
  }

  static getMyTypedArrayInt8Array(): collections.Int8Array {
    return new SendableStaticGetFuncSetClass().myTypedArrayInt8Array;
  }

  static getMyTypedArrayUint8Array(): collections.Uint8Array {
    return new SendableStaticGetFuncSetClass().myTypedArrayUint8Array;
  }

  static getMyTypedArrayInt16Array(): collections.Int16Array {
    return new SendableStaticGetFuncSetClass().myTypedArrayInt16Array;
  }

  static getMyTypedArrayUint16Array(): collections.Uint16Array {
    return new SendableStaticGetFuncSetClass().myTypedArrayUint16Array;
  }

  static getMyTypedArrayInt32Array(): collections.Int32Array {
    return new SendableStaticGetFuncSetClass().myTypedArrayInt32Array;
  }

  static getMyTypedArrayUint32Array(): collections.Uint32Array {
    return new SendableStaticGetFuncSetClass().myTypedArrayUint32Array;
  }

  static getMyTypedArrayUint8ClampedArray(): collections.Uint8ClampedArray {
    return new SendableStaticGetFuncSetClass().myTypedArrayUint8ClampedArray;
  }

  static getMyTypedArrayFloat32Array(): collections.Float32Array {
    return new SendableStaticGetFuncSetClass().myTypedArrayFloat32Array;
  }

  static getMyArrayBuffer(): collections.ArrayBuffer {
    return new SendableStaticGetFuncSetClass().myArrayBuffer;
  }

  static getMyConcatArray(): collections.ConcatArray<number> {
    return new SendableStaticGetFuncSetClass().myConcatArray;
  }

  static getMyBitVector(): collections.BitVector {
    return new SendableStaticGetFuncSetClass().myBitVector;
  }

  static getMyASON(): ISendable {
    return new SendableStaticGetFuncSetClass().myASON;
  }

  static getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return new SendableStaticGetFuncSetClass().myAsyncLock;
  }

  static getMySendableUnionArray(): string | number | boolean | bigint {
    return new SendableStaticGetFuncSetClass().mySendableUnionArray;
  }
}

@Sendable
export class SendableGetFuncSetClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  topLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  topLevelFunction: SendableFuncType = TopLevelSendableFunction;
  myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  myArray: collections.Array<number> = new collections.Array<number>();
  myMap: collections.Map<number, number> = new collections.Map<number, number>();
  mySet: collections.Set<number> = new collections.Set<number>();
  myTypedArrayInt8Array: collections.Int8Array = new collections.Int8Array(6);
  myTypedArrayUint8Array: collections.Uint8Array = new collections.Uint8Array(6);
  myTypedArrayInt16Array: collections.Int16Array = new collections.Int16Array(6);
  myTypedArrayUint16Array: collections.Uint16Array = new collections.Uint16Array(6);
  myTypedArrayInt32Array: collections.Int32Array = new collections.Int32Array(6);
  myTypedArrayUint32Array: collections.Uint32Array = new collections.Uint32Array(6);
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(6);
  myTypedArrayFloat32Array: collections.Float32Array = new collections.Float32Array(6);
  myArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  myConcatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  myBitVector: collections.BitVector = new collections.BitVector(2);
  myASON: ISendable = ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  mySendableUnionArray: string | number | boolean | bigint = 1;

  constructor() {
  }

  getMyString(): string {
    return new SendableGetFuncSetClass().myString;
  }

  getMyNumber(): number {
    return new SendableGetFuncSetClass().myNumber;
  }

  getMyBoolean(): boolean {
    return new SendableGetFuncSetClass().myBoolean;
  }

  getMyBigInt(): bigint {
    return new SendableGetFuncSetClass().myBigInt;
  }

  getMyUndefined(): undefined | string | number | null {
    return new SendableGetFuncSetClass().myUndefined;
  }

  getMyNull(): undefined | string | number | null {
    return new SendableGetFuncSetClass().myNull;
  }

  getMyTopLevelClassInstance(): topLevelSendableClass {
    return new SendableGetFuncSetClass().topLevelClassInstance;
  }

  getMyTopLevelFunction(): SendableFuncType {
    return new SendableGetFuncSetClass().topLevelFunction;
  }

  getMyEnum(): SendableConstEnum {
    return new SendableGetFuncSetClass().myEnum;
  }

  getMyArray(): collections.Array<number> {
    return new SendableGetFuncSetClass().myArray;
  }

  getMyMap(): collections.Map<number, number> {
    return new SendableGetFuncSetClass().myMap;
  }

  getMySet(): collections.Set<number> {
    return new SendableGetFuncSetClass().mySet;
  }

  getMyTypedArrayInt8Array(): collections.Int8Array {
    return new SendableGetFuncSetClass().myTypedArrayInt8Array;
  }

  getMyTypedArrayUint8Array(): collections.Uint8Array {
    return new SendableGetFuncSetClass().myTypedArrayUint8Array;
  }

  getMyTypedArrayInt16Array(): collections.Int16Array {
    return new SendableGetFuncSetClass().myTypedArrayInt16Array;
  }

  getMyTypedArrayUint16Array(): collections.Uint16Array {
    return new SendableGetFuncSetClass().myTypedArrayUint16Array;
  }

  getMyTypedArrayInt32Array(): collections.Int32Array {
    return new SendableGetFuncSetClass().myTypedArrayInt32Array;
  }

  getMyTypedArrayUint32Array(): collections.Uint32Array {
    return new SendableGetFuncSetClass().myTypedArrayUint32Array;
  }

  getMyTypedArrayUint8ClampedArray(): collections.Uint8ClampedArray {
    return new SendableGetFuncSetClass().myTypedArrayUint8ClampedArray;
  }

  getMyTypedArrayFloat32Array(): collections.Float32Array {
    return new SendableGetFuncSetClass().myTypedArrayFloat32Array;
  }

  getMyArrayBuffer(): collections.ArrayBuffer {
    return new SendableGetFuncSetClass().myArrayBuffer;
  }

  getMyConcatArray(): collections.ConcatArray<number> {
    return new SendableGetFuncSetClass().myConcatArray;
  }

  getMyBitVector(): collections.BitVector {
    return new SendableGetFuncSetClass().myBitVector;
  }

  getMyASON(): ISendable {
    return new SendableGetFuncSetClass().myASON;
  }

  getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return new SendableGetFuncSetClass().myAsyncLock;
  }

  getMySendableUnionArray(): string | number | boolean | bigint {
    return new SendableGetFuncSetClass().mySendableUnionArray;
  }
}

@Sendable
export class SendableStaticSetFuncSetClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  topLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  topLevelFunction: SendableFuncType = TopLevelSendableFunction;
  myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  myArray: collections.Array<number> = new collections.Array<number>();
  myMap: collections.Map<number, number> = new collections.Map<number, number>();
  mySet: collections.Set<number> = new collections.Set<number>();
  myTypedArrayInt8Array: collections.Int8Array = new collections.Int8Array(6);
  myTypedArrayUint8Array: collections.Uint8Array = new collections.Uint8Array(6);
  myTypedArrayInt16Array: collections.Int16Array = new collections.Int16Array(6);
  myTypedArrayUint16Array: collections.Uint16Array = new collections.Uint16Array(6);
  myTypedArrayInt32Array: collections.Int32Array = new collections.Int32Array(6);
  myTypedArrayUint32Array: collections.Uint32Array = new collections.Uint32Array(6);
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(6);
  myTypedArrayFloat32Array: collections.Float32Array = new collections.Float32Array(6);
  myArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  myConcatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  myBitVector: collections.BitVector = new collections.BitVector(2);
  myASON: ISendable = ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  mySendableUnionArray: string | number | boolean | bigint = 1;

  constructor() {
  }

  static setMyString(instance: SendableStaticSetFuncSetClass, value: string) {
    instance.myString = value;
  }

  static setMyNumber(instance: SendableStaticSetFuncSetClass, value: number) {
    instance.myNumber = value;
  }

  static setMyBoolean(instance: SendableStaticSetFuncSetClass, value: boolean) {
    instance.myBoolean = value;
  }

  static setMyBigInt(instance: SendableStaticSetFuncSetClass, value: bigint) {
    instance.myBigInt = value;
  }

  static setMyUndefined(instance: SendableStaticSetFuncSetClass, value: undefined | string | number | null) {
    instance.myUndefined = value;
  }

  static setMyNull(instance: SendableStaticSetFuncSetClass, value: undefined | string | number | null) {
    instance.myNull = value;
  }

  static setMyTopLevelClassInstance(instance: SendableStaticSetFuncSetClass, value: topLevelSendableClass) {
    instance.topLevelClassInstance = value;
  }

  static setMyTopLevelFunction(instance: SendableStaticSetFuncSetClass, value: SendableFuncType) {
    instance.topLevelFunction = value;
  }

  static setMyEnum(instance: SendableStaticSetFuncSetClass, value: SendableConstEnum) {
    instance.myEnum = value;
  }

  static setMyArray(instance: SendableStaticSetFuncSetClass, value: collections.Array<number>) {
    instance.myArray = value;
  }

  static setMyMap(instance: SendableStaticSetFuncSetClass, value: collections.Map<number, number>) {
    instance.myMap = value;
  }

  static setMySet(instance: SendableStaticSetFuncSetClass, value: collections.Set<number>) {
    instance.mySet = value;
  }

  static setMyTypedArrayInt8Array(instance: SendableStaticSetFuncSetClass, value: collections.Int8Array) {
    instance.myTypedArrayInt8Array = value;
  }

  static setMyTypedArrayUint8Array(instance: SendableStaticSetFuncSetClass, value: collections.Uint8Array) {
    instance.myTypedArrayUint8Array = value;
  }

  static setMyTypedArrayInt16Array(instance: SendableStaticSetFuncSetClass, value: collections.Int16Array) {
    instance.myTypedArrayInt16Array = value;
  }

  static setMyTypedArrayUint16Array(instance: SendableStaticSetFuncSetClass, value: collections.Uint16Array) {
    instance.myTypedArrayUint16Array = value;
  }

  static setMyTypedArrayInt32Array(instance: SendableStaticSetFuncSetClass, value: collections.Int32Array) {
    instance.myTypedArrayInt32Array = value;
  }

  static setMyTypedArrayUint32Array(instance: SendableStaticSetFuncSetClass, value: collections.Uint32Array) {
    instance.myTypedArrayUint32Array = value;
  }

  static setMyTypedArrayUint8ClampedArray(instance: SendableStaticSetFuncSetClass,
    value: collections.Uint8ClampedArray) {
    instance.myTypedArrayUint8ClampedArray = value;
  }

  static setMyTypedArrayFloat32Array(instance: SendableStaticSetFuncSetClass, value: collections.Float32Array) {
    instance.myTypedArrayFloat32Array = value;
  }

  static setMyArrayBuffer(instance: SendableStaticSetFuncSetClass, value: collections.ArrayBuffer) {
    instance.myArrayBuffer = value;
  }

  static setMyConcatArray(instance: SendableStaticSetFuncSetClass, value: collections.ConcatArray<number>) {
    instance.myConcatArray = value;
  }

  static setMyBitVector(instance: SendableStaticSetFuncSetClass, value: collections.BitVector) {
    instance.myBitVector = value;
  }

  static setMyASON(instance: SendableStaticSetFuncSetClass, value: ISendable) {
    instance.myASON = value;
  }

  static setMyAsyncLock(instance: SendableStaticSetFuncSetClass, value: ArkTSUtils.locks.AsyncLock) {
    instance.myAsyncLock = value;
  }

  static setMySendableUnionArray(instance: SendableStaticSetFuncSetClass, value: string | number | boolean | bigint) {
    instance.mySendableUnionArray = value;
  }
}

@Sendable
export class SendableSetFuncSetClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  topLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  topLevelFunction: SendableFuncType = TopLevelSendableFunction;
  myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  myArray: collections.Array<number> = new collections.Array<number>();
  myMap: collections.Map<number, number> = new collections.Map<number, number>();
  mySet: collections.Set<number> = new collections.Set<number>();
  myTypedArrayInt8Array: collections.Int8Array = new collections.Int8Array(6);
  myTypedArrayUint8Array: collections.Uint8Array = new collections.Uint8Array(6);
  myTypedArrayInt16Array: collections.Int16Array = new collections.Int16Array(6);
  myTypedArrayUint16Array: collections.Uint16Array = new collections.Uint16Array(6);
  myTypedArrayInt32Array: collections.Int32Array = new collections.Int32Array(6);
  myTypedArrayUint32Array: collections.Uint32Array = new collections.Uint32Array(6);
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(6);
  myTypedArrayFloat32Array: collections.Float32Array = new collections.Float32Array(6);
  myArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  myConcatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  myBitVector: collections.BitVector = new collections.BitVector(2);
  myASON: ISendable = ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  mySendableUnionArray: string | number | boolean | bigint = 1;

  constructor() {
  }

  setMyString(value: string) {
    this.myString = value;
  }

  setMyNumber(value: number) {
    this.myNumber = value;
  }

  setMyBoolean(value: boolean) {
    this.myBoolean = value;
  }

  setMyBigInt(value: bigint) {
    this.myBigInt = value;
  }

  setMyUndefined(value: undefined | string | number | null) {
    this.myUndefined = value;
  }

  setMyNull(value: undefined | string | number | null) {
    this.myNull = value;
  }

  setMyTopLevelClassInstance(value: topLevelSendableClass) {
    this.topLevelClassInstance = value;
  }

  setMyTopLevelFunction(value: SendableFuncType) {
    this.topLevelFunction = value;
  }

  setMyEnum(value: SendableConstEnum) {
    this.myEnum = value;
  }

  setMyArray(value: collections.Array<number>) {
    this.myArray = value;
  }

  setMyMap(value: collections.Map<number, number>) {
    this.myMap = value;
  }

  setMySet(value: collections.Set<number>) {
    this.mySet = value;
  }

  setMyTypedArrayInt8Array(value: collections.Int8Array) {
    this.myTypedArrayInt8Array = value;
  }

  setMyTypedArrayUint8Array(value: collections.Uint8Array) {
    this.myTypedArrayUint8Array = value;
  }

  setMyTypedArrayInt16Array(value: collections.Int16Array) {
    this.myTypedArrayInt16Array = value;
  }

  setMyTypedArrayUint16Array(value: collections.Uint16Array) {
    this.myTypedArrayUint16Array = value;
  }

  setMyTypedArrayInt32Array(value: collections.Int32Array) {
    this.myTypedArrayInt32Array = value;
  }

  setMyTypedArrayUint32Array(value: collections.Uint32Array) {
    this.myTypedArrayUint32Array = value;
  }

  setMyTypedArrayUint8ClampedArray(value: collections.Uint8ClampedArray) {
    this.myTypedArrayUint8ClampedArray = value;
  }

  setMyTypedArrayFloat32Array(value: collections.Float32Array) {
    this.myTypedArrayFloat32Array = value;
  }

  setMyArrayBuffer(value: collections.ArrayBuffer) {
    this.myArrayBuffer = value;
  }

  setMyConcatArray(value: collections.ConcatArray<number>) {
    this.myConcatArray = value;
  }

  setMyBitVector(value: collections.BitVector) {
    this.myBitVector = value;
  }

  setMyASON(value: ISendable) {
    this.myASON = value;
  }

  setMyAsyncLock(value: ArkTSUtils.locks.AsyncLock) {
    this.myAsyncLock = value;
  }

  setMySendableUnionArray(value: string | number | boolean | bigint) {
    this.mySendableUnionArray = value;
  }
}

@Sendable
export class SendableConstructorClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  topLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  topLevelFunction: SendableFuncType = TopLevelSendableFunction;
  myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  myArray: collections.Array<number> = new collections.Array<number>();
  myMap: collections.Map<number, number> = new collections.Map<number, number>();
  mySet: collections.Set<number> = new collections.Set<number>();
  myTypedArrayInt8Array: collections.Int8Array = new collections.Int8Array(6);
  myTypedArrayUint8Array: collections.Uint8Array = new collections.Uint8Array(6);
  myTypedArrayInt16Array: collections.Int16Array = new collections.Int16Array(6);
  myTypedArrayUint16Array: collections.Uint16Array = new collections.Uint16Array(6);
  myTypedArrayInt32Array: collections.Int32Array = new collections.Int32Array(6);
  myTypedArrayUint32Array: collections.Uint32Array = new collections.Uint32Array(6);
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(6);
  myTypedArrayFloat32Array: collections.Float32Array = new collections.Float32Array(6);
  myArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  myConcatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  myBitVector: collections.BitVector = new collections.BitVector(2);
  myASON: ISendable = ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  mySendableUnionArray: string | number | boolean | bigint = 1;

  constructor(param?: string | number | boolean | bigint | undefined | null | topLevelSendableClass | SendableFuncType | SendableConstEnum | collections.Array<number> | collections.Map<number, number> | collections.Set<number> | collections.Int8Array | collections.Uint8Array | collections.Int16Array | collections.Uint16Array | collections.Int32Array | collections.Uint32Array | collections.Uint8ClampedArray | collections.Float32Array | collections.ArrayBuffer | collections.ConcatArray<number> | collections.BitVector | ISendable | ArkTSUtils.locks.AsyncLock) {
    if (typeof param === 'string') {
      this.myString = param;
    } else if (typeof param === 'number') {
      this.myNumber = param;
    } else if (typeof param === 'boolean') {
      this.myBoolean = param;
    } else if (typeof param === 'bigint') {
      this.myBigInt = param;
    } else if (param instanceof topLevelSendableClass) {
      this.topLevelClassInstance = param;
    } else if (param instanceof collections.Array) {
      this.myArray = param;
    } else if (param instanceof collections.Map) {
      this.myMap = param;
    } else if (param instanceof collections.Set) {
      this.mySet = param;
    } else if (param instanceof collections.Int8Array) {
      this.myTypedArrayInt8Array = param;
    } else if (param instanceof collections.Uint8Array) {
      this.myTypedArrayUint8Array = param;
    } else if (param instanceof collections.Int16Array) {
      this.myTypedArrayInt16Array = param;
    } else if (param instanceof collections.Uint16Array) {
      this.myTypedArrayUint16Array = param;
    } else if (param instanceof collections.Int32Array) {
      this.myTypedArrayInt32Array = param;
    } else if (param instanceof collections.Uint32Array) {
      this.myTypedArrayUint32Array = param;
    } else if (param instanceof collections.Uint8ClampedArray) {
      this.myTypedArrayUint8ClampedArray = param;
    } else if (param instanceof collections.Float32Array) {
      this.myTypedArrayFloat32Array = param;
    } else if (param instanceof collections.ArrayBuffer) {
      this.myArrayBuffer = param;
    } else if (param instanceof collections.BitVector) {
      this.myBitVector = param;
    } else if (param instanceof ArkTSUtils.locks.AsyncLock) {
      this.myAsyncLock = param;
    } else if (param === undefined || param === null) {
      this.myUndefined = param as undefined;
      this.myNull = param as null;
    } else if (param === TopLevelSendableFunction) {
      this.topLevelFunction = TopLevelSendableFunction;
    }
  }
}