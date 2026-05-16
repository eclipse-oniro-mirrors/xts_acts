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
export class SendableStaticReadonlyClass implements ISendable {
  static readonly myString: string = 'example string';
  static readonly myNumber: number = 42;
  static readonly myBoolean: boolean = true;
  static readonly myBigInt: bigint = 1234567890123456789012345678901234567890n;
  static readonly myUndefined: undefined | string | number | null = undefined;
  static readonly myNull: undefined | string | number | null = null;
  static readonly topLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  static readonly topLevelFunction: SendableFuncType = TopLevelSendableFunction;
  static readonly myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  static readonly myArray: collections.Array<number> = new collections.Array<number>();
  static readonly myMap: collections.Map<number, number> = new collections.Map<number, number>();
  static readonly mySet: collections.Set<number> = new collections.Set<number>();
  static readonly myTypedArrayInt8Array: collections.Int8Array = new collections.Int8Array(6);
  static readonly myTypedArrayUint8Array: collections.Uint8Array = new collections.Uint8Array(6);
  static readonly myTypedArrayInt16Array: collections.Int16Array = new collections.Int16Array(6);
  static readonly myTypedArrayUint16Array: collections.Uint16Array = new collections.Uint16Array(6);
  static readonly myTypedArrayInt32Array: collections.Int32Array = new collections.Int32Array(6);
  static readonly myTypedArrayUint32Array: collections.Uint32Array = new collections.Uint32Array(6);
  static readonly myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(6);
  static readonly myTypedArrayFloat32Array: collections.Float32Array = new collections.Float32Array(6);
  static readonly myArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  static readonly myConcatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  static readonly myBitVector: collections.BitVector = new collections.BitVector(2);
  static readonly myASON: ISendable =
    ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  static readonly myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  static readonly mySendableUnionArray: string | number | boolean | bigint = 1;

  constructor() {
  }
}

@Sendable
export class SendableNonParameterFuncStaticReadonlyClass implements ISendable {
  static readonly myString: string = SendableNonParameterFuncStaticReadonlyClass.getMyString();
  static readonly myNumber: number = SendableNonParameterFuncStaticReadonlyClass.getMyNumber();
  static readonly myBoolean: boolean = SendableNonParameterFuncStaticReadonlyClass.getMyBoolean();
  static readonly myBigInt: bigint = SendableNonParameterFuncStaticReadonlyClass.getMyBigInt();
  static readonly myUndefined: undefined | string | number | null =
    SendableNonParameterFuncStaticReadonlyClass.getMyUndefined();
  static readonly myNull: undefined | string | number | null =
    SendableNonParameterFuncStaticReadonlyClass.getMyNull();
  static readonly topLevelClassInstance: topLevelSendableClass =
    SendableNonParameterFuncStaticReadonlyClass.getTopLevelClassInstance();
  static readonly topLevelFunction: SendableFuncType =
    SendableNonParameterFuncStaticReadonlyClass.getTopLevelFunction();
  static readonly myEnum: SendableConstEnum = SendableNonParameterFuncStaticReadonlyClass.getMyEnum();
  static readonly myArray: collections.Array<number> = SendableNonParameterFuncStaticReadonlyClass.getMyArray();
  static readonly myMap: collections.Map<number, number> =
    SendableNonParameterFuncStaticReadonlyClass.getMyMap();
  static readonly mySet: collections.Set<number> = SendableNonParameterFuncStaticReadonlyClass.getMySet();
  static readonly myTypedArrayInt8Array: collections.Int8Array =
    SendableNonParameterFuncStaticReadonlyClass.getMyTypedArrayInt8Array();
  static readonly myTypedArrayUint8Array: collections.Uint8Array =
    SendableNonParameterFuncStaticReadonlyClass.getMyTypedArrayUint8Array();
  static readonly myTypedArrayInt16Array: collections.Int16Array =
    SendableNonParameterFuncStaticReadonlyClass.getMyTypedArrayInt16Array();
  static readonly myTypedArrayUint16Array: collections.Uint16Array =
    SendableNonParameterFuncStaticReadonlyClass.getMyTypedArrayUint16Array();
  static readonly myTypedArrayInt32Array: collections.Int32Array =
    SendableNonParameterFuncStaticReadonlyClass.getMyTypedArrayInt32Array();
  static readonly myTypedArrayUint32Array: collections.Uint32Array =
    SendableNonParameterFuncStaticReadonlyClass.getMyTypedArrayUint32Array();
  static readonly myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray =
    SendableNonParameterFuncStaticReadonlyClass.getMyTypedArrayUint8ClampedArray();
  static readonly myTypedArrayFloat32Array: collections.Float32Array =
    SendableNonParameterFuncStaticReadonlyClass.getMyTypedArrayFloat32Array();
  static readonly myArrayBuffer: collections.ArrayBuffer =
    SendableNonParameterFuncStaticReadonlyClass.getMyArrayBuffer();
  static readonly myConcatArray: collections.ConcatArray<number> =
    SendableNonParameterFuncStaticReadonlyClass.getMyConcatArray();
  static readonly myBitVector: collections.BitVector =
    SendableNonParameterFuncStaticReadonlyClass.getMyBitVector();
  static readonly myASON: ISendable = SendableNonParameterFuncStaticReadonlyClass.getMyASON();
  static readonly myAsyncLock: ArkTSUtils.locks.AsyncLock =
    SendableNonParameterFuncStaticReadonlyClass.getMyAsyncLock();
  static readonly mySendableUnionArray: string | number | boolean | bigint =
    SendableNonParameterFuncStaticReadonlyClass.getMySendableUnionArray();

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
export class SendableNonFuncStaticReadonlyClass implements ISendable {
  static readonly myString: string = 'example string';
  static readonly myNumber: number = 42;
  static readonly myBoolean: boolean = true;
  static readonly myBigInt: bigint = 1234567890123456789012345678901234567890n;
  static readonly myUndefined: undefined | string | number | null = undefined;
  static readonly myNull: undefined | string | number | null = null;
  static readonly topLevelClassInstance: topLevelSendableClass = new topLevelSendableClass();
  static readonly topLevelFunction: SendableFuncType = TopLevelSendableFunction;
  static readonly myEnum: SendableConstEnum = SendableConstEnum.OPTION_1;
  static readonly myArray: collections.Array<number> = new collections.Array<number>();
  static readonly myMap: collections.Map<number, number> = new collections.Map<number, number>();
  static readonly mySet: collections.Set<number> = new collections.Set<number>();
  static readonly myTypedArrayInt8Array: collections.Int8Array = new collections.Int8Array(6);
  static readonly myTypedArrayUint8Array: collections.Uint8Array = new collections.Uint8Array(6);
  static readonly myTypedArrayInt16Array: collections.Int16Array = new collections.Int16Array(6);
  static readonly myTypedArrayUint16Array: collections.Uint16Array = new collections.Uint16Array(6);
  static readonly myTypedArrayInt32Array: collections.Int32Array = new collections.Int32Array(6);
  static readonly myTypedArrayUint32Array: collections.Uint32Array = new collections.Uint32Array(6);
  static readonly myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(6);
  static readonly myTypedArrayFloat32Array: collections.Float32Array = new collections.Float32Array(6);
  static readonly myArrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(10);
  static readonly myConcatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
  static readonly myBitVector: collections.BitVector = new collections.BitVector(2);
  static readonly myASON: ISendable =
    ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable;
  static readonly myAsyncLock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("queryTestLock");
  static readonly mySendableUnionArray: string | number | boolean | bigint = 1;
}

@Sendable
export class SendableArrowNewStaticReadonlyClass implements ISendable {
  static readonly myString: string = ((value: string) => value)('example string');
  static readonly myNumber: number = ((value: number) => value)(42);
  static readonly myBoolean: boolean = ((value: boolean) => value)(true);
  static readonly myBigInt: bigint = ((value: bigint) => value)(1234567890123456789012345678901234567890n);
  static readonly myUndefined: undefined | string | number | null = ((value: undefined) => value)(undefined);
  static readonly myNull: undefined | string | number | null = ((value: null) => value)(null);
  static readonly topLevelClassInstance: topLevelSendableClass =
    ((value: topLevelSendableClass) => value)(new topLevelSendableClass());
  static readonly topLevelFunction: SendableFuncType = ((value: SendableFuncType) => value)(TopLevelSendableFunction);
  static readonly myEnum: SendableConstEnum = ((value: SendableConstEnum) => value)(SendableConstEnum.OPTION_1);
  static readonly myArray: collections.Array<number> =
    ((value: collections.Array<number>) => value)(new collections.Array<number>());
  static readonly myMap: collections.Map<number, number> =
    ((value: collections.Map<number, number>) => value)(new collections.Map<number, number>());
  static readonly mySet: collections.Set<number> =
    ((value: collections.Set<number>) => value)(new collections.Set<number>());
  static readonly myTypedArrayInt8Array: collections.Int8Array =
    ((value: collections.Int8Array) => value)(new collections.Int8Array(6));
  static readonly myTypedArrayUint8Array: collections.Uint8Array =
    ((value: collections.Uint8Array) => value)(new collections.Uint8Array(6));
  static readonly myTypedArrayInt16Array: collections.Int16Array =
    ((value: collections.Int16Array) => value)(new collections.Int16Array(6));
  static readonly myTypedArrayUint16Array: collections.Uint16Array =
    ((value: collections.Uint16Array) => value)(new collections.Uint16Array(6));
  static readonly myTypedArrayInt32Array: collections.Int32Array =
    ((value: collections.Int32Array) => value)(new collections.Int32Array(6));
  static readonly myTypedArrayUint32Array: collections.Uint32Array =
    ((value: collections.Uint32Array) => value)(new collections.Uint32Array(6));
  static readonly myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray =
    ((value: collections.Uint8ClampedArray) => value)(new collections.Uint8ClampedArray(6));
  static readonly myTypedArrayFloat32Array: collections.Float32Array =
    ((value: collections.Float32Array) => value)(new collections.Float32Array(6));
  static readonly myArrayBuffer: collections.ArrayBuffer =
    ((value: collections.ArrayBuffer) => value)(new collections.ArrayBuffer(10));
  static readonly myConcatArray: collections.ConcatArray<number> =
    ((value: collections.ConcatArray<number>) => value)(new collections.Array<number>(1, 2, 4));
  static readonly myBitVector: collections.BitVector =
    ((value: collections.BitVector) => value)(new collections.BitVector(2));
  static readonly myASON: ISendable =
    ((value: ISendable) => value)(ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable);
  static readonly myAsyncLock: ArkTSUtils.locks.AsyncLock =
    ((value: ArkTSUtils.locks.AsyncLock) => value)(ArkTSUtils.locks.AsyncLock.request("queryTestLock"));
  static readonly mySendableUnionArray: string | number | boolean | bigint = ((value: number) => value)(1);

  constructor() {
  }
}

@Sendable
export class SendableExpressionArrowOutStaticReadonlyClass implements ISendable {
  static readonly myString: string = (() => 'example string')();
  static readonly myNumber: number = (() => 42)();
  static readonly myBoolean: boolean = (() => true)();
  static readonly myBigInt: bigint = (() => 1234567890123456789012345678901234567890n)();
  static readonly myUndefined: undefined | string | number | null = (() => undefined)();
  static readonly myNull: undefined | string | number | null = (() => null)();
  static readonly topLevelClassInstance: topLevelSendableClass = (() => new topLevelSendableClass())();
  static readonly topLevelFunction: SendableFuncType = (() => TopLevelSendableFunction)();
  static readonly myEnum: SendableConstEnum = (() => SendableConstEnum.OPTION_1)();
  static readonly myArray: collections.Array<number> = (() => new collections.Array<number>())();
  static readonly myMap: collections.Map<number, number> = (() => new collections.Map<number, number>())();
  static readonly mySet: collections.Set<number> = (() => new collections.Set<number>())();
  static readonly myTypedArrayInt8Array: collections.Int8Array = (() => new collections.Int8Array(6))();
  static readonly myTypedArrayUint8Array: collections.Uint8Array = (() => new collections.Uint8Array(6))();
  static readonly myTypedArrayInt16Array: collections.Int16Array = (() => new collections.Int16Array(6))();
  static readonly myTypedArrayUint16Array: collections.Uint16Array = (() => new collections.Uint16Array(6))();
  static readonly myTypedArrayInt32Array: collections.Int32Array = (() => new collections.Int32Array(6))();
  static readonly myTypedArrayUint32Array: collections.Uint32Array = (() => new collections.Uint32Array(6))();
  static readonly myTypedArrayUint8ClampedArray: collections.Uint8ClampedArray =
    (() => new collections.Uint8ClampedArray(6))();
  static readonly myTypedArrayFloat32Array: collections.Float32Array = (() => new collections.Float32Array(6))();
  static readonly myArrayBuffer: collections.ArrayBuffer = (() => new collections.ArrayBuffer(10))();
  static readonly myConcatArray: collections.ConcatArray<number> = (() => new collections.Array<number>(1, 2, 4))();
  static readonly myBitVector: collections.BitVector = (() => new collections.BitVector(2))();
  static readonly myASON: ISendable =
    (() => ArkTSUtils.ASON.parse('{"name": "John", "age": 30, "city": "ChongQing"}') as ISendable)();
  static readonly myAsyncLock: ArkTSUtils.locks.AsyncLock =
    (() => ArkTSUtils.locks.AsyncLock.request("queryTestLock"))();
  static readonly mySendableUnionArray: string | number | boolean | bigint = (() => 1)();

  constructor() {
  }
}

type GetValueFunc<T> = () => T;

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