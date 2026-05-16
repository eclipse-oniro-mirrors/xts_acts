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
export class SendableDefaultClass implements ISendable {
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
}

@Sendable
export class SendableDefaultFuncClass implements ISendable {
  myString: string;
  myNumber: number;
  myBoolean: boolean;
  myBigInt: bigint;
  myUndefined: undefined | string | number | null;
  myNull: undefined | string | number | null;
  topLevelClassInstance: topLevelSendableClass;
  topLevelFunction: SendableFuncType;
  myEnum: SendableConstEnum;
  myArray: collections.Array<number>;
  myMap: collections.Map<number, number>;
  mySet: collections.Set<number>;
  myTypedArrayInt8Array: collections.Int8Array;
  myTypedArrayUint8Array: collections.Uint8Array;
  myTypedArrayInt16Array: collections.Int16Array;
  myTypedArrayUint16Array: collections.Uint16Array;
  myTypedArrayInt32Array: collections.Int32Array;
  myTypedArrayUint32Array: collections.Uint32Array;
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray;
  myTypedArrayFloat32Array: collections.Float32Array;
  myArrayBuffer: collections.ArrayBuffer;
  myConcatArray: collections.ConcatArray<number>;
  myBitVector: collections.BitVector;
  myASON: ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock;
  mySendableUnionArray: string | number | boolean | bigint;

  constructor(func: <T>(arg: T) => T) {
    this.myString = func<string>('example string');
    this.myNumber = func<number>(42);
    this.myBoolean = func<boolean>(true);
    this.myBigInt = func<bigint>(1234567890123456789012345678901234567890n);
    this.myUndefined = func<undefined | string | number | null>(undefined);
    this.myNull = func<undefined | string | number | null>(null);
    this.topLevelClassInstance = func<topLevelSendableClass>(new topLevelSendableClass());
    this.topLevelFunction = func<SendableFuncType>(TopLevelSendableFunction);
    this.myEnum = func<SendableConstEnum>(SendableConstEnum.OPTION_1);
    this.myArray = func<collections.Array<number>>(new collections.Array<number>());
    this.myMap = func<collections.Map<number, number>>(new collections.Map<number, number>());
    this.mySet = func<collections.Set<number>>(new collections.Set<number>());
    this.myTypedArrayInt8Array = func<collections.Int8Array>(new collections.Int8Array(6));
    this.myTypedArrayUint8Array = func<collections.Uint8Array>(new collections.Uint8Array(6));
    this.myTypedArrayInt16Array = func<collections.Int16Array>(new collections.Int16Array(6));
    this.myTypedArrayUint16Array = func<collections.Uint16Array>(new collections.Uint16Array(6));
    this.myTypedArrayInt32Array = func<collections.Int32Array>(new collections.Int32Array(6));
    this.myTypedArrayUint32Array = func<collections.Uint32Array>(new collections.Uint32Array(6));
    this.myTypedArrayUint8ClampedArray = func<collections.Uint8ClampedArray>(new collections.Uint8ClampedArray(6));
    this.myTypedArrayFloat32Array = func<collections.Float32Array>(new collections.Float32Array(6));
    this.myArrayBuffer = func<collections.ArrayBuffer>(new collections.ArrayBuffer(10));
    this.myConcatArray = func<collections.ConcatArray<number>>(new collections.Array<number>(1, 2, 4));
    this.myBitVector = func<collections.BitVector>(new collections.BitVector(2));
    this.myASON =
      func<ISendable>(ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
    this.myAsyncLock = func<ArkTSUtils.locks.AsyncLock>(ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
    this.mySendableUnionArray = func<string | number | boolean | bigint>(1);
  }
}

@Sendable
export class SendableDefaultArrowClass implements ISendable {
  myString: string;
  myNumber: number;
  myBoolean: boolean;
  myBigInt: bigint;
  myUndefined: undefined | string | number | null;
  myNull: undefined | string | number | null;
  topLevelClassInstance: topLevelSendableClass;
  topLevelFunction: SendableFuncType;
  myEnum: SendableConstEnum;
  myArray: collections.Array<number>;
  myMap: collections.Map<number, number>;
  mySet: collections.Set<number>;
  myTypedArrayInt8Array: collections.Int8Array;
  myTypedArrayUint8Array: collections.Uint8Array;
  myTypedArrayInt16Array: collections.Int16Array;
  myTypedArrayUint16Array: collections.Uint16Array;
  myTypedArrayInt32Array: collections.Int32Array;
  myTypedArrayUint32Array: collections.Uint32Array;
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray;
  myTypedArrayFloat32Array: collections.Float32Array;
  myArrayBuffer: collections.ArrayBuffer;
  myConcatArray: collections.ConcatArray<number>;
  myBitVector: collections.BitVector;
  myASON: ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock;
  mySendableUnionArray: string | number | boolean | bigint;

  constructor(func: <T>(arg: () => T) => T) {
    this.myString = func<string>(() => new String('example string').valueOf());
    this.myNumber = func<number>(() => new Number(42).valueOf());
    this.myBoolean = func<boolean>(() => new Boolean(true).valueOf());
    this.myBigInt = func<bigint>(() => BigInt(1234567890123456789012345678901234567890n));
    this.myUndefined = func<undefined | string | number | null>(() => undefined);
    this.myNull = func<undefined | string | number | null>(() => null);
    this.topLevelClassInstance = func<topLevelSendableClass>(() => new topLevelSendableClass());
    this.topLevelFunction = func<SendableFuncType>(() => TopLevelSendableFunction);
    this.myEnum = func<SendableConstEnum>(() => SendableConstEnum.OPTION_1);
    this.myArray = func<collections.Array<number>>(() => new collections.Array<number>());
    this.myMap = func<collections.Map<number, number>>(() => new collections.Map<number, number>());
    this.mySet = func<collections.Set<number>>(() => new collections.Set<number>());
    this.myTypedArrayInt8Array = func<collections.Int8Array>(() => new collections.Int8Array(6));
    this.myTypedArrayUint8Array = func<collections.Uint8Array>(() => new collections.Uint8Array(6));
    this.myTypedArrayInt16Array = func<collections.Int16Array>(() => new collections.Int16Array(6));
    this.myTypedArrayUint16Array = func<collections.Uint16Array>(() => new collections.Uint16Array(6));
    this.myTypedArrayInt32Array = func<collections.Int32Array>(() => new collections.Int32Array(6));
    this.myTypedArrayUint32Array = func<collections.Uint32Array>(() => new collections.Uint32Array(6));
    this.myTypedArrayUint8ClampedArray =
      func<collections.Uint8ClampedArray>(() => new collections.Uint8ClampedArray(6));
    this.myTypedArrayFloat32Array = func<collections.Float32Array>(() => new collections.Float32Array(6));
    this.myArrayBuffer = func<collections.ArrayBuffer>(() => new collections.ArrayBuffer(10));
    this.myConcatArray = func<collections.ConcatArray<number>>(() => new collections.Array<number>(1, 2, 4));
    this.myBitVector = func<collections.BitVector>(() => new collections.BitVector(2));
    this.myASON =
      func<ISendable>(() => ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
    this.myAsyncLock = func<ArkTSUtils.locks.AsyncLock>(() => ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
    this.mySendableUnionArray = func<string | number | boolean | bigint>(() => 1);
  }
}

@Sendable
export class SendableDefaultArrowOutClass implements ISendable {
  myString: string;
  myNumber: number;
  myBoolean: boolean;
  myBigInt: bigint;
  myUndefined: undefined | string | number | null;
  myNull: undefined | string | number | null;
  topLevelClassInstance: topLevelSendableClass;
  topLevelFunction: SendableFuncType;
  myEnum: SendableConstEnum;
  myArray: collections.Array<number>;
  myMap: collections.Map<number, number>;
  mySet: collections.Set<number>;
  myTypedArrayInt8Array: collections.Int8Array;
  myTypedArrayUint8Array: collections.Uint8Array;
  myTypedArrayInt16Array: collections.Int16Array;
  myTypedArrayUint16Array: collections.Uint16Array;
  myTypedArrayInt32Array: collections.Int32Array;
  myTypedArrayUint32Array: collections.Uint32Array;
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray;
  myTypedArrayFloat32Array: collections.Float32Array;
  myArrayBuffer: collections.ArrayBuffer;
  myConcatArray: collections.ConcatArray<number>;
  myBitVector: collections.BitVector;
  myASON: ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock;
  mySendableUnionArray: string | number | boolean | bigint;

  constructor(func: <T>(arg: () => T) => T) {
    this.myString = func(() => new String('example string').valueOf());
    this.myNumber = func(() => new Number(42).valueOf());
    this.myBoolean = func(() => new Boolean(true).valueOf());
    this.myBigInt = func(() => BigInt(1234567890123456789012345678901234567890n));
    this.myUndefined = func(() => undefined);
    this.myNull = func(() => null);
    this.topLevelClassInstance = func(() => new topLevelSendableClass());
    this.topLevelFunction = func(() => TopLevelSendableFunction);
    this.myEnum = func(() => SendableConstEnum.OPTION_1);
    this.myArray = func(() => new collections.Array<number>());
    this.myMap = func(() => new collections.Map<number, number>());
    this.mySet = func(() => new collections.Set<number>());
    this.myTypedArrayInt8Array = func(() => new collections.Int8Array(6));
    this.myTypedArrayUint8Array = func(() => new collections.Uint8Array(6));
    this.myTypedArrayInt16Array = func(() => new collections.Int16Array(6));
    this.myTypedArrayUint16Array = func(() => new collections.Uint16Array(6));
    this.myTypedArrayInt32Array = func(() => new collections.Int32Array(6));
    this.myTypedArrayUint32Array = func(() => new collections.Uint32Array(6));
    this.myTypedArrayUint8ClampedArray = func(() => new collections.Uint8ClampedArray(6));
    this.myTypedArrayFloat32Array = func(() => new collections.Float32Array(6));
    this.myArrayBuffer = func(() => new collections.ArrayBuffer(10));
    this.myConcatArray = func(() => new collections.Array<number>(1, 2, 4));
    this.myBitVector = func(() => new collections.BitVector(2));
    this.myASON = func(() => ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
    this.myAsyncLock = func(() => ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
    this.mySendableUnionArray = func(() => 1);
  }
}

@Sendable
export class SendableDefaultFuncInClass implements ISendable {
  myString: string;
  myNumber: number;
  myBoolean: boolean;
  myBigInt: bigint;
  myUndefined: undefined | string | number | null;
  myNull: undefined | string | number | null;
  topLevelClassInstance: topLevelSendableClass;
  topLevelFunction: SendableFuncType;
  myEnum: SendableConstEnum;
  myArray: collections.Array<number>;
  myMap: collections.Map<number, number>;
  mySet: collections.Set<number>;
  myTypedArrayInt8Array: collections.Int8Array;
  myTypedArrayUint8Array: collections.Uint8Array;
  myTypedArrayInt16Array: collections.Int16Array;
  myTypedArrayUint16Array: collections.Uint16Array;
  myTypedArrayInt32Array: collections.Int32Array;
  myTypedArrayUint32Array: collections.Uint32Array;
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray;
  myTypedArrayFloat32Array: collections.Float32Array;
  myArrayBuffer: collections.ArrayBuffer;
  myConcatArray: collections.ConcatArray<number>;
  myBitVector: collections.BitVector;
  myASON: ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock;
  mySendableUnionArray: string | number | boolean | bigint;

  constructor() {
    this.myString = this.setProperty(() => 'example string');
    this.myNumber = this.setProperty(() => 42);
    this.myBoolean = this.setProperty(() => true);
    this.myBigInt = this.setProperty(() => 1234567890123456789012345678901234567890n);
    this.myUndefined = this.setProperty(() => undefined);
    this.myNull = this.setProperty(() => null);
    this.topLevelClassInstance = this.setProperty(() => new topLevelSendableClass());
    this.topLevelFunction = this.setProperty(() => TopLevelSendableFunction);
    this.myEnum = this.setProperty(() => SendableConstEnum.OPTION_1);
    this.myArray = this.setProperty(() => new collections.Array<number>());
    this.myMap = this.setProperty(() => new collections.Map<number, number>());
    this.mySet = this.setProperty(() => new collections.Set<number>());
    this.myTypedArrayInt8Array = this.setProperty(() => new collections.Int8Array(6));
    this.myTypedArrayUint8Array = this.setProperty(() => new collections.Uint8Array(6));
    this.myTypedArrayInt16Array = this.setProperty(() => new collections.Int16Array(6));
    this.myTypedArrayUint16Array = this.setProperty(() => new collections.Uint16Array(6));
    this.myTypedArrayInt32Array = this.setProperty(() => new collections.Int32Array(6));
    this.myTypedArrayUint32Array = this.setProperty(() => new collections.Uint32Array(6));
    this.myTypedArrayUint8ClampedArray = this.setProperty(() => new collections.Uint8ClampedArray(6));
    this.myTypedArrayFloat32Array = this.setProperty(() => new collections.Float32Array(6));
    this.myArrayBuffer = this.setProperty(() => new collections.ArrayBuffer(10));
    this.myConcatArray = this.setProperty(() => new collections.Array<number>(1, 2, 4));
    this.myBitVector = this.setProperty(() => new collections.BitVector(2));
    this.myASON =
      this.setProperty(() => ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
    this.myAsyncLock = this.setProperty(() => ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
    this.mySendableUnionArray = this.setProperty(() => 1);
  }

  setProperty<T>(func: () => T): T {
    return func();
  }
}

@Sendable
export class SendableDefaultNonParameterFuncClass implements ISendable {
  myString: string = this.getMyString();
  myNumber: number = this.getMyNumber();
  myBoolean: boolean = this.getMyBoolean();
  myBigInt: bigint = this.getMyBigInt();
  myUndefined: undefined | string | number | null = this.getMyUndefined();
  myNull: undefined | string | number | null = this.getMyNull();
  topLevelClassInstance: topLevelSendableClass = this.getTopLevelClassInstance();
  topLevelFunction: SendableFuncType = this.getTopLevelFunction();
  myEnum: SendableConstEnum = this.getMyEnum();
  myArray: collections.Array<number> = this.getMyArray();
  myMap: collections.Map<number, number> = this.getMyMap();
  mySet: collections.Set<number> = this.getMySet();
  myTypedArrayInt8Array: collections.Int8Array = this.getMyTypedArrayInt8Array();
  myTypedArrayUint8Array: collections.Uint8Array = this.getMyTypedArrayUint8Array();
  myTypedArrayInt16Array: collections.Int16Array = this.getMyTypedArrayInt16Array();
  myTypedArrayUint16Array: collections.Uint16Array = this.getMyTypedArrayUint16Array();
  myTypedArrayInt32Array: collections.Int32Array = this.getMyTypedArrayInt32Array();
  myTypedArrayUint32Array: collections.Uint32Array = this.getMyTypedArrayUint32Array();
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = this.getMyTypedArrayUint8ClampedArray();
  myTypedArrayFloat32Array: collections.Float32Array = this.getMyTypedArrayFloat32Array();
  myArrayBuffer: collections.ArrayBuffer = this.getMyArrayBuffer();
  myConcatArray: collections.ConcatArray<number> = this.getMyConcatArray();
  myBitVector: collections.BitVector = this.getMyBitVector();
  myASON: ISendable = this.getMyASON();
  myAsyncLock: ArkTSUtils.locks.AsyncLock = this.getMyAsyncLock();
  mySendableUnionArray: string | number | boolean | bigint = this.getMySendableUnionArray();

  constructor() {
  }

  private getMyString(): string {
    return 'example string';
  }

  private getMyNumber(): number {
    return 42;
  }

  private getMyBoolean(): boolean {
    return true;
  }

  private getMyBigInt(): bigint {
    return 1234567890123456789012345678901234567890n;
  }

  private getMyUndefined(): undefined | string | number | null {
    return undefined;
  }

  private getMyNull(): undefined | string | number | null {
    return null;
  }

  private getTopLevelClassInstance(): topLevelSendableClass {
    return new topLevelSendableClass();
  }

  private getTopLevelFunction(): SendableFuncType {
    return TopLevelSendableFunction;
  }

  private getMyEnum(): SendableConstEnum {
    return SendableConstEnum.OPTION_1;
  }

  private getMyArray(): collections.Array<number> {
    return new collections.Array<number>();
  }

  private getMyMap(): collections.Map<number, number> {
    return new collections.Map<number, number>();
  }

  private getMySet(): collections.Set<number> {
    return new collections.Set<number>();
  }

  private getMyTypedArrayInt8Array(): collections.Int8Array {
    return new collections.Int8Array(6);
  }

  private getMyTypedArrayUint8Array(): collections.Uint8Array {
    return new collections.Uint8Array(6);
  }

  private getMyTypedArrayInt16Array(): collections.Int16Array {
    return new collections.Int16Array(6);
  }

  private getMyTypedArrayUint16Array(): collections.Uint16Array {
    return new collections.Uint16Array(6);
  }

  private getMyTypedArrayInt32Array(): collections.Int32Array {
    return new collections.Int32Array(6);
  }

  private getMyTypedArrayUint32Array(): collections.Uint32Array {
    return new collections.Uint32Array(6);
  }

  private getMyTypedArrayUint8ClampedArray(): collections.Uint8ClampedArray {
    return new collections.Uint8ClampedArray(6);
  }

  private getMyTypedArrayFloat32Array(): collections.Float32Array {
    return new collections.Float32Array(6);
  }

  private getMyArrayBuffer(): collections.ArrayBuffer {
    return new collections.ArrayBuffer(10);
  }

  private getMyConcatArray(): collections.ConcatArray<number> {
    return new collections.Array<number>(1, 2, 4);
  }

  private getMyBitVector(): collections.BitVector {
    return new collections.BitVector(2);
  }

  private getMyASON(): ISendable {
    return ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  }

  private getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  }

  private getMySendableUnionArray(): string | number | boolean | bigint {
    return 1;
  }
}

@Sendable
export class SendableDefaultOutArrowClass implements ISendable {
  myString: string;
  myNumber: number;
  myBoolean: boolean;
  myBigInt: bigint;
  myUndefined: undefined | string | number | null;
  myNull: undefined | string | number | null;
  topLevelClassInstance: topLevelSendableClass;
  topLevelFunction: SendableFuncType;
  myEnum: SendableConstEnum;
  myArray: collections.Array<number>;
  myMap: collections.Map<number, number>;
  mySet: collections.Set<number>;
  myTypedArrayInt8Array: collections.Int8Array;
  myTypedArrayUint8Array: collections.Uint8Array;
  myTypedArrayInt16Array: collections.Int16Array;
  myTypedArrayUint16Array: collections.Uint16Array;
  myTypedArrayInt32Array: collections.Int32Array;
  myTypedArrayUint32Array: collections.Uint32Array;
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray;
  myTypedArrayFloat32Array: collections.Float32Array;
  myArrayBuffer: collections.ArrayBuffer;
  myConcatArray: collections.ConcatArray<number>;
  myBitVector: collections.BitVector;
  myASON: ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock;
  mySendableUnionArray: string | number | boolean | bigint;

  constructor() {
    const func = <T>(arg: T) => arg;

    this.myString = func<string>('example string');
    this.myNumber = func<number>(42);
    this.myBoolean = func<boolean>(true);
    this.myBigInt = func<bigint>(1234567890123456789012345678901234567890n);
    this.myUndefined = func<undefined | string | number | null>(undefined);
    this.myNull = func<undefined | string | number | null>(null);
    this.topLevelClassInstance = func<topLevelSendableClass>(new topLevelSendableClass());
    this.topLevelFunction = func<SendableFuncType>(TopLevelSendableFunction);
    this.myEnum = func<SendableConstEnum>(SendableConstEnum.OPTION_1);
    this.myArray = func<collections.Array<number>>(new collections.Array<number>());
    this.myMap = func<collections.Map<number, number>>(new collections.Map<number, number>());
    this.mySet = func<collections.Set<number>>(new collections.Set<number>());
    this.myTypedArrayInt8Array = func<collections.Int8Array>(new collections.Int8Array(6));
    this.myTypedArrayUint8Array = func<collections.Uint8Array>(new collections.Uint8Array(6));
    this.myTypedArrayInt16Array = func<collections.Int16Array>(new collections.Int16Array(6));
    this.myTypedArrayUint16Array = func<collections.Uint16Array>(new collections.Uint16Array(6));
    this.myTypedArrayInt32Array = func<collections.Int32Array>(new collections.Int32Array(6));
    this.myTypedArrayUint32Array = func<collections.Uint32Array>(new collections.Uint32Array(6));
    this.myTypedArrayUint8ClampedArray = func<collections.Uint8ClampedArray>(new collections.Uint8ClampedArray(6));
    this.myTypedArrayFloat32Array = func<collections.Float32Array>(new collections.Float32Array(6));
    this.myArrayBuffer = func<collections.ArrayBuffer>(new collections.ArrayBuffer(10));
    this.myConcatArray = func<collections.ConcatArray<number>>(new collections.Array<number>(1, 2, 4));
    this.myBitVector = func<collections.BitVector>(new collections.BitVector(2));
    this.myASON =
      func<ISendable>(ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
    this.myAsyncLock = func<ArkTSUtils.locks.AsyncLock>(ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
    this.mySendableUnionArray = func<string | number | boolean | bigint>(1);
  }
}

@Sendable
export class SendableDefaultNonFuncClass implements ISendable {
  myString: string = (() => 'example string')();
  myNumber: number = (() => 42)();
  myBoolean: boolean = (() => true)();
  myBigInt: bigint = (() => 1234567890123456789012345678901234567890n)();
  myUndefined: undefined | string | number | null = (() => undefined)();
  myNull: undefined | string | number | null = (() => null)();
  topLevelClassInstance: topLevelSendableClass = (() => new topLevelSendableClass())();
  topLevelFunction: SendableFuncType = (() => TopLevelSendableFunction)();
  myEnum: SendableConstEnum = (() => SendableConstEnum.OPTION_1)();
  myArray: collections.Array<number> = (() => new collections.Array<number>())();
  myMap: collections.Map<number, number> = (() => new collections.Map<number, number>())();
  mySet: collections.Set<number> = (() => new collections.Set<number>())();
  myTypedArrayInt8Array: collections.Int8Array = (() => new collections.Int8Array(6))();
  myTypedArrayUint8Array: collections.Uint8Array = (() => new collections.Uint8Array(6))();
  myTypedArrayInt16Array: collections.Int16Array = (() => new collections.Int16Array(6))();
  myTypedArrayUint16Array: collections.Uint16Array = (() => new collections.Uint16Array(6))();
  myTypedArrayInt32Array: collections.Int32Array = (() => new collections.Int32Array(6))();
  myTypedArrayUint32Array: collections.Uint32Array = (() => new collections.Uint32Array(6))();
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = (() => new collections.Uint8ClampedArray(6))();
  myTypedArrayFloat32Array: collections.Float32Array = (() => new collections.Float32Array(6))();
  myArrayBuffer: collections.ArrayBuffer = (() => new collections.ArrayBuffer(10))();
  myConcatArray: collections.ConcatArray<number> = (() => new collections.Array<number>(1, 2, 4))();
  myBitVector: collections.BitVector = (() => new collections.BitVector(2))();
  myASON: ISendable = (() => ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable)();
  myAsyncLock: ArkTSUtils.locks.AsyncLock = (() => ArkTSUtils.locks.AsyncLock.request("queryTestLock"))();
  mySendableUnionArray: string | number | boolean | bigint = (() => 1)();

  constructor() {
  }
}

@Sendable
export class SendableDefaultParameterFuncClass implements ISendable {
  myString: string;
  myNumber: number;
  myBoolean: boolean;
  myBigInt: bigint;
  myUndefined: undefined | string | number | null;
  myNull: undefined | string | number | null;
  topLevelClassInstance: topLevelSendableClass;
  topLevelFunction: SendableFuncType;
  myEnum: SendableConstEnum;
  myArray: collections.Array<number>;
  myMap: collections.Map<number, number>;
  mySet: collections.Set<number>;
  myTypedArrayInt8Array: collections.Int8Array;
  myTypedArrayUint8Array: collections.Uint8Array;
  myTypedArrayInt16Array: collections.Int16Array;
  myTypedArrayUint16Array: collections.Uint16Array;
  myTypedArrayInt32Array: collections.Int32Array;
  myTypedArrayUint32Array: collections.Uint32Array;
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray;
  myTypedArrayFloat32Array: collections.Float32Array;
  myArrayBuffer: collections.ArrayBuffer;
  myConcatArray: collections.ConcatArray<number>;
  myBitVector: collections.BitVector;
  myASON: ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock;
  mySendableUnionArray: string | number | boolean | bigint;

  constructor() {
    const func = <T>(initializer: () => T): T => initializer();

    this.myString = func(() => 'example string');
    this.myNumber = func(() => 42);
    this.myBoolean = func(() => true);
    this.myBigInt = func(() => 1234567890123456789012345678901234567890n);
    this.myUndefined = func(() => undefined);
    this.myNull = func(() => null);
    this.topLevelClassInstance = func(() => new topLevelSendableClass());
    this.topLevelFunction = func(() => TopLevelSendableFunction);
    this.myEnum = func(() => SendableConstEnum.OPTION_1);
    this.myArray = func(() => new collections.Array<number>());
    this.myMap = func(() => new collections.Map<number, number>());
    this.mySet = func(() => new collections.Set<number>());
    this.myTypedArrayInt8Array = func(() => new collections.Int8Array(6));
    this.myTypedArrayUint8Array = func(() => new collections.Uint8Array(6));
    this.myTypedArrayInt16Array = func(() => new collections.Int16Array(6));
    this.myTypedArrayUint16Array = func(() => new collections.Uint16Array(6));
    this.myTypedArrayInt32Array = func(() => new collections.Int32Array(6));
    this.myTypedArrayUint32Array = func(() => new collections.Uint32Array(6));
    this.myTypedArrayUint8ClampedArray = func(() => new collections.Uint8ClampedArray(6));
    this.myTypedArrayFloat32Array = func(() => new collections.Float32Array(6));
    this.myArrayBuffer = func(() => new collections.ArrayBuffer(10));
    this.myConcatArray = func(() => new collections.Array<number>(1, 2, 4));
    this.myBitVector = func(() => new collections.BitVector(2));
    this.myASON = func(() => ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
    this.myAsyncLock = func(() => ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
    this.mySendableUnionArray = func(() => 1);
  }
}

@Sendable
export class SendableDefaultArrowNewClass implements ISendable {
  myString: string = ((value: string) => value)('example string');
  myNumber: number = ((value: number) => value)(42);
  myBoolean: boolean = ((value: boolean) => value)(true);
  myBigInt: bigint = ((value: bigint) => value)(1234567890123456789012345678901234567890n);
  myUndefined: undefined | string | number | null = ((value: undefined) => value)(undefined);
  myNull: undefined | string | number | null = ((value: null) => value)(null);
  topLevelClassInstance: topLevelSendableClass = ((value: topLevelSendableClass) => value)(new topLevelSendableClass());
  topLevelFunction: SendableFuncType = ((value: SendableFuncType) => value)(TopLevelSendableFunction);
  myEnum: SendableConstEnum = ((value: SendableConstEnum) => value)(SendableConstEnum.OPTION_1);
  myArray: collections.Array<number> = ((value: collections.Array<number>) => value)(new collections.Array<number>());
  myMap: collections.Map<number, number> =
    ((value: collections.Map<number, number>) => value)(new collections.Map<number, number>());
  mySet: collections.Set<number> = ((value: collections.Set<number>) => value)(new collections.Set<number>());
  myTypedArrayInt8Array: collections.Int8Array =
    ((value: collections.Int8Array) => value)(new collections.Int8Array(6));
  myTypedArrayUint8Array: collections.Uint8Array =
    ((value: collections.Uint8Array) => value)(new collections.Uint8Array(6));
  myTypedArrayInt16Array: collections.Int16Array =
    ((value: collections.Int16Array) => value)(new collections.Int16Array(6));
  myTypedArrayUint16Array: collections.Uint16Array =
    ((value: collections.Uint16Array) => value)(new collections.Uint16Array(6));
  myTypedArrayInt32Array: collections.Int32Array =
    ((value: collections.Int32Array) => value)(new collections.Int32Array(6));
  myTypedArrayUint32Array: collections.Uint32Array =
    ((value: collections.Uint32Array) => value)(new collections.Uint32Array(6));
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray =
    ((value: collections.Uint8ClampedArray) => value)(new collections.Uint8ClampedArray(6));
  myTypedArrayFloat32Array: collections.Float32Array =
    ((value: collections.Float32Array) => value)(new collections.Float32Array(6));
  myArrayBuffer: collections.ArrayBuffer = ((value: collections.ArrayBuffer) => value)(new collections.ArrayBuffer(10));
  myConcatArray: collections.ConcatArray<number> =
    ((value: collections.ConcatArray<number>) => value)(new collections.Array<number>(1, 2, 4));
  myBitVector: collections.BitVector = ((value: collections.BitVector) => value)(new collections.BitVector(2));
  myASON: ISendable =
    ((value: ISendable) => value)(ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
  myAsyncLock: ArkTSUtils.locks.AsyncLock =
    ((value: ArkTSUtils.locks.AsyncLock) => value)(ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
  mySendableUnionArray: string | number | boolean | bigint = ((value: number) => value)(1);

  constructor() {
  }
}

@Sendable
export class SendableDefaultExpressionArrowOutClass implements ISendable {
  myString: string = (() => 'example string')();
  myNumber: number = (() => 42)();
  myBoolean: boolean = (() => true)();
  myBigInt: bigint = (() => 1234567890123456789012345678901234567890n)();
  myUndefined: undefined | string | number | null = (() => undefined)();
  myNull: undefined | string | number | null = (() => null)();
  topLevelClassInstance: topLevelSendableClass = (() => new topLevelSendableClass())();
  topLevelFunction: SendableFuncType = (() => TopLevelSendableFunction)();
  myEnum: SendableConstEnum = (() => SendableConstEnum.OPTION_1)();
  myArray: collections.Array<number> = (() => new collections.Array<number>())();
  myMap: collections.Map<number, number> = (() => new collections.Map<number, number>())();
  mySet: collections.Set<number> = (() => new collections.Set<number>())();
  myTypedArrayInt8Array: collections.Int8Array = (() => new collections.Int8Array(6))();
  myTypedArrayUint8Array: collections.Uint8Array = (() => new collections.Uint8Array(6))();
  myTypedArrayInt16Array: collections.Int16Array = (() => new collections.Int16Array(6))();
  myTypedArrayUint16Array: collections.Uint16Array = (() => new collections.Uint16Array(6))();
  myTypedArrayInt32Array: collections.Int32Array = (() => new collections.Int32Array(6))();
  myTypedArrayUint32Array: collections.Uint32Array = (() => new collections.Uint32Array(6))();
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = (() => new collections.Uint8ClampedArray(6))();
  myTypedArrayFloat32Array: collections.Float32Array = (() => new collections.Float32Array(6))();
  myArrayBuffer: collections.ArrayBuffer = (() => new collections.ArrayBuffer(10))();
  myConcatArray: collections.ConcatArray<number> = (() => new collections.Array<number>(1, 2, 4))();
  myBitVector: collections.BitVector = (() => new collections.BitVector(2))();
  myASON: ISendable = (() => ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable)();
  myAsyncLock: ArkTSUtils.locks.AsyncLock = (() => ArkTSUtils.locks.AsyncLock.request("queryTestLock"))();
  mySendableUnionArray: string | number | boolean | bigint = (() => 1)();

  constructor() {
  }
}

type GetValueFunc<T> = () => T;

@Sendable
export class SendableDefaultExpressionOutClass implements ISendable {
  myString: string;
  myNumber: number;
  myBoolean: boolean;
  myBigInt: bigint;
  myUndefined: undefined | string | number | null;
  myNull: undefined | string | number | null;
  topLevelClassInstance: topLevelSendableClass;
  topLevelFunction: SendableFuncType;
  myEnum: SendableConstEnum;
  myArray: collections.Array<number>;
  myMap: collections.Map<number, number>;
  mySet: collections.Set<number>;
  myTypedArrayInt8Array: collections.Int8Array;
  myTypedArrayUint8Array: collections.Uint8Array;
  myTypedArrayInt16Array: collections.Int16Array;
  myTypedArrayUint16Array: collections.Uint16Array;
  myTypedArrayInt32Array: collections.Int32Array;
  myTypedArrayUint32Array: collections.Uint32Array;
  myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray;
  myTypedArrayFloat32Array: collections.Float32Array;
  myArrayBuffer: collections.ArrayBuffer;
  myConcatArray: collections.ConcatArray<number>;
  myBitVector: collections.BitVector;
  myASON: ISendable;
  myAsyncLock: ArkTSUtils.locks.AsyncLock;
  mySendableUnionArray: string | number | boolean | bigint;

  constructor(
    getString: GetValueFunc<string> = () => 'example string',
    getNumber: GetValueFunc<number> = () => 42,
    getBoolean: GetValueFunc<boolean> = () => true,
    getBigInt: GetValueFunc<bigint> = () => 1234567890123456789012345678901234567890n,
    getUndefined: GetValueFunc<undefined | string | number | null> = () => undefined,
    getNull: GetValueFunc<undefined | string | number | null> = () => null,
    getTopLevelClassInstance: GetValueFunc<topLevelSendableClass> = () => new topLevelSendableClass(),
    getTopLevelFunction: GetValueFunc<SendableFuncType> = () => TopLevelSendableFunction,
    getEnum: GetValueFunc<SendableConstEnum> = () => SendableConstEnum.OPTION_1,
    getArray: GetValueFunc<collections.Array<number>> = () => new collections.Array<number>(),
    getMap: GetValueFunc<collections.Map<number, number>> = () => new collections.Map<number, number>(),
    getSet: GetValueFunc<collections.Set<number>> = () => new collections.Set<number>(),
    getTypedArrayInt8Array: GetValueFunc<collections.Int8Array> = () => new collections.Int8Array(6),
    getTypedArrayUint8Array: GetValueFunc<collections.Uint8Array> = () => new collections.Uint8Array(6),
    getTypedArrayInt16Array: GetValueFunc<collections.Int16Array> = () => new collections.Int16Array(6),
    getTypedArrayUint16Array: GetValueFunc<collections.Uint16Array> = () => new collections.Uint16Array(6),
    getTypedArrayInt32Array: GetValueFunc<collections.Int32Array> = () => new collections.Int32Array(6),
    getTypedArrayUint32Array: GetValueFunc<collections.Uint32Array> = () => new collections.Uint32Array(6),
    getTypedArrayUint8ClampedArray: GetValueFunc<collections.Uint8ClampedArray> = () => new collections.Uint8ClampedArray(6),
    getTypedArrayFloat32Array: GetValueFunc<collections.Float32Array> = () => new collections.Float32Array(6),
    getArrayBuffer: GetValueFunc<collections.ArrayBuffer> = () => new collections.ArrayBuffer(10),
    getConcatArray: GetValueFunc<collections.ConcatArray<number>> = () => new collections.Array<number>(1, 2, 4),
    getBitVector: GetValueFunc<collections.BitVector> = () => new collections.BitVector(2),
    getASON: GetValueFunc<ISendable> = () => ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable,
    getAsyncLock: GetValueFunc<ArkTSUtils.locks.AsyncLock> = () => ArkTSUtils.locks.AsyncLock.request("queryTestLock"),
    getSendableUnionArray: GetValueFunc<string | number | boolean | bigint> = () => 1
  ) {
    this.myString = getString();
    this.myNumber = getNumber();
    this.myBoolean = getBoolean();
    this.myBigInt = getBigInt();
    this.myUndefined = getUndefined();
    this.myNull = getNull();
    this.topLevelClassInstance = getTopLevelClassInstance();
    this.topLevelFunction = getTopLevelFunction();
    this.myEnum = getEnum();
    this.myArray = getArray();
    this.myMap = getMap();
    this.mySet = getSet();
    this.myTypedArrayInt8Array = getTypedArrayInt8Array();
    this.myTypedArrayUint8Array = getTypedArrayUint8Array();
    this.myTypedArrayInt16Array = getTypedArrayInt16Array();
    this.myTypedArrayUint16Array = getTypedArrayUint16Array();
    this.myTypedArrayInt32Array = getTypedArrayInt32Array();
    this.myTypedArrayUint32Array = getTypedArrayUint32Array();
    this.myTypedArrayUint8ClampedArray = getTypedArrayUint8ClampedArray();
    this.myTypedArrayFloat32Array = getTypedArrayFloat32Array();
    this.myArrayBuffer = getArrayBuffer();
    this.myConcatArray = getConcatArray();
    this.myBitVector = getBitVector();
    this.myASON = getASON();
    this.myAsyncLock = getAsyncLock();
    this.mySendableUnionArray = getSendableUnionArray();
  }
}

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