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
export class SendablePrivateClass implements ISendable {
  private myString: string = 'example string';
  private myNumber: number = 42;
  private myBoolean: boolean = true;
  private myBigInt: bigint = 1234567890123456789012345678901234567890n;
  private myUndefined: undefined | string | number | null = undefined;
  private myNull: undefined | string | number | null = null;
  private topLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  private topLevelFunction: SendableFuncType = TopLevelSendableFunction;
  private myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  private myArray: collections.Array<number> = new collections.Array<number>();
  private myMap: collections.Map<number, number> = new collections.Map<number, number>();
  private mySet: collections.Set<number> = new collections.Set<number>();
  private myTypedArrayInt8Array: collections.Int8Array = new collections.Int8Array(6);
  private myTypedArrayUint8Array: collections.Uint8Array = new collections.Uint8Array(6);
  private myTypedArrayInt16Array: collections.Int16Array = new collections.Int16Array(6);
  private myTypedArrayUint16Array: collections.Uint16Array = new collections.Uint16Array(6);
  private myTypedArrayInt32Array: collections.Int32Array = new collections.Int32Array(6);
  private myTypedArrayUint32Array: collections.Uint32Array = new collections.Uint32Array(6);
  private myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(6);
  private myTypedArrayFloat32Array: collections.Float32Array = new collections.Float32Array(6);
  private myArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  private myConcatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  private myBitVector: collections.BitVector = new collections.BitVector(2);
  private myASON: ISendable = ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  private myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  private mySendableUnionArray: string | number | boolean | bigint = 1;

  constructor() {
  }
}

@Sendable
export class SendablePrivateInheritClass extends SendablePrivateClass {
  department: string;

  constructor(department: string) {
    super()
    this.department = department;
  }
}

@Sendable
export class SendableDefaultClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  myTopLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  myTopLevelFunction: SendableFuncType = TopLevelSendableFunction;
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
    this.myTopLevelClassInstance = value;
  }

  setMyTopLevelFunction(value: SendableFuncType) {
    this.myTopLevelFunction = value;
  }

  setMyEnum(value: SendableConstEnum) {
    this.myEnum = value;
  }

  setMyArray(value: number[]) {
    this.myArray = new collections.Array<number>(...value);
  }

  setMyMap(key: number, value: number) {
    this.myMap.set(key, value);
  }

  setMySet(value: number) {
    this.mySet = this.mySet.add(value);
  }

  setMyTypedArrayInt8Array(value: number[]) {
    this.myTypedArrayInt8Array = new collections.Int8Array(value);
  }

  setMyTypedArrayUint8Array(value: number[]) {
    this.myTypedArrayUint8Array = new collections.Uint8Array(value);
  }

  setMyTypedArrayInt16Array(value: number[]) {
    this.myTypedArrayInt16Array = new collections.Int16Array(value);
  }

  setMyTypedArrayUint16Array(value: number[]) {
    this.myTypedArrayUint16Array = new collections.Uint16Array(value);
  }

  setMyTypedArrayInt32Array(value: number[]) {
    this.myTypedArrayInt32Array = new collections.Int32Array(value);
  }

  setMyTypedArrayUint32Array(value: number[]) {
    this.myTypedArrayUint32Array = new collections.Uint32Array(value);
  }

  setMyTypedArrayUint8ClampedArray(value: number[]) {
    this.myTypedArrayUint8ClampedArray = new collections.Uint8ClampedArray(value);
  }

  setMyTypedArrayFloat32Array(value: number[]) {
    this.myTypedArrayFloat32Array = new collections.Float32Array(value);
  }

  setMyArrayBuffer(size: number) {
    this.myArrayBuffer = new collections.ArrayBuffer(size);
  }

  setMyConcatArray(value: number[]) {
    this.myConcatArray = new collections.Array<number>(...value);
  }

  setMyBitVector(size: number) {
    this.myBitVector.push(size);
  }

  setMyASON(json: string) {
    this.myASON = ArkTSUtils.ASON.parse(json) as ISendable;
  }

  setMyAsyncLock(name: string) {
    this.myAsyncLock = ArkTSUtils.locks.AsyncLock.request(name);
  }

  setMySendableUnion(value: string | number | boolean | bigint) {
    this.mySendableUnionArray = value;
  }
}

@Sendable
export class SendableDefaultInheritClass extends SendableDefaultClass {
  constructor() {
    super();
  }

  getMyString() {
    return this.myString;
  }

  getMyNumber(): number {
    return this.myNumber;
  }

  getMyBoolean(): boolean {
    return this.myBoolean;
  }

  getMyBigInt(): bigint {
    return this.myBigInt;
  }

  getMyUndefined(): undefined | string | number | null {
    return this.myUndefined;
  }

  getMyNull(): undefined | string | number | null {
    return this.myNull;
  }

  getMyTopLevelClassInstance(): topLevelSendableClass {
    return this.myTopLevelClassInstance;
  }

  getMyTopLevelFunction(): SendableFuncType {
    return this.myTopLevelFunction;
  }

  getMyEnum(): SendableConstEnum {
    return this.myEnum;
  }

  getMyArray(): collections.Array<number> {
    return this.myArray;
  }

  getMyMap(): collections.Map<number, number> {
    return this.myMap;
  }

  getMySet(): collections.Set<number> {
    return this.mySet;
  }

  getMyTypedArrayInt8Array(): collections.Int8Array {
    return this.myTypedArrayInt8Array;
  }

  getMyTypedArrayUint8Array(): collections.Uint8Array {
    return this.myTypedArrayUint8Array;
  }

  getMyTypedArrayInt16Array(): collections.Int16Array {
    return this.myTypedArrayInt16Array;
  }

  getMyTypedArrayUint16Array(): collections.Uint16Array {
    return this.myTypedArrayUint16Array;
  }

  getMyTypedArrayInt32Array(): collections.Int32Array {
    return this.myTypedArrayInt32Array;
  }

  getMyTypedArrayUint32Array(): collections.Uint32Array {
    return this.myTypedArrayUint32Array;
  }

  getMyTypedArrayUint8ClampedArray(): collections.Uint8ClampedArray {
    return this.myTypedArrayUint8ClampedArray;
  }

  getMyTypedArrayFloat32Array(): collections.Float32Array {
    return this.myTypedArrayFloat32Array;
  }

  getMyArrayBuffer(): collections.ArrayBuffer {
    return this.myArrayBuffer;
  }

  getMyConcatArray(): collections.ConcatArray<number> {
    return this.myConcatArray;
  }

  getMyBitVector(): collections.BitVector {
    return this.myBitVector;
  }

  getMyASON(): ISendable {
    return this.myASON;
  }

  getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return this.myAsyncLock;
  }

  getMySendableUnionArray(): string | number | boolean | bigint {
    return this.mySendableUnionArray;
  }
}

@Sendable
export class SendablePublicClass implements ISendable {
  public myString: string = 'example string';
  public myNumber: number = 42;
  public myBoolean: boolean = true;
  public myBigInt: bigint = 1234567890123456789012345678901234567890n;
  public myUndefined: undefined | string | number | null = undefined;
  public myNull: undefined | string | number | null = null;
  public myTopLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  public myTopLevelFunction: SendableFuncType = TopLevelSendableFunction;
  public myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  public myArray: collections.Array<number> = new collections.Array<number>();
  public myMap: collections.Map<number, number> = new collections.Map<number, number>();
  public mySet: collections.Set<number> = new collections.Set<number>();
  public myTypedArrayInt8Array: collections.Int8Array = new collections.Int8Array(6);
  public myTypedArrayUint8Array: collections.Uint8Array = new collections.Uint8Array(6);
  public myTypedArrayInt16Array: collections.Int16Array = new collections.Int16Array(6);
  public myTypedArrayUint16Array: collections.Uint16Array = new collections.Uint16Array(6);
  public myTypedArrayInt32Array: collections.Int32Array = new collections.Int32Array(6);
  public myTypedArrayUint32Array: collections.Uint32Array = new collections.Uint32Array(6);
  public myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(6);
  public myTypedArrayFloat32Array: collections.Float32Array = new collections.Float32Array(6);
  public myArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  public myConcatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  public myBitVector: collections.BitVector = new collections.BitVector(2);
  public myASON: ISendable = ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  public myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  public mySendableUnionArray: string | number | boolean | bigint = 1;

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
    this.myTopLevelClassInstance = value;
  }

  setMyTopLevelFunction(value: SendableFuncType) {
    this.myTopLevelFunction = value;
  }

  setMyEnum(value: SendableConstEnum) {
    this.myEnum = value;
  }

  setMyArray(value: number[]) {
    this.myArray = new collections.Array<number>(...value);
  }

  setMyMap(key: number, value: number) {
    this.myMap.set(key, value);
  }

  setMySet(value: number) {
    this.mySet = this.mySet.add(value);
  }

  setMyTypedArrayInt8Array(value: number[]) {
    this.myTypedArrayInt8Array = new collections.Int8Array(value);
  }

  setMyTypedArrayUint8Array(value: number[]) {
    this.myTypedArrayUint8Array = new collections.Uint8Array(value);
  }

  setMyTypedArrayInt16Array(value: number[]) {
    this.myTypedArrayInt16Array = new collections.Int16Array(value);
  }

  setMyTypedArrayUint16Array(value: number[]) {
    this.myTypedArrayUint16Array = new collections.Uint16Array(value);
  }

  setMyTypedArrayInt32Array(value: number[]) {
    this.myTypedArrayInt32Array = new collections.Int32Array(value);
  }

  setMyTypedArrayUint32Array(value: number[]) {
    this.myTypedArrayUint32Array = new collections.Uint32Array(value);
  }

  setMyTypedArrayUint8ClampedArray(value: number[]) {
    this.myTypedArrayUint8ClampedArray = new collections.Uint8ClampedArray(value);
  }

  setMyTypedArrayFloat32Array(value: number[]) {
    this.myTypedArrayFloat32Array = new collections.Float32Array(value);
  }

  setMyArrayBuffer(size: number) {
    this.myArrayBuffer = new collections.ArrayBuffer(size);
  }

  setMyConcatArray(value: number[]) {
    this.myConcatArray = new collections.Array<number>(...value);
  }

  setMyBitVector(size: number) {
    this.myBitVector.push(size);
  }

  setMyASON(json: string) {
    this.myASON = ArkTSUtils.ASON.parse(json) as ISendable;
  }

  setMyAsyncLock(name: string) {
    this.myAsyncLock = ArkTSUtils.locks.AsyncLock.request(name);
  }

  setMySendableUnion(value: string | number | boolean | bigint) {
    this.mySendableUnionArray = value;
  }
}

@Sendable
export class SendablePublicInheritClass extends SendablePublicClass {
  constructor() {
    super();
  }

  getMyString() {
    return this.myString;
  }

  getMyNumber(): number {
    return this.myNumber;
  }

  getMyBoolean(): boolean {
    return this.myBoolean;
  }

  getMyBigInt(): bigint {
    return this.myBigInt;
  }

  getMyUndefined(): undefined | string | number | null {
    return this.myUndefined;
  }

  getMyNull(): undefined | string | number | null {
    return this.myNull;
  }

  getMyTopLevelClassInstance(): topLevelSendableClass {
    return this.myTopLevelClassInstance;
  }

  getMyTopLevelFunction(): SendableFuncType {
    return this.myTopLevelFunction;
  }

  getMyEnum(): SendableConstEnum {
    return this.myEnum;
  }

  getMyArray(): collections.Array<number> {
    return this.myArray;
  }

  getMyMap(): collections.Map<number, number> {
    return this.myMap;
  }

  getMySet(): collections.Set<number> {
    return this.mySet;
  }

  getMyTypedArrayInt8Array(): collections.Int8Array {
    return this.myTypedArrayInt8Array;
  }

  getMyTypedArrayUint8Array(): collections.Uint8Array {
    return this.myTypedArrayUint8Array;
  }

  getMyTypedArrayInt16Array(): collections.Int16Array {
    return this.myTypedArrayInt16Array;
  }

  getMyTypedArrayUint16Array(): collections.Uint16Array {
    return this.myTypedArrayUint16Array;
  }

  getMyTypedArrayInt32Array(): collections.Int32Array {
    return this.myTypedArrayInt32Array;
  }

  getMyTypedArrayUint32Array(): collections.Uint32Array {
    return this.myTypedArrayUint32Array;
  }

  getMyTypedArrayUint8ClampedArray(): collections.Uint8ClampedArray {
    return this.myTypedArrayUint8ClampedArray;
  }

  getMyTypedArrayFloat32Array(): collections.Float32Array {
    return this.myTypedArrayFloat32Array;
  }

  getMyArrayBuffer(): collections.ArrayBuffer {
    return this.myArrayBuffer;
  }

  getMyConcatArray(): collections.ConcatArray<number> {
    return this.myConcatArray;
  }

  getMyBitVector(): collections.BitVector {
    return this.myBitVector;
  }

  getMyASON(): ISendable {
    return this.myASON;
  }

  getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return this.myAsyncLock;
  }

  getMySendableUnionArray(): string | number | boolean | bigint {
    return this.mySendableUnionArray;
  }
}

@Sendable
export class SendablePrivateFuncClass implements ISendable {
  myString: string = this.handleString('example string');
  myNumber: number = this.handleNumber(42);
  myBoolean: boolean = this.handleBoolean(true);
  myBigInt: bigint = this.handleBigInt(1234567890123456789012345678901234567890n);
  myUndefined: undefined | string | number | null = this.handleUndefined(undefined);
  myNull: undefined | string | number | null = this.handleNull(null);
  topLevelClassInstance: topLevelSendableClass = this.handleTopLevelClassInstance(new topLevelSendableClass());
  topLevelFunction: SendableFuncType = this.handleTopLevelFunction(TopLevelSendableFunction);
  myEnum: SendableConstEnum = this.handleEnum(SendableConstEnum.OPTION_1);
  myArray: collections.Array<number> = this.handleArray(new collections.Array<number>());
  myMap: collections.Map<number, number> = this.handleMap(new collections.Map<number, number>());
  mySet: collections.Set<number> = this.handleSet(new collections.Set<number>());
  myTypedArrayInt8Array: collections.Int8Array = this.handleTypedArrayInt8Array(new collections.Int8Array(6));
  myTypedArrayUint8Array: collections.Uint8Array = this.handleTypedArrayUint8Array(new collections.Uint8Array(6));
  myTypedArrayInt16Array: collections.Int16Array = this.handleTypedArrayInt16Array(new collections.Int16Array(6));
  myTypedArrayUint16Array: collections.Uint16Array = this.handleTypedArrayUint16Array(new collections.Uint16Array(6));
  myTypedArrayInt32Array: collections.Int32Array = this.handleTypedArrayInt32Array(new collections.Int32Array(6));
  myTypedArrayUint32Array: collections.Uint32Array = this.handleTypedArrayUint32Array(new collections.Uint32Array(6));
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray =
    this.handleTypedArrayUint8ClampedArray(new collections.Uint8ClampedArray(6));
  myTypedArrayFloat32Array: collections.Float32Array =
    this.handleTypedArrayFloat32Array(new collections.Float32Array(6));
  myArrayBuffer: collections.ArrayBuffer = this.handleArrayBuffer(new collections.ArrayBuffer(10));
  myConcatArray: collections.ConcatArray<number> = this.handleConcatArray(new collections.Array<number>(1, 2, 4));
  myBitVector: collections.BitVector = this.handleBitVector(new collections.BitVector(2));
  myASON: ISendable =
    this.handleASON(ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
  myAsyncLock: ArkTSUtils.locks.AsyncLock = this.handleAsyncLock(ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
  mySendableUnionArray: string | number | boolean | bigint = this.handleSendableUnionArray(1);

  constructor() {
  }

  private handleString(input: string): string {
    return input;
  }

  private handleNumber(input: number): number {
    return input;
  }

  private handleBoolean(input: boolean): boolean {
    return input;
  }

  private handleBigInt(input: bigint): bigint {
    return input;
  }

  private handleUndefined(input: undefined | string | number | null): undefined | string | number | null {
    return input;
  }

  private handleNull(input: undefined | string | number | null): undefined | string | number | null {
    return input;
  }

  private handleTopLevelClassInstance(input: topLevelSendableClass): topLevelSendableClass {
    return input;
  }

  private handleTopLevelFunction(input: SendableFuncType): SendableFuncType {
    return input;
  }

  private handleEnum(input: SendableConstEnum): SendableConstEnum {
    return input;
  }

  private handleArray(input: collections.Array<number>): collections.Array<number> {
    return input;
  }

  private handleMap(input: collections.Map<number, number>): collections.Map<number, number> {
    return input;
  }

  private handleSet(input: collections.Set<number>): collections.Set<number> {
    return input;
  }

  private handleTypedArrayInt8Array(input: collections.Int8Array): collections.Int8Array {
    return input;
  }

  private handleTypedArrayUint8Array(input: collections.Uint8Array): collections.Uint8Array {
    return input;
  }

  private handleTypedArrayInt16Array(input: collections.Int16Array): collections.Int16Array {
    return input;
  }

  private handleTypedArrayUint16Array(input: collections.Uint16Array): collections.Uint16Array {
    return input;
  }

  private handleTypedArrayInt32Array(input: collections.Int32Array): collections.Int32Array {
    return input;
  }

  private handleTypedArrayUint32Array(input: collections.Uint32Array): collections.Uint32Array {
    return input;
  }

  private handleTypedArrayUint8ClampedArray(input: collections.Uint8ClampedArray): collections.Uint8ClampedArray {
    return input;
  }

  private handleTypedArrayFloat32Array(input: collections.Float32Array): collections.Float32Array {
    return input;
  }

  private handleArrayBuffer(input: collections.ArrayBuffer): collections.ArrayBuffer {
    return input;
  }

  private handleConcatArray(input: collections.ConcatArray<number>): collections.ConcatArray<number> {
    return input;
  }

  private handleBitVector(input: collections.BitVector): collections.BitVector {
    return input;
  }

  private handleASON(input: ISendable): ISendable {
    return input;
  }

  private handleAsyncLock(input: ArkTSUtils.locks.AsyncLock): ArkTSUtils.locks.AsyncLock {
    return input;
  }

  private handleSendableUnionArray(input: string | number | boolean | bigint): string | number | boolean | bigint {
    return input;
  }
}

@Sendable
export class SendablePrivateFuncInheritClass extends SendablePrivateFuncClass {
  department: string;

  constructor(department: string) {
    super()
    this.department = department;
  }
}

@Sendable
export class SendableDefaultFuncClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  myTopLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  myTopLevelFunction: SendableFuncType = TopLevelSendableFunction;
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

  handleString(input: string): string {
    return input;
  }

  handleNumber(input: number): number {
    return input;
  }

  handleBoolean(input: boolean): boolean {
    return input;
  }

  handleBigInt(input: bigint): bigint {
    return input;
  }

  handleUndefined(input: undefined | string | number | null): undefined | string | number | null {
    return input;
  }

  handleNull(input: undefined | string | number | null): undefined | string | number | null {
    return input;
  }

  handleTopLevelClassInstance(input: topLevelSendableClass): topLevelSendableClass {
    return input;
  }

  handleTopLevelFunction(input: SendableFuncType): SendableFuncType {
    return input;
  }

  handleEnum(input: SendableConstEnum): SendableConstEnum {
    return input;
  }

  handleArray(input: collections.Array<number>): collections.Array<number> {
    return input;
  }

  handleMap(input: collections.Map<number, number>): collections.Map<number, number> {
    return input;
  }

  handleSet(input: collections.Set<number>): collections.Set<number> {
    return input;
  }

  handleTypedArrayInt8Array(input: collections.Int8Array): collections.Int8Array {
    return input;
  }

  handleTypedArrayUint8Array(input: collections.Uint8Array): collections.Uint8Array {
    return input;
  }

  handleTypedArrayInt16Array(input: collections.Int16Array): collections.Int16Array {
    return input;
  }

  handleTypedArrayUint16Array(input: collections.Uint16Array): collections.Uint16Array {
    return input;
  }

  handleTypedArrayInt32Array(input: collections.Int32Array): collections.Int32Array {
    return input;
  }

  handleTypedArrayUint32Array(input: collections.Uint32Array): collections.Uint32Array {
    return input;
  }

  handleTypedArrayUint8ClampedArray(input: collections.Uint8ClampedArray): collections.Uint8ClampedArray {
    return input;
  }

  handleTypedArrayFloat32Array(input: collections.Float32Array): collections.Float32Array {
    return input;
  }

  handleArrayBuffer(input: collections.ArrayBuffer): collections.ArrayBuffer {
    return input;
  }

  handleConcatArray(input: collections.ConcatArray<number>): collections.ConcatArray<number> {
    return input;
  }

  handleBitVector(input: collections.BitVector): collections.BitVector {
    return input;
  }

  handleASON(input: ISendable): ISendable {
    return input;
  }

  handleAsyncLock(input: ArkTSUtils.locks.AsyncLock): ArkTSUtils.locks.AsyncLock {
    return input;
  }

  handleSendableUnionArray(input: string | number | boolean | bigint): string | number | boolean | bigint {
    return input;
  }
}

@Sendable
export class SendableDefaultFuncInheritClass extends SendableDefaultFuncClass {
  constructor() {
    super()
  }

  setMyString(value: string) {
    this.myString = this.handleString(value);
  }

  setMyNumber(value: number) {
    this.myNumber = this.handleNumber(value);
  }

  setMyBoolean(value: boolean) {
    this.myBoolean = this.handleBoolean(value);
  }

  setMyBigInt(value: bigint) {
    this.myBigInt = this.handleBigInt(value);
  }

  setMyUndefined(value: undefined | string | number | null) {
    this.myUndefined = this.handleUndefined(value);
  }

  setMyNull(value: undefined | string | number | null) {
    this.myNull = this.handleNull(value);
  }

  setMyTopLevelClassInstance(value: topLevelSendableClass) {
    this.myTopLevelClassInstance = this.handleTopLevelClassInstance(value);
  }

  setMyTopLevelFunction(value: SendableFuncType) {
    this.myTopLevelFunction = this.handleTopLevelFunction(value);
  }

  setMyEnum(value: SendableConstEnum) {
    this.myEnum = this.handleEnum(value);
  }

  setMyArray(value: number[]) {
    const arrayInstance = new collections.Array<number>(...value);
    this.myArray = this.handleArray(arrayInstance);
  }

  setMyMap(key: number, value: number) {
    if (!this.myMap) {
      this.myMap = new collections.Map<number, number>();
    }
    this.myMap.set(key, value);
    this.myMap = this.handleMap(this.myMap);
  }

  setMySet(value: number) {
    if (!this.mySet) {
      this.mySet = new collections.Set<number>();
    }
    this.mySet.add(value);
    this.mySet = this.handleSet(this.mySet);
  }

  setMyTypedArrayInt8Array(value: number[]) {
    const int8Array = new collections.Int8Array(value);
    this.myTypedArrayInt8Array = this.handleTypedArrayInt8Array(int8Array);
  }

  setMyTypedArrayUint8Array(value: number[]) {
    const uint8Array = new collections.Uint8Array(value);
    this.myTypedArrayUint8Array = this.handleTypedArrayUint8Array(uint8Array);
  }

  setMyTypedArrayInt16Array(value: number[]) {
    const int16Array = new collections.Int16Array(value);
    this.myTypedArrayInt16Array = this.handleTypedArrayInt16Array(int16Array);
  }

  setMyTypedArrayUint16Array(value: number[]) {
    const uint16Array = new collections.Uint16Array(value);
    this.myTypedArrayUint16Array = this.handleTypedArrayUint16Array(uint16Array);
  }

  setMyTypedArrayInt32Array(value: number[]) {
    const int32Array = new collections.Int32Array(value);
    this.myTypedArrayInt32Array = this.handleTypedArrayInt32Array(int32Array);
  }

  setMyTypedArrayUint32Array(value: number[]) {
    const uint32Array = new collections.Uint32Array(value);
    this.myTypedArrayUint32Array = this.handleTypedArrayUint32Array(uint32Array);
  }

  setMyTypedArrayUint8ClampedArray(value: number[]) {
    const uint8ClampedArray = new collections.Uint8ClampedArray(value);
    this.myTypedArrayUint8ClampedArray = this.handleTypedArrayUint8ClampedArray(uint8ClampedArray);
  }

  setMyTypedArrayFloat32Array(value: number[]) {
    const float32Array = new collections.Float32Array(value);
    this.myTypedArrayFloat32Array = this.handleTypedArrayFloat32Array(float32Array);
  }

  setMyArrayBuffer(size: number) {
    const arrayBuffer = new collections.ArrayBuffer(size);
    this.myArrayBuffer = this.handleArrayBuffer(arrayBuffer);
  }

  setMyConcatArray(value: number) {
    const concatArrayInstance: collections.ConcatArray<number> = new collections.Array<number>(value);
    this.myConcatArray = this.handleConcatArray(concatArrayInstance);
  }

  setMyBitVector(size: number) {
    this.myBitVector.push(size);
    this.myBitVector = this.handleBitVector(this.myBitVector);
  }

  setMyASON(json: string) {
    const parsedObject = ArkTSUtils.ASON.parse(json) as ISendable;
    this.myASON = this.handleASON(parsedObject);
  }

  setMyAsyncLock(name: string) {
    const lockInstance = ArkTSUtils.locks.AsyncLock.request(name);
    this.myAsyncLock = this.handleAsyncLock(lockInstance);
  }

  setMySendableUnion(value: string | number | boolean | bigint) {
    this.mySendableUnionArray = this.handleSendableUnionArray(value);
  }
}

@Sendable
export class SendablePublicFuncClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  myTopLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  myTopLevelFunction: SendableFuncType = TopLevelSendableFunction;
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

  public handleString(input: string): string {
    return input;
  }

  public handleNumber(input: number): number {
    return input;
  }

  public handleBoolean(input: boolean): boolean {
    return input;
  }

  public handleBigInt(input: bigint): bigint {
    return input;
  }

  public handleUndefined(input: undefined | string | number | null): undefined | string | number | null {
    return input;
  }

  public handleNull(input: undefined | string | number | null): undefined | string | number | null {
    return input;
  }

  public handleTopLevelClassInstance(input: topLevelSendableClass): topLevelSendableClass {
    return input;
  }

  public handleTopLevelFunction(input: SendableFuncType): SendableFuncType {
    return input;
  }

  public handleEnum(input: SendableConstEnum): SendableConstEnum {
    return input;
  }

  public handleArray(input: collections.Array<number>): collections.Array<number> {
    return input;
  }

  public handleMap(input: collections.Map<number, number>): collections.Map<number, number> {
    return input;
  }

  public handleSet(input: collections.Set<number>): collections.Set<number> {
    return input;
  }

  public handleTypedArrayInt8Array(input: collections.Int8Array): collections.Int8Array {
    return input;
  }

  public handleTypedArrayUint8Array(input: collections.Uint8Array): collections.Uint8Array {
    return input;
  }

  public handleTypedArrayInt16Array(input: collections.Int16Array): collections.Int16Array {
    return input;
  }

  public handleTypedArrayUint16Array(input: collections.Uint16Array): collections.Uint16Array {
    return input;
  }

  public handleTypedArrayInt32Array(input: collections.Int32Array): collections.Int32Array {
    return input;
  }

  public handleTypedArrayUint32Array(input: collections.Uint32Array): collections.Uint32Array {
    return input;
  }

  public handleTypedArrayUint8ClampedArray(input: collections.Uint8ClampedArray): collections.Uint8ClampedArray {
    return input;
  }

  public handleTypedArrayFloat32Array(input: collections.Float32Array): collections.Float32Array {
    return input;
  }

  public handleArrayBuffer(input: collections.ArrayBuffer): collections.ArrayBuffer {
    return input;
  }

  public handleConcatArray(input: collections.ConcatArray<number>): collections.ConcatArray<number> {
    return input;
  }

  public handleBitVector(input: collections.BitVector): collections.BitVector {
    return input;
  }

  public handleASON(input: ISendable): ISendable {
    return input;
  }

  public handleAsyncLock(input: ArkTSUtils.locks.AsyncLock): ArkTSUtils.locks.AsyncLock {
    return input;
  }

  public handleSendableUnionArray(input: string | number | boolean | bigint): string | number | boolean | bigint {
    return input;
  }
}

@Sendable
export class SendablePublicFuncInheritClass extends SendablePublicFuncClass {
  constructor() {
    super()
  }

  setMyString(value: string) {
    this.myString = this.handleString(value);
  }

  setMyNumber(value: number) {
    this.myNumber = this.handleNumber(value);
  }

  setMyBoolean(value: boolean) {
    this.myBoolean = this.handleBoolean(value);
  }

  setMyBigInt(value: bigint) {
    this.myBigInt = this.handleBigInt(value);
  }

  setMyUndefined(value: undefined | string | number | null) {
    this.myUndefined = this.handleUndefined(value);
  }

  setMyNull(value: undefined | string | number | null) {
    this.myNull = this.handleNull(value);
  }

  setMyTopLevelClassInstance(value: topLevelSendableClass) {
    this.myTopLevelClassInstance = this.handleTopLevelClassInstance(value);
  }

  setMyTopLevelFunction(value: SendableFuncType) {
    this.myTopLevelFunction = this.handleTopLevelFunction(value);
  }

  setMyEnum(value: SendableConstEnum) {
    this.myEnum = this.handleEnum(value);
  }

  setMyArray(value: number[]) {
    const arrayInstance = new collections.Array<number>(...value);
    this.myArray = this.handleArray(arrayInstance);
  }

  setMyMap(key: number, value: number) {
    if (!this.myMap) {
      this.myMap = new collections.Map<number, number>();
    }
    this.myMap.set(key, value);
    this.myMap = this.handleMap(this.myMap);
  }

  setMySet(value: number) {
    if (!this.mySet) {
      this.mySet = new collections.Set<number>();
    }
    this.mySet.add(value);
    this.mySet = this.handleSet(this.mySet);
  }

  setMyTypedArrayInt8Array(value: number[]) {
    const int8Array = new collections.Int8Array(value);
    this.myTypedArrayInt8Array = this.handleTypedArrayInt8Array(int8Array);
  }

  setMyTypedArrayUint8Array(value: number[]) {
    const uint8Array = new collections.Uint8Array(value);
    this.myTypedArrayUint8Array = this.handleTypedArrayUint8Array(uint8Array);
  }

  setMyTypedArrayInt16Array(value: number[]) {
    const int16Array = new collections.Int16Array(value);
    this.myTypedArrayInt16Array = this.handleTypedArrayInt16Array(int16Array);
  }

  setMyTypedArrayUint16Array(value: number[]) {
    const uint16Array = new collections.Uint16Array(value);
    this.myTypedArrayUint16Array = this.handleTypedArrayUint16Array(uint16Array);
  }

  setMyTypedArrayInt32Array(value: number[]) {
    const int32Array = new collections.Int32Array(value);
    this.myTypedArrayInt32Array = this.handleTypedArrayInt32Array(int32Array);
  }

  setMyTypedArrayUint32Array(value: number[]) {
    const uint32Array = new collections.Uint32Array(value);
    this.myTypedArrayUint32Array = this.handleTypedArrayUint32Array(uint32Array);
  }

  setMyTypedArrayUint8ClampedArray(value: number[]) {
    const uint8ClampedArray = new collections.Uint8ClampedArray(value);
    this.myTypedArrayUint8ClampedArray = this.handleTypedArrayUint8ClampedArray(uint8ClampedArray);
  }

  setMyTypedArrayFloat32Array(value: number[]) {
    const float32Array = new collections.Float32Array(value);
    this.myTypedArrayFloat32Array = this.handleTypedArrayFloat32Array(float32Array);
  }

  setMyArrayBuffer(size: number) {
    const arrayBuffer = new collections.ArrayBuffer(size);
    this.myArrayBuffer = this.handleArrayBuffer(arrayBuffer);
  }

  setMyConcatArray(value: number) {
    const concatArrayInstance: collections.ConcatArray<number> = new collections.Array<number>(value);
    this.myConcatArray = this.handleConcatArray(concatArrayInstance);
  }

  setMyBitVector(size: number) {
    this.myBitVector.push(size);
    this.myBitVector = this.handleBitVector(this.myBitVector);
  }

  setMyASON(json: string) {
    const parsedObject = ArkTSUtils.ASON.parse(json) as ISendable;
    this.myASON = this.handleASON(parsedObject);
  }

  setMyAsyncLock(name: string) {
    const lockInstance = ArkTSUtils.locks.AsyncLock.request(name);
    this.myAsyncLock = this.handleAsyncLock(lockInstance);
  }

  setMySendableUnion(value: string | number | boolean | bigint) {
    this.mySendableUnionArray = this.handleSendableUnionArray(value);
  }
}

@Sendable
export class SendablePrivateGetFuncClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  myTopLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  myTopLevelFunction: SendableFuncType = TopLevelSendableFunction;
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

  private getMyString() {
    return this.myString;
  }

  private getMyNumber(): number {
    return this.myNumber;
  }

  private getMyBoolean(): boolean {
    return this.myBoolean;
  }

  private getMyBigInt(): bigint {
    return this.myBigInt;
  }

  private getMyUndefined(): undefined | string | number | null {
    return this.myUndefined;
  }

  private getMyNull(): undefined | string | number | null {
    return this.myNull;
  }

  private getMyTopLevelClassInstance(): topLevelSendableClass {
    return this.myTopLevelClassInstance;
  }

  private getMyTopLevelFunction(): SendableFuncType {
    return this.myTopLevelFunction;
  }

  private getMyEnum(): SendableConstEnum {
    return this.myEnum;
  }

  private getMyArray(): collections.Array<number> {
    return this.myArray;
  }

  private getMyMap(): collections.Map<number, number> {
    return this.myMap;
  }

  private getMySet(): collections.Set<number> {
    return this.mySet;
  }

  private getMyTypedArrayInt8Array(): collections.Int8Array {
    return this.myTypedArrayInt8Array;
  }

  private getMyTypedArrayUint8Array(): collections.Uint8Array {
    return this.myTypedArrayUint8Array;
  }

  private getMyTypedArrayInt16Array(): collections.Int16Array {
    return this.myTypedArrayInt16Array;
  }

  private getMyTypedArrayUint16Array(): collections.Uint16Array {
    return this.myTypedArrayUint16Array;
  }

  private getMyTypedArrayInt32Array(): collections.Int32Array {
    return this.myTypedArrayInt32Array;
  }

  private getMyTypedArrayUint32Array(): collections.Uint32Array {
    return this.myTypedArrayUint32Array;
  }

  private getMyTypedArrayUint8ClampedArray(): collections.Uint8ClampedArray {
    return this.myTypedArrayUint8ClampedArray;
  }

  private getMyTypedArrayFloat32Array(): collections.Float32Array {
    return this.myTypedArrayFloat32Array;
  }

  private getMyArrayBuffer(): collections.ArrayBuffer {
    return this.myArrayBuffer;
  }

  private getMyConcatArray(): collections.ConcatArray<number> {
    return this.myConcatArray;
  }

  private getMyBitVector(): collections.BitVector {
    return this.myBitVector;
  }

  private getMyASON(): ISendable {
    return this.myASON;
  }

  private getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return this.myAsyncLock;
  }

  private getMySendableUnionArray(): string | number | boolean | bigint {
    return this.mySendableUnionArray;
  }
}

@Sendable
export class SendablePrivateGetFuncInheritClass extends SendablePrivateGetFuncClass {
  constructor() {
    super()
  }
}

@Sendable
export class SendableDefaultGetFuncClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  myTopLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  myTopLevelFunction: SendableFuncType = TopLevelSendableFunction;
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

  getMyString() {
    return this.myString;
  }

  getMyNumber(): number {
    return this.myNumber;
  }

  getMyBoolean(): boolean {
    return this.myBoolean;
  }

  getMyBigInt(): bigint {
    return this.myBigInt;
  }

  getMyUndefined(): undefined | string | number | null {
    return this.myUndefined;
  }

  getMyNull(): undefined | string | number | null {
    return this.myNull;
  }

  getMyTopLevelClassInstance(): topLevelSendableClass {
    return this.myTopLevelClassInstance;
  }

  getMyTopLevelFunction(): SendableFuncType {
    return this.myTopLevelFunction;
  }

  getMyEnum(): SendableConstEnum {
    return this.myEnum;
  }

  getMyArray(): collections.Array<number> {
    return this.myArray;
  }

  getMyMap(): collections.Map<number, number> {
    return this.myMap;
  }

  getMySet(): collections.Set<number> {
    return this.mySet;
  }

  getMyTypedArrayInt8Array(): collections.Int8Array {
    return this.myTypedArrayInt8Array;
  }

  getMyTypedArrayUint8Array(): collections.Uint8Array {
    return this.myTypedArrayUint8Array;
  }

  getMyTypedArrayInt16Array(): collections.Int16Array {
    return this.myTypedArrayInt16Array;
  }

  getMyTypedArrayUint16Array(): collections.Uint16Array {
    return this.myTypedArrayUint16Array;
  }

  getMyTypedArrayInt32Array(): collections.Int32Array {
    return this.myTypedArrayInt32Array;
  }

  getMyTypedArrayUint32Array(): collections.Uint32Array {
    return this.myTypedArrayUint32Array;
  }

  getMyTypedArrayUint8ClampedArray(): collections.Uint8ClampedArray {
    return this.myTypedArrayUint8ClampedArray;
  }

  getMyTypedArrayFloat32Array(): collections.Float32Array {
    return this.myTypedArrayFloat32Array;
  }

  getMyArrayBuffer(): collections.ArrayBuffer {
    return this.myArrayBuffer;
  }

  getMyConcatArray(): collections.ConcatArray<number> {
    return this.myConcatArray;
  }

  getMyBitVector(): collections.BitVector {
    return this.myBitVector;
  }

  getMyASON(): ISendable {
    return this.myASON;
  }

  getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return this.myAsyncLock;
  }

  getMySendableUnionArray(): string | number | boolean | bigint {
    return this.mySendableUnionArray;
  }
}

@Sendable
export class SendableDefaultGetFuncInheritClass extends SendableDefaultGetFuncClass {
  constructor() {
    super()
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
    this.myTopLevelClassInstance = value;
  }

  setMyTopLevelFunction(value: SendableFuncType) {
    this.myTopLevelFunction = value;
  }

  setMyEnum(value: SendableConstEnum) {
    this.myEnum = value;
  }

  setMyArray(value: number[]) {
    this.myArray = new collections.Array<number>(...value);
  }

  setMyMap(key: number, value: number) {
    this.myMap.set(key, value);
  }

  setMySet(value: number) {
    this.mySet = this.mySet.add(value);
  }

  setMyTypedArrayInt8Array(value: number[]) {
    this.myTypedArrayInt8Array = new collections.Int8Array(value);
  }

  setMyTypedArrayUint8Array(value: number[]) {
    this.myTypedArrayUint8Array = new collections.Uint8Array(value);
  }

  setMyTypedArrayInt16Array(value: number[]) {
    this.myTypedArrayInt16Array = new collections.Int16Array(value);
  }

  setMyTypedArrayUint16Array(value: number[]) {
    this.myTypedArrayUint16Array = new collections.Uint16Array(value);
  }

  setMyTypedArrayInt32Array(value: number[]) {
    this.myTypedArrayInt32Array = new collections.Int32Array(value);
  }

  setMyTypedArrayUint32Array(value: number[]) {
    this.myTypedArrayUint32Array = new collections.Uint32Array(value);
  }

  setMyTypedArrayUint8ClampedArray(value: number[]) {
    this.myTypedArrayUint8ClampedArray = new collections.Uint8ClampedArray(value);
  }

  setMyTypedArrayFloat32Array(value: number[]) {
    this.myTypedArrayFloat32Array = new collections.Float32Array(value);
  }

  setMyArrayBuffer(size: number) {
    this.myArrayBuffer = new collections.ArrayBuffer(size);
  }

  setMyConcatArray(value: number[]) {
    this.myConcatArray = new collections.Array<number>(...value);
  }

  setMyBitVector(size: number) {
    this.myBitVector.push(size);
  }

  setMyASON(json: string) {
    this.myASON = ArkTSUtils.ASON.parse(json) as ISendable;
  }

  setMyAsyncLock(name: string) {
    this.myAsyncLock = ArkTSUtils.locks.AsyncLock.request(name);
  }

  setMySendableUnion(value: string | number | boolean | bigint) {
    this.mySendableUnionArray = value;
  }
}

@Sendable
export class SendablePublicGetFuncClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  myTopLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  myTopLevelFunction: SendableFuncType = TopLevelSendableFunction;
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

  public getMyString() {
    return this.myString;
  }

  public getMyNumber(): number {
    return this.myNumber;
  }

  public getMyBoolean(): boolean {
    return this.myBoolean;
  }

  public getMyBigInt(): bigint {
    return this.myBigInt;
  }

  public getMyUndefined(): undefined | string | number | null {
    return this.myUndefined;
  }

  public getMyNull(): undefined | string | number | null {
    return this.myNull;
  }

  public getMyTopLevelClassInstance(): topLevelSendableClass {
    return this.myTopLevelClassInstance;
  }

  public getMyTopLevelFunction(): SendableFuncType {
    return this.myTopLevelFunction;
  }

  public getMyEnum(): SendableConstEnum {
    return this.myEnum;
  }

  public getMyArray(): collections.Array<number> {
    return this.myArray;
  }

  public getMyMap(): collections.Map<number, number> {
    return this.myMap;
  }

  public getMySet(): collections.Set<number> {
    return this.mySet;
  }

  public getMyTypedArrayInt8Array(): collections.Int8Array {
    return this.myTypedArrayInt8Array;
  }

  public getMyTypedArrayUint8Array(): collections.Uint8Array {
    return this.myTypedArrayUint8Array;
  }

  public getMyTypedArrayInt16Array(): collections.Int16Array {
    return this.myTypedArrayInt16Array;
  }

  public getMyTypedArrayUint16Array(): collections.Uint16Array {
    return this.myTypedArrayUint16Array;
  }

  public getMyTypedArrayInt32Array(): collections.Int32Array {
    return this.myTypedArrayInt32Array;
  }

  public getMyTypedArrayUint32Array(): collections.Uint32Array {
    return this.myTypedArrayUint32Array;
  }

  public getMyTypedArrayUint8ClampedArray(): collections.Uint8ClampedArray {
    return this.myTypedArrayUint8ClampedArray;
  }

  public getMyTypedArrayFloat32Array(): collections.Float32Array {
    return this.myTypedArrayFloat32Array;
  }

  public getMyArrayBuffer(): collections.ArrayBuffer {
    return this.myArrayBuffer;
  }

  public getMyConcatArray(): collections.ConcatArray<number> {
    return this.myConcatArray;
  }

  public getMyBitVector(): collections.BitVector {
    return this.myBitVector;
  }

  public getMyASON(): ISendable {
    return this.myASON;
  }

  public getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return this.myAsyncLock;
  }

  public getMySendableUnionArray(): string | number | boolean | bigint {
    return this.mySendableUnionArray;
  }
}

@Sendable
export class SendablePublicGetFuncInheritClass extends SendablePublicGetFuncClass {
  constructor() {
    super()
  }

  public setMyString(value: string) {
    this.myString = value;
  }

  public setMyNumber(value: number) {
    this.myNumber = value;
  }

  public setMyBoolean(value: boolean) {
    this.myBoolean = value;
  }

  public setMyBigInt(value: bigint) {
    this.myBigInt = value;
  }

  public setMyUndefined(value: undefined | string | number | null) {
    this.myUndefined = value;
  }

  public setMyNull(value: undefined | string | number | null) {
    this.myNull = value;
  }

  public setMyTopLevelClassInstance(value: topLevelSendableClass) {
    this.myTopLevelClassInstance = value;
  }

  public setMyTopLevelFunction(value: SendableFuncType) {
    this.myTopLevelFunction = value;
  }

  public setMyEnum(value: SendableConstEnum) {
    this.myEnum = value;
  }

  public setMyArray(value: number[]) {
    this.myArray = new collections.Array<number>(...value);
  }

  public setMyMap(key: number, value: number) {
    this.myMap.set(key, value);
  }

  public setMySet(value: number) {
    this.mySet = this.mySet.add(value);
  }

  public setMyTypedArrayInt8Array(value: number[]) {
    this.myTypedArrayInt8Array = new collections.Int8Array(value);
  }

  public setMyTypedArrayUint8Array(value: number[]) {
    this.myTypedArrayUint8Array = new collections.Uint8Array(value);
  }

  public setMyTypedArrayInt16Array(value: number[]) {
    this.myTypedArrayInt16Array = new collections.Int16Array(value);
  }

  public setMyTypedArrayUint16Array(value: number[]) {
    this.myTypedArrayUint16Array = new collections.Uint16Array(value);
  }

  public setMyTypedArrayInt32Array(value: number[]) {
    this.myTypedArrayInt32Array = new collections.Int32Array(value);
  }

  public setMyTypedArrayUint32Array(value: number[]) {
    this.myTypedArrayUint32Array = new collections.Uint32Array(value);
  }

  public setMyTypedArrayUint8ClampedArray(value: number[]) {
    this.myTypedArrayUint8ClampedArray = new collections.Uint8ClampedArray(value);
  }

  public setMyTypedArrayFloat32Array(value: number[]) {
    this.myTypedArrayFloat32Array = new collections.Float32Array(value);
  }

  public setMyArrayBuffer(size: number) {
    this.myArrayBuffer = new collections.ArrayBuffer(size);
  }

  public setMyConcatArray(value: number[]) {
    this.myConcatArray = new collections.Array<number>(...value);
  }

  public setMyBitVector(size: number) {
    this.myBitVector.push(size);
  }

  public setMyASON(json: string) {
    this.myASON = ArkTSUtils.ASON.parse(json) as ISendable;
  }

  public setMyAsyncLock(name: string) {
    this.myAsyncLock = ArkTSUtils.locks.AsyncLock.request(name);
  }

  public setMySendableUnion(value: string | number | boolean | bigint) {
    this.mySendableUnionArray = value;
  }
}

@Sendable
export class SendablePrivateSetFuncClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  myTopLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  myTopLevelFunction: SendableFuncType = TopLevelSendableFunction;
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

  private setMyString(value: string) {
    this.myString = value;
  }

  private setMyNumber(value: number) {
    this.myNumber = value;
  }

  private setMyBoolean(value: boolean) {
    this.myBoolean = value;
  }

  private setMyBigInt(value: bigint) {
    this.myBigInt = value;
  }

  private setMyUndefined(value: undefined | string | number | null) {
    this.myUndefined = value;
  }

  private setMyNull(value: undefined | string | number | null) {
    this.myNull = value;
  }

  private setMyTopLevelClassInstance(value: topLevelSendableClass) {
    this.myTopLevelClassInstance = value;
  }

  private setMyTopLevelFunction(value: SendableFuncType) {
    this.myTopLevelFunction = value;
  }

  private setMyEnum(value: SendableConstEnum) {
    this.myEnum = value;
  }

  private setMyArray(value: number[]) {
    this.myArray = new collections.Array<number>(...value);
  }

  private setMyMap(key: number, value: number) {
    this.myMap.set(key, value);
  }

  private setMySet(value: number) {
    this.mySet = this.mySet.add(value);
  }

  private setMyTypedArrayInt8Array(value: number[]) {
    this.myTypedArrayInt8Array = new collections.Int8Array(value);
  }

  private setMyTypedArrayUint8Array(value: number[]) {
    this.myTypedArrayUint8Array = new collections.Uint8Array(value);
  }

  private setMyTypedArrayInt16Array(value: number[]) {
    this.myTypedArrayInt16Array = new collections.Int16Array(value);
  }

  private setMyTypedArrayUint16Array(value: number[]) {
    this.myTypedArrayUint16Array = new collections.Uint16Array(value);
  }

  private setMyTypedArrayInt32Array(value: number[]) {
    this.myTypedArrayInt32Array = new collections.Int32Array(value);
  }

  private setMyTypedArrayUint32Array(value: number[]) {
    this.myTypedArrayUint32Array = new collections.Uint32Array(value);
  }

  private setMyTypedArrayUint8ClampedArray(value: number[]) {
    this.myTypedArrayUint8ClampedArray = new collections.Uint8ClampedArray(value);
  }

  private setMyTypedArrayFloat32Array(value: number[]) {
    this.myTypedArrayFloat32Array = new collections.Float32Array(value);
  }

  private setMyArrayBuffer(size: number) {
    this.myArrayBuffer = new collections.ArrayBuffer(size);
  }

  private setMyConcatArray(value: number[]) {
    this.myConcatArray = new collections.Array<number>(...value);
  }

  private setMyBitVector(size: number) {
    this.myBitVector.push(size);
  }

  private setMyASON(json: string) {
    this.myASON = ArkTSUtils.ASON.parse(json) as ISendable;
  }

  private setMyAsyncLock(name: string) {
    this.myAsyncLock = ArkTSUtils.locks.AsyncLock.request(name);
  }

  private setMySendableUnion(value: string | number | boolean | bigint) {
    this.mySendableUnionArray = value;
  }
}

@Sendable
export class SendablePrivateSetFuncInheritClass extends SendablePrivateSetFuncClass {
  constructor() {
    super()
  }
}

@Sendable
export class SendablePublicSetFuncClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  myTopLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  myTopLevelFunction: SendableFuncType = TopLevelSendableFunction;
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

  public setMyString(value: string) {
    this.myString = value;
  }

  public setMyNumber(value: number) {
    this.myNumber = value;
  }

  public setMyBoolean(value: boolean) {
    this.myBoolean = value;
  }

  public setMyBigInt(value: bigint) {
    this.myBigInt = value;
  }

  public setMyUndefined(value: undefined | string | number | null) {
    this.myUndefined = value;
  }

  public setMyNull(value: undefined | string | number | null) {
    this.myNull = value;
  }

  public setMyTopLevelClassInstance(value: topLevelSendableClass) {
    this.myTopLevelClassInstance = value;
  }

  public setMyTopLevelFunction(value: SendableFuncType) {
    this.myTopLevelFunction = value;
  }

  public setMyEnum(value: SendableConstEnum) {
    this.myEnum = value;
  }

  public setMyArray(value: number[]) {
    this.myArray = new collections.Array<number>(...value);
  }

  public setMyMap(key: number, value: number) {
    this.myMap.set(key, value);
  }

  public setMySet(value: number) {
    this.mySet = this.mySet.add(value);
  }

  public setMyTypedArrayInt8Array(value: number[]) {
    this.myTypedArrayInt8Array = new collections.Int8Array(value);
  }

  public setMyTypedArrayUint8Array(value: number[]) {
    this.myTypedArrayUint8Array = new collections.Uint8Array(value);
  }

  public setMyTypedArrayInt16Array(value: number[]) {
    this.myTypedArrayInt16Array = new collections.Int16Array(value);
  }

  public setMyTypedArrayUint16Array(value: number[]) {
    this.myTypedArrayUint16Array = new collections.Uint16Array(value);
  }

  public setMyTypedArrayInt32Array(value: number[]) {
    this.myTypedArrayInt32Array = new collections.Int32Array(value);
  }

  public setMyTypedArrayUint32Array(value: number[]) {
    this.myTypedArrayUint32Array = new collections.Uint32Array(value);
  }

  public setMyTypedArrayUint8ClampedArray(value: number[]) {
    this.myTypedArrayUint8ClampedArray = new collections.Uint8ClampedArray(value);
  }

  public setMyTypedArrayFloat32Array(value: number[]) {
    this.myTypedArrayFloat32Array = new collections.Float32Array(value);
  }

  public setMyArrayBuffer(size: number) {
    this.myArrayBuffer = new collections.ArrayBuffer(size);
  }

  public setMyConcatArray(value: number[]) {
    this.myConcatArray = new collections.Array<number>(...value);
  }

  public setMyBitVector(size: number) {
    this.myBitVector.push(size);
  }

  public setMyASON(json: string) {
    this.myASON = ArkTSUtils.ASON.parse(json) as ISendable;
  }

  public setMyAsyncLock(name: string) {
    this.myAsyncLock = ArkTSUtils.locks.AsyncLock.request(name);
  }

  public setMySendableUnion(value: string | number | boolean | bigint) {
    this.mySendableUnionArray = value;
  }
}

@Sendable
export class SendablePublicSetFuncInheritClass extends SendablePublicSetFuncClass {
  constructor() {
    super();
  }

  public getMyString() {
    return this.myString;
  }

  public getMyNumber(): number {
    return this.myNumber;
  }

  public getMyBoolean(): boolean {
    return this.myBoolean;
  }

  public getMyBigInt(): bigint {
    return this.myBigInt;
  }

  public getMyUndefined(): undefined | string | number | null {
    return this.myUndefined;
  }

  public getMyNull(): undefined | string | number | null {
    return this.myNull;
  }

  public getMyTopLevelClassInstance(): topLevelSendableClass {
    return this.myTopLevelClassInstance;
  }

  public getMyTopLevelFunction(): SendableFuncType {
    return this.myTopLevelFunction;
  }

  public getMyEnum(): SendableConstEnum {
    return this.myEnum;
  }

  public getMyArray(): collections.Array<number> {
    return this.myArray;
  }

  public getMyMap(): collections.Map<number, number> {
    return this.myMap;
  }

  public getMySet(): collections.Set<number> {
    return this.mySet;
  }

  public getMyTypedArrayInt8Array(): collections.Int8Array {
    return this.myTypedArrayInt8Array;
  }

  public getMyTypedArrayUint8Array(): collections.Uint8Array {
    return this.myTypedArrayUint8Array;
  }

  public getMyTypedArrayInt16Array(): collections.Int16Array {
    return this.myTypedArrayInt16Array;
  }

  public getMyTypedArrayUint16Array(): collections.Uint16Array {
    return this.myTypedArrayUint16Array;
  }

  public getMyTypedArrayInt32Array(): collections.Int32Array {
    return this.myTypedArrayInt32Array;
  }

  public getMyTypedArrayUint32Array(): collections.Uint32Array {
    return this.myTypedArrayUint32Array;
  }

  public getMyTypedArrayUint8ClampedArray(): collections.Uint8ClampedArray {
    return this.myTypedArrayUint8ClampedArray;
  }

  public getMyTypedArrayFloat32Array(): collections.Float32Array {
    return this.myTypedArrayFloat32Array;
  }

  public getMyArrayBuffer(): collections.ArrayBuffer {
    return this.myArrayBuffer;
  }

  public getMyConcatArray(): collections.ConcatArray<number> {
    return this.myConcatArray;
  }

  public getMyBitVector(): collections.BitVector {
    return this.myBitVector;
  }

  public getMyASON(): ISendable {
    return this.myASON;
  }

  public getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return this.myAsyncLock;
  }

  public getMySendableUnionArray(): string | number | boolean | bigint {
    return this.mySendableUnionArray;
  }
}

@Sendable
export class SendablePrivateGetSetFuncClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  myTopLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  myTopLevelFunction: SendableFuncType = TopLevelSendableFunction;
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

  private setMyString(value: string) {
    this.myString = this.handleString(value);
  }

  private setMyNumber(value: number) {
    this.myNumber = this.handleNumber(value);
  }

  private setMyBoolean(value: boolean) {
    this.myBoolean = this.handleBoolean(value);
  }

  private setMyBigInt(value: bigint) {
    this.myBigInt = this.handleBigInt(value);
  }

  private setMyUndefined(value: undefined | string | number | null) {
    this.myUndefined = this.handleUndefined(value);
  }

  private setMyNull(value: undefined | string | number | null) {
    this.myNull = this.handleNull(value);
  }

  private setMyTopLevelClassInstance(value: topLevelSendableClass) {
    this.myTopLevelClassInstance = this.handleTopLevelClassInstance(value);
  }

  private setMyTopLevelFunction(value: SendableFuncType) {
    this.myTopLevelFunction = this.handleTopLevelFunction(value);
  }

  private setMyEnum(value: SendableConstEnum) {
    this.myEnum = this.handleEnum(value);
  }

  private setMyArray(value: number[]) {
    const arrayInstance = new collections.Array<number>(...value);
    this.myArray = this.handleArray(arrayInstance);
  }

  private setMyMap(key: number, value: number) {
    if (!this.myMap) {
      this.myMap = new collections.Map<number, number>();
    }
    this.myMap.set(key, value);
    this.myMap = this.handleMap(this.myMap);
  }

  private setMySet(value: number) {
    if (!this.mySet) {
      this.mySet = new collections.Set<number>();
    }
    this.mySet.add(value);
    this.mySet = this.handleSet(this.mySet);
  }

  private setMyTypedArrayInt8Array(value: number[]) {
    const int8Array = new collections.Int8Array(value);
    this.myTypedArrayInt8Array = this.handleTypedArrayInt8Array(int8Array);
  }

  private setMyTypedArrayUint8Array(value: number[]) {
    const uint8Array = new collections.Uint8Array(value);
    this.myTypedArrayUint8Array = this.handleTypedArrayUint8Array(uint8Array);
  }

  private setMyTypedArrayInt16Array(value: number[]) {
    const int16Array = new collections.Int16Array(value);
    this.myTypedArrayInt16Array = this.handleTypedArrayInt16Array(int16Array);
  }

  private setMyTypedArrayUint16Array(value: number[]) {
    const uint16Array = new collections.Uint16Array(value);
    this.myTypedArrayUint16Array = this.handleTypedArrayUint16Array(uint16Array);
  }

  private setMyTypedArrayInt32Array(value: number[]) {
    const int32Array = new collections.Int32Array(value);
    this.myTypedArrayInt32Array = this.handleTypedArrayInt32Array(int32Array);
  }

  private setMyTypedArrayUint32Array(value: number[]) {
    const uint32Array = new collections.Uint32Array(value);
    this.myTypedArrayUint32Array = this.handleTypedArrayUint32Array(uint32Array);
  }

  private setMyTypedArrayUint8ClampedArray(value: number[]) {
    const uint8ClampedArray = new collections.Uint8ClampedArray(value);
    this.myTypedArrayUint8ClampedArray = this.handleTypedArrayUint8ClampedArray(uint8ClampedArray);
  }

  private setMyTypedArrayFloat32Array(value: number[]) {
    const float32Array = new collections.Float32Array(value);
    this.myTypedArrayFloat32Array = this.handleTypedArrayFloat32Array(float32Array);
  }

  private setMyArrayBuffer(size: number) {
    const arrayBuffer = new collections.ArrayBuffer(size);
    this.myArrayBuffer = this.handleArrayBuffer(arrayBuffer);
  }

  private setMyConcatArray(value: number) {
    const concatArrayInstance: collections.ConcatArray<number> = new collections.Array<number>(value);
    this.myConcatArray = this.handleConcatArray(concatArrayInstance);
  }

  private setMyBitVector(size: number) {
    this.myBitVector.push(size);
    this.myBitVector = this.handleBitVector(this.myBitVector);
  }

  private setMyASON(json: string) {
    const parsedObject = ArkTSUtils.ASON.parse(json) as ISendable;
    this.myASON = this.handleASON(parsedObject);
  }

  private setMyAsyncLock(name: string) {
    const lockInstance = ArkTSUtils.locks.AsyncLock.request(name);
    this.myAsyncLock = this.handleAsyncLock(lockInstance);
  }

  private setMySendableUnion(value: string | number | boolean | bigint) {
    this.mySendableUnionArray = this.handleSendableUnionArray(value);
  }

  private getMyString() {
    return this.myString;
  }

  private getMyNumber(): number {
    return this.myNumber;
  }

  private getMyBoolean(): boolean {
    return this.myBoolean;
  }

  private getMyBigInt(): bigint {
    return this.myBigInt;
  }

  private getMyUndefined(): undefined | string | number | null {
    return this.myUndefined;
  }

  private getMyNull(): undefined | string | number | null {
    return this.myNull;
  }

  private getMyTopLevelClassInstance(): topLevelSendableClass {
    return this.myTopLevelClassInstance;
  }

  private getMyTopLevelFunction(): SendableFuncType {
    return this.myTopLevelFunction;
  }

  private getMyEnum(): SendableConstEnum {
    return this.myEnum;
  }

  private getMyArray(): collections.Array<number> {
    return this.myArray;
  }

  private getMyMap(): collections.Map<number, number> {
    return this.myMap;
  }

  private getMySet(): collections.Set<number> {
    return this.mySet;
  }

  private getMyTypedArrayInt8Array(): collections.Int8Array {
    return this.myTypedArrayInt8Array;
  }

  private getMyTypedArrayUint8Array(): collections.Uint8Array {
    return this.myTypedArrayUint8Array;
  }

  private getMyTypedArrayInt16Array(): collections.Int16Array {
    return this.myTypedArrayInt16Array;
  }

  private getMyTypedArrayUint16Array(): collections.Uint16Array {
    return this.myTypedArrayUint16Array;
  }

  private getMyTypedArrayInt32Array(): collections.Int32Array {
    return this.myTypedArrayInt32Array;
  }

  private getMyTypedArrayUint32Array(): collections.Uint32Array {
    return this.myTypedArrayUint32Array;
  }

  private getMyTypedArrayUint8ClampedArray(): collections.Uint8ClampedArray {
    return this.myTypedArrayUint8ClampedArray;
  }

  private getMyTypedArrayFloat32Array(): collections.Float32Array {
    return this.myTypedArrayFloat32Array;
  }

  private getMyArrayBuffer(): collections.ArrayBuffer {
    return this.myArrayBuffer;
  }

  private getMyConcatArray(): collections.ConcatArray<number> {
    return this.myConcatArray;
  }

  private getMyBitVector(): collections.BitVector {
    return this.myBitVector;
  }

  private getMyASON(): ISendable {
    return this.myASON;
  }

  private getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return this.myAsyncLock;
  }

  private getMySendableUnionArray(): string | number | boolean | bigint {
    return this.mySendableUnionArray;
  }

  private handleString(input: string): string {
    return input;
  }

  private handleNumber(input: number): number {
    return input;
  }

  private handleBoolean(input: boolean): boolean {
    return input;
  }

  private handleBigInt(input: bigint): bigint {
    return input;
  }

  private handleUndefined(input: undefined | string | number | null): undefined | string | number | null {
    return input;
  }

  private handleNull(input: undefined | string | number | null): undefined | string | number | null {
    return input;
  }

  private handleTopLevelClassInstance(input: topLevelSendableClass): topLevelSendableClass {
    return input;
  }

  private handleTopLevelFunction(input: SendableFuncType): SendableFuncType {
    return input;
  }

  private handleEnum(input: SendableConstEnum): SendableConstEnum {
    return input;
  }

  private handleArray(input: collections.Array<number>): collections.Array<number> {
    return input;
  }

  private handleMap(input: collections.Map<number, number>): collections.Map<number, number> {
    return input;
  }

  private handleSet(input: collections.Set<number>): collections.Set<number> {
    return input;
  }

  private handleTypedArrayInt8Array(input: collections.Int8Array): collections.Int8Array {
    return input;
  }

  private handleTypedArrayUint8Array(input: collections.Uint8Array): collections.Uint8Array {
    return input;
  }

  private handleTypedArrayInt16Array(input: collections.Int16Array): collections.Int16Array {
    return input;
  }

  private handleTypedArrayUint16Array(input: collections.Uint16Array): collections.Uint16Array {
    return input;
  }

  private handleTypedArrayInt32Array(input: collections.Int32Array): collections.Int32Array {
    return input;
  }

  private handleTypedArrayUint32Array(input: collections.Uint32Array): collections.Uint32Array {
    return input;
  }

  private handleTypedArrayUint8ClampedArray(input: collections.Uint8ClampedArray): collections.Uint8ClampedArray {
    return input;
  }

  private handleTypedArrayFloat32Array(input: collections.Float32Array): collections.Float32Array {
    return input;
  }

  private handleArrayBuffer(input: collections.ArrayBuffer): collections.ArrayBuffer {
    return input;
  }

  private handleConcatArray(input: collections.ConcatArray<number>): collections.ConcatArray<number> {
    return input;
  }

  private handleBitVector(input: collections.BitVector): collections.BitVector {
    return input;
  }

  private handleASON(input: ISendable): ISendable {
    return input;
  }

  private handleAsyncLock(input: ArkTSUtils.locks.AsyncLock): ArkTSUtils.locks.AsyncLock {
    return input;
  }

  private handleSendableUnionArray(input: string | number | boolean | bigint): string | number | boolean | bigint {
    return input;
  }
}

@Sendable
export class SendablePrivateSetGetFuncInheritClass extends SendablePrivateGetSetFuncClass {
  constructor() {
    super()
  }
}

@Sendable
export class SendableDefaultGetSetFuncClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  myTopLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  myTopLevelFunction: SendableFuncType = TopLevelSendableFunction;
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
    this.myString = this.handleString(value);
  }

  setMyNumber(value: number) {
    this.myNumber = this.handleNumber(value);
  }

  setMyBoolean(value: boolean) {
    this.myBoolean = this.handleBoolean(value);
  }

  setMyBigInt(value: bigint) {
    this.myBigInt = this.handleBigInt(value);
  }

  setMyUndefined(value: undefined | string | number | null) {
    this.myUndefined = this.handleUndefined(value);
  }

  setMyNull(value: undefined | string | number | null) {
    this.myNull = this.handleNull(value);
  }

  setMyTopLevelClassInstance(value: topLevelSendableClass) {
    this.myTopLevelClassInstance = this.handleTopLevelClassInstance(value);
  }

  setMyTopLevelFunction(value: SendableFuncType) {
    this.myTopLevelFunction = this.handleTopLevelFunction(value);
  }

  setMyEnum(value: SendableConstEnum) {
    this.myEnum = this.handleEnum(value);
  }

  setMyArray(value: number[]) {
    const arrayInstance = new collections.Array<number>(...value);
    this.myArray = this.handleArray(arrayInstance);
  }

  setMyMap(key: number, value: number) {
    if (!this.myMap) {
      this.myMap = new collections.Map<number, number>();
    }
    this.myMap.set(key, value);
    this.myMap = this.handleMap(this.myMap);
  }

  setMySet(value: number) {
    if (!this.mySet) {
      this.mySet = new collections.Set<number>();
    }
    this.mySet.add(value);
    this.mySet = this.handleSet(this.mySet);
  }

  setMyTypedArrayInt8Array(value: number[]) {
    const int8Array = new collections.Int8Array(value);
    this.myTypedArrayInt8Array = this.handleTypedArrayInt8Array(int8Array);
  }

  setMyTypedArrayUint8Array(value: number[]) {
    const uint8Array = new collections.Uint8Array(value);
    this.myTypedArrayUint8Array = this.handleTypedArrayUint8Array(uint8Array);
  }

  setMyTypedArrayInt16Array(value: number[]) {
    const int16Array = new collections.Int16Array(value);
    this.myTypedArrayInt16Array = this.handleTypedArrayInt16Array(int16Array);
  }

  setMyTypedArrayUint16Array(value: number[]) {
    const uint16Array = new collections.Uint16Array(value);
    this.myTypedArrayUint16Array = this.handleTypedArrayUint16Array(uint16Array);
  }

  setMyTypedArrayInt32Array(value: number[]) {
    const int32Array = new collections.Int32Array(value);
    this.myTypedArrayInt32Array = this.handleTypedArrayInt32Array(int32Array);
  }

  setMyTypedArrayUint32Array(value: number[]) {
    const uint32Array = new collections.Uint32Array(value);
    this.myTypedArrayUint32Array = this.handleTypedArrayUint32Array(uint32Array);
  }

  setMyTypedArrayUint8ClampedArray(value: number[]) {
    const uint8ClampedArray = new collections.Uint8ClampedArray(value);
    this.myTypedArrayUint8ClampedArray = this.handleTypedArrayUint8ClampedArray(uint8ClampedArray);
  }

  setMyTypedArrayFloat32Array(value: number[]) {
    const float32Array = new collections.Float32Array(value);
    this.myTypedArrayFloat32Array = this.handleTypedArrayFloat32Array(float32Array);
  }

  setMyArrayBuffer(size: number) {
    const arrayBuffer = new collections.ArrayBuffer(size);
    this.myArrayBuffer = this.handleArrayBuffer(arrayBuffer);
  }

  setMyConcatArray(value: number) {
    const concatArrayInstance: collections.ConcatArray<number> = new collections.Array<number>(value);
    this.myConcatArray = this.handleConcatArray(concatArrayInstance);
  }

  setMyBitVector(size: number) {
    this.myBitVector.push(size);
    this.myBitVector = this.handleBitVector(this.myBitVector);
  }

  setMyASON(json: string) {
    const parsedObject = ArkTSUtils.ASON.parse(json) as ISendable;
    this.myASON = this.handleASON(parsedObject);
  }

  setMyAsyncLock(name: string) {
    const lockInstance = ArkTSUtils.locks.AsyncLock.request(name);
    this.myAsyncLock = this.handleAsyncLock(lockInstance);
  }

  setMySendableUnion(value: string | number | boolean | bigint) {
    this.mySendableUnionArray = this.handleSendableUnionArray(value);
  }

  getMyString() {
    return this.myString;
  }

  getMyNumber(): number {
    return this.myNumber;
  }

  getMyBoolean(): boolean {
    return this.myBoolean;
  }

  getMyBigInt(): bigint {
    return this.myBigInt;
  }

  getMyUndefined(): undefined | string | number | null {
    return this.myUndefined;
  }

  getMyNull(): undefined | string | number | null {
    return this.myNull;
  }

  getMyTopLevelClassInstance(): topLevelSendableClass {
    return this.myTopLevelClassInstance;
  }

  getMyTopLevelFunction(): SendableFuncType {
    return this.myTopLevelFunction;
  }

  getMyEnum(): SendableConstEnum {
    return this.myEnum;
  }

  getMyArray(): collections.Array<number> {
    return this.myArray;
  }

  getMyMap(): collections.Map<number, number> {
    return this.myMap;
  }

  getMySet(): collections.Set<number> {
    return this.mySet;
  }

  getMyTypedArrayInt8Array(): collections.Int8Array {
    return this.myTypedArrayInt8Array;
  }

  getMyTypedArrayUint8Array(): collections.Uint8Array {
    return this.myTypedArrayUint8Array;
  }

  getMyTypedArrayInt16Array(): collections.Int16Array {
    return this.myTypedArrayInt16Array;
  }

  getMyTypedArrayUint16Array(): collections.Uint16Array {
    return this.myTypedArrayUint16Array;
  }

  getMyTypedArrayInt32Array(): collections.Int32Array {
    return this.myTypedArrayInt32Array;
  }

  getMyTypedArrayUint32Array(): collections.Uint32Array {
    return this.myTypedArrayUint32Array;
  }

  getMyTypedArrayUint8ClampedArray(): collections.Uint8ClampedArray {
    return this.myTypedArrayUint8ClampedArray;
  }

  getMyTypedArrayFloat32Array(): collections.Float32Array {
    return this.myTypedArrayFloat32Array;
  }

  getMyArrayBuffer(): collections.ArrayBuffer {
    return this.myArrayBuffer;
  }

  getMyConcatArray(): collections.ConcatArray<number> {
    return this.myConcatArray;
  }

  getMyBitVector(): collections.BitVector {
    return this.myBitVector;
  }

  getMyASON(): ISendable {
    return this.myASON;
  }

  getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return this.myAsyncLock;
  }

  getMySendableUnionArray(): string | number | boolean | bigint {
    return this.mySendableUnionArray;
  }

  handleString(input: string): string {
    return input;
  }

  handleNumber(input: number): number {
    return input;
  }

  handleBoolean(input: boolean): boolean {
    return input;
  }

  handleBigInt(input: bigint): bigint {
    return input;
  }

  handleUndefined(input: undefined | string | number | null): undefined | string | number | null {
    return input;
  }

  handleNull(input: undefined | string | number | null): undefined | string | number | null {
    return input;
  }

  handleTopLevelClassInstance(input: topLevelSendableClass): topLevelSendableClass {
    return input;
  }

  handleTopLevelFunction(input: SendableFuncType): SendableFuncType {
    return input;
  }

  handleEnum(input: SendableConstEnum): SendableConstEnum {
    return input;
  }

  handleArray(input: collections.Array<number>): collections.Array<number> {
    return input;
  }

  handleMap(input: collections.Map<number, number>): collections.Map<number, number> {
    return input;
  }

  handleSet(input: collections.Set<number>): collections.Set<number> {
    return input;
  }

  handleTypedArrayInt8Array(input: collections.Int8Array): collections.Int8Array {
    return input;
  }

  handleTypedArrayUint8Array(input: collections.Uint8Array): collections.Uint8Array {
    return input;
  }

  handleTypedArrayInt16Array(input: collections.Int16Array): collections.Int16Array {
    return input;
  }

  handleTypedArrayUint16Array(input: collections.Uint16Array): collections.Uint16Array {
    return input;
  }

  handleTypedArrayInt32Array(input: collections.Int32Array): collections.Int32Array {
    return input;
  }

  handleTypedArrayUint32Array(input: collections.Uint32Array): collections.Uint32Array {
    return input;
  }

  handleTypedArrayUint8ClampedArray(input: collections.Uint8ClampedArray): collections.Uint8ClampedArray {
    return input;
  }

  handleTypedArrayFloat32Array(input: collections.Float32Array): collections.Float32Array {
    return input;
  }

  handleArrayBuffer(input: collections.ArrayBuffer): collections.ArrayBuffer {
    return input;
  }

  handleConcatArray(input: collections.ConcatArray<number>): collections.ConcatArray<number> {
    return input;
  }

  handleBitVector(input: collections.BitVector): collections.BitVector {
    return input;
  }

  handleASON(input: ISendable): ISendable {
    return input;
  }

  handleAsyncLock(input: ArkTSUtils.locks.AsyncLock): ArkTSUtils.locks.AsyncLock {
    return input;
  }

  handleSendableUnionArray(input: string | number | boolean | bigint): string | number | boolean | bigint {
    return input;
  }
}

@Sendable
export class SendableDefaultSetGetFuncInheritClass extends SendableDefaultGetSetFuncClass {
  constructor() {
    super()
  }
}

@Sendable
export class SendablePublicGetSetFuncClass implements ISendable {
  myString: string = 'example string';
  myNumber: number = 42;
  myBoolean: boolean = true;
  myBigInt: bigint = 1234567890123456789012345678901234567890n;
  myUndefined: undefined | string | number | null = undefined;
  myNull: undefined | string | number | null = null;
  myTopLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  myTopLevelFunction: SendableFuncType = TopLevelSendableFunction;
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

  public setMyString(value: string) {
    this.myString = this.handleString(value);
  }

  public setMyNumber(value: number) {
    this.myNumber = this.handleNumber(value);
  }

  public setMyBoolean(value: boolean) {
    this.myBoolean = this.handleBoolean(value);
  }

  public setMyBigInt(value: bigint) {
    this.myBigInt = this.handleBigInt(value);
  }

  public setMyUndefined(value: undefined | string | number | null) {
    this.myUndefined = this.handleUndefined(value);
  }

  public setMyNull(value: undefined | string | number | null) {
    this.myNull = this.handleNull(value);
  }

  public setMyTopLevelClassInstance(value: topLevelSendableClass) {
    this.myTopLevelClassInstance = this.handleTopLevelClassInstance(value);
  }

  public setMyTopLevelFunction(value: SendableFuncType) {
    this.myTopLevelFunction = this.handleTopLevelFunction(value);
  }

  public setMyEnum(value: SendableConstEnum) {
    this.myEnum = this.handleEnum(value);
  }

  public setMyArray(value: number[]) {
    const arrayInstance = new collections.Array<number>(...value);
    this.myArray = this.handleArray(arrayInstance);
  }

  public setMyMap(key: number, value: number) {
    if (!this.myMap) {
      this.myMap = new collections.Map<number, number>();
    }
    this.myMap.set(key, value);
    this.myMap = this.handleMap(this.myMap);
  }

  public setMySet(value: number) {
    if (!this.mySet) {
      this.mySet = new collections.Set<number>();
    }
    this.mySet.add(value);
    this.mySet = this.handleSet(this.mySet);
  }

  public setMyTypedArrayInt8Array(value: number[]) {
    const int8Array = new collections.Int8Array(value);
    this.myTypedArrayInt8Array = this.handleTypedArrayInt8Array(int8Array);
  }

  public setMyTypedArrayUint8Array(value: number[]) {
    const uint8Array = new collections.Uint8Array(value);
    this.myTypedArrayUint8Array = this.handleTypedArrayUint8Array(uint8Array);
  }

  public setMyTypedArrayInt16Array(value: number[]) {
    const int16Array = new collections.Int16Array(value);
    this.myTypedArrayInt16Array = this.handleTypedArrayInt16Array(int16Array);
  }

  public setMyTypedArrayUint16Array(value: number[]) {
    const uint16Array = new collections.Uint16Array(value);
    this.myTypedArrayUint16Array = this.handleTypedArrayUint16Array(uint16Array);
  }

  public setMyTypedArrayInt32Array(value: number[]) {
    const int32Array = new collections.Int32Array(value);
    this.myTypedArrayInt32Array = this.handleTypedArrayInt32Array(int32Array);
  }

  public setMyTypedArrayUint32Array(value: number[]) {
    const uint32Array = new collections.Uint32Array(value);
    this.myTypedArrayUint32Array = this.handleTypedArrayUint32Array(uint32Array);
  }

  public setMyTypedArrayUint8ClampedArray(value: number[]) {
    const uint8ClampedArray = new collections.Uint8ClampedArray(value);
    this.myTypedArrayUint8ClampedArray = this.handleTypedArrayUint8ClampedArray(uint8ClampedArray);
  }

  public setMyTypedArrayFloat32Array(value: number[]) {
    const float32Array = new collections.Float32Array(value);
    this.myTypedArrayFloat32Array = this.handleTypedArrayFloat32Array(float32Array);
  }

  public setMyArrayBuffer(size: number) {
    const arrayBuffer = new collections.ArrayBuffer(size);
    this.myArrayBuffer = this.handleArrayBuffer(arrayBuffer);
  }

  public setMyConcatArray(value: number) {
    const concatArrayInstance: collections.ConcatArray<number> = new collections.Array<number>(value);
    this.myConcatArray = this.handleConcatArray(concatArrayInstance);
  }

  public setMyBitVector(size: number) {
    this.myBitVector.push(size);
    this.myBitVector = this.handleBitVector(this.myBitVector);
  }

  public setMyASON(json: string) {
    const parsedObject = ArkTSUtils.ASON.parse(json) as ISendable;
    this.myASON = this.handleASON(parsedObject);
  }

  public setMyAsyncLock(name: string) {
    const lockInstance = ArkTSUtils.locks.AsyncLock.request(name);
    this.myAsyncLock = this.handleAsyncLock(lockInstance);
  }

  public setMySendableUnion(value: string | number | boolean | bigint) {
    this.mySendableUnionArray = this.handleSendableUnionArray(value);
  }

  public getMyString() {
    return this.myString;
  }

  public getMyNumber(): number {
    return this.myNumber;
  }

  public getMyBoolean(): boolean {
    return this.myBoolean;
  }

  public getMyBigInt(): bigint {
    return this.myBigInt;
  }

  public getMyUndefined(): undefined | string | number | null {
    return this.myUndefined;
  }

  public getMyNull(): undefined | string | number | null {
    return this.myNull;
  }

  public getMyTopLevelClassInstance(): topLevelSendableClass {
    return this.myTopLevelClassInstance;
  }

  public getMyTopLevelFunction(): SendableFuncType {
    return this.myTopLevelFunction;
  }

  public getMyEnum(): SendableConstEnum {
    return this.myEnum;
  }

  public getMyArray(): collections.Array<number> {
    return this.myArray;
  }

  public getMyMap(): collections.Map<number, number> {
    return this.myMap;
  }

  public getMySet(): collections.Set<number> {
    return this.mySet;
  }

  public getMyTypedArrayInt8Array(): collections.Int8Array {
    return this.myTypedArrayInt8Array;
  }

  public getMyTypedArrayUint8Array(): collections.Uint8Array {
    return this.myTypedArrayUint8Array;
  }

  public getMyTypedArrayInt16Array(): collections.Int16Array {
    return this.myTypedArrayInt16Array;
  }

  public getMyTypedArrayUint16Array(): collections.Uint16Array {
    return this.myTypedArrayUint16Array;
  }

  public getMyTypedArrayInt32Array(): collections.Int32Array {
    return this.myTypedArrayInt32Array;
  }

  public getMyTypedArrayUint32Array(): collections.Uint32Array {
    return this.myTypedArrayUint32Array;
  }

  public getMyTypedArrayUint8ClampedArray(): collections.Uint8ClampedArray {
    return this.myTypedArrayUint8ClampedArray;
  }

  public getMyTypedArrayFloat32Array(): collections.Float32Array {
    return this.myTypedArrayFloat32Array;
  }

  public getMyArrayBuffer(): collections.ArrayBuffer {
    return this.myArrayBuffer;
  }

  public getMyConcatArray(): collections.ConcatArray<number> {
    return this.myConcatArray;
  }

  public getMyBitVector(): collections.BitVector {
    return this.myBitVector;
  }

  public getMyASON(): ISendable {
    return this.myASON;
  }

  public getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return this.myAsyncLock;
  }

  public getMySendableUnionArray(): string | number | boolean | bigint {
    return this.mySendableUnionArray;
  }

  public handleString(input: string): string {
    return input;
  }

  public handleNumber(input: number): number {
    return input;
  }

  public handleBoolean(input: boolean): boolean {
    return input;
  }

  public handleBigInt(input: bigint): bigint {
    return input;
  }

  public handleUndefined(input: undefined | string | number | null): undefined | string | number | null {
    return input;
  }

  public handleNull(input: undefined | string | number | null): undefined | string | number | null {
    return input;
  }

  public handleTopLevelClassInstance(input: topLevelSendableClass): topLevelSendableClass {
    return input;
  }

  public handleTopLevelFunction(input: SendableFuncType): SendableFuncType {
    return input;
  }

  public handleEnum(input: SendableConstEnum): SendableConstEnum {
    return input;
  }

  public handleArray(input: collections.Array<number>): collections.Array<number> {
    return input;
  }

  public handleMap(input: collections.Map<number, number>): collections.Map<number, number> {
    return input;
  }

  public handleSet(input: collections.Set<number>): collections.Set<number> {
    return input;
  }

  public handleTypedArrayInt8Array(input: collections.Int8Array): collections.Int8Array {
    return input;
  }

  public handleTypedArrayUint8Array(input: collections.Uint8Array): collections.Uint8Array {
    return input;
  }

  public handleTypedArrayInt16Array(input: collections.Int16Array): collections.Int16Array {
    return input;
  }

  public handleTypedArrayUint16Array(input: collections.Uint16Array): collections.Uint16Array {
    return input;
  }

  public handleTypedArrayInt32Array(input: collections.Int32Array): collections.Int32Array {
    return input;
  }

  public handleTypedArrayUint32Array(input: collections.Uint32Array): collections.Uint32Array {
    return input;
  }

  public handleTypedArrayUint8ClampedArray(input: collections.Uint8ClampedArray): collections.Uint8ClampedArray {
    return input;
  }

  public handleTypedArrayFloat32Array(input: collections.Float32Array): collections.Float32Array {
    return input;
  }

  public handleArrayBuffer(input: collections.ArrayBuffer): collections.ArrayBuffer {
    return input;
  }

  public handleConcatArray(input: collections.ConcatArray<number>): collections.ConcatArray<number> {
    return input;
  }

  public handleBitVector(input: collections.BitVector): collections.BitVector {
    return input;
  }

  public handleASON(input: ISendable): ISendable {
    return input;
  }

  public handleAsyncLock(input: ArkTSUtils.locks.AsyncLock): ArkTSUtils.locks.AsyncLock {
    return input;
  }

  public handleSendableUnionArray(input: string | number | boolean | bigint): string | number | boolean | bigint {
    return input;
  }
}

@Sendable
export class SendablePublicSetGetFuncInheritClass extends SendablePublicGetSetFuncClass {
  constructor() {
    super()
  }
}