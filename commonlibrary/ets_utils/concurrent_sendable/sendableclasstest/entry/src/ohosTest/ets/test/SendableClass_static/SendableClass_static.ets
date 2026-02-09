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
export class SendableStaticClass implements ISendable {
  static myString: string = 'example string';
  static myNumber: number = 42;
  static myBoolean: boolean = true;
  static myBigInt: bigint = 1234567890123456789012345678901234567890n;
  static myUndefined: undefined | string | number | null = undefined;
  static myNull: undefined | string | number | null = null;
  static topLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  static topLevelFunction: SendableFuncType = TopLevelSendableFunction;
  static myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  static myArray: collections.Array<number> = new collections.Array<number>();
  static myMap: collections.Map<number, number> = new collections.Map<number, number>();
  static mySet: collections.Set<number> = new collections.Set<number>();
  static myTypedArrayInt8Array: collections.Int8Array = new collections.Int8Array(6);
  static myTypedArrayUint8Array: collections.Uint8Array = new collections.Uint8Array(6);
  static myTypedArrayInt16Array: collections.Int16Array = new collections.Int16Array(6);
  static myTypedArrayUint16Array: collections.Uint16Array = new collections.Uint16Array(6);
  static myTypedArrayInt32Array: collections.Int32Array = new collections.Int32Array(6);
  static myTypedArrayUint32Array: collections.Uint32Array = new collections.Uint32Array(6);
  static myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(6);
  static myTypedArrayFloat32Array: collections.Float32Array = new collections.Float32Array(6);
  static myArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  static myConcatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  static myBitVector: collections.BitVector = new collections.BitVector(2);
  static myASON: ISendable = ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  static myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  static mySendableUnionArray: string | number | boolean | bigint = 1;

  constructor() {
  }
}

@Sendable
export class SendableFuncStaticClass implements ISendable {
  static myString: string;
  static myNumber: number;
  static myBoolean: boolean;
  static myBigInt: bigint;
  static myUndefined: undefined | string | number | null;
  static myNull: undefined | string | number | null;
  static topLevelClassInstance: topLevelSendableClass;
  static topLevelFunction: SendableFuncType;
  static myEnum: SendableConstEnum;
  static myArray: collections.Array<number>;
  static myMap: collections.Map<number, number>;
  static mySet: collections.Set<number>;
  static myTypedArrayInt8Array: collections.Int8Array;
  static myTypedArrayUint8Array: collections.Uint8Array;
  static myTypedArrayInt16Array: collections.Int16Array;
  static myTypedArrayUint16Array: collections.Uint16Array;
  static myTypedArrayInt32Array: collections.Int32Array;
  static myTypedArrayUint32Array: collections.Uint32Array;
  static myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray;
  static myTypedArrayFloat32Array: collections.Float32Array;
  static myArrayBuffer: collections.ArrayBuffer;
  static myConcatArray: collections.ConcatArray<number>;
  static myBitVector: collections.BitVector;
  static myASON: ISendable;
  static myAsyncLock: ArkTSUtils.locks.AsyncLock;
  static mySendableUnionArray: string | number | boolean | bigint;

  constructor(func: <T>(arg: T) => T) {
    SendableFuncStaticClass.myString = func<string>('example string');
    SendableFuncStaticClass.myNumber = func<number>(42);
    SendableFuncStaticClass.myBoolean = func<boolean>(true);
    SendableFuncStaticClass.myBigInt = func<bigint>(1234567890123456789012345678901234567890n);
    SendableFuncStaticClass.myUndefined = func<undefined | string | number | null>(undefined);
    SendableFuncStaticClass.myNull = func<undefined | string | number | null>(null);
    SendableFuncStaticClass.topLevelClassInstance = func<topLevelSendableClass>(new topLevelSendableClass());
    SendableFuncStaticClass.topLevelFunction = func<SendableFuncType>(TopLevelSendableFunction);
    SendableFuncStaticClass.myEnum = func<SendableConstEnum>(SendableConstEnum.OPTION_1);
    SendableFuncStaticClass.myArray = func<collections.Array<number>>(new collections.Array<number>());
    SendableFuncStaticClass.myMap = func<collections.Map<number, number>>(new collections.Map<number, number>());
    SendableFuncStaticClass.mySet = func<collections.Set<number>>(new collections.Set<number>());
    SendableFuncStaticClass.myTypedArrayInt8Array = func<collections.Int8Array>(new collections.Int8Array(6));
    SendableFuncStaticClass.myTypedArrayUint8Array = func<collections.Uint8Array>(new collections.Uint8Array(6));
    SendableFuncStaticClass.myTypedArrayInt16Array = func<collections.Int16Array>(new collections.Int16Array(6));
    SendableFuncStaticClass.myTypedArrayUint16Array =
      func<collections.Uint16Array>(new collections.Uint16Array(6));
    SendableFuncStaticClass.myTypedArrayInt32Array = func<collections.Int32Array>(new collections.Int32Array(6));
    SendableFuncStaticClass.myTypedArrayUint32Array =
      func<collections.Uint32Array>(new collections.Uint32Array(6));
    SendableFuncStaticClass.myTypedArrayUint8ClampedArray =
      func<collections.Uint8ClampedArray>(new collections.Uint8ClampedArray(6));
    SendableFuncStaticClass.myTypedArrayFloat32Array =
      func<collections.Float32Array>(new collections.Float32Array(6));
    SendableFuncStaticClass.myArrayBuffer = func<collections.ArrayBuffer>(new collections.ArrayBuffer(10));
    SendableFuncStaticClass.myConcatArray =
      func<collections.ConcatArray<number>>(new collections.Array<number>(1, 2, 4));
    SendableFuncStaticClass.myBitVector = func<collections.BitVector>(new collections.BitVector(2));
    SendableFuncStaticClass.myASON =
      func<ISendable>(ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
    SendableFuncStaticClass.myAsyncLock =
      func<ArkTSUtils.locks.AsyncLock>(ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
    SendableFuncStaticClass.mySendableUnionArray = func<string | number | boolean | bigint>(1);
  }
}

@Sendable
export class SendableArrowStaticClass implements ISendable {
  static myString: string;
  static myNumber: number;
  static myBoolean: boolean;
  static myBigInt: bigint;
  static myUndefined: undefined | string | number | null;
  static myNull: undefined | string | number | null;
  static topLevelClassInstance: topLevelSendableClass;
  static topLevelFunction: SendableFuncType;
  static myEnum: SendableConstEnum;
  static myArray: collections.Array<number>;
  static myMap: collections.Map<number, number>;
  static mySet: collections.Set<number>;
  static myTypedArrayInt8Array: collections.Int8Array;
  static myTypedArrayUint8Array: collections.Uint8Array;
  static myTypedArrayInt16Array: collections.Int16Array;
  static myTypedArrayUint16Array: collections.Uint16Array;
  static myTypedArrayInt32Array: collections.Int32Array;
  static myTypedArrayUint32Array: collections.Uint32Array;
  static myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray;
  static myTypedArrayFloat32Array: collections.Float32Array;
  static myArrayBuffer: collections.ArrayBuffer;
  static myConcatArray: collections.ConcatArray<number>;
  static myBitVector: collections.BitVector;
  static myASON: ISendable;
  static myAsyncLock: ArkTSUtils.locks.AsyncLock;
  static mySendableUnionArray: string | number | boolean | bigint;

  constructor(func: <T>(arg: () => T) => T) {
    SendableArrowStaticClass.myString = func<string>(() => new String('example string').valueOf());
    SendableArrowStaticClass.myNumber = func<number>(() => new Number(42).valueOf());
    SendableArrowStaticClass.myBoolean = func<boolean>(() => new Boolean(true).valueOf());
    SendableArrowStaticClass.myBigInt = func<bigint>(() => BigInt(1234567890123456789012345678901234567890n));
    SendableArrowStaticClass.myUndefined = func<undefined | string | number | null>(() => undefined);
    SendableArrowStaticClass.myNull = func<undefined | string | number | null>(() => null);
    SendableArrowStaticClass.topLevelClassInstance =
      func<topLevelSendableClass>(() => new topLevelSendableClass());
    SendableArrowStaticClass.topLevelFunction = func<SendableFuncType>(() => TopLevelSendableFunction);
    SendableArrowStaticClass.myEnum = func<SendableConstEnum>(() => SendableConstEnum.OPTION_1);
    SendableArrowStaticClass.myArray = func<collections.Array<number>>(() => new collections.Array<number>());
    SendableArrowStaticClass.myMap =
      func<collections.Map<number, number>>(() => new collections.Map<number, number>());
    SendableArrowStaticClass.mySet = func<collections.Set<number>>(() => new collections.Set<number>());
    SendableArrowStaticClass.myTypedArrayInt8Array =
      func<collections.Int8Array>(() => new collections.Int8Array(6));
    SendableArrowStaticClass.myTypedArrayUint8Array =
      func<collections.Uint8Array>(() => new collections.Uint8Array(6));
    SendableArrowStaticClass.myTypedArrayInt16Array =
      func<collections.Int16Array>(() => new collections.Int16Array(6));
    SendableArrowStaticClass.myTypedArrayUint16Array =
      func<collections.Uint16Array>(() => new collections.Uint16Array(6));
    SendableArrowStaticClass.myTypedArrayInt32Array =
      func<collections.Int32Array>(() => new collections.Int32Array(6));
    SendableArrowStaticClass.myTypedArrayUint32Array =
      func<collections.Uint32Array>(() => new collections.Uint32Array(6));
    SendableArrowStaticClass.myTypedArrayUint8ClampedArray =
      func<collections.Uint8ClampedArray>(() => new collections.Uint8ClampedArray(6));
    SendableArrowStaticClass.myTypedArrayFloat32Array =
      func<collections.Float32Array>(() => new collections.Float32Array(6));
    SendableArrowStaticClass.myArrayBuffer =
      func<collections.ArrayBuffer>(() => new collections.ArrayBuffer(10));
    SendableArrowStaticClass.myConcatArray =
      func<collections.ConcatArray<number>>(() => new collections.Array<number>(1, 2, 4));
    SendableArrowStaticClass.myBitVector = func<collections.BitVector>(() => new collections.BitVector(2));
    SendableArrowStaticClass.myASON =
      func<ISendable>(() => ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
    SendableArrowStaticClass.myAsyncLock =
      func<ArkTSUtils.locks.AsyncLock>(() => ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
    SendableArrowStaticClass.mySendableUnionArray = func<string | number | boolean | bigint>(() => 1);
  }
}

@Sendable
export class SendableArrowOutStaticClass implements ISendable {
  static myString: string;
  static myNumber: number;
  static myBoolean: boolean;
  static myBigInt: bigint;
  static myUndefined: undefined | string | number | null;
  static myNull: undefined | string | number | null;
  static topLevelClassInstance: topLevelSendableClass;
  static topLevelFunction: SendableFuncType;
  static myEnum: SendableConstEnum;
  static myArray: collections.Array<number>;
  static myMap: collections.Map<number, number>;
  static mySet: collections.Set<number>;
  static myTypedArrayInt8Array: collections.Int8Array;
  static myTypedArrayUint8Array: collections.Uint8Array;
  static myTypedArrayInt16Array: collections.Int16Array;
  static myTypedArrayUint16Array: collections.Uint16Array;
  static myTypedArrayInt32Array: collections.Int32Array;
  static myTypedArrayUint32Array: collections.Uint32Array;
  static myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray;
  static myTypedArrayFloat32Array: collections.Float32Array;
  static myArrayBuffer: collections.ArrayBuffer;
  static myConcatArray: collections.ConcatArray<number>;
  static myBitVector: collections.BitVector;
  static myASON: ISendable;
  static myAsyncLock: ArkTSUtils.locks.AsyncLock;
  static mySendableUnionArray: string | number | boolean | bigint;

  constructor(func: <T>(arg: () => T) => T) {
    SendableArrowOutStaticClass.myString = func(() => new String('example string').valueOf());
    SendableArrowOutStaticClass.myNumber = func(() => new Number(42).valueOf());
    SendableArrowOutStaticClass.myBoolean = func(() => new Boolean(true).valueOf());
    SendableArrowOutStaticClass.myBigInt = func(() => BigInt(1234567890123456789012345678901234567890n));
    SendableArrowOutStaticClass.myUndefined = func(() => undefined);
    SendableArrowOutStaticClass.myNull = func(() => null);
    SendableArrowOutStaticClass.topLevelClassInstance = func(() => new topLevelSendableClass());
    SendableArrowOutStaticClass.topLevelFunction = func(() => TopLevelSendableFunction);
    SendableArrowOutStaticClass.myEnum = func(() => SendableConstEnum.OPTION_1);
    SendableArrowOutStaticClass.myArray = func(() => new collections.Array<number>());
    SendableArrowOutStaticClass.myMap = func(() => new collections.Map<number, number>());
    SendableArrowOutStaticClass.mySet = func(() => new collections.Set<number>());
    SendableArrowOutStaticClass.myTypedArrayInt8Array = func(() => new collections.Int8Array(6));
    SendableArrowOutStaticClass.myTypedArrayUint8Array = func(() => new collections.Uint8Array(6));
    SendableArrowOutStaticClass.myTypedArrayInt16Array = func(() => new collections.Int16Array(6));
    SendableArrowOutStaticClass.myTypedArrayUint16Array = func(() => new collections.Uint16Array(6));
    SendableArrowOutStaticClass.myTypedArrayInt32Array = func(() => new collections.Int32Array(6));
    SendableArrowOutStaticClass.myTypedArrayUint32Array = func(() => new collections.Uint32Array(6));
    SendableArrowOutStaticClass.myTypedArrayUint8ClampedArray = func(() => new collections.Uint8ClampedArray(6));
    SendableArrowOutStaticClass.myTypedArrayFloat32Array = func(() => new collections.Float32Array(6));
    SendableArrowOutStaticClass.myArrayBuffer = func(() => new collections.ArrayBuffer(10));
    SendableArrowOutStaticClass.myConcatArray = func(() => new collections.Array<number>(1, 2, 4));
    SendableArrowOutStaticClass.myBitVector = func(() => new collections.BitVector(2));
    SendableArrowOutStaticClass.myASON =
      func(() => ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
    SendableArrowOutStaticClass.myAsyncLock = func(() => ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
    SendableArrowOutStaticClass.mySendableUnionArray = func(() => 1);
  }
}

@Sendable
export class SendableFuncInStaticClass implements ISendable {
  static myString: string;
  static myNumber: number;
  static myBoolean: boolean;
  static myBigInt: bigint;
  static myUndefined: undefined | string | number | null;
  static myNull: undefined | string | number | null;
  static topLevelClassInstance: topLevelSendableClass;
  static topLevelFunction: SendableFuncType;
  static myEnum: SendableConstEnum;
  static myArray: collections.Array<number>;
  static myMap: collections.Map<number, number>;
  static mySet: collections.Set<number>;
  static myTypedArrayInt8Array: collections.Int8Array;
  static myTypedArrayUint8Array: collections.Uint8Array;
  static myTypedArrayInt16Array: collections.Int16Array;
  static myTypedArrayUint16Array: collections.Uint16Array;
  static myTypedArrayInt32Array: collections.Int32Array;
  static myTypedArrayUint32Array: collections.Uint32Array;
  static myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray;
  static myTypedArrayFloat32Array: collections.Float32Array;
  static myArrayBuffer: collections.ArrayBuffer;
  static myConcatArray: collections.ConcatArray<number>;
  static myBitVector: collections.BitVector;
  static myASON: ISendable;
  static myAsyncLock: ArkTSUtils.locks.AsyncLock;
  static mySendableUnionArray: string | number | boolean | bigint;

  constructor() {
    SendableFuncInStaticClass.myString = this.setProperty(() => 'example string');
    SendableFuncInStaticClass.myNumber = this.setProperty(() => 42);
    SendableFuncInStaticClass.myBoolean = this.setProperty(() => true);
    SendableFuncInStaticClass.myBigInt = this.setProperty(() => 1234567890123456789012345678901234567890n);
    SendableFuncInStaticClass.myUndefined = this.setProperty(() => undefined);
    SendableFuncInStaticClass.myNull = this.setProperty(() => null);
    SendableFuncInStaticClass.topLevelClassInstance = this.setProperty(() => new topLevelSendableClass());
    SendableFuncInStaticClass.topLevelFunction = this.setProperty(() => TopLevelSendableFunction);
    SendableFuncInStaticClass.myEnum = this.setProperty(() => SendableConstEnum.OPTION_1);
    SendableFuncInStaticClass.myArray = this.setProperty(() => new collections.Array<number>());
    SendableFuncInStaticClass.myMap = this.setProperty(() => new collections.Map<number, number>());
    SendableFuncInStaticClass.mySet = this.setProperty(() => new collections.Set<number>());
    SendableFuncInStaticClass.myTypedArrayInt8Array = this.setProperty(() => new collections.Int8Array(6));
    SendableFuncInStaticClass.myTypedArrayUint8Array = this.setProperty(() => new collections.Uint8Array(6));
    SendableFuncInStaticClass.myTypedArrayInt16Array = this.setProperty(() => new collections.Int16Array(6));
    SendableFuncInStaticClass.myTypedArrayUint16Array = this.setProperty(() => new collections.Uint16Array(6));
    SendableFuncInStaticClass.myTypedArrayInt32Array = this.setProperty(() => new collections.Int32Array(6));
    SendableFuncInStaticClass.myTypedArrayUint32Array = this.setProperty(() => new collections.Uint32Array(6));
    SendableFuncInStaticClass.myTypedArrayUint8ClampedArray =
      this.setProperty(() => new collections.Uint8ClampedArray(6));
    SendableFuncInStaticClass.myTypedArrayFloat32Array = this.setProperty(() => new collections.Float32Array(6));
    SendableFuncInStaticClass.myArrayBuffer = this.setProperty(() => new collections.ArrayBuffer(10));
    SendableFuncInStaticClass.myConcatArray = this.setProperty(() => new collections.Array<number>(1, 2, 4));
    SendableFuncInStaticClass.myBitVector = this.setProperty(() => new collections.BitVector(2));
    SendableFuncInStaticClass.myASON =
      this.setProperty(() => ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
    SendableFuncInStaticClass.myAsyncLock =
      this.setProperty(() => ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
    SendableFuncInStaticClass.mySendableUnionArray = this.setProperty(() => 1);
  }

  setProperty<T>(func: () => T): T {
    return func();
  }
}

@Sendable
export class SendableNonParameterFuncStaticClass implements ISendable {
  static myString: string = SendableNonParameterFuncStaticClass.getMyString();
  static myNumber: number = SendableNonParameterFuncStaticClass.getMyNumber();
  static myBoolean: boolean = SendableNonParameterFuncStaticClass.getMyBoolean();
  static myBigInt: bigint = SendableNonParameterFuncStaticClass.getMyBigInt();
  static myUndefined: undefined | string | number | null = SendableNonParameterFuncStaticClass.getMyUndefined();
  static myNull: undefined | string | number | null = SendableNonParameterFuncStaticClass.getMyNull();
  static topLevelClassInstance: topLevelSendableClass =
    SendableNonParameterFuncStaticClass.getTopLevelClassInstance();
  static topLevelFunction: SendableFuncType = SendableNonParameterFuncStaticClass.getTopLevelFunction();
  static myEnum: SendableConstEnum = SendableNonParameterFuncStaticClass.getMyEnum();
  static myArray: collections.Array<number> = SendableNonParameterFuncStaticClass.getMyArray();
  static myMap: collections.Map<number, number> = SendableNonParameterFuncStaticClass.getMyMap();
  static mySet: collections.Set<number> = SendableNonParameterFuncStaticClass.getMySet();
  static myTypedArrayInt8Array: collections.Int8Array =
    SendableNonParameterFuncStaticClass.getMyTypedArrayInt8Array();
  static myTypedArrayUint8Array: collections.Uint8Array =
    SendableNonParameterFuncStaticClass.getMyTypedArrayUint8Array();
  static myTypedArrayInt16Array: collections.Int16Array =
    SendableNonParameterFuncStaticClass.getMyTypedArrayInt16Array();
  static myTypedArrayUint16Array: collections.Uint16Array =
    SendableNonParameterFuncStaticClass.getMyTypedArrayUint16Array();
  static myTypedArrayInt32Array: collections.Int32Array =
    SendableNonParameterFuncStaticClass.getMyTypedArrayInt32Array();
  static myTypedArrayUint32Array: collections.Uint32Array =
    SendableNonParameterFuncStaticClass.getMyTypedArrayUint32Array();
  static myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray =
    SendableNonParameterFuncStaticClass.getMyTypedArrayUint8ClampedArray();
  static myTypedArrayFloat32Array: collections.Float32Array =
    SendableNonParameterFuncStaticClass.getMyTypedArrayFloat32Array();
  static myArrayBuffer: collections.ArrayBuffer = SendableNonParameterFuncStaticClass.getMyArrayBuffer();
  static myConcatArray: collections.ConcatArray<number> = SendableNonParameterFuncStaticClass.getMyConcatArray();
  static myBitVector: collections.BitVector = SendableNonParameterFuncStaticClass.getMyBitVector();
  static myASON: ISendable = SendableNonParameterFuncStaticClass.getMyASON();
  static myAsyncLock: ArkTSUtils.locks.AsyncLock = SendableNonParameterFuncStaticClass.getMyAsyncLock();
  static mySendableUnionArray: string | number | boolean | bigint =
    SendableNonParameterFuncStaticClass.getMySendableUnionArray();

  constructor() {
  }

  private static getMyString(): string {
    return 'example string';
  }

  private static getMyNumber(): number {
    return 42;
  }

  private static getMyBoolean(): boolean {
    return true;
  }

  private static getMyBigInt(): bigint {
    return 1234567890123456789012345678901234567890n;
  }

  private static getMyUndefined(): undefined | string | number | null {
    return undefined;
  }

  private static getMyNull(): undefined | string | number | null {
    return null;
  }

  private static getTopLevelClassInstance(): topLevelSendableClass {
    return new topLevelSendableClass();
  }

  private static getTopLevelFunction(): SendableFuncType {
    return TopLevelSendableFunction;
  }

  private static getMyEnum(): SendableConstEnum {
    return SendableConstEnum.OPTION_1;
  }

  private static getMyArray(): collections.Array<number> {
    return new collections.Array<number>();
  }

  private static getMyMap(): collections.Map<number, number> {
    return new collections.Map<number, number>();
  }

  private static getMySet(): collections.Set<number> {
    return new collections.Set<number>();
  }

  private static getMyTypedArrayInt8Array(): collections.Int8Array {
    return new collections.Int8Array(6);
  }

  private static getMyTypedArrayUint8Array(): collections.Uint8Array {
    return new collections.Uint8Array(6);
  }

  private static getMyTypedArrayInt16Array(): collections.Int16Array {
    return new collections.Int16Array(6);
  }

  private static getMyTypedArrayUint16Array(): collections.Uint16Array {
    return new collections.Uint16Array(6);
  }

  private static getMyTypedArrayInt32Array(): collections.Int32Array {
    return new collections.Int32Array(6);
  }

  private static getMyTypedArrayUint32Array(): collections.Uint32Array {
    return new collections.Uint32Array(6);
  }

  private static getMyTypedArrayUint8ClampedArray(): collections.Uint8ClampedArray {
    return new collections.Uint8ClampedArray(6);
  }

  private static getMyTypedArrayFloat32Array(): collections.Float32Array {
    return new collections.Float32Array(6);
  }

  private static getMyArrayBuffer(): collections.ArrayBuffer {
    return new collections.ArrayBuffer(10);
  }

  private static getMyConcatArray(): collections.ConcatArray<number> {
    return new collections.Array<number>(1, 2, 4);
  }

  private static getMyBitVector(): collections.BitVector {
    return new collections.BitVector(2);
  }

  private static getMyASON(): ISendable {
    return ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  }

  private static getMyAsyncLock(): ArkTSUtils.locks.AsyncLock {
    return ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  }

  private static getMySendableUnionArray(): string | number | boolean | bigint {
    return 1;
  }
}

@Sendable
export class SendableOutArrowStaticClass implements ISendable {
  static myString: string;
  static myNumber: number;
  static myBoolean: boolean;
  static myBigInt: bigint;
  static myUndefined: undefined | string | number | null;
  static myNull: undefined | string | number | null;
  static topLevelClassInstance: topLevelSendableClass;
  static topLevelFunction: SendableFuncType;
  static myEnum: SendableConstEnum;
  static myArray: collections.Array<number>;
  static myMap: collections.Map<number, number>;
  static mySet: collections.Set<number>;
  static myTypedArrayInt8Array: collections.Int8Array;
  static myTypedArrayUint8Array: collections.Uint8Array;
  static myTypedArrayInt16Array: collections.Int16Array;
  static myTypedArrayUint16Array: collections.Uint16Array;
  static myTypedArrayInt32Array: collections.Int32Array;
  static myTypedArrayUint32Array: collections.Uint32Array;
  static myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray;
  static myTypedArrayFloat32Array: collections.Float32Array;
  static myArrayBuffer: collections.ArrayBuffer;
  static myConcatArray: collections.ConcatArray<number>;
  static myBitVector: collections.BitVector;
  static myASON: ISendable;
  static myAsyncLock: ArkTSUtils.locks.AsyncLock;
  static mySendableUnionArray: string | number | boolean | bigint;

  constructor() {
    const func = <T>(arg: T) => arg;

    SendableOutArrowStaticClass.myString = func<string>('example string');
    SendableOutArrowStaticClass.myNumber = func<number>(42);
    SendableOutArrowStaticClass.myBoolean = func<boolean>(true);
    SendableOutArrowStaticClass.myBigInt = func<bigint>(1234567890123456789012345678901234567890n);
    SendableOutArrowStaticClass.myUndefined = func<undefined | string | number | null>(undefined);
    SendableOutArrowStaticClass.myNull = func<undefined | string | number | null>(null);
    SendableOutArrowStaticClass.topLevelClassInstance = func<topLevelSendableClass>(new topLevelSendableClass());
    SendableOutArrowStaticClass.topLevelFunction = func<SendableFuncType>(TopLevelSendableFunction);
    SendableOutArrowStaticClass.myEnum = func<SendableConstEnum>(SendableConstEnum.OPTION_1);
    SendableOutArrowStaticClass.myArray = func<collections.Array<number>>(new collections.Array<number>());
    SendableOutArrowStaticClass.myMap =
      func<collections.Map<number, number>>(new collections.Map<number, number>());
    SendableOutArrowStaticClass.mySet = func<collections.Set<number>>(new collections.Set<number>());
    SendableOutArrowStaticClass.myTypedArrayInt8Array =
      func<collections.Int8Array>(new collections.Int8Array(6));
    SendableOutArrowStaticClass.myTypedArrayUint8Array =
      func<collections.Uint8Array>(new collections.Uint8Array(6));
    SendableOutArrowStaticClass.myTypedArrayInt16Array =
      func<collections.Int16Array>(new collections.Int16Array(6));
    SendableOutArrowStaticClass.myTypedArrayUint16Array =
      func<collections.Uint16Array>(new collections.Uint16Array(6));
    SendableOutArrowStaticClass.myTypedArrayInt32Array =
      func<collections.Int32Array>(new collections.Int32Array(6));
    SendableOutArrowStaticClass.myTypedArrayUint32Array =
      func<collections.Uint32Array>(new collections.Uint32Array(6));
    SendableOutArrowStaticClass.myTypedArrayUint8ClampedArray =
      func<collections.Uint8ClampedArray>(new collections.Uint8ClampedArray(6));
    SendableOutArrowStaticClass.myTypedArrayFloat32Array =
      func<collections.Float32Array>(new collections.Float32Array(6));
    SendableOutArrowStaticClass.myArrayBuffer = func<collections.ArrayBuffer>(new collections.ArrayBuffer(10));
    SendableOutArrowStaticClass.myConcatArray =
      func<collections.ConcatArray<number>>(new collections.Array<number>(1, 2, 4));
    SendableOutArrowStaticClass.myBitVector = func<collections.BitVector>(new collections.BitVector(2));
    SendableOutArrowStaticClass.myASON =
      func<ISendable>(ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
    SendableOutArrowStaticClass.myAsyncLock =
      func<ArkTSUtils.locks.AsyncLock>(ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
    SendableOutArrowStaticClass.mySendableUnionArray = func<string | number | boolean | bigint>(1);
  }
}

@Sendable
export class SendableNonFuncStaticClass implements ISendable {
  static myString: string = 'example string';
  static myNumber: number = 42;
  static myBoolean: boolean = true;
  static myBigInt: bigint = 1234567890123456789012345678901234567890n;
  static myUndefined: undefined | string | number | null = undefined;
  static myNull: undefined | string | number | null = null;
  static topLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  static topLevelFunction: SendableFuncType = TopLevelSendableFunction;
  static myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  static myArray: collections.Array<number> = new collections.Array<number>();
  static myMap: collections.Map<number, number> = new collections.Map<number, number>();
  static mySet: collections.Set<number> = new collections.Set<number>();
  static myTypedArrayInt8Array: collections.Int8Array = new collections.Int8Array(6);
  static myTypedArrayUint8Array: collections.Uint8Array = new collections.Uint8Array(6);
  static myTypedArrayInt16Array: collections.Int16Array = new collections.Int16Array(6);
  static myTypedArrayUint16Array: collections.Uint16Array = new collections.Uint16Array(6);
  static myTypedArrayInt32Array: collections.Int32Array = new collections.Int32Array(6);
  static myTypedArrayUint32Array: collections.Uint32Array = new collections.Uint32Array(6);
  static myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(6);
  static myTypedArrayFloat32Array: collections.Float32Array = new collections.Float32Array(6);
  static myArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  static myConcatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  static myBitVector: collections.BitVector = new collections.BitVector(2);
  static myASON: ISendable = ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  static myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  static mySendableUnionArray: string | number | boolean | bigint = 1;
}

@Sendable
export class SendableParameterFuncStaticClass implements ISendable {
  static myString: string;
  static myNumber: number;
  static myBoolean: boolean;
  static myBigInt: bigint;
  static myUndefined: undefined | string | number | null;
  static myNull: undefined | string | number | null;
  static topLevelClassInstance: topLevelSendableClass;
  static topLevelFunction: SendableFuncType;
  static myEnum: SendableConstEnum;
  static myArray: collections.Array<number>;
  static myMap: collections.Map<number, number>;
  static mySet: collections.Set<number>;
  static myTypedArrayInt8Array: collections.Int8Array;
  static myTypedArrayUint8Array: collections.Uint8Array;
  static myTypedArrayInt16Array: collections.Int16Array;
  static myTypedArrayUint16Array: collections.Uint16Array;
  static myTypedArrayInt32Array: collections.Int32Array;
  static myTypedArrayUint32Array: collections.Uint32Array;
  static myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray;
  static myTypedArrayFloat32Array: collections.Float32Array;
  static myArrayBuffer: collections.ArrayBuffer;
  static myConcatArray: collections.ConcatArray<number>;
  static myBitVector: collections.BitVector;
  static myASON: ISendable;
  static myAsyncLock: ArkTSUtils.locks.AsyncLock;
  static mySendableUnionArray: string | number | boolean | bigint;

  constructor() {
    const func = <T>(initializer: () => T): T => initializer();

    SendableParameterFuncStaticClass.myString = func(() => 'example string');
    SendableParameterFuncStaticClass.myNumber = func(() => 42);
    SendableParameterFuncStaticClass.myBoolean = func(() => true);
    SendableParameterFuncStaticClass.myBigInt = func(() => 1234567890123456789012345678901234567890n);
    SendableParameterFuncStaticClass.myUndefined = func(() => undefined);
    SendableParameterFuncStaticClass.myNull = func(() => null);
    SendableParameterFuncStaticClass.topLevelClassInstance = func(() => new topLevelSendableClass());
    SendableParameterFuncStaticClass.topLevelFunction = func(() => TopLevelSendableFunction);
    SendableParameterFuncStaticClass.myEnum = func(() => SendableConstEnum.OPTION_1);
    SendableParameterFuncStaticClass.myArray = func(() => new collections.Array<number>());
    SendableParameterFuncStaticClass.myMap = func(() => new collections.Map<number, number>());
    SendableParameterFuncStaticClass.mySet = func(() => new collections.Set<number>());
    SendableParameterFuncStaticClass.myTypedArrayInt8Array = func(() => new collections.Int8Array(6));
    SendableParameterFuncStaticClass.myTypedArrayUint8Array = func(() => new collections.Uint8Array(6));
    SendableParameterFuncStaticClass.myTypedArrayInt16Array = func(() => new collections.Int16Array(6));
    SendableParameterFuncStaticClass.myTypedArrayUint16Array = func(() => new collections.Uint16Array(6));
    SendableParameterFuncStaticClass.myTypedArrayInt32Array = func(() => new collections.Int32Array(6));
    SendableParameterFuncStaticClass.myTypedArrayUint32Array = func(() => new collections.Uint32Array(6));
    SendableParameterFuncStaticClass.myTypedArrayUint8ClampedArray =
      func(() => new collections.Uint8ClampedArray(6));
    SendableParameterFuncStaticClass.myTypedArrayFloat32Array = func(() => new collections.Float32Array(6));
    SendableParameterFuncStaticClass.myArrayBuffer = func(() => new collections.ArrayBuffer(10));
    SendableParameterFuncStaticClass.myConcatArray = func(() => new collections.Array<number>(1, 2, 4));
    SendableParameterFuncStaticClass.myBitVector = func(() => new collections.BitVector(2));
    SendableParameterFuncStaticClass.myASON =
      func(() => ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
    SendableParameterFuncStaticClass.myAsyncLock =
      func(() => ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
    SendableParameterFuncStaticClass.mySendableUnionArray = func(() => 1);
  }
}

@Sendable
export class SendableArrowNewStaticClass implements ISendable {
  static myString: string = ((value: string) => value)('example string');
  static myNumber: number = ((value: number) => value)(42);
  static myBoolean: boolean = ((value: boolean) => value)(true);
  static myBigInt: bigint = ((value: bigint) => value)(1234567890123456789012345678901234567890n);
  static myUndefined: undefined | string | number | null = ((value: undefined) => value)(undefined);
  static myNull: undefined | string | number | null = ((value: null) => value)(null);
  static topLevelClassInstance: topLevelSendableClass =
    ((value: topLevelSendableClass) => value)(new topLevelSendableClass());
  static topLevelFunction: SendableFuncType = ((value: SendableFuncType) => value)(TopLevelSendableFunction);
  static myEnum: SendableConstEnum = ((value: SendableConstEnum) => value)(SendableConstEnum.OPTION_1);
  static myArray: collections.Array<number> =
    ((value: collections.Array<number>) => value)(new collections.Array<number>());
  static myMap: collections.Map<number, number> =
    ((value: collections.Map<number, number>) => value)(new collections.Map<number, number>());
  static mySet: collections.Set<number> = ((value: collections.Set<number>) => value)(new collections.Set<number>());
  static myTypedArrayInt8Array: collections.Int8Array =
    ((value: collections.Int8Array) => value)(new collections.Int8Array(6));
  static myTypedArrayUint8Array: collections.Uint8Array =
    ((value: collections.Uint8Array) => value)(new collections.Uint8Array(6));
  static myTypedArrayInt16Array: collections.Int16Array =
    ((value: collections.Int16Array) => value)(new collections.Int16Array(6));
  static myTypedArrayUint16Array: collections.Uint16Array =
    ((value: collections.Uint16Array) => value)(new collections.Uint16Array(6));
  static myTypedArrayInt32Array: collections.Int32Array =
    ((value: collections.Int32Array) => value)(new collections.Int32Array(6));
  static myTypedArrayUint32Array: collections.Uint32Array =
    ((value: collections.Uint32Array) => value)(new collections.Uint32Array(6));
  static myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray =
    ((value: collections.Uint8ClampedArray) => value)(new collections.Uint8ClampedArray(6));
  static myTypedArrayFloat32Array: collections.Float32Array =
    ((value: collections.Float32Array) => value)(new collections.Float32Array(6));
  static myArrayBuffer: collections.ArrayBuffer =
    ((value: collections.ArrayBuffer) => value)(new collections.ArrayBuffer(10));
  static myConcatArray: collections.ConcatArray<number> =
    ((value: collections.ConcatArray<number>) => value)(new collections.Array<number>(1, 2, 4));
  static myBitVector: collections.BitVector = ((value: collections.BitVector) => value)(new collections.BitVector(2));
  static myASON: ISendable =
    ((value: ISendable) => value)(ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
  static myAsyncLock: ArkTSUtils.locks.AsyncLock =
    ((value: ArkTSUtils.locks.AsyncLock) => value)(ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
  static mySendableUnionArray: string | number | boolean | bigint = ((value: number) => value)(1);

  constructor() {
  }
}

@Sendable
export class SendableExpressionArrowOutStaticClass implements ISendable {
  static myString: string = (() => 'example string')();
  static myNumber: number = (() => 42)();
  static myBoolean: boolean = (() => true)();
  static myBigInt: bigint = (() => 1234567890123456789012345678901234567890n)();
  static myUndefined: undefined | string | number | null = (() => undefined)();
  static myNull: undefined | string | number | null = (() => null)();
  static topLevelClassInstance: topLevelSendableClass = (() => new topLevelSendableClass())();
  static topLevelFunction: SendableFuncType = (() => TopLevelSendableFunction)();
  static myEnum: SendableConstEnum = (() => SendableConstEnum.OPTION_1)();
  static myArray: collections.Array<number> = (() => new collections.Array<number>())();
  static myMap: collections.Map<number, number> = (() => new collections.Map<number, number>())();
  static mySet: collections.Set<number> = (() => new collections.Set<number>())();
  static myTypedArrayInt8Array: collections.Int8Array = (() => new collections.Int8Array(6))();
  static myTypedArrayUint8Array: collections.Uint8Array = (() => new collections.Uint8Array(6))();
  static myTypedArrayInt16Array: collections.Int16Array = (() => new collections.Int16Array(6))();
  static myTypedArrayUint16Array: collections.Uint16Array = (() => new collections.Uint16Array(6))();
  static myTypedArrayInt32Array: collections.Int32Array = (() => new collections.Int32Array(6))();
  static myTypedArrayUint32Array: collections.Uint32Array = (() => new collections.Uint32Array(6))();
  static myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = (() => new collections.Uint8ClampedArray(6))();
  static myTypedArrayFloat32Array: collections.Float32Array = (() => new collections.Float32Array(6))();
  static myArrayBuffer: collections.ArrayBuffer = (() => new collections.ArrayBuffer(10))();
  static myConcatArray: collections.ConcatArray<number> = (() => new collections.Array<number>(1, 2, 4))();
  static myBitVector: collections.BitVector = (() => new collections.BitVector(2))();
  static myASON: ISendable =
    (() => ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable)();
  static myAsyncLock: ArkTSUtils.locks.AsyncLock = (() => ArkTSUtils.locks.AsyncLock.request("queryTestLock"))();
  static mySendableUnionArray: string | number | boolean | bigint = (() => 1)();

  constructor() {
  }
}

type GetValueFunc<T> = () => T;

@Sendable
export class SendableExpressionOutStaticClass implements ISendable {
  static myString: string;
  static myNumber: number;
  static myBoolean: boolean;
  static myBigInt: bigint;
  static myUndefined: undefined | string | number | null;
  static myNull: undefined | string | number | null;
  static topLevelClassInstance: topLevelSendableClass;
  static topLevelFunction: SendableFuncType;
  static myEnum: SendableConstEnum;
  static myArray: collections.Array<number>;
  static myMap: collections.Map<number, number>;
  static mySet: collections.Set<number>;
  static myTypedArrayInt8Array: collections.Int8Array;
  static myTypedArrayUint8Array: collections.Uint8Array;
  static myTypedArrayInt16Array: collections.Int16Array;
  static myTypedArrayUint16Array: collections.Uint16Array;
  static myTypedArrayInt32Array: collections.Int32Array;
  static myTypedArrayUint32Array: collections.Uint32Array;
  static myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray;
  static myTypedArrayFloat32Array: collections.Float32Array;
  static myArrayBuffer: collections.ArrayBuffer;
  static myConcatArray: collections.ConcatArray<number>;
  static myBitVector: collections.BitVector;
  static myASON: ISendable;
  static myAsyncLock: ArkTSUtils.locks.AsyncLock;
  static mySendableUnionArray: string | number | boolean | bigint;

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
    SendableExpressionOutStaticClass.myString = getString();
    SendableExpressionOutStaticClass.myNumber = getNumber();
    SendableExpressionOutStaticClass.myBoolean = getBoolean();
    SendableExpressionOutStaticClass.myBigInt = getBigInt();
    SendableExpressionOutStaticClass.myUndefined = getUndefined();
    SendableExpressionOutStaticClass.myNull = getNull();
    SendableExpressionOutStaticClass.topLevelClassInstance = getTopLevelClassInstance();
    SendableExpressionOutStaticClass.topLevelFunction = getTopLevelFunction();
    SendableExpressionOutStaticClass.myEnum = getEnum();
    SendableExpressionOutStaticClass.myArray = getArray();
    SendableExpressionOutStaticClass.myMap = getMap();
    SendableExpressionOutStaticClass.mySet = getSet();
    SendableExpressionOutStaticClass.myTypedArrayInt8Array = getTypedArrayInt8Array();
    SendableExpressionOutStaticClass.myTypedArrayUint8Array = getTypedArrayUint8Array();
    SendableExpressionOutStaticClass.myTypedArrayInt16Array = getTypedArrayInt16Array();
    SendableExpressionOutStaticClass.myTypedArrayUint16Array = getTypedArrayUint16Array();
    SendableExpressionOutStaticClass.myTypedArrayInt32Array = getTypedArrayInt32Array();
    SendableExpressionOutStaticClass.myTypedArrayUint32Array = getTypedArrayUint32Array();
    SendableExpressionOutStaticClass.myTypedArrayUint8ClampedArray = getTypedArrayUint8ClampedArray();
    SendableExpressionOutStaticClass.myTypedArrayFloat32Array = getTypedArrayFloat32Array();
    SendableExpressionOutStaticClass.myArrayBuffer = getArrayBuffer();
    SendableExpressionOutStaticClass.myConcatArray = getConcatArray();
    SendableExpressionOutStaticClass.myBitVector = getBitVector();
    SendableExpressionOutStaticClass.myASON = getASON();
    SendableExpressionOutStaticClass.myAsyncLock = getAsyncLock();
    SendableExpressionOutStaticClass.mySendableUnionArray = getSendableUnionArray();
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