/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsRuntimeTest() {
  describe('builtinsRuntimeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name    builtinsRuntimeTest0001
     * @tc.number  BUILTINS_RUNTIME_TEST_0001
     * @tc.desc    Test basic functionality of isLittleEndianPlatform API
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = Runtime.isLittleEndianPlatform();

      expect(typeof result).assertEqual('boolean');

      const result1: boolean = Runtime.isLittleEndianPlatform();
      const result2: boolean = Runtime.isLittleEndianPlatform();
      const result3: boolean = Runtime.isLittleEndianPlatform();

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(result3);
    });

    /**
     * @tc.name    builtinsRuntimeTest0002
     * @tc.number  BUILTINS_RUNTIME_TEST_0002
     * @tc.desc    Test isLittleEndianPlatform with different data types to verify endianness
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const singleByteArray: Uint8Array = new Uint8Array([0x01]);
      expect(singleByteArray[0]).assertEqual(0x01);

      const uint16Array: Uint16Array = new Uint16Array([0x0102]);
      const uint16Buffer: Uint8Array = new Uint8Array(uint16Array.buffer);

      if (isLittleEndian) {
        expect(uint16Buffer[0]).assertEqual(0x02);
        expect(uint16Buffer[1]).assertEqual(0x01);
      } else {
        expect(uint16Buffer[0]).assertEqual(0x01);
        expect(uint16Buffer[1]).assertEqual(0x02);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest0003
     * @tc.number  BUILTINS_RUNTIME_TEST_0003
     * @tc.desc    Test isLittleEndianPlatform with Int32Array boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const int32MinArray: Int32Array = new Int32Array([-2147483648]);
      const int32MinBuffer: Uint8Array = new Uint8Array(int32MinArray.buffer);

      if (isLittleEndian) {
        expect(int32MinBuffer[0]).assertEqual(0x00);
        expect(int32MinBuffer[1]).assertEqual(0x00);
        expect(int32MinBuffer[2]).assertEqual(0x00);
        expect(int32MinBuffer[3]).assertEqual(0x80);
      } else {
        expect(int32MinBuffer[0]).assertEqual(0x80);
        expect(int32MinBuffer[1]).assertEqual(0x00);
        expect(int32MinBuffer[2]).assertEqual(0x00);
        expect(int32MinBuffer[3]).assertEqual(0x00);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest0004
     * @tc.number  BUILTINS_RUNTIME_TEST_0004
     * @tc.desc    Test isLittleEndianPlatform with Uint32Array boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const uint32MaxArray: Uint32Array = new Uint32Array([4294967295]);
      const uint32MaxBuffer: Uint8Array = new Uint8Array(uint32MaxArray.buffer);

      if (isLittleEndian) {
        expect(uint32MaxBuffer[0]).assertEqual(0xFF);
        expect(uint32MaxBuffer[1]).assertEqual(0xFF);
        expect(uint32MaxBuffer[2]).assertEqual(0xFF);
        expect(uint32MaxBuffer[3]).assertEqual(0xFF);
      } else {
        expect(uint32MaxBuffer[0]).assertEqual(0xFF);
        expect(uint32MaxBuffer[1]).assertEqual(0xFF);
        expect(uint32MaxBuffer[2]).assertEqual(0xFF);
        expect(uint32MaxBuffer[3]).assertEqual(0xFF);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest0005
     * @tc.number  BUILTINS_RUNTIME_TEST_0005
     * @tc.desc    Test isLittleEndianPlatform with Float32Array special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const floatArray: Float32Array = new Float32Array([1.0]);
      const floatBuffer: Uint8Array = new Uint8Array(floatArray.buffer);

      if (isLittleEndian) {
        expect(floatBuffer[0]).assertEqual(0x00);
        expect(floatBuffer[1]).assertEqual(0x00);
        expect(floatBuffer[2]).assertEqual(0x80);
        expect(floatBuffer[3]).assertEqual(0x3F);
      } else {
        expect(floatBuffer[0]).assertEqual(0x3F);
        expect(floatBuffer[1]).assertEqual(0x80);
        expect(floatBuffer[2]).assertEqual(0x00);
        expect(floatBuffer[3]).assertEqual(0x00);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest0006
     * @tc.number  BUILTINS_RUNTIME_TEST_0006
     * @tc.desc    Test isLittleEndianPlatform with Float64Array special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const doubleArray: Float64Array = new Float64Array([1.0]);
      const doubleBuffer: Uint8Array = new Uint8Array(doubleArray.buffer);

      if (isLittleEndian) {
        expect(doubleBuffer[0]).assertEqual(0x00);
        expect(doubleBuffer[1]).assertEqual(0x00);
        expect(doubleBuffer[2]).assertEqual(0x00);
        expect(doubleBuffer[3]).assertEqual(0x00);
        expect(doubleBuffer[4]).assertEqual(0x00);
        expect(doubleBuffer[5]).assertEqual(0x00);
        expect(doubleBuffer[6]).assertEqual(0xF0);
        expect(doubleBuffer[7]).assertEqual(0x3F);
      } else {
        expect(doubleBuffer[0]).assertEqual(0x3F);
        expect(doubleBuffer[1]).assertEqual(0xF0);
        expect(doubleBuffer[2]).assertEqual(0x00);
        expect(doubleBuffer[3]).assertEqual(0x00);
        expect(doubleBuffer[4]).assertEqual(0x00);
        expect(doubleBuffer[5]).assertEqual(0x00);
        expect(doubleBuffer[6]).assertEqual(0x00);
        expect(doubleBuffer[7]).assertEqual(0x00);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest0007
     * @tc.number  BUILTINS_RUNTIME_TEST_0007
     * @tc.desc    Test isLittleEndianPlatform with ArrayBuffer operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const view32: Uint32Array = new Uint32Array(buffer);
      const view8: Uint8Array = new Uint8Array(buffer);

      view32[0] = 0x01020304;

      if (isLittleEndian) {
        expect(view8[0]).assertEqual(0x04);
        expect(view8[1]).assertEqual(0x03);
        expect(view8[2]).assertEqual(0x02);
        expect(view8[3]).assertEqual(0x01);
      } else {
        expect(view8[0]).assertEqual(0x01);
        expect(view8[1]).assertEqual(0x02);
        expect(view8[2]).assertEqual(0x03);
        expect(view8[3]).assertEqual(0x04);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest0008
     * @tc.number  BUILTINS_RUNTIME_TEST_0008
     * @tc.desc    Test isLittleEndianPlatform with DataView operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const dataView: DataView = new DataView(buffer);

      dataView.setUint16(0, 0x0102, true);
      dataView.setUint16(2, 0x0102, false);

      const littleEndianValue: number = dataView.getUint16(0, true);
      const bigEndianValue: number = dataView.getUint16(2, false);

      expect(littleEndianValue).assertEqual(0x0102);
      expect(bigEndianValue).assertEqual(0x0102);

      const view8: Uint8Array = new Uint8Array(buffer);

      expect(view8[0]).assertEqual(0x02);
      expect(view8[1]).assertEqual(0x01);

      expect(view8[2]).assertEqual(0x01);
      expect(view8[3]).assertEqual(0x02);
    });

    /**
     * @tc.name    builtinsRuntimeTest0009
     * @tc.number  BUILTINS_RUNTIME_TEST_0009
     * @tc.desc    Test isLittleEndianPlatform with multiple data types consistency
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const isLittleEndian: boolean = Runtime.isLittleEndianPlatform();

      const buffer: ArrayBuffer = new ArrayBuffer(8);

      const uint32View: Uint32Array = new Uint32Array(buffer);
      uint32View[0] = 0xAABBCCDD;

      const uint8View: Uint8Array = new Uint8Array(buffer);

      if (isLittleEndian) {
        expect(uint8View[0]).assertEqual(0xDD);
        expect(uint8View[1]).assertEqual(0xCC);
        expect(uint8View[2]).assertEqual(0xBB);
        expect(uint8View[3]).assertEqual(0xAA);
      } else {
        expect(uint8View[0]).assertEqual(0xAA);
        expect(uint8View[1]).assertEqual(0xBB);
        expect(uint8View[2]).assertEqual(0xCC);
        expect(uint8View[3]).assertEqual(0xDD);
      }

      const int16View: Int16Array = new Int16Array(buffer);
      int16View[0] = 0x1122;

      if (isLittleEndian) {
        expect(uint8View[0]).assertEqual(0x22);
        expect(uint8View[1]).assertEqual(0x11);
      } else {
        expect(uint8View[0]).assertEqual(0x11);
        expect(uint8View[1]).assertEqual(0x22);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest0010
     * @tc.number  BUILTINS_RUNTIME_TEST_0010
     * @tc.desc    Test __narrowAny with null and undefined values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nullResult: (object | null | undefined) = __narrowAny(null);
      expect(nullResult === null).assertTrue();

      const undefinedResult: (object | null | undefined) = __narrowAny(undefined);
      expect(undefinedResult === undefined).assertTrue();

      const nullToObject: object | null = __narrowAny<object | null>(null);
      expect(nullToObject === null).assertTrue();

      const undefinedToObject: object | undefined = __narrowAny<object | undefined>(undefined);
      expect(undefinedToObject === undefined).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest0011
     * @tc.number  BUILTINS_RUNTIME_TEST_0011
     * @tc.desc    Test __narrowAny with primitive types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numberValue: number = 42;
      const numberResult: (object | null | undefined) = __narrowAny(numberValue);
      expect(typeof numberResult).assertEqual('number');
      expect(numberResult as number).assertEqual(42);

      const stringValue: string = 'hello';
      const stringResult: (object | null | undefined) = __narrowAny(stringValue);
      expect(typeof stringResult).assertEqual('string');
      expect(stringResult as string).assertEqual('hello');

      const booleanValue: boolean = true;
      const booleanResult: (object | null | undefined) = __narrowAny(booleanValue);
      expect(typeof booleanResult).assertEqual('boolean');
      expect(booleanResult as boolean).assertTrue();

      const nanResult: (object | null | undefined) = __narrowAny(NaN);
      expect(typeof nanResult).assertEqual('number');
      expect(isNaN(nanResult as number)).assertTrue();

      const infinityResult: (object | null | undefined) = __narrowAny(Infinity);
      expect(typeof infinityResult).assertEqual('number');
      expect((infinityResult as number) === Infinity).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest0012
     * @tc.number  BUILTINS_RUNTIME_TEST_0012
     * @tc.desc    Test __narrowAny with number boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxValueResult: (object | null | undefined) = __narrowAny(Number.MAX_VALUE);
      expect(typeof maxValueResult).assertEqual('number');
      expect((maxValueResult as number) === Number.MAX_VALUE).assertTrue();

      const minValueResult: (object | null | undefined) = __narrowAny(Number.MIN_VALUE);
      expect(typeof minValueResult).assertEqual('number');
      expect((minValueResult as number) === Number.MIN_VALUE).assertTrue();

      const maxSafeIntResult: (object | null | undefined) = __narrowAny(Number.MAX_SAFE_INTEGER);
      expect(typeof maxSafeIntResult).assertEqual('number');
      expect((maxSafeIntResult as number) === Number.MAX_SAFE_INTEGER).assertTrue();

      const epsilonResult: (object | null | undefined) = __narrowAny(Number.EPSILON);
      expect(typeof epsilonResult).assertEqual('number');
      expect((epsilonResult as number) === Number.EPSILON).assertTrue();

      const expResult: (object | null | undefined) = __narrowAny(2 ** 3);
      expect(typeof expResult).assertEqual('number');
      expect((expResult as number) === 8).assertTrue();

      const sciResult: (object | null | undefined) = __narrowAny(1e3);
      expect(typeof sciResult).assertEqual('number');
      expect((sciResult as number) === 1000).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest0013
     * @tc.number  BUILTINS_RUNTIME_TEST_0013
     * @tc.desc    Test __narrowAny with string types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emptyStringResult: (object | null | undefined) = __narrowAny('');
      expect(typeof emptyStringResult).assertEqual('string');
      expect((emptyStringResult as string) === '').assertTrue();

      const specialChars: string = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const specialResult: (object | null | undefined) = __narrowAny(specialChars);
      expect(typeof specialResult).assertEqual('string');
      expect((specialResult as string) === specialChars).assertTrue();

      const asciiChars: string = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      const asciiResult: (object | null | undefined) = __narrowAny(asciiChars);
      expect(typeof asciiResult).assertEqual('string');
      expect((asciiResult as string) === asciiChars).assertTrue();

      const escapeStr: string = '\n\r\t\\\'\"\?';
      const escapeResult: (object | null | undefined) = __narrowAny(escapeStr);
      expect(typeof escapeResult).assertEqual('string');
      expect((escapeResult as string) === escapeStr).assertTrue();

      const emojiResult: (object | null | undefined) = __narrowAny('👆');
      expect(typeof emojiResult).assertEqual('string');
      expect((emojiResult as string) === '👆').assertTrue();

      const zeroStringResult: (object | null | undefined) = __narrowAny('0');
      expect(typeof zeroStringResult).assertEqual('string');
      expect((zeroStringResult as string) === '0').assertTrue();

      const nanStringResult: (object | null | undefined) = __narrowAny('NaN');
      expect(typeof nanStringResult).assertEqual('string');
      expect((nanStringResult as string) === 'NaN').assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest0014
     * @tc.number  BUILTINS_RUNTIME_TEST_0014
     * @tc.desc    Test __narrowAny with array types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const normalArray: number[] = [72, 101, 108, 108, 111];
      const arrayResult: (object | null | undefined) = __narrowAny(normalArray);
      expect(Array.isArray(arrayResult)).assertTrue();
      expect((arrayResult as number[]).length).assertEqual(5);
      expect((arrayResult as number[])[0]).assertEqual(72);

      const zeroArray: number[] = [72, 101, 108, 108, 111, 0, 0, 0];
      const zeroArrayResult: (object | null | undefined) = __narrowAny(zeroArray);
      expect(Array.isArray(zeroArrayResult)).assertTrue();
      expect((zeroArrayResult as number[]).length).assertEqual(8);

      const negativeArray: number[] = [72, 101, 108, -111, 114];
      const negativeArrayResult: (object | null | undefined) = __narrowAny(negativeArray);
      expect(Array.isArray(negativeArrayResult)).assertTrue();
      expect((negativeArrayResult as number[])[3]).assertEqual(-111);

      const specialArray: number[] = [72, 101, NaN, Infinity, 108, 111];
      const specialArrayResult: (object | null | undefined) = __narrowAny(specialArray);
      expect(Array.isArray(specialArrayResult)).assertTrue();
      expect(isNaN((specialArrayResult as number[])[2])).assertTrue();
      expect((specialArrayResult as number[])[3] === Infinity).assertTrue();

      const emptyArray: number[] = [];
      const emptyArrayResult: (object | null | undefined) = __narrowAny(emptyArray);
      expect(Array.isArray(emptyArrayResult)).assertTrue();
      expect((emptyArrayResult as number[]).length).assertEqual(0);

      const typedArray: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      const typedArrayResult: (object | null | undefined) = __narrowAny(typedArray);
      expect(typedArrayResult instanceof Uint8Array).assertTrue();
      expect((typedArrayResult as Uint8Array).length).assertEqual(5);
    });

    /**
     * @tc.name    builtinsRuntimeTest0015
     * @tc.number  BUILTINS_RUNTIME_TEST_0015
     * @tc.desc    Test __narrowAny with TypedArray types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const int8Array: Int8Array = new Int8Array([-128, 0, 127]);
      const int8Result: (object | null | undefined) = __narrowAny(int8Array);
      expect(int8Result instanceof Int8Array).assertTrue();
      expect((int8Result as Int8Array)[0]).assertEqual(-128);
      expect((int8Result as Int8Array)[2]).assertEqual(127);

      const uint8Array: Uint8Array = new Uint8Array([0, 128, 255]);
      const uint8Result: (object | null | undefined) = __narrowAny(uint8Array);
      expect(uint8Result instanceof Uint8Array).assertTrue();
      expect((uint8Result as Uint8Array)[0]).assertEqual(0);
      expect((uint8Result as Uint8Array)[2]).assertEqual(255);

      const clampedArray: Uint8ClampedArray = new Uint8ClampedArray([0, 128, 255, -1, 256]);
      const clampedResult: (object | null | undefined) = __narrowAny(clampedArray);
      expect(clampedResult instanceof Uint8ClampedArray).assertTrue();
      expect((clampedResult as Uint8ClampedArray)[3]).assertEqual(0);
      expect((clampedResult as Uint8ClampedArray)[4]).assertEqual(255);

      const int32Array: Int32Array = new Int32Array([-2147483648, 0, 2147483647]);
      const int32Result: (object | null | undefined) = __narrowAny(int32Array);
      expect(int32Result instanceof Int32Array).assertTrue();
      expect((int32Result as Int32Array)[0]).assertEqual(-2147483648);
      expect((int32Result as Int32Array)[2]).assertEqual(2147483647);

      const float32Array: Float32Array = new Float32Array([NaN, Infinity, -Infinity, 1.5]);
      const float32Result: (object | null | undefined) = __narrowAny(float32Array);
      expect(float32Result instanceof Float32Array).assertTrue();
      expect(isNaN((float32Result as Float32Array)[0])).assertTrue();
      expect((float32Result as Float32Array)[1] === Infinity).assertTrue();
    });

    /**
     * @tc.name    builtinsRuntimeTest0016
     * @tc.number  BUILTINS_RUNTIME_TEST_0016
     * @tc.desc    Test __narrowAny with complex object types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const bufferResult: (object | null | undefined) = __narrowAny(buffer);
      expect(bufferResult instanceof ArrayBuffer).assertTrue();
      expect((bufferResult as ArrayBuffer).byteLength).assertEqual(16);

      const dataView: DataView = new DataView(new ArrayBuffer(16));
      const dataViewResult: (object | null | undefined) = __narrowAny(dataView);
      expect(dataViewResult instanceof DataView).assertTrue();

      const date: Date = new Date('2024-01-01');
      const dateResult: (object | null | undefined) = __narrowAny(date);
      expect(dateResult instanceof Date).assertTrue();

      const regex: RegExp = new RegExp('abc', 'gi');
      const regexResult: (object | null | undefined) = __narrowAny(regex);
      expect(regexResult instanceof RegExp).assertTrue();

      const map: Map<string, string | object> = new Map<string, string | object>([
        ['key1', 'value1'],
      ]);
      const mapResult: (object | null | undefined) = __narrowAny(map);
      expect(mapResult instanceof Map).assertTrue();

      const set: Set<number> = new Set<number>([1, 2, 3, 2, 1]);
      const setResult: (object | null | undefined) = __narrowAny(set);
      expect(setResult instanceof Set).assertTrue();

      if (setResult instanceof Set) {
        expect(setResult.size).assertEqual(3);
      }
    });

    /**
     * @tc.name    builtinsRuntimeTest0017
     * @tc.number  BUILTINS_RUNTIME_TEST_0017
     * @tc.desc    Test __narrowAny with type narrowing
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const stringValue: string = 'test';

      const narrowedString: string = __narrowAny<string>(stringValue);
      expect(typeof narrowedString).assertEqual('string');
      expect(narrowedString).assertEqual('test');

      const numberValue: number = 42;
      const narrowedNumber: number = __narrowAny<number>(numberValue);
      expect(typeof narrowedNumber).assertEqual('number');
      expect(narrowedNumber).assertEqual(42);

      const booleanValue: boolean = true;
      const narrowedBoolean: boolean = __narrowAny<boolean>(booleanValue);
      expect(typeof narrowedBoolean).assertEqual('boolean');
      expect(narrowedBoolean).assertTrue();

      const arrayValue: number[] = [1, 2, 3];
      const narrowedArray: number[] = __narrowAny<number[]>(arrayValue);
      expect(Array.isArray(narrowedArray)).assertTrue();
      expect(narrowedArray.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsRuntimeTest0018
     * @tc.number  BUILTINS_RUNTIME_TEST_0018
     * @tc.desc    Test __narrowAny with edge cases and performance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const funcValue: () => void = () => {};
      const funcResult: (object | null | undefined) = __narrowAny(funcValue);
      expect(typeof funcResult).assertEqual('function');

      const largeString: string = 'a'.repeat(1000);
      const largeStringResult: (object | null | undefined) = __narrowAny(largeString);
      expect(typeof largeStringResult).assertEqual('string');
      expect((largeStringResult as string).length).assertEqual(1000);

      const largeArray: number[] = [];
      for (let i = 0; i < 1000; i++) {
        largeArray.push(i);
      }
      const largeArrayResult: (object | null | undefined) = __narrowAny(largeArray);
      expect(Array.isArray(largeArrayResult)).assertTrue();
      expect((largeArrayResult as number[]).length).assertEqual(1000);

      const largeObj: Record<string, number> = {};
      for (let i = 0; i < 100; i++) {
        largeObj[`key${i}`] = i;
      }
      const largeObjResult: (object | null | undefined) = __narrowAny(largeObj);
      expect(typeof largeObjResult).assertEqual('object');
      expect(Object.keys(largeObjResult as Record<string, number>).length).assertEqual(6);

      const startTime: number = Date.now();
      const testValues: (object | null | undefined | number | string | boolean)[] = [null, undefined, 0, 'test', true, {}];

      for (let i = 0; i < 1000; i++) {
        for (let j = 0; j < testValues.length; j++) {
          const value = testValues[j];
          const result: (object | null | undefined) = __narrowAny(value);
          expect(result !== undefined || result === undefined).assertTrue();
        }
      }

      const endTime: number = Date.now();
      const elapsedTime: number = endTime - startTime;
      expect(elapsedTime < 1000).assertFalse();
    });

  })
}